From: "Kjetil Laasby" <Kjetil@laasby.com>
Subject: ip_nat_pptp & ip_conntrack_pptp help appreciated.
Date: Mon, 30 Sep 2002 23:10:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0EB90DD25728C04CBD401CDCD72D2A655A8A@homer.no.laasby.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello !

I've got a little problem thats disrupting my nightsleep - and I
 hope someone could point me into where I'm doing wrong.=20

My configuration is like this :=20
---------------------------------------------
80.x.x.x  (Valid IP)
Cisco DSL router=20
(one rule - NAT all to 10.0.2.1)
   |
10.0.2.1 - RedHat 7.3 - kernel-2.4.20-pre8   (this Iface will receive
							     all data
from valid-IP)
	(Routing enabled, Netfilter 1.2.7a)
10.0.0.1 - RedHat 7.3 - kernel-2.4.20-pre8
   |
10.0.0.2 - Windows box (Client)

My goal is to have a PPTP server (with PoPToP).=20
-------------------------------------------------
The kernel is built with MPPE support, and everything seems OK with=20
the kernel, pptpd, ppp and ms-chap2 authentication part.

The following statements are vital :=20
-------------------------------------
1 If I PPTP connect internally (from 10.0.0.2 =3D> 10.0.2.1) - all is=20
  OK, but I want to connect from the outside.
2 If I enable GRE and 1723 on the 10.0.2.1 interface and tries to=20
  use a PPTP client to the external-IP (80.x.x.x) - nothing works.=20
  (tcp->connect() to 1723 work, but GRE negotiation fails)
3 If PoPToP listens to the 10.0.0.1 interface, and I DNAT's GRE &=20
  1723 from 10.0.2.1 - it works (without ip_nat_pptp).=20
4 If I then modprobe ip_nat_pptp, nothing works. (Either to another
  PPTP server in the universe, or to my own local)

My questions are :=20
------------------------------------
- Why does GRE not function when I try to connect in statement 2?
- Statement 3 works, but is unrealiable. I believe this has something
  to do with conn_track_pptp/gre ? A lot of " Buffering out-of-order=20
  packet; got 2 after 0" error messages. Why does this work and not 2?
- Are there a better architectual solution - or: What would you do?
- I believe I've misunderstood something vital here, could someone
  please point it out ? ;-)

Script to forward in statement 3=20
-----------------------------------
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 1723 -j DNAT
--to 10.0.0.1
/sbin/iptables -t nat -A PREROUTING -i eth1 -p 47 -j DNAT --to 10.0.0.1
(should be pretty plain)

Following interessting modules are loaded :=20
------------------------------------------------
ip_conntrack_pptp       3392   0  (autoclean)
ip_conntrack_proto_gre  3328   0  [ip_conntrack_pptp]
ipt_REDIRECT            1408   0  (autoclean)
ppp_mppe               24736   0  (autoclean)
ppp_async               8096   0  (autoclean)
ppp_generic            23692   0  (autoclean) [ppp_mppe ppp_async]
slhc                    6092   0  (autoclean) [ppp_generic]
ipt_multiport           1216   5  (autoclean)
ipt_LOG                 4160   3  (autoclean)
ipt_state               1056  86  (autoclean)
iptable_nat            19124   1  (autoclean) [ipt_REDIRECT]
iptable_filter          2336   1  (autoclean)
ipt_conntrack           1664   0  (autoclean) (unused)
ip_tables              13728   9  (autoclean) [ipt_REDIRECT
ipt_multiport ipt_LO
G ipt_state iptable_nat iptable_filter ipt_conntrack]
ip_conntrack           25996   5  (autoclean) [ip_conntrack_pptp
ip_conntrack_pr
oto_gre ipt_REDIRECT ipt_state iptable_nat ipt_conntrack]

TIA !

Regards,
Kjetil Laasby

PS. Keep up the good work!






=20

