From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: Complex NAT problems /sorry for the formated text
Date: Thu, 20 May 2004 10:07:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085062037.22574.5.camel@localhost>
References: <7528A97D83FBD411BEF40003471B905B05D8FF10@smtp.retecal.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7528A97D83FBD411BEF40003471B905B05D8FF10@smtp.retecal.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: CPD - David =?ISO-8859-1?Q?Carde=F1osa?= Rubio <dcardenosa@cac.retecal.es>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-05-20 at 07:45, CPD - David Carde=C3=B1osa Rubio wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> =20
>=20
> Hi=20
>=20
> I have a strage problem with iptables NAT=20
>=20
> I try to join 2 net with the same ip.=20
>=20
>=20
> fwinet-2:~# iptables -L -n -t nat -v=20
> Chain PREROUTING (policy ACCEPT 41232 packets, 2376K bytes)=20
>  pkts bytes target     prot opt in     out     source             =20
> destination=20
>    94  4743 NETMAP     all  --  eth2   *       172.0.0.0/8        =20
> 172.20.4.0/24       172.16.4.0/24=20
>     7   420 NETMAP     all  --  eth1   *       172.16.4.0/24      =20
> 172.20.3.0/24       172.16.33.0/24=20
>=20
> Chain POSTROUTING (policy ACCEPT 21845 packets, 1167K bytes)=20
>  pkts bytes target     prot opt in     out     source             =20
> destination=20
>     0     0 NETMAP     all  --  *      eth1    172.16.33.0/24     =20
> 172.16.4.0/24       172.20.3.0/24=20
>   654 33367 NETMAP     all  --  *      eth2    172.16.4.0/24      =20
> 172.0.0.0/8         172.20.4.0/24=20
>     0     0 SNAT       all  --  *      eth0    172.16.0.0/16      =20
> 0.0.0.0/0           to:192.168.8.6=20
>     0     0 SNAT       all  --  *      eth0    172.40.40.0/22     =20
> 0.0.0.0/0           to:192.168.8.6=20
>     0     0 SNAT       all  --  *      eth0    172.60.60.0/24     =20
> 0.0.0.0/0           to:192.168.8.6=20
>   394 32515 SNAT       all  --  *      eth0    10.152.24.100      =20
> 0.0.0.0/0           to:192.168.8.6=20
>     0     0 MASQUERADE  all  --  *      eth1    0.0.0.0/0          =20
> 172.16.4.14=20
>=20
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)=20
>  pkts bytes target     prot opt in     out     source             =20
> destination=20
>=20
>=20
> The 1=C2=BA rule in POSTROUTING table don=C2=B4t work, the packets go to =
the
> inteface eth1 with the original ip, i have the same problem for the
> other NETMAP rules(i also try with SNAT/DNAT) but when y reboot de
> firewall the rules apply correctly.
>=20
> This only happend when modify the rules and no reboot, if reboot and
> load the firewall script (with the new rules) all work ok.
>=20
>=20
> fwinet-2:~# tcpdump -i eth2 -n icmp=20
> tcpdump: listening on eth2=20
> 13:25:38.157106 172.16.33.1 > 172.20.4.11: icmp: echo request=20
> 13:25:39.158705 172.16.33.1 > 172.20.4.11: icmp: echo request=20
>=20
> fwinet-2:~# tcpdump -i eth1 -n icmp=20
> tcpdump: listening on eth1=20
> 13:25:43.163094 172.16.33.1 > 172.16.4.11: icmp: echo request=20
>=20
> It=C2=B4s very strange.=20
>=20
> fwinet-2:~# uname -a=20
> Linux fwinet-2 2.4.26 #2 Mon May 17 21:11:05 CEST 2004 i686 unknown=20
<snip>
I can't give you an easy answer but I can suggest some process.  Have
you compared the rule listings before and after a change? Have you
placed logging rules within your rule set to see where the packets are
being unexpectedly accepted or dropped?
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net=20


