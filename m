From: Philip Craig <philipc@snapgear.com>
Subject: Re: pptp & NAT
Date: Fri, 04 Nov 2005 14:00:59 +1000
Message-ID: <436ADCFB.6070201@snapgear.com>
References: <436ADB4C.7070800@exse.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000102030302080509040208"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436ADB4C.7070800@exse.net>
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
To: =?ISO-8859-1?Q?Sebastian_B=F6hm?= <seb@exse.net>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------000102030302080509040208
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/04/2005 01:53 PM, Sebastian B=F6hm wrote:
> - sometimes (every 10th connection attempt or so) the connections fails=
=20
> with "GRE: read(fd=3D5,buffer=3D8056720,len=3D8260) from network failed=
:=20
> status =3D -1 error =3D Protocol
> not available" reading in the server logs. I use windows clients with=20
> linux server. somewhere I read that I should load ip_gre on the firewal=
l=20
> or block a specific icmp packet, is that correct ? (I dont like to bloc=
k=20
> icmp, icmp is there for reason)

Please try the attached patch.  It has fixed a problem for someone else,
and I think this problem may be the same, but I'm not sure.

> - I am unable to estabish two pptp connections from one client, I can=20
> connect to one pptp server and I can connect to a second pptp server,=20
> but the second connection never accepts any traffic, when I stop the=20
> first connection, the second connection begins to work. Is this a bug o=
r=20
> a known missing feature ?

This is intended to work.  I haven't personally tested it in
2.6.14 though.

--------------000102030302080509040208
Content-Type: text/plain;
 name="pptp-2.6.14.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pptp-2.6.14.patch"

diff -u -p -u -r1.1.1.1 ip_nat_helper_pptp.c
--- linux-2.6.x/net/ipv4/netfilter/ip_nat_helper_pptp.c	28 Oct 2005 04:39:25 -0000	1.1.1.1
+++ linux-2.6.x/net/ipv4/netfilter/ip_nat_helper_pptp.c	3 Nov 2005 09:18:01 -0000
@@ -73,6 +73,7 @@ static void pptp_nat_expected(struct ip_
 	struct ip_conntrack_tuple t;
 	struct ip_ct_pptp_master *ct_pptp_info;
 	struct ip_nat_pptp *nat_pptp_info;
+	struct ip_nat_range range;
 
 	ct_pptp_info = &master->help.ct_pptp_info;
 	nat_pptp_info = &master->nat.help.nat_pptp_info;
@@ -110,7 +111,30 @@ static void pptp_nat_expected(struct ip_
 		DEBUGP("not found!\n");
 	}
 
-	ip_nat_follow_master(ct, exp);
+	/* This must be a fresh one. */
+	BUG_ON(ct->status & IPS_NAT_DONE_MASK);
+
+	/* Change src to where master sends to */
+	range.flags = IP_NAT_RANGE_MAP_IPS;
+	range.min_ip = range.max_ip
+		= ct->master->tuplehash[!exp->dir].tuple.dst.ip;
+	if (exp->dir == IP_CT_DIR_ORIGINAL) {
+		range.flags |= IP_NAT_RANGE_PROTO_SPECIFIED;
+		range.min = range.max = exp->saved_proto;
+	}
+	/* hook doesn't matter, but it has to do source manip */
+	ip_nat_setup_info(ct, &range, NF_IP_POST_ROUTING);
+
+	/* For DST manip, map port here to where it's expected. */
+	range.flags = IP_NAT_RANGE_MAP_IPS;
+	range.min_ip = range.max_ip
+		= ct->master->tuplehash[!exp->dir].tuple.src.ip;
+	if (exp->dir == IP_CT_DIR_REPLY) {
+		range.flags |= IP_NAT_RANGE_PROTO_SPECIFIED;
+		range.min = range.max = exp->saved_proto;
+	}
+	/* hook doesn't matter, but it has to do destination manip */
+	ip_nat_setup_info(ct, &range, NF_IP_PRE_ROUTING);
 }
 
 /* outbound packets == from PNS to PAC */
@@ -213,7 +237,7 @@ pptp_exp_gre(struct ip_conntrack_expect 
 
 	/* alter expectation for PNS->PAC direction */
 	invert_tuplepr(&inv_t, &expect_orig->tuple);
-	expect_orig->saved_proto.gre.key = htons(nat_pptp_info->pac_call_id);
+	expect_orig->saved_proto.gre.key = htons(ct_pptp_info->pns_call_id);
 	expect_orig->tuple.src.u.gre.key = htons(nat_pptp_info->pns_call_id);
 	expect_orig->tuple.dst.u.gre.key = htons(ct_pptp_info->pac_call_id);
 	inv_t.src.ip = reply_t->src.ip;

--------------000102030302080509040208--

