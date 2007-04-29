From: Lee Kok Seng <kokseng@ieee.org>
Subject: [PATCH] linux 2.4, RPC conntrack (1 of 2)
Date: Mon, 30 Apr 2007 06:12:12 +0800
Message-ID: <A4DD6CE0-5FBB-4A7A-A6B1-CA1ADAC5AE05@ieee.org>
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

- -----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I needed to mount NFS volume connecting a client on linux 2.4 box to  
a  NFS
server hosted on linux 2.6 box. That is when I realized that the  
current RPC
conntrack helper module is not working right. Over the week-end, I  
traced the
problem to the lack of support for fragmented packets in portmap RPC
DUMP procedure call replies.  The fix is for linux 2.4, tested on  
2.4.34.1
for both UDP and TCP NFSv3 mounting. I am working on linux 2.6
patch.

Here is a patch and fix, summary of changes:

- - - - - add support for portmapper DUMP procedure by handling multiple
    fragments reply, and registering replies as expected connections.
- - - - - ip_conntrack_tcp now checks against the list of allowed RPC
   specified by --rpcs before setting up ip_conntrack_expect.
   Limitation is it will use the --rpcs list of the last rule
   that invoke rpc match module of any table. This is practical
   since usually you will need only one such rule.
- - - - - Helper will only look at portmap RPC now.
- - - - - Please use tcp for NFS in order for the protocol to work  
properly
   with ip_conntrack.

I changed the version from 2.2 to 2.3, so, if this is not the right
thing to do, please bark.

/ks

diff -ur patch-o-matic-ng-20070207/patchlets/rpc/linux/include/linux/ 
netfilter_ipv4/ip_conntrack_rpc.h patch-o-matic-ng-20070207-new/ 
patchlets/rpc/linux/include/linux/netfilter_ipv4/ip_conntrack_rpc.h
- - --- patch-o-matic-ng-20070207/patchlets/rpc/linux/include/linux/ 
netfilter_ipv4/ip_conntrack_rpc.h	2003-12-19 02:47:52.000000000 +0800
+++ patch-o-matic-ng-20070207-new/patchlets/rpc/linux/include/linux/ 
netfilter_ipv4/ip_conntrack_rpc.h	2007-04-29 18:01:20.000000000 +0800
@@ -1,4 +1,4 @@
- - -/* RPC extension for IP connection tracking, Version 2.2
+/* RPC extension for IP connection tracking, Version 2.3
   * (C) 2000 by Marcelo Barbosa Lima <marcelo.lima@dcc.unicamp.br>
   *	- original rpc tracking module
   *	- "recent" connection handling for kernel 2.3+ netfilter
@@ -10,6 +10,17 @@
   *	- upgraded conntrack modules to newnat api - kernel 2.4.20+
   *	- extended matching to support filtering on procedures
   *
+ * (c) 2007 by kokseng <kokseng@ieee.org> (version 2.3)
+ * 	- add support for portmapper DUMP procedure by handling multiple
+ *	  fragments reply, and registering replies as expected connections.
+ *	- ip_conntrack_tcp now checks against the list of allowed RPC
+ *	  specirfied by --rpcs before setting up ip_conntrack_expect.
+ *	  Limitation is it will use the --rpcs list of the last rule
+ *	  that invoke rpc match module of any table. This is practical
+ *	  since usually you will need only one such rule.
+ *	- Please use tcp for NFS in order for the protocol to work properly
+ *	  with ip_conntrack.
+ *
   * ip_conntrack_rpc.h,v 2.2 2003/01/12 18:30:00
   *
   *	This program is free software; you can redistribute it and/or
@@ -54,15 +65,42 @@
	u_int16_t port;
	
	/* Protocol */
