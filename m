From: "Robert Allmeroth" <netfilter@epygi.de>
Subject: pptp / gre connection tracking problem
Date: Thu, 26 Jun 2003 12:46:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PIEIIGGHCLEGAPAHFMDOAEFLCOAA.netfilter@epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

hello,

we have a problem with pptp/gre connection tracking.

scenario 1:
  PC            ->          Router 1                           -> interne=
t -> Router 2
 (pptp client)            (pptp NAT)                                     =
   (poptop server (no NAT))
 (windows xp)

  172.30.255.1/16  ->  172.30.0.177/16 <-> 10.20.10.177/16   ->          =
 -> 10.20.10.216/16

Problem:
  If the connection tracking on the poptop server router is loaded, the c=
onnection fails.
  -> (Operation not permitted.. see log)
  If not.. the connection establishes (partially) fine.

  That behaviour only happens if the NAT router is involved. Scenario 2 w=
orks fine.

Our Router:
  our Router is a big-endian Motorola MPC 857
  2.4.18, iptables 1.2.8 and patch-o-matic-20030615

----------

So the following scenario works if the conntrack table is empty
(with or without the conntrack module loaded) on the poptop server machin=
e.

scenario 2:
  PC            ->   internet -> Router 2
 (pptp client)                   (poptop server (no NAT))
 (windows xp)


best regards
  Robert & Markus

-------------- snip ... log of poptop server machine --------------------=
-----

bash-2.05#
Jun 26 09:55:12 daemon.info pptpd[2181]: CTRL: Client 10.20.0.55 control =
connection started
Jun 26 09:55:12 daemon.info pptpd[2181]: CTRL: Starting call (launching p=
ppd, opening GRE)
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:ip_ct_gre_ke=
ymap_add: adding new entry c11d8670: 10.20.0.55:0xc000 ->
10.20.10.216:0x0:1:0x880b
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:ip_ct_gre_ke=
ymap_add: adding new entry c11d8d70: 10.20.10.216:0x0 ->
10.20.0.55:0xc000:1:0x880b
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:ip_ct_gre_ke=
ymap_add: adding new entry c11d8df0: 10.20.10.216:0x0 ->
10.20.0.55:0xc000:1:0x880b
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:ip_ct_gre_ke=
ymap_add: adding new entry c11d8cb0: 10.20.0.55:0xc000 ->
10.20.10.216:0x0:1:0x880b
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:gre_new: : 1=
0.20.0.55:0x0 -> 10.20.10.216:0x0:1:0x880b
Jun 26 09:55:12 daemon.notice ppp-poptop[2182]: pppd 2.4.2b1 started by r=
oot, uid 0
Jun 26 09:55:12 daemon.info ppp-poptop[2182]: Using interface ppp0
Jun 26 09:55:12 daemon.notice ppp-poptop[2182]: Connect: ppp0 <--> /dev/t=
typ0
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:gre_new: : 1=
0.20.10.216:0x0 -> 10.20.0.55:0xc000:1:0x880b
Jun 26 09:55:12 daemon.debug klogd: ip_nat_proto_gre.c:gre_unique_tuple: =
min =3D 0, range_size =3D 1
Jun 26 09:55:12 daemon.debug klogd: ip_nat_proto_gre.c:gre_unique_tuple: =
c1eb5730: no NAT mapping
Jun 26 09:55:12 daemon.debug klogd: ip_nat_proto_gre.c:gre_unique_tuple: =
c1eb5730: NATing GRE PPTP
Jun 26 09:55:12 daemon.debug klogd: ip_nat_proto_gre.c:gre_unique_tuple: =
min =3D 1, range_size =3D 65535
Jun 26 09:55:12 daemon.debug klogd: ip_nat_proto_gre.c:gre_manip_pkt: cal=
l_id -> 0x0000
Jun 26 09:55:12 daemon.debug klogd: ip_nat_proto_gre.c:gre_unique_tuple: =
min =3D 0, range_size =3D 1
Jun 26 09:55:12 daemon.debug klogd: ip_nat_proto_gre.c:gre_unique_tuple: =
c1eb5730: no NAT mapping
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:gre_destroy:=
  entering
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:ip_ct_gre_ke=
ymap_destroy: removing c11d8df0 from list
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:ip_ct_gre_ke=
ymap_destroy: removing c11d8cb0 from list
Jun 26 09:55:12 daemon.err pptpd[2181]: GRE: xmit failed from decaps_hdlc=
: Operation not permitted
Jun 26 09:55:12 daemon.err pptpd[2181]: CTRL: PTY read or GRE write faile=
d (pty,gre)=3D(4,5)
Jun 26 09:55:12 daemon.info pptpd[2181]: CTRL: Client 10.20.0.55 control =
connection finished
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:gre_destroy:=
  entering
