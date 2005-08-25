From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: Problem with conntrack, all packet are marked as invalid.
Date: Thu, 25 Aug 2005 16:16:03 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF860BFC93@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Tien-Ren Chen <trchen1033@gmail.com>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

Hi

if you have a static ip situation i would use the snat target, thats not =
the problem but just noticed..
please post your iptables startup script or the output of iptables-save.
one thing i've never seen before is the "ctstate" output anybody any =
idea?!

greets matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of=20
> Tien-Ren Chen
> Sent: Wednesday, August 24, 2005 4:51 PM
> To: netfilter@lists.netfilter.org
> Subject: Problem with conntrack, all packet are marked as invalid.
>=20
>=20
>   Hi all,
> I'm updating the kernel of my NAT box running Gentoo=20
> distribution, from=20
> 2.6.8-gentoo to 2.6.12-nitro5.
> After that, forwarding of packets from outside(the internet) to local=20
> seems down.
> I examined my iptables, and found this line do not catch=20
> packets anymore.
>  233M  167G ACCEPT     all  --  out    in      0.0.0.0/0           =20
> 0.0.0.0/0           ctstate RELATED,ESTABLISHED
> I added the following rules to check what happened:
>     8   424 LOG        all  --  *      *       140.112.90.73       =20
> 0.0.0.0/0           ctstate INVALID LOG flags 0 level 4
>     0     0 LOG        all  --  *      *       140.112.90.73       =20
> 0.0.0.0/0           ctstate NEW LOG flags 0 level 4
>     0     0 LOG        all  --  *      *       140.112.90.73       =20
> 0.0.0.0/0           ctstate ESTABLISHED LOG flags 0 level 4
>     0     0 LOG        all  --  *      *       140.112.90.73       =20
> 0.0.0.0/0           ctstate RELATED LOG flags 0 level 4
> All packets are marked as INVALID, however, connection=20
> tracking works well:
> $ cat /proc/net/ip_conntrack
> tcp      6 429538 ESTABLISHED src=3D172.21.0.2 dst=3D140.112.90.73=20
> sport=3D1669 dport=3D23 packets=3D440 bytes=3D18445 =
src=3D140.112.90.73=20
> dst=3D140.109.224.64 sport=3D23 dport=3D1669 packets=3D362 =
bytes=3D185484=20
> [ASSURED] mark=3D0 use=3D1
>=20
> I'm not sure if it's a netfilter bug or it's my misconfiguration.
> I tried searching on the google and the netfilter FAQs, but no luck.
> Does anyone have some clue for it? Thanks for any help.
> --
> Tien-Ren Chen, 2005/08/24.
>=20
> Sorry for my bad English.
> --
>=20
> Here's my network configuration:
> out:  140.109.224.64/24 connect to internet with static adsl
> in:   172.21.0.1/24     bridge two local networks (hub + giga)
> hub:  (null)            connect to my 100m switch
> giga: (null)            connect to my laptop dock
>=20
> Here's my original iptables rules:
> Chain INPUT (policy ACCEPT 312M packets, 149G bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>=20
> Chain FORWARD (policy DROP 67 packets, 49048 bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>  233M  167G ACCEPT     all  --  out    in      0.0.0.0/0           =20
> 0.0.0.0/0           ctstate RELATED,ESTABLISHED
>  236M  142G ACCEPT     all  --  in     out     0.0.0.0/0           =20
> 0.0.0.0/0
> 1679K   86M ACCEPT     tcp  --  out    *       0.0.0.0/0           =20
> 172.21.0.2          tcp dpt:12664
>   10M  628M ACCEPT     udp  --  out    *       0.0.0.0/0           =20
> 172.21.0.2          udp dpt:12764
>  624K   33M ACCEPT     tcp  --  out    *       0.0.0.0/0           =20
> 172.21.0.2          tcp dpt:12666
> 41496 5019K ACCEPT     all  --  in     in      0.0.0.0/0           =20
> 0.0.0.0/0
>   518 25096 ACCEPT     tcp  --  out    *       0.0.0.0/0           =20
> 172.21.0.2          tcp dpt:80
>=20
> Chain OUTPUT (policy ACCEPT 471M packets, 500G bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>=20
> Chain PREROUTING (policy ACCEPT 19M packets, 1152M bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>     0     0 DROP       all  --  out    *       172.21.0.0/24       =20
> 0.0.0.0/0
> 1677K   84M DNAT       tcp  --  out    *       0.0.0.0/0           =20
> 0.0.0.0/0           tcp dpt:12664 to:172.21.0.2
>   10M  634M DNAT       udp  --  out    *       0.0.0.0/0           =20
> 0.0.0.0/0           udp dpt:12764 to:172.21.0.2
>  639K   33M DNAT       tcp  --  out    *       0.0.0.0/0           =20
> 0.0.0.0/0           tcp dpt:12666 to:172.21.0.2
>   362 17652 DNAT       tcp  --  out    *       0.0.0.0/0           =20
> 0.0.0.0/0           tcp dpt:80 to:172.21.0.2
>=20
> Chain POSTROUTING (policy ACCEPT 14M packets, 861M bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
> 8970K  572M MASQUERADE  all  --  *      out     172.21.0.0/24       =20
> 0.0.0.0/0
>=20
> Chain OUTPUT (policy ACCEPT 1468K packets, 126M bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>=20
>=20
>=20