- - -	u_int16_t proto;
+	u_int16_t proto; 	
+
+	/* Procedure */
+	u_int32_t rpcproc;	/* 3=>get; 4=>DUMP procedure */
+	u_int32_t rpcver;	/* RPC procedure version */	
+
+	u_int32_t getproc;	/* RPC portmapper GET: requested proc */
+
+	/* fragment  */
+	u_int32_t fragcnt;	/* Number of fragments seen */
+	u_int32_t fragfcnt;	/* Field-count in stored fragmented record */
+	u_int32_t frag[4];	/* Buffer to store fragment */	
	struct timer_list timeout;
};
static inline int request_p_cmp(const struct request_p *p, u_int32_t  
xid,
				u_int32_t ip, u_int32_t port) {
- - -	return (p->xid == xid && p->ip == ip && p->port);
+	return ((xid==0 || p->xid == xid) &&  p->ip == ip && p->port);
}
+/*
+	IPT_RPC_CHECK_ALLOWED:
+ 	#define to check RPC allowed list before setting up  
ip_conntrack_expect.
+	'allowed list' is setup with -m rpc --rpcs <rpc-service>,...
+	(rpc-service: as in '/etc/rpc' or 'rpcinfo -p')
+ */
+#define IPT_RPC_CHECK_ALLOWED
+#ifdef  IPT_RPC_CHECK_ALLOWED
+struct rpc_allowed {
+	const void *	rpc_info;		
+	int 		(*fMatchRpcs)(char *c_procs, int i_procs, int proc);
+};
+#endif
+
+#define IPT_RPC_PORTMAP	100000L		/* portmap; /etc/rpc */
+
#endif /* _IP_CONNTRACK_RPC_H */
diff -ur patch-o-matic-ng-20070207/patchlets/rpc/linux/net/ipv4/ 
netfilter/ip_conntrack_rpc_tcp.c patch-o-matic-ng-20070207-new/ 
patchlets/rpc/linux/net/ipv4/netfilter/ip_conntrack_rpc_tcp.c
- - --- patch-o-matic-ng-20070207/patchlets/rpc/linux/net/ipv4/ 
netfilter/ip_conntrack_rpc_tcp.c	2005-09-22 18:23:13.000000000 +0800
+++ patch-o-matic-ng-20070207-new/patchlets/rpc/linux/net/ipv4/ 
netfilter/ip_conntrack_rpc_tcp.c	2007-04-29 19:04:19.000000000 +0800
@@ -1,4 +1,4 @@
- - -/* RPC extension for IP (TCP) connection tracking, Version 2.2
+/* RPC extension for IP (TCP) connection tracking, Version 2.3
   * (C) 2000 by Marcelo Barbosa Lima <marcelo.lima@dcc.unicamp.br>
   *	- original rpc tracking module
   *	- "recent" connection handling for kernel 2.3+ netfilter
@@ -13,6 +13,36 @@
   * (c) 2004,2005 by David Stes <stes@pandora.be>
   *      - add nsrexec option for Legato NetWorker
   *
+ * (c) 2007 by kokseng <kokseng@ieee.org> (Version 2.3)
+ * 	- add support for portmapper DUMP procedure by handling multiple
+ *	  fragments reply, and registering replies as expected connections.
+ *	- ip_conntrack_tcp now checks against the list of allowed RPC
+ *	  specirfied by --rpcs before setting up ip_conntrack_expect.
+ *	  Limitation is it will use the --rpcs list of the last rule
+ *	  that invoke rpc match module of any table. This is practical
+ *	  since usually you will need only one such rule.
+ * 	- Helper wil only look at portmap RPC now.
+ *	- Please use tcp for NFS in order for the protocol to work properly
+ *	  with ip_conntrack.
+ *
+ *	insmod ip_conntrack_rpc_tcp.o  
ports=port1,port2,...port<MAX_PORTS> maxexpect=1-<MAX_EXPECT>
+ *
+ *	Please give the ports of all RPC servers you wish to connect to.
+ *	If you don't specify ports, the default will be port 111.
+ *
+ *	'maxexpect' specifies the maximum number of ip_conntrack_expect
+ *	that can be registered. For RPC clients that issue portmapper
+ * 	DUMP procedure first to request a list of port maps, all returned
+ * 	RPC service ports that has procedure version equal or greater than
+ *	the RPC DUMP procedure version will be registered  
ip_conntrack_expect.
+ *	For outgoing RPC call, for example, a NFS volume mount, this will
+ * 	allow subsequent mountd, rquotad, status, nfs RPC calls to succeed.
+ *	
+ *	In order for NFS mount to work with ip_conntrack, you must mount
+ *	NFS volume with 'tcp' option. Otherwise, once the mount is  
successful
+ *	using this helper module, the UDP 'connection' will time-out  
(depending
+ *	on your kernel UDP parameters), and you will get NFS errors.
+ *
   * ip_conntrack_rpc_tpc.c,v 2.2 2003/01/12 18:30:00
   *
   *	This program is free software; you can redistribute it and/or
@@ -27,9 +57,12 @@
   *      For example, ports=111,7938 for Legato NetWorker's  
portmapper on 7938.
   *	If you don't specify ports, the default will be port 111 (SUN  
portmap).
   *
+ *	This module *must* be loaded first before ip_conntrack_rpc_udp and
+ *	ipt_rpc. This should be automatic by the kernel anyway, more  
relevant
+ *	to infer that rmmod must be done in the opposite sequence.
+ *
   *      Please specify nsrexec, the TCP port of the rexec() service of
   *      Legato NetWorker.  For example, nsrexec=7937
- - - *
   **
   *	Note to all:
   *
@@ -66,23 +99,37 @@
#include <linux/netfilter_ipv4/ip_tables.h>
#include <linux/netfilter_ipv4/ip_conntrack_helper.h>
#include <linux/netfilter_ipv4/ip_conntrack_rpc.h>
+#include <linux/netfilter_ipv4/ipt_rpc.h>
#define MAX_PORTS 8
static int ports[MAX_PORTS];
static int ports_n_c = 0;
static int nsrexec = 0;
+#define MAX_EXPECT 32
+static int maxexpect = 16;
+
+#ifdef IPT_RPC_CHECK_ALLOWED
+struct rpc_allowed   rpc_allowed_tcp;
+struct rpc_allowed * iptRpc_tcp = NULL;
+#endif
+
#ifdef MODULE_PARM
MODULE_PARM(nsrexec, "i");
MODULE_PARM_DESC(nsrexec, "TCP port of Legato NetWorker's rexec  
service");
MODULE_PARM(ports, "1-" __MODULE_STRING(MAX_PORTS) "i");
MODULE_PARM_DESC(ports, "port numbers (TCP/UDP) of RPC portmapper  
servers");
+MODULE_PARM(maxexpect, "1-" __MODULE_STRING(MAX_EXPECT) "i");
+MODULE_PARM_DESC(maxexpect, "Maximum number of expected RPC services  
to conntrack");
#endif
MODULE_AUTHOR("Marcelo Barbosa Lima <marcelo.lima@dcc.unicamp.br>");
MODULE_DESCRIPTION("RPC TCP connection tracking module");
MODULE_LICENSE("GPL");
+#define SHOWMSG(format, args...) printk(KERN_DEBUG  
"ip_conntrack_rpc_tcp: " \
+					format, ## args)
+
#if 0
#define DEBUGP(format, args...) printk(KERN_DEBUG  
"ip_conntrack_rpc_tcp: " \
					format, ## args)
@@ -144,7 +191,7 @@
static void alloc_request_p(u_int32_t xid, u_int16_t proto, u_int32_t  
ip,
- - -		     u_int16_t port)
+		     u_int16_t port, u_int32_t rpcproc, u_int32_t rpcver,  
u_int32_t getproc)
{
	struct request_p *req_p;
	
@@ -172,6 +219,7 @@
		return;			
	}
	*req_p = ((struct request_p) {{ NULL, NULL }, xid, ip, port, proto,
+		rpcproc, rpcver, getproc, 0, 0, {0,0,0,0},
		{ { NULL, NULL }, jiffies + EXP, (unsigned long)req_p,
			NULL }});

@@ -188,6 +236,74 @@
}
+int expect_rpc_packet(const u_int32_t *data,
+			int dir, struct ip_conntrack *ct,
+			struct list_head request_p_list, struct rpc_allowed * allowed,
+			unsigned uThisProc, unsigned uThisProto, unsigned uThisPort)
+{
+	struct  ip_conntrack_expect expect, *exp = &expect;
+	int	ret = -1; /* Means error */
+	/*
+	 *  If a packet has made it this far then it deserves an
+	 *  expectation ...  if port == 0, then this service is
+	 *  not going to be registered.
+	 */
+	if (! uThisPort ||  uThisPort == nsrexec) return ret;
+	#ifdef IPT_RPC_CHECK_ALLOWED
+	if (allowed && allowed->fMatchRpcs && allowed->rpc_info &&
+	    allowed->fMatchRpcs( (char *)&((const struct ipt_rpc_info *) 
allowed->rpc_info)->c_procs,
+			((const struct ipt_rpc_info *) allowed->rpc_info)->i_procs,  
uThisProc) == 0) {
+		DEBUGP("!!! RPC: unauthorized procedure [%u].\n", uThisProc);
+		return ret;
+	}
+	#endif
+	memset(&expect, 0, sizeof(expect));
+
+	/* Watch out, Radioactive-Man! */
+	exp->tuple.src.ip = ct->tuplehash[!dir].tuple.src.ip;
+	exp->tuple.dst.ip = ct->tuplehash[!dir].tuple.dst.ip;
+	exp->mask.src.ip = 0xffffffff;
+	exp->mask.dst.ip = 0xffffffff;
+
+	switch (uThisProto) {
+		case IPPROTO_UDP:
+			exp->tuple.src.u.udp.port = 0;
+			exp->tuple.dst.u.udp.port = htons(uThisPort);
+			exp->tuple.dst.protonum = IPPROTO_UDP;
+			exp->mask.src.u.udp.port = 0;
+			exp->mask.dst.u.udp.port = htons(0xffff);
+			exp->mask.dst.protonum = 0xffff;
+			break;
+
+		case IPPROTO_TCP:
+			exp->tuple.src.u.tcp.port = 0;
+			exp->tuple.dst.u.tcp.port = htons(uThisPort);
+			exp->tuple.dst.protonum = IPPROTO_TCP;
+			exp->mask.src.u.tcp.port = 0;
+			exp->mask.dst.u.tcp.port = htons(0xffff);
+			exp->mask.dst.protonum = 0xffff;
+			break;
+	}
+	exp->expectfn = NULL;
+
+	ret = ip_conntrack_expect_related(ct, &expect);
+	if (ret) {
+		DEBUGP("!!! ip_conntrack_expect_related ret=%d\n", ret);
+	} else {
+		DEBUGP("%u expect related ip   %u.%u.%u.%u:0-%u.%u.%u.%u:%u proto=% 
u\n",
+			ct->expecting,
+			NIPQUAD(exp->tuple.src.ip),
+			NIPQUAD(exp->tuple.dst.ip),
+			uThisPort, uThisProto);
+
+		DEBUGP("%u expect related mask %u.%u.%u.%u:0-%u.%u.%u.%u:65535  
proto=%u\n",
+			ct->expecting,
+			NIPQUAD(exp->mask.src.ip),
+			NIPQUAD(exp->mask.dst.ip),
+			exp->mask.dst.protonum);
+	}
+	return ret;
+}
static int check_rpc_packet(const u_int32_t *data,
			int dir, struct ip_conntrack *ct,
@@ -195,63 +311,109 @@
{
	struct request_p *req_p;
	u_int32_t xid;
- - -	struct ip_conntrack_expect expect, *exp = &expect;
          /* Translstion's buffer for XDR */
          u_int16_t port_buf;
+	u_int32_t rpcproc = 0;
+	u_int32_t rpcver = 2;
+	u_int32_t rpcprog;
+
+	unsigned fraglast;
+	unsigned fraglen;
+	unsigned rpchead = 0;	/* !=0 => fragment has RPC header */
+	
+	/* Get Fragment header */
+	fraglen = (unsigned)(0x7FFFFFFFL & IXDR_GET_INT32(data));	
+	fraglast = (IXDR_GET_INT32(data) & (1L<<(sizeof(u_int32_t)*8-1))) ?  
1:0;
+	DEBUGP("@@@ FRAGMENT: last(%u) len(%u)\n", fraglast, fraglen);
+
+	/* Get to data */
+	data++;
	/* Get XID */
	xid = *data;
- - - 	/* This does sanity checking on RPC payloads,
- - -	 * and permits only the RPC "get port" (3)
- - -	 * in authorised procedures in client
- - -	 * communications with the portmapper.
- - -	 */
- - -
	/* perform direction dependant RPC work */
	if (dir == IP_CT_DIR_ORIGINAL) {
+		DEBUGP("@@@ ------ packet is from the initiator. [cont]\n");
- - -		data += 5;
- - -
- - -		/* Get RPC requestor */
- - -		if (IXDR_GET_INT32(data) != 3) {
- - -			DEBUGP("RPC packet contains an invalid (non \"get\") requestor.  
[skip]\n");
+		data += 3; /* 0:xid, 1:message_type, 2:rpcver, 3:progs, 4: progver */
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
+		/* Check if we can handle the requested procedure */
+		if ( rpcproc == 3) {
+			/* Get RPC requestor */
+			DEBUGP("RPC packet contains a \"get\" requestor. fraglen %u [cont] 
\n", fraglen);
+		} else if (rpcproc  == 4) {
+			/* DUMP  RPC requestor */
+			DEBUGP("RPC packet contains a \"DUMP\" requestor. [cont]\n");
+			/* Tests if fragment len is ok */
+			if (fraglen != 40) {
+				/* 40 = XID, message_type, rpcvers, progs, vers, proc, cred(2),  
verifier(2) */
+				DEBUGP("packet length is not correct. [skip]\n");
+				return NF_ACCEPT;
+			}
+		} else {
+			DEBUGP("RPC packet contains invalid (neither \"get\" nor \"dump 
\") requestor. [skip]\n");
			return NF_ACCEPT;
		}
- - -		DEBUGP("RPC packet contains a \"get\" requestor. [cont]\n");
- - -
		data++;
		/* Jump Credentials and Verfifier */
		data += IXDR_GET_INT32(data) + 2;
		data += IXDR_GET_INT32(data) + 2;
- - -		/* Get RPC procedure */
- - -		DEBUGP("RPC packet contains procedure request [%u]. [cont]\n",
- - -			(unsigned int)IXDR_GET_INT32(data));
- - -
- - -		/* Get RPC protocol and store against client parameters */
- - -		data = data + 2;
- - -		alloc_request_p(xid, IXDR_GET_INT32(data), ct->tuplehash 
[dir].tuple.src.ip,
- - -				ct->tuplehash[dir].tuple.src.u.all);
- - -
- - -		DEBUGP("allocated RPC req_p for xid=%u proto=%u %u.%u.%u.%u:%u\n",
- - -			xid, IXDR_GET_INT32(data),
- - -			NIPQUAD(ct->tuplehash[dir].tuple.src.ip),
- - -			ntohs(ct->tuplehash[dir].tuple.src.u.all));
- - -
- - -		DEBUGP("allocated RPC request for protocol %u. [done]\n",
- - -			(unsigned int)IXDR_GET_INT32(data));
+		if (rpcproc == 3) {
+			unsigned uThisProc = (unsigned) IXDR_GET_INT32(data);
+			/* RPC GET procedure */
+			DEBUGP("RPC packet contains procedure request [%u]. [cont]\n",  
uThisProc);
+
+			/* Get RPC protocol and store against client parameters */
+			data = data + 2;
+			alloc_request_p(xid, IXDR_GET_INT32(data), ct->tuplehash 
[dir].tuple.src.ip,
+					ct->tuplehash[dir].tuple.src.u.all, rpcproc, rpcver, uThisProc);
+			DEBUGP("allocated RPC req_p for xid=%u proto=%u %u.%u.%u.%u:%u\n",
+				xid, IXDR_GET_INT32(data),
+				NIPQUAD(ct->tuplehash[dir].tuple.src.ip),
+				ntohs(ct->tuplehash[dir].tuple.src.u.all));
+
+			DEBUGP("allocated RPC request for protocol %u. [done]\n",
+				(unsigned int)IXDR_GET_INT32(data));
+		} else if (rpcproc == 4) {
+			alloc_request_p(xid, (u_int32_t)0 , ct->tuplehash[dir].tuple.src.ip,
+					ct->tuplehash[dir].tuple.src.u.all, rpcproc, rpcver, 0);
+			DEBUGP("allocated RPC req_p for xid=%u proto=%u %u.%u.%u.%u:%u\n",
+				xid, 0,
+				NIPQUAD(ct->tuplehash[dir].tuple.src.ip),
+				ntohs(ct->tuplehash[dir].tuple.src.u.all));
+		}
	} else {
- - -
- - -		/* Check for returning packet's stored counterpart */
+		DEBUGP("@@@ ------ packet is from the receiver. [cont]\n");
+		/* HACK: request_p_cmp changed to force match w/o xid when xid is  
specified as 0 */
+		/* Check whether this reply is the starting fragment or  
continuation fragment */
		req_p = LIST_FIND(&request_p_list_tcp, request_p_cmp,
- - -				  struct request_p *, xid,
- - -				  ct->tuplehash[!dir].tuple.src.ip,
- - -				  ct->tuplehash[!dir].tuple.src.u.all);
+			  struct request_p *, 0,
+			  ct->tuplehash[!dir].tuple.src.ip,
+			  ct->tuplehash[!dir].tuple.src.u.all);
+		if (req_p  && req_p->xid) {
+			if (!req_p->fragcnt)  {	
+				/* 1st fragment, XID must match */
+				if (req_p->xid == xid) {
+					rpchead = 1;		/* Match XID */
+					req_p->fragcnt += 1;	/* Increment fragment counter */
+				} else  req_p = NULL;		/* Not the right XID */
+			} else  req_p->fragcnt += 1;		/* Increment fragment counter */
+		}
		/* Drop unexpected packets */
		if (!req_p) {
@@ -259,85 +421,93 @@
			return NF_ACCEPT;
		}
- - -		/* Verifies if packet is really an RPC reply packet */
- - -		data++;
- - -		if (IXDR_GET_INT32(data) != 1) {
- - -			DEBUGP("packet is not a valid RPC reply. [skip]\n");
- - -			return NF_ACCEPT;
- - -		}
- - -
- - -		/* Is status accept? */
- - -		data++;
- - -		if (IXDR_GET_INT32(data)) {
- - -			DEBUGP("packet is not an RPC accept. [skip]\n");
- - -			return NF_ACCEPT;
- - -		}
- - -
- - -		/* Get Verifier length. Jump verifier */
- - -		data++;
- - -		data = data + IXDR_GET_INT32(data) + 2;
- - -
- - -		/* Is accpet status "success"? */
- - -		if (IXDR_GET_INT32(data)) {
- - -			DEBUGP("packet is not an RPC accept status of success. [skip]\n");
- - -			return NF_ACCEPT;
- - -		}
- - -
- - -		/* Get server port number */	
- - -		data++;
- - -		port_buf = (u_int16_t) IXDR_GET_INT32(data);
- - -
- - -		/* If a packet has made it this far then it deserves an
- - -		 * expectation ...  if port == 0, then this service is
- - -		 * not going to be registered.
- - -		 */
- - -		if (port_buf && port_buf != nsrexec) {
- - -			DEBUGP("port found: %u\n", port_buf);
- - -
- - -			memset(&expect, 0, sizeof(expect));
- - -
- - -			/* Watch out, Radioactive-Man! */
- - -			exp->tuple.src.ip = ct->tuplehash[!dir].tuple.src.ip;
- - -			exp->tuple.dst.ip = ct->tuplehash[!dir].tuple.dst.ip;
- - -			exp->mask.src.ip = 0xffffffff;
- - -			exp->mask.dst.ip = 0xffffffff;
- - -
- - -			switch (req_p->proto) {
- - -				case IPPROTO_UDP:
- - -					exp->tuple.src.u.udp.port = 0;
- - -					exp->tuple.dst.u.udp.port = htons(port_buf);
- - -					exp->tuple.dst.protonum = IPPROTO_UDP;
- - -					exp->mask.src.u.udp.port = 0;
- - -					exp->mask.dst.u.udp.port = htons(0xffff);
- - -					exp->mask.dst.protonum = 0xffff;
- - -					break;
- - -
- - -				case IPPROTO_TCP:
- - -					exp->tuple.src.u.tcp.port = 0;
- - -					exp->tuple.dst.u.tcp.port = htons(port_buf);
- - -					exp->tuple.dst.protonum = IPPROTO_TCP;
- - -					exp->mask.src.u.tcp.port = 0;
- - -					exp->mask.dst.u.tcp.port = htons(0xffff);
- - -					exp->mask.dst.protonum = 0xffff;
- - -					break;
+		DEBUGP("RPC: rpchead(%u) xid(%u)\n", rpchead, xid);
+		if (rpchead) {
+			/* Verifies if packet is really an RPC reply packet */
+			data++;
+			if (IXDR_GET_INT32(data) != 1) {
+				DEBUGP("packet is not a valid RPC reply. [skip]\n");
+				return NF_ACCEPT;
			}
- - -			exp->expectfn = NULL;
- - -			ip_conntrack_expect_related(ct, &expect);
+			/* Is status accept? */
+			data++;
+			if (IXDR_GET_INT32(data)) {
+				DEBUGP("packet is not an RPC accept. [skip]\n");
+				return NF_ACCEPT;
+			}
- - -			DEBUGP("expect related ip   %u.%u.%u.%u:0-%u.%u.%u.%u:%u proto=% 
u\n",
- - -				NIPQUAD(exp->tuple.src.ip),
- - -				NIPQUAD(exp->tuple.dst.ip),
- - -				port_buf, req_p->proto);
- - -
- - -			DEBUGP("expect related mask %u.%u.%u.%u:0-%u.%u.%u.%u:65535  
proto=%u\n",
- - -				NIPQUAD(exp->mask.src.ip),
- - -				NIPQUAD(exp->mask.dst.ip),
- - -				exp->mask.dst.protonum);
+			/* Get Verifier length. Jump verifier's flavor. */
+			data++;
+			/* verifier's lenght is at second member */
+			data = data + IXDR_GET_INT32((data+1)) + 2;
+
+			/* Is accpet status "success"? */
+			if (IXDR_GET_INT32(data)) {
+				DEBUGP("packet is not an RPC accept status of success. [skip]\n");
+				return NF_ACCEPT;
+			}
- - -		}
+			data++;
+			if (req_p->rpcproc == 3) {
+				/* Get server port number */	
+				port_buf = (u_int16_t) IXDR_GET_INT32(data);
+				expect_rpc_packet(data, dir, ct, request_p_list,
+					iptRpc_tcp, req_p->getproc, req_p->proto, port_buf);
+			} /* fi - proc = get */
+		} else if (req_p->fragfcnt) {
+			/* ! rpc head */
+			unsigned fragfcnt = req_p->fragfcnt;
+			DEBUGP("@@@ FRAGMENT:consuming %u fields from previous fragmented  
record\n", fragfcnt);
+			unsigned uThisProc = req_p->frag[0];
+			unsigned uThisVer  = fragfcnt>1 ? req_p->frag[1]:IXDR_GET_INT32 
((data+1-fragfcnt));
+			unsigned uThisProto= fragfcnt>2 ? req_p->frag[2]:IXDR_GET_INT32 
((data+2-fragfcnt));
+			unsigned uThisPort = fragfcnt>3 ? req_p->frag[3]:IXDR_GET_INT32 
((data+3-fragfcnt));
+			data += fragfcnt;
+			DEBUGP("##   Proc(%u)ver(%u)Proto(%u)Port(%u)\n",
+				uThisProc, uThisVer, uThisProto, uThisPort);
+			if (uThisVer >= req_p->rpcver)
+				expect_rpc_packet(data, dir, ct, request_p_list,
+					iptRpc_tcp, uThisProc, uThisProto, uThisPort);
+			/* Adjust remaining fraglen */
+			fraglen -= (4 -fragfcnt) * sizeof(u_int32_t);
+			memset(req_p->frag, 0, sizeof(req_p->frag));
+			req_p->fragfcnt = 0;
+		} /* fi - rpchead  */
+
+		if (req_p->rpcproc == 4) {
+			unsigned uCnt = 0;	/* Counts the number of pmap record */	
+			/* RPC header: 0:XID, 1: message_type, 2:status 3,4: verifier,  
5:accept_status */
+			unsigned uLimit  = rpchead ? fraglen -24 : fraglen;
+			DEBUGP("RPC DUMP procedure reply; fraglen(%u)\n", fraglen);
+
+			/* Each pmap record is 16 bytes + 4 bytes of 'Value Follows' */
+			while ((IXDR_GET_INT32(data)) && uCnt <  uLimit/20) {
+				unsigned uThisProc	= (unsigned) IXDR_GET_INT32((data+1));
+				unsigned uThisVer 	= (unsigned) IXDR_GET_INT32((data+2));
+				unsigned uThisProto 	= (unsigned) IXDR_GET_INT32((data+3));
+				port_buf = IXDR_GET_INT32((data+4));	/* Get server port number */	
+				DEBUGP("## %u Proc(%u)ver(%u)Proto(%u)Port(%u)\n",
+					uCnt, uThisProc, uThisVer, uThisProto,port_buf);
+				if (uThisVer >= req_p->rpcver)
+					expect_rpc_packet(data,dir, ct, request_p_list,
+						iptRpc_tcp, uThisProc, uThisProto, port_buf);
+				data += 5; uCnt += 1;
+			} /* end - while */
+			if (uLimit % 20 != 0) {
+				u_int32_t * p;
+				unsigned rem = (uLimit % 20) / sizeof(u_int32_t);;
+				if (rem <= 4) {
+					/* Save remaining bytes for processing with next fragment */
+					DEBUGP("FRAGMENT: remaining %u bytes\n", uLimit - uCnt * 20);
+					req_p->fragfcnt = rem ? rem - 1 : 0;
+					p = req_p->frag;  data++; /* 1st is continuation */
+					while (--rem) { *(p++) = IXDR_GET_INT32(data); data++; }
+				} /* fi - rem */
+			} /* fi - uLimit */
+		} /* fi - proc = DUMP */
- - -		req_cl(req_p);
+		if (fraglast) req_cl(req_p);
		DEBUGP("packet evaluated. [expect]\n");
		return NF_ACCEPT;
@@ -360,7 +530,7 @@
	int crp_ret;
- - -	DEBUGP("new packet to evaluate ..\n");
+	DEBUGP("@@@ new packet to evaluate ..\n");
	/* This works for packets like handshake packets, ignore */
	if (len == ((tcph->doff + iph->ihl) * 4)) {
@@ -395,39 +565,13 @@
		return NF_ACCEPT;
	}
- - -	/* perform direction dependant protocol work */
- - -	if (dir == IP_CT_DIR_ORIGINAL) {
- - -
- - -		DEBUGP("packet is from the initiator. [cont]\n");
- - -
- - -		/* Tests if packet len is ok */
- - -		if ((tcplen - (tcph->doff * 4)) != 60) {
- - -			DEBUGP("packet length is not correct. [skip]\n");
- - -			return NF_ACCEPT;
- - -		}
- - -
- - -	} else {
- - -
- - -		DEBUGP("packet is from the receiver. [cont]\n");
- - -
- - -		/* Tests if packet len is ok */
- - -		if ((tcplen - (tcph->doff * 4)) != 32) {
- - -			DEBUGP("packet length is not correct. [skip]\n");
- - -			return NF_ACCEPT;
- - -		}
- - -	}
- - -
- - -	/* Get to the data */
- - -	data++;
- - -
- - -	/* Check the RPC data */
+	/* Check the RPC data; now include the fragment header, then  
XID ... etc */
	crp_ret = check_rpc_packet(data, dir, ct, request_p_list_tcp);
	return crp_ret;
}
- - -
static struct ip_conntrack_helper rpc_helpers[MAX_PORTS];
static char rpc_names[MAX_PORTS][10];
@@ -441,6 +585,12 @@
	/* If no port given, default to standard RPC port */
	if (ports[0] == 0)
		ports[0] = RPC_PORT;
+	
+	maxexpect = (maxexpect>0 && maxexpect<= 32)?maxexpect:16;
+	#ifdef IPT_RPC_CHECK_ALLOWED
+	memset(&rpc_allowed_tcp, 0, sizeof(rpc_allowed_tcp));
+	iptRpc_tcp = & rpc_allowed_tcp;
+	#endif
	for (port = 0; (port < MAX_PORTS) && ports[port]; port++) {
		memset(&rpc_helpers[port], 0, sizeof(struct ip_conntrack_helper));
@@ -453,7 +603,7 @@
		rpc_helpers[port].name = tmpname;
		rpc_helpers[port].me = THIS_MODULE;
- - -		rpc_helpers[port].max_expected = 1;
+		rpc_helpers[port].max_expected = maxexpect;
		rpc_helpers[port].flags = IP_CT_HELPER_F_REUSE_EXPECT;
		rpc_helpers[port].timeout = 0;
@@ -467,26 +617,27 @@
		rpc_helpers[port].help = help;
- - -		DEBUGP("registering helper for port #%d: %d/TCP\n", port, ports 
[port]);
- - -		DEBUGP("helper match ip   %u.%u.%u.%u:%u->%u.%u.%u.%u:%u\n",
- - -			NIPQUAD(rpc_helpers[port].tuple.dst.ip),
- - -			ntohs(rpc_helpers[port].tuple.dst.u.tcp.port),
- - -			NIPQUAD(rpc_helpers[port].tuple.src.ip),
- - -			ntohs(rpc_helpers[port].tuple.src.u.tcp.port));
- - -		DEBUGP("helper match mask %u.%u.%u.%u:%u->%u.%u.%u.%u:%u\n",
- - -			NIPQUAD(rpc_helpers[port].mask.dst.ip),
- - -			ntohs(rpc_helpers[port].mask.dst.u.tcp.port),
- - -			NIPQUAD(rpc_helpers[port].mask.src.ip),
- - -			ntohs(rpc_helpers[port].mask.src.u.tcp.port));
- - -
		ret = ip_conntrack_helper_register(&rpc_helpers[port]);
- - -
		if (ret) {
			printk("ERROR registering port %d\n",
				ports[port]);
			fini();
			return -EBUSY;
+		} else {
+			SHOWMSG("registering helper for port #%d: %d/TCP\n", port, ports 
[port]);
+			SHOWMSG("helper match ip   %u.%u.%u.%u:%u->%u.%u.%u.%u:%u\n",
+				NIPQUAD(rpc_helpers[port].tuple.dst.ip),
+				ntohs(rpc_helpers[port].tuple.dst.u.tcp.port),
+				NIPQUAD(rpc_helpers[port].tuple.src.ip),
+				ntohs(rpc_helpers[port].tuple.src.u.tcp.port));
+			SHOWMSG("helper match mask %u.%u.%u.%u:%u->%u.%u.%u.%u:%u\n",
+				NIPQUAD(rpc_helpers[port].mask.dst.ip),
+				ntohs(rpc_helpers[port].mask.dst.u.tcp.port),
+				NIPQUAD(rpc_helpers[port].mask.src.ip),
+				ntohs(rpc_helpers[port].mask.src.u.tcp.port));
+			SHOWMSG("Maximum expected: %u\n", maxexpect);
		}
+
		ports_n_c++;
	}
	return 0;
@@ -502,8 +653,13 @@
	DEBUGP("cleaning request list\n");
	clean_request(&request_p_list_tcp);
+	#ifdef IPT_RPC_CHECK_ALLOWED
+	memset(&rpc_allowed_tcp, 0, sizeof(rpc_allowed_tcp));
+	iptRpc_tcp = NULL;
+	#endif
+
	for (port = 0; (port < ports_n_c) && ports[port]; port++) {
- - -		DEBUGP("unregistering port %d\n", ports[port]);
+		SHOWMSG("unregistering port %d\n", ports[port]);
		ip_conntrack_helper_unregister(&rpc_helpers[port]);
	}
}
@@ -516,4 +672,6 @@
EXPORT_SYMBOL(request_p_list_tcp);
EXPORT_SYMBOL(ip_conntrack_rpc_tcp);
EXPORT_SYMBOL(ipct_rpc_tcp_lock);
+EXPORT_SYMBOL(expect_rpc_packet);
+EXPORT_SYMBOL(iptRpc_tcp);

- -----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)

iD8DBQFGNRg1Ymb/DX8rx/kRAjGqAJ94IUsndj++UaH1ghndO9qsUQLl4gCfSV8t
vu158AcatG6vlNmE+fqoLqY=
=4XGn
- -----END PGP SIGNATURE-----
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)

iD8DBQFGNRhEa5L3LJEn2t0RAoLIAKDeUjrTtJGN0AiUXEkc5jk3vb5pRQCeODfz
OY7K5v23W5p1T+HhTv07ANU=
=d16w
-----END PGP SIGNATURE-----

