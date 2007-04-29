From: Lee Kok Seng <kokseng@ieee.org>
Subject: [PATCH] linux 2.4, RPC conntrack (2 of 2)
Date: Mon, 30 Apr 2007 06:12:23 +0800
Message-ID: <B764BDEA-3BB6-4958-A0C1-41F3B721D859@ieee.org>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

diff -ur patch-o-matic-ng-20070207/patchlets/rpc/linux/net/ipv4/ 
netfilter/ip_conntrack_rpc_udp.c patch-o-matic-ng-20070207-new/ 
patchlets/rpc/linux/net/ipv4/netfilter/ip_conntrack_rpc_udp.c
- --- patch-o-matic-ng-20070207/patchlets/rpc/linux/net/ipv4/netfilter/ 
ip_conntrack_rpc_udp.c	2004-11-12 05:37:48.000000000 +0800
+++ patch-o-matic-ng-20070207-new/patchlets/rpc/linux/net/ipv4/ 
netfilter/ip_conntrack_rpc_udp.c	2007-04-29 18:54:37.000000000 +0800
@@ -10,6 +10,14 @@
   *	- upgraded conntrack modules to newnat api - kernel 2.4.20+
   *	- extended matching to support filtering on procedures
   *
+ * (c) 2007 by kokseng <kokseng@ieee.org>
+ *	- ip_conntrack_udp now checks against the list of allowed RPC
+ *	  specirfied by --rpcs before setting up ip_conntrack_expect.
+ *	  Limitation is it will use the --rpcs list of the last rule
+ *	  that invoke rpc match module of any table. This is practical
+ *	  since usually you will need only one such rule.
+ * 	- Helper wil only look at portmap RPC now.
+ *
   * ip_conntrack_rpc_udp.c,v 2.2 2003/01/12 18:30:00
   *
   *	This program is free software; you can redistribute it and/or