Jun 26 09:55:12 daemon.err pptpd[2181]: CTRL: Couldn't write packet to cl=
ient.
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:ip_ct_gre_ke=
ymap_destroy: removing c11d8670 from list
Jun 26 09:55:12 daemon.notice ppp-poptop[2182]: Modem hangup
Jun 26 09:55:12 daemon.err pptpd[2181]: CTRL: Couldn't write packet to cl=
ient.
Jun 26 09:55:12 daemon.debug klogd: ip_conntrack_proto_gre.c:ip_ct_gre_ke=
ymap_destroy: removing c11d8d70 from list
Jun 26 09:55:12 daemon.notice ppp-poptop[2182]: Connection terminated.
Jun 26 09:55:12 daemon.info ppp-poptop[2182]: Exit.

---------- end log --------------

bash-2.05# lsmod
Module                  Size  Used by
ipt_string              2736  28  (autoclean)
ipt_MARK                1312  31  (autoclean)
ipt_LOG                 4032   1  (autoclean)
ipt_MASQUERADE          2768   1  (autoclean)
ipt_psd                43520   2  (autoclean)
ipt_state               1248  10  (autoclean)
ipt_IPV4OPTSSTRIP       1504   1  (autoclean)
ipt_limit               1616   4  (autoclean)
ipt_mark                1040   3  (autoclean)
iptable_mangle          2880   1  (autoclean)
iptable_filter          2368   1  (autoclean)
ip_conntrack_egg        3680   0  (unused)
ip_nat_snmp_basic      10256   0  (unused)
ip_nat_proto_gre        2752   0  (unused)
ip_nat_amanda           2576   0  (unused)
ip_conntrack_amanda     2624   1  [ip_nat_amanda]
ip_nat_mms              4288   0  (unused)
ip_conntrack_mms        4352   1  [ip_nat_mms]
ip_conntrack_quake3     2896   1  (autoclean)
ip_nat_quake3           2928   0  (unused)
ip_nat_irc              3824   0  (unused)
ip_conntrack_irc        4336   1  [ip_nat_irc]
ip_nat_pptp             2992   0  (unused)
ip_conntrack_pptp       3360   1  [ip_nat_pptp]
ip_conntrack_proto_gre    5904   0  [ip_nat_pptp ip_conntrack_pptp]
ip_nat_h323             3888   0  (unused)
ip_conntrack_h323       3616   1  [ip_nat_h323]
ip_nat_ftp              4912   0  (unused)
iptable_nat            29792  11  [ipt_MASQUERADE ip_nat_snmp_basic ip_na=
t_proto_gre ip_nat_amanda ip_nat_mms ip_nat_quake3 ip_nat_i
rc ip_nat_pptp ip_nat_h323 ip_nat_ftp]
ip_tables              18416  14  [ipt_string ipt_MARK ipt_LOG ipt_MASQUE=
RADE ipt_psd ipt_state ipt_IPV4OPTSSTRIP ipt_limit ipt_mark
 iptable_mangle iptable_filter iptable_nat]
ip_conntrack_ftp        5472   1  [ip_nat_ftp]
ip_conntrack           37248  11  [ipt_MASQUERADE ipt_state ip_conntrack_=
egg ip_nat_amanda ip_conntrack_amanda ip_nat_mms ip_conntra
ck_mms ip_conntrack_quake3 ip_nat_quake3 ip_nat_irc ip_conntrack_irc ip_n=
at_pptp ip_conntrack_pptp ip_conntrack_proto_gre ip_nat_h32
3 ip_conntrack_h323 ip_nat_ftp iptable_nat ip_conntrack_ftp]

------------------------------
bash-2.05# iptables -vnL -t nat
Chain PREROUTING (policy ACCEPT 107 packets, 15967 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation

Chain POSTROUTING (policy ACCEPT 2 packets, 119 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation
    4   722 MASQUERADE  all  --  *      eth1    0.0.0.0/0            0.0.=
0.0/0

Chain OUTPUT (policy ACCEPT 6 packets, 841 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation

--------------------------------
bash-2.05# iptables -vnL
Chain INPUT (policy ACCEPT 1 packets, 117 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation


------------------
Epygi Labs DE           |  Herrenstra=DFe 23
Robert Allmeroth        |  76133 Karlsruhe
Tel: +49 721 20596 43   |  Fax: +49 721 20596 59


