From: "Andrea Iacopini" <andrea.iacopini@realtech.it>
Subject: Re: ROUTE and source IPv6 routing - how ?
Date: Tue, 2 Dec 2003 10:35:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012801c3b8b7$91ecb140$fefa1fac@Merlin>
References: <Pine.GSO.4.33.0312011606350.27223-100000@horus.imag.fr> <1070352120.1383.9.camel@descartes>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

unsubscribe
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Andrea Iacopini,
Technology Solutions, Networking and Security Competence Center

REALTECH Italia S.p.A. - Technology drives e-Business
Via Paolo di Dono, 73 - 00142 Roma, Italy

andrea.iacopini@realtech.it
Mobile + 39 335 123.44.93
Tel. +39 06 51.95.981, Fax. +39 06 51.96.36.74
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Valued IEEE Member,
Member NO: 41412812
Real hackers don't die, just their TTL expires. [Unknown]
----- Original Message -----=20
From: "Cedric de Launois" <delaunois@info.ucl.ac.be>
To: "Pawel Hadam" <Pawel.Hadam@imag.fr>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, December 02, 2003 9:02 AM
Subject: Re: ROUTE and source IPv6 routing - how ?


Le lun 01/12/2003 =E0 16:22, Pawel Hadam a =E9crit :
> Hi all
>
> I have two hosts and both have two NICs.
>
> CLIENT: eth0 - ipc0 =3D 2001:660:5301:26:2c0:9fff:fe1a:caca
>         eth1 - ipc1 =3D 2001:688:1fa1:2:204:75ff:fef8:93a4
>
> SERVER: eth0 - ips0 =3D 2001:660:5301:26:210:5aff:febe:bb78
>         eth1 - ips1 =3D 2001:688:1fa1:2:204:75ff:fee8:52fd
>
> As you can see, both eth0 are connected to the same LAN (so have IPv6
> addresses from the same LAN), and both eth1 are connected to the second
> LAN.
>
> According to the normal IPv6 routing, all packets exit from CLIENT to ips0
> always via eth0, and to ips1 always via eth1.
>
> But when I have a client program bound to ipc0 (src =3D ipc0) I would like
> to see all packets exiting via eth0, both packets going to ips0 and to
> ips1. The same way, packets from a client bound to ipc1 (src =3D ipc1)
> should always exit via eth1. Like this:
>
> 1) (ipc0 -> ips0) via eth0
> 2) (ipc0 -> ips1) via eth0
> 3) (ipc1 -> ips0) via eth1
> 4) (ipc1 -> ips1) via eth1
>
>
> To obtain this I used kernel 2.4.22 with netfilter and patch-o-matic
> module ROUTE, and configured this way:
>
>
> mykonos:~ # ip6tables -t mangle -A POSTROUTING --source
> 2001:660:5301:26:2c0:9fff:fe1a:caca -j ROUTE --oif eth0 --continue
>
> mykonos:~ # ip6tables -t mangle -A POSTROUTING --source
> 2001:688:1fa1:2:204:75ff:fef8:93a4 -j ROUTE --oif eth1 --continue
>
> mykonos:~ # ip6tables -t mangle -nL
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
>
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> ROUTE      all      2001:660:5301:26:2c0:9fff:fe1a:caca/128  ::/0
> ROUTE oif:eth0 continue
> ROUTE      all      2001:688:1fa1:2:204:75ff:fef8:93a4/128  ::/0
> ROUTE oif:eth1 continue
>
>
> But it works only in cases 1) and 4). In cases 2) and 3) it gives the
> following messages in /var/log/messages:
>
>
> Dec  1 15:52:29 mykonos kernel: ip6t_ROUTE: no explicit route found via
> interface eth1
>
> Dec  1 15:52:45 mykonos kernel: ip6t_ROUTE: called with:
> DST=3D2001:0688:1fa1:0002:0204:75ff:fee8:52fd
> GATEWAY=3D0000:0000:0000:0000:0000:0000:0000
> :0000 OUT=3Deth0
>
> Dec  1 15:52:45 mykonos kernel: ip6t_ROUTE: no explicit route found via
> interface eth0
>
> Dec  1 15:52:48 mykonos kernel: ip6t_ROUTE: called with:
> DST=3D2001:0688:1fa1:0002:0204:75ff:fee8:52fd
> GATEWAY=3D0000:0000:0000:0000:0000:0000:0000
> :0000 OUT=3Deth0
>
>
>
> And I cannot see any packet exiting any interface.
>
> Could anybody help me with this configuration to reach my target, please
> ??? Or maybe I should change something in my routing table ???

You have to add an entry in your routing table saying that destination
2001:688:1fa1:2:204:75ff:fee8:52fd is reachable through iface ipc0.
Otherwise the ROUTE target can't figure out whether the destination
is on-link or gateway'ed.

Try with something like this :
  ip -f inet6 route add 2001:688:1fa1:2:204:75ff:fee8:52fd dev eth0

Same remark applies for case 3).

Cedric