@@ -58,11 +66,18 @@
#include <linux/netfilter_ipv4/ip_tables.h>
#include <linux/netfilter_ipv4/ip_conntrack_helper.h>
#include <linux/netfilter_ipv4/ip_conntrack_rpc.h>
+#include <linux/netfilter_ipv4/ipt_rpc.h>
#define MAX_PORTS 8
static int ports[MAX_PORTS];
static int ports_n_c = 0;
+#ifdef IPT_RPC_CHECK_ALLOWED
+struct rpc_allowed   rpc_allowed_udp;
+struct rpc_allowed * iptRpc_udp = NULL;
+#endif
+
+
#ifdef MODULE_PARM
MODULE_PARM(ports, "1-" __MODULE_STRING(MAX_PORTS) "i");
MODULE_PARM_DESC(ports, "port numbers (TCP/UDP) of RPC portmapper  
servers");
@@ -72,6 +87,8 @@
MODULE_DESCRIPTION("RPC UDP connection tracking module");
MODULE_LICENSE("GPL");
+#define SHOWMSG(format, args...) printk(KERN_DEBUG  
"ip_conntrack_rpc_udp: " \
+					format, ## args)
#if 0
#define DEBUGP(format, args...) printk(KERN_DEBUG  
"ip_conntrack_rpc_udp: " \
					format, ## args)
@@ -89,6 +106,11 @@
LIST_HEAD(request_p_list_udp);
+/* Implemented in ip_conntrack_rpc_tcp.c */
+extern int expect_rpc_packet(const u_int32_t *data,
+			int dir, struct ip_conntrack *ct,
+			struct list_head request_p_list, struct rpc_allowed * allowed,
+			unsigned uThisProc, unsigned uThisProto, unsigned uThisPort);
static void delete_request_p(unsigned long request_p_ul)
{
@@ -133,7 +155,7 @@
static void alloc_request_p(u_int32_t xid, u_int16_t proto, u_int32_t  
ip,
- -		     u_int16_t port)
+		     u_int16_t port, u_int32_t rpcproc, u_int32_t rpcver,  
u_int32_t getproc)
{
	struct request_p *req_p;

@@ -161,6 +183,7 @@
		return;			
	}
	*req_p = ((struct request_p) {{ NULL, NULL }, xid, ip, port, proto,
+		rpcproc, rpcver, getproc, 0, 0, {0,0,0,0},
		{ { NULL, NULL }, jiffies + EXP, (unsigned long)req_p,
			NULL }});

@@ -177,18 +200,19 @@
}
- -
static int check_rpc_packet(const u_int32_t *data,
			int dir, struct ip_conntrack *ct,
			struct list_head request_p_list)
{
	struct request_p *req_p;
	u_int32_t xid;
- -	struct ip_conntrack_expect expect, *exp = &expect;
	/* Translstion's buffer for XDR */
	u_int16_t port_buf;
+	u_int32_t rpcproc = 0;
+	u_int32_t rpcver = 2;
+	u_int32_t rpcprog;
	/* Get XID */
	xid = *data;
@@ -201,16 +225,27 @@
	/* perform direction dependant RPC work */
	if (dir == IP_CT_DIR_ORIGINAL) {
+		unsigned getproc;
- -		data += 5;
+		DEBUGP("@@@ ------ UDP packet is from the initiator. [cont]\n");
- -		/* Get RPC requestor */
- -		if (IXDR_GET_INT32(data) != 3) {
- -			DEBUGP("RPC packet contains an invalid (non \"get\") requestor.  
[skip]\n");
+		data += 3;/* 0:xid, 1:message_type, 2:rpcver, 3:progs, 4: progver,  
5:proc */
+		rpcprog = IXDR_GET_INT32(data);
+		if (rpcprog != IPT_RPC_PORTMAP) {
+			DEBUGP("RPC %u request: only handle portmap RPC. [skip]\n",  
rpcprog);
+			return NF_ACCEPT;
+		}
+		rpcver  = IXDR_GET_INT32((data+1));
+		rpcproc = IXDR_GET_INT32((data+2));
+		DEBUGP("RPC portmap request: procedure(%u) ver(%u)\n", rpcproc,  
rpcver);
+		data +=2;
+
+		/* UDP RPC request only handles GET request */
+		if (rpcproc != 3) {
+			/* Get RPC requestor */
+			DEBUGP("RPC packet contains invalid (%u) requestor. [skip]\n",  
rpcproc);
			return NF_ACCEPT;
		}
- -		DEBUGP("RPC packet contains a \"get\" requestor. [cont]\n");
- -
		data++;
		/* Jump Credentials and Verfifier */
@@ -218,13 +253,13 @@
		data = data + IXDR_GET_INT32(data) + 2;
		/* Get RPC procedure */
- -		DEBUGP("RPC packet contains procedure request [%u]. [cont]\n",
- -			(unsigned int)IXDR_GET_INT32(data));
+		getproc = (unsigned int)IXDR_GET_INT32(data);
+		DEBUGP("RPC portmap GET request for [%u]. [cont]\n", getproc);
		/* Get RPC protocol and store against client parameters */
		data = data + 2;
		alloc_request_p(xid, IXDR_GET_INT32(data), ct->tuplehash 
[dir].tuple.src.ip,
- -				ct->tuplehash[dir].tuple.src.u.all);
+				ct->tuplehash[dir].tuple.src.u.all, rpcproc, rpcver, getproc);
		DEBUGP("allocated RPC req_p for xid=%u proto=%u %u.%u.%u.%u:%u\n",
			xid, IXDR_GET_INT32(data),
@@ -235,6 +270,7 @@
			(unsigned int)IXDR_GET_INT32(data));
	} else {
+		DEBUGP("@@@ ------ UDP packet is from the receiver. [cont]\n");
		/* Check for returning packet's stored counterpart */
		req_p = LIST_FIND(&request_p_list_udp, request_p_cmp,
@@ -264,7 +300,7 @@
		/* Get Verifier length. Jump verifier */
		data++;
- -		data = data + IXDR_GET_INT32(data) + 2;
+		data = data + IXDR_GET_INT32((data+1)) + 2;
		/* Is accpet status "success"? */
		if (IXDR_GET_INT32(data)) {
@@ -272,59 +308,13 @@
			return NF_ACCEPT;
		}
- -		/* Get server port number */	
		data++;
- -		port_buf = (u_int16_t) IXDR_GET_INT32(data);
- -
- -		/* If a packet has made it this far then it deserves an
- -		 * expectation ...  if port == 0, then this service is
- -		 * not going to be registered.
- -		 */
- -		if (port_buf) {
- -			DEBUGP("port found: %u\n", port_buf);
- -
- -			memset(&expect, 0, sizeof(expect));
- -
- -			/* Watch out, Radioactive-Man! */
- -			exp->tuple.src.ip = ct->tuplehash[!dir].tuple.src.ip;
- -			exp->tuple.dst.ip = ct->tuplehash[!dir].tuple.dst.ip;
- -			exp->mask.src.ip = 0xffffffff;
- -			exp->mask.dst.ip = 0xffffffff;
- -
- -			switch (req_p->proto) {
- -				case IPPROTO_UDP:
- -					exp->tuple.src.u.udp.port = 0;
- -					exp->tuple.dst.u.udp.port = htons(port_buf);
- -					exp->tuple.dst.protonum = IPPROTO_UDP;
- -					exp->mask.src.u.udp.port = 0;
- -					exp->mask.dst.u.udp.port = htons(0xffff);
- -					exp->mask.dst.protonum = 0xffff;
- -					break;
- -
- -				case IPPROTO_TCP:
- -					exp->tuple.src.u.tcp.port = 0;
- -					exp->tuple.dst.u.tcp.port = htons(port_buf);
- -					exp->tuple.dst.protonum = IPPROTO_TCP;
- -					exp->mask.src.u.tcp.port = 0;
- -					exp->mask.dst.u.tcp.port = htons(0xffff);
- -					exp->mask.dst.protonum = 0xffff;
- -					break;
- -			}
- -			exp->expectfn = NULL;
- -
- -			ip_conntrack_expect_related(ct, &expect);
- -
- -			DEBUGP("expect related ip   %u.%u.%u.%u:0-%u.%u.%u.%u:%u proto=%u 
\n",
- -				NIPQUAD(exp->tuple.src.ip),
- -				NIPQUAD(exp->tuple.dst.ip),
- -				port_buf, req_p->proto);
- -
- -			DEBUGP("expect related mask %u.%u.%u.%u:0-%u.%u.%u.%u:65535 proto= 
%u\n",
- -				NIPQUAD(exp->mask.src.ip),
- -				NIPQUAD(exp->mask.dst.ip),
- -				exp->mask.dst.protonum);
- -
- -		}
+		if (req_p->rpcproc == 3) {
+			/* Get server port number */	
+			port_buf = (u_int16_t) IXDR_GET_INT32(data);
+			expect_rpc_packet(data, dir, ct, request_p_list, iptRpc_udp,
+				req_p->getproc, req_p->proto, port_buf);
+		} /* fi - proc = get */
		req_cl(req_p);
@@ -351,7 +341,7 @@
	const u_int16_t *chsm = (const u_int16_t *)udph + 3;
- -	DEBUGP("new packet to evaluate ..\n");
+	DEBUGP("@@@ new UDP packet to evaluate ..\n");
	/* Not whole UDP header? */
	if (udplen < sizeof(struct udphdr)) {
@@ -372,9 +362,6 @@
	/* perform direction dependant protocol work */
	if (dir == IP_CT_DIR_ORIGINAL) {
- -
- -		DEBUGP("packet is from the initiator. [cont]\n");
- -
		/* Tests if packet len is ok */
		if ((udplen - sizeof(struct udphdr)) != 56) {
			DEBUGP("packet length is not correct. [skip]\n");
@@ -382,9 +369,6 @@
		}
	} else {
- -
- -		DEBUGP("packet is from the receiver. [cont]\n");
- -
		/* Until there's been traffic both ways, don't look in packets. */
		if (ctinfo != IP_CT_ESTABLISHED + IP_CT_IS_REPLY) {
			DEBUGP("connection tracking state is; ctinfo=%u ..\n", ctinfo);
@@ -401,9 +385,6 @@
	}
- -	/* Get to the data */
- -	/* udp *data == *correct */
- -
	/* Check the RPC data */
	crp_ret = check_rpc_packet(data, dir, ct, request_p_list_udp);
@@ -426,6 +407,11 @@
	if (ports[0] == 0)
		ports[0] = RPC_PORT;
+	#ifdef IPT_RPC_CHECK_ALLOWED
+	memset(&rpc_allowed_udp, 0, sizeof(rpc_allowed_udp));
+	iptRpc_udp = & rpc_allowed_udp;
+	#endif
+
	for (port = 0; (port < MAX_PORTS) && ports[port]; port++) {
		memset(&rpc_helpers[port], 0, sizeof(struct ip_conntrack_helper));
@@ -451,13 +437,13 @@
		rpc_helpers[port].help = help;
- -		DEBUGP("registering helper for port #%d: %d/UDP\n", port, ports 
[port]);
- -		DEBUGP("helper match ip   %u.%u.%u.%u:%u->%u.%u.%u.%u:%u\n",
+		SHOWMSG("registering helper for port #%d: %d/UDP\n", port, ports 
[port]);
+		SHOWMSG("helper match ip   %u.%u.%u.%u:%u->%u.%u.%u.%u:%u\n",
			NIPQUAD(rpc_helpers[port].tuple.dst.ip),
			ntohs(rpc_helpers[port].tuple.dst.u.udp.port),
			NIPQUAD(rpc_helpers[port].tuple.src.ip),
			ntohs(rpc_helpers[port].tuple.src.u.udp.port));
- -		DEBUGP("helper match mask %u.%u.%u.%u:%u->%u.%u.%u.%u:%u\n",
+		SHOWMSG("helper match mask %u.%u.%u.%u:%u->%u.%u.%u.%u:%u\n",
			NIPQUAD(rpc_helpers[port].mask.dst.ip),
			ntohs(rpc_helpers[port].mask.dst.u.udp.port),
			NIPQUAD(rpc_helpers[port].mask.src.ip),
@@ -486,8 +472,13 @@
	DEBUGP("cleaning request list\n");
	clean_request(&request_p_list_udp);
+	#ifdef IPT_RPC_CHECK_ALLOWED
+	memset(&rpc_allowed_udp, 0, sizeof(rpc_allowed_udp));
+	iptRpc_udp = NULL;
+	#endif
+
	for (port = 0; (port < ports_n_c) && ports[port]; port++) {
- -		DEBUGP("unregistering port %d\n", ports[port]);
+		SHOWMSG("unregistering port %d\n", ports[port]);
		ip_conntrack_helper_unregister(&rpc_helpers[port]);
	}
}
@@ -500,4 +491,5 @@
EXPORT_SYMBOL(request_p_list_udp);
EXPORT_SYMBOL(ip_conntrack_rpc_udp);
EXPORT_SYMBOL(ipct_rpc_udp_lock);
+EXPORT_SYMBOL(iptRpc_udp);
diff -ur patch-o-matic-ng-20070207/patchlets/rpc/linux/net/ipv4/ 
netfilter/ipt_rpc.c patch-o-matic-ng-20070207-new/patchlets/rpc/linux/ 
net/ipv4/netfilter/ipt_rpc.c
- --- patch-o-matic-ng-20070207/patchlets/rpc/linux/net/ipv4/netfilter/ 
ipt_rpc.c	2004-09-04 00:15:14.000000000 +0800
+++ patch-o-matic-ng-20070207-new/patchlets/rpc/linux/net/ipv4/ 
netfilter/ipt_rpc.c	2007-04-29 19:02:05.000000000 +0800
@@ -1,4 +1,4 @@
- -/* RPC extension for IP connection matching, Version 2.2
+/* RPC extension for IP connection matching, Version 2.3
   * (C) 2000 by Marcelo Barbosa Lima <marcelo.lima@dcc.unicamp.br>
   *	- original rpc tracking module
   *	- "recent" connection handling for kernel 2.3+ netfilter
@@ -10,19 +10,28 @@
   *	- upgraded conntrack modules to newnat api - kernel 2.4.20+
   *	- extended matching to support filtering on procedures
   *
+ * (c) 2007 by kokseng <kokseng@ieee.org> (versione 2.3)
+ * 	- add support for portmapper DUMP procedure by handling multiple
+ *	  fragments reply, and registering replies as expected connections.
+*	- ip_conntrack_tcp/_udp now checks against the list of allowed RPC
+ *	  specirfied by --rpcs before setting up ip_conntrack_expect.
+ *	  Limitation is it will use the --rpcs list of the last rule
+ *	  that invoke rpc match module of any table. This is practical
+ *	  since usually you will need only one such rule.
+ * 	- Helper wil only look at portmap RPC now.
+ *	- Please use tcp for NFS in order for the protocol to work properly
+ *	  with ip_conntrack.
+ *
   * ipt_rpc.c,v 2.2 2003/01/12 18:30:00
   *
   *	This program is free software; you can redistribute it and/or
   *	modify it under the terms of the GNU General Public License
   *	as published by the Free Software Foundation; either version
   *	2 of the License, or (at your option) any later version.
- - **
+ *
   *	Module load syntax:
- - *	insmod ipt_rpc.o ports=port1,port2,...port<MAX_PORTS>
+ *	insmod ipt_rpc.o ports=port1,port2,...port<MAX_PORTS>
   *
- - *	Please give the ports of all RPC servers you wish to connect to.
- - *	If you don't specify ports, the default will be port 111.
- - **
   *	Note to all:
   *
   *	RPCs should not be exposed to the internet - ask the Pentagon;
@@ -57,6 +66,7 @@
static int ports[MAX_PORTS];
static int ports_n_c = 0;
+
#ifdef MODULE_PARM
MODULE_PARM(ports, "1-" __MODULE_STRING(MAX_PORTS) "i");
MODULE_PARM_DESC(ports, "port numbers (TCP/UDP) of RPC portmapper  
servers");
@@ -66,6 +76,9 @@
MODULE_DESCRIPTION("RPC connection matching module");
MODULE_LICENSE("GPL");
+#define SHOWMSG(format, args...) printk(KERN_DEBUG "ipt_rpc: " \
+					format, ## args)
+
#if 0
#define DEBUGP(format, args...) printk(KERN_DEBUG "ipt_rpc: " \
					format, ## args)
@@ -73,7 +86,7 @@
#define DEBUGP(format, args...)
#endif
- -EXPORT_NO_SYMBOLS;
+EXPORT_NO_SYMBOLS;
/* vars from ip_conntrack_rpc_tcp */
extern struct list_head request_p_list_tcp;
@@ -83,6 +96,12 @@
extern struct list_head request_p_list_udp;
extern struct module *ip_conntrack_rpc_udp;
+/* RPC allowed  */
+#ifdef IPT_RPC_CHECK_ALLOWED
+extern struct rpc_allowed * iptRpc_tcp;
+extern struct rpc_allowed * iptRpc_udp;
+#endif
+
DECLARE_RWLOCK_EXTERN(ipct_rpc_tcp_lock);
DECLARE_RWLOCK_EXTERN(ipct_rpc_udp_lock);
@@ -106,7 +125,6 @@
const int IPT_RPC_CHAR_LEN = 11;
- -
static int k_atoi(char *string)
{
	unsigned int result = 0;
@@ -125,14 +143,13 @@
	return(result);
}
- -
static int match_rpcs(char *c_procs, int i_procs, int proc)
{
	int   proc_ctr;
	char *proc_ptr;
	unsigned int proc_num;
- -	DEBUGP("entered match_rpcs [%i] [%i] ..\n", i_procs, proc);
+	DEBUGP("match_rpcs [%i] [%i] ..\n", i_procs, proc);
	if (i_procs == -1)
		return 1;
@@ -150,7 +167,6 @@
	return 0;
}
- -
static int check_rpc_packet(const u_int32_t *data, const void  
*matchinfo,
			int *hotdrop, int dir, struct ip_conntrack *ct,
			int offset, struct list_head request_p_list)
@@ -381,6 +397,17 @@
	if (matchsize != IPT_ALIGN(sizeof(struct ipt_rpc_info)))
		return 0;
+	#ifdef IPT_RPC_CHECK_ALLOWED
+	if (iptRpc_tcp) {
+		iptRpc_tcp->fMatchRpcs = match_rpcs;
+		iptRpc_tcp->rpc_info = matchinfo;
+	}
+	if (iptRpc_udp) {
+		iptRpc_udp->fMatchRpcs = match_rpcs;
+		iptRpc_udp->rpc_info = matchinfo;
+	}
+	#endif
+	
	return 1;
}
@@ -398,9 +425,9 @@
	if (ports[0] == 0)
		ports[0] = RPC_PORT;
- -	DEBUGP("registering match [%s] for;\n", rpc_match.name);
+	SHOWMSG("registering match [%s] for;\n", rpc_match.name);
	for (port = 0; (port < MAX_PORTS) && ports[port]; port++) {
- -		DEBUGP("  port %i (UDP|TCP);\n", ports[port]);
+		SHOWMSG("  port %i (UDP|TCP);\n", ports[port]);
		ports_n_c++;
	}
	
@@ -410,7 +437,7 @@
static void fini(void)
{
- -	DEBUGP("unregistering match\n");
+	SHOWMSG("unregistering match\n");
	ipt_unregister_match(&rpc_match);
}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)

iD8DBQFGNRhHYmb/DX8rx/kRAsk6AJ0ZhDKRPXsYCUJFylP96Ck5cnRWcACgprMg
Btki58qT98L/TzCMGqQC+N8=
=DnzY
-----END PGP SIGNATURE-----

