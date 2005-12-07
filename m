From: stefanb@zitmail.uni-paderborn.de
Subject: Re: U60 and masquerading
Date: Wed,  7 Dec 2005 21:13:59 +0100
Message-ID: <1133986439.43974287562fb@zitmail.uni-paderborn.de>
References: <20051207175426.GA16442@rayleigh.systella.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051207175426.GA16442@rayleigh.systella.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,
this looks much like the same problem I have on my U10 with kernels 2.6.9 a=
nd
up. Supposedly masqueraded connections show up as unreplied in
/proc/net/ip_conntrack, and /proc/net/ip_conntrack_expect is empty.

Things are working fine for me using kernel 2.6.8.1. I haven't tested 2.4.x.
There is no /proc/net/ip_conntrack_expect in 2.6.8.1, so I suspect this cha=
nge
introduced a bug.

Unfortunately, I do not know how to get it working except by using an older=
 kernel.

Regards,
Stefan Boettner


Quoting BERTRAND Jo=EBl <mt@systella.fr>:

>  	Hello,
>=20
>  	I'm trying to use iptables on a ULTRASparc U60 (smp) without any
>  	success. I use the same version of iptables on several i386, an
>  	U420R (kernel 2.4 SMP) and an U1E with succes...
>=20
>  Root bohr:[~] > lsmod
>  Module                  Size  Used by
>  iptable_mangle          3328  0=20
>  autofs4                18632  1=20
>  ipt_TCPMSS              4800  0=20
>  ipt_tcpmss              3008  0=20
>  ipt_MASQUERADE          3844  1=20
>  iptable_nat             8708  1=20
>  ip_nat                 20824  2 ipt_MASQUERADE,iptable_nat
>  ip_conntrack           60264  3 ipt_MASQUERADE,iptable_nat,ip_nat
>  iptable_filter          3392  0=20
>  ip_tables              21184  6
>=20
> iptable_mangle,ipt_TCPMSS,ipt_tcpmss,ipt_MASQUERADE,iptable_nat,iptable_f=
ilter
>  sg                     33720  0=20
>  sr_mod                 16940  0=20
>  cdrom                  40880  1 sr_mod
>  usblp                  12928  0=20
>  parport_pc             39816  0=20
>  parport                41688  1 parport_pc
>  Root bohr:[~] > iptables -L -n
>  Chain INPUT (policy ACCEPT)
>  target     prot opt source               destination        =20
>=20
>  Chain FORWARD (policy ACCEPT)
>  target     prot opt source               destination        =20
>=20
>  Chain OUTPUT (policy ACCEPT)
>  target     prot opt source               destination        =20
>  Root bohr:[~] > iptables -t nat -L -n
>  Chain PREROUTING (policy ACCEPT)
>  target     prot opt source               destination        =20
>=20
>  Chain POSTROUTING (policy ACCEPT)
>  target     prot opt source               destination        =20
>  MASQUERADE  all  --  192.168.0.0/24       0.0.0.0/0          =20
>=20
>  Chain OUTPUT (policy ACCEPT)
>  target     prot opt source               destination        =20
>  Root bohr:[~] > cat /proc/sys/net/ipv4/ip_forward=20
>  1
>  Root bohr:[~] >=20
>=20
>  192.168.0.100 is a i386 workstation. Its default gateway is
>  192.168.0.128.
>=20
>  192.168.0.128 is the second ethernet interface of my U60. Address of the
>  first one is 10.0.0.1 and is used to be the support of ppp0.
>=20
>  When I try to ping www.kernel.org from 192.168.0.200. I can see :
>  Root bohr:[~] > tcpdump -i eth1 proto ICMP
>  tcpdump: verbose output suppressed, use -v or -vv for full protocol
>  decode
>  listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes
>  18:04:56.333172 IP 192.168.0.100 > zeus-pub1.kernel.org: ICMP echo
>  request, id 53550, seq 13056, length 64
>  18:04:57.337379 IP 192.168.0.100 > zeus-pub1.kernel.org: ICMP echo
>  request, id 53550, seq 13312, length 64
>  18:04:58.341366 IP 192.168.0.100 > zeus-pub1.kernel.org: ICMP echo
>  request, id 53550, seq 13568, length 64
>  18:04:59.345455 IP 192.168.0.100 > zeus-pub1.kernel.org: ICMP echo
>  request, id 53550, seq 13824, length 64
>=20
>  4 packets captured
>  8 packets received by filter
>  0 packets dropped by kernel
>  Root bohr:[~] > tcpdump -i ppp0 proto ICMP
>  tcpdump: verbose output suppressed, use -v or -vv for full protocol
>  decode
>  listening on ppp0, link-type LINUX_SLL (Linux cooked), capture size 96
>  bytes
>  18:05:36.501017 IP bohr.systella.fr > zeus-pub1.kernel.org: ICMP echo
>  request, id 53550, seq 23296, length 64
>  18:05:36.712653 IP zeus-pub1.kernel.org > bohr.systella.fr: ICMP echo
>  reply, id 53550, seq 23296, length 64
>  18:05:37.505105 IP bohr.systella.fr > zeus-pub1.kernel.org: ICMP echo
>  request, id 53550, seq 23552, length 64
>  18:05:37.717251 IP zeus-pub1.kernel.org > bohr.systella.fr: ICMP echo
>  reply, id 53550, seq 23552, length 64
>  18:05:38.509186 IP bohr.systella.fr > zeus-pub1.kernel.org: ICMP echo
>  request, id 53550, seq 23808, length 64
>  18:05:38.723250 IP zeus-pub1.kernel.org > bohr.systella.fr: ICMP echo
>  reply, id 53550, seq 23808, length 64
>=20
>  6 packets captured
>  12 packets received by filter
>  0 packets dropped by kernel
>  Root bohr:[~] > cat /var/lib/iptables/active=20
>  # Generated by iptables-save v1.2.7a on Tue Mar  4 10:43:40 2003
>  *nat
>  :PREROUTING ACCEPT [5:340]
>  :POSTROUTING ACCEPT [0:0]
>  :OUTPUT ACCEPT [334:24336]
>  [334:24336] -A POSTROUTING -s 192.168.0.0/255.255.255.0 -j MASQUERADE=20
>  COMMIT
>  # Completed on Tue Mar  4 10:43:40 2003
>  # Generated by iptables-save v1.2.7a on Tue Mar  4 10:43:40 2003
>  *filter
>  :INPUT ACCEPT [3612:629789]
>  :FORWARD ACCEPT [0:0]
>  :OUTPUT ACCEPT [3708:560260]
>  COMMIT
>  # Completed on Tue Mar  4 10:43:40 2003
>  Root bohr:[~] >=20
>=20
> 	When I try to make a ping over the U60, I obtain :
>=20
>  Root bohr:[~] > cat /proc/net/ip_conntrack | grep icmp
>  icmp     1 29 src=3D192.168.0.100 dst=3D213.41.184.253 type=3D8 code=3D0=
 id=3D64616
>  packets=3D2888 bytes=3D242592 [UNREPLIED] src=3D213.41.184.253
> dst=3D213.41.140.153
>  type=3D0 code=3D0 id=3D64616 packets=3D0 bytes=3D0 mark=3D0 use=3D1
>  Root bohr:[~] >=20
>=20
>  	Strange, isn't it ?
>=20
>  	Thus, all paquets taht come from 192.168.0.100 are routed by ppp0.
>  	www.kernel.org answers to my ping, but my U60 doesn't transmet the
>  	incoming paquet to 192.168.0.100. Why ? Any idea ?
>=20
>  	Regards,
>=20
>  	JKB
>=20
>=20



