From: ro0ot <ro0ot@phreaker.net>
Subject: Re: Two link adsl on the same server
Date: Wed, 11 May 2005 01:08:37 +0800
Message-ID: <4280EA95.8020306@phreaker.net>
References: <00ee01c5557d$e1979d90$8b00000a@PIVT>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00ee01c5557d$e1979d90$8b00000a@PIVT>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?=22Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29=22?= <sa.campos@datasulsp.com.br>
Cc: Netfilter list <netfilter@lists.netfilter.org>

Below is only examples: -

First, include this in /etc/iproute2/rt_tables as below: -

201 http.out
202 ftp.out
203 smtp.out
204 pop3.out

Next, include this in a preferred executable file such as=20
/usr/local/bin/rc.routing as below: -

#!/bin/sh

# first ISP
ip route add 1.1.1.68/30 dev eth2 src 1.1.1.70 table 1
ip route add default via 1.1.1.69 table 1

# second ISP
ip route add 2.2.2.116/30 dev eth4 src 2.2.2.118 table 2
ip route add default via 2.2.2.117 table 2

ip rule add from 1.1.1.70 table 1
ip rule add from 2.2.2.118 table 2

ip route add 172.17.0.0/16 dev eth1 table 1
ip route add 2.2.2.116/30 dev eth4 table 1

ip route add 172.17.0.0/16 dev eth1 table 2
ip route add 1.1.1.68/30 dev eth2 table 2

ip route add default scope global nexthop via 1.1.1.70 dev eth2 nexthop=20
via 2.2.2.118 dev eth4

ip rule add fwmark 1 table http.out
ip rule add fwmark 2 table ftp.out
ip rule add fwmark 3 table smtp.out
ip rule add fwmark 4 table pop3.out

ip route add default via 1.1.1.69 dev eth2 table http.out
ip route add default via 1.1.1.69 dev eth2 table ftp.out

ip route add default via 2.2.2.117 dev eth4 table smtp.out
ip route add default via 2.2.2.117 dev eth4 table pop3.out

Next, include this in a preferred executable file such as=20
/usr/local/bin/rc.firewall as below: -

#!bin/sh

iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to-source 1.1.1.70
iptables -t nat -A POSTROUTING -o eth4 -j SNAT --to-source 2.2.2.118

iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 80 -j MARK=20
--set-mark 1
iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 21 -j MARK=20
--set-mark 2
iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 25 -j MARK=20
--set-mark 3
iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 110 -j MARK=20
--set-mark 4

Hope it helps...

Regards,
ro0ot


Sebasti=E3o Ant=F4nio Campos (GWA) wrote:

>Hi!
>
>We have two ADSL link on the same server and we'd like to use load balan=
ce.
>
>I tried to used, but I didn't have success.
>
>I use on eth1 172.17.1.6 mask 255.255.0.0 my local network;
>on eth2 my first ADSL 200.168.1.19 mask 255.255.255.192 default gw 200.2=
04.140.1
>on eth4 my first ADSL 200.204.140.10 mask 255.255.255.192 default gw 200=
.179.1.1
>
>This IP are static.
>
>On my local network I have two servers (E-mail server and one web server=
) and I need to PREROUTING with DNAT.
>
>And we would like to separate the port 80 and 21 using one link on eth0 =
and the port 25 and 110 other link eth4 and other ports eth0 or eth4 link=
.
>
>My files:
>
>My ifcfg-ethx files:
>
>#NIC SIS on board, usando link1 ADSL
>DEVICE=3Deth0
>ONBOOT=3Dyes
>#BOOTPROTO=3Ddhcp
>BOOTPROTO=3Dstatic
>BROADCAST=3D200.168.1.63
>IPADDR=3D200.168.1.19
>NETMASK=3D255.255.255.192
>NETWORK=3D200.168.1.0
>#GATEWAY=3D200.168.1.1
>___________________________________________________________
>#Placa Realtek, Uso Local, slot 1
>DEVICE=3Deth1
>ONBOOT=3Dyes
>BOOTPROTO=3Dstatic
>IPADDR=3D172.17.1.6
>BROADCAST=3D172.17.255.255
>NETMASK=3D255.255.0.0
>NETWORK=3D172.17.0.0
>________________________________________________________
>#NIC Realtek, link 2 ADSL
>DEVICE=3Deth4
>ONBOOT=3Dyes
>BOOTPROTO=3Dstatic
>BROADCAST=3D200.204.140.63
>IPADDR=3D200.204.140.10
>NETMASK=3D255.255.255.192
>NETWORK=3D200.204.140.0
>
>_________________________________________________
>file /etc/sysconfig/network
>
>NETWORKING=3Dyes
>HOSTNAME=3Drbz-firewall
>#GATEWAY=3D200.168.1.1
>GATEWAY=3D200.204.140.1
>___________________________________________________
>file /etc/iproute2/rt_tables
>
>#
># reserved values
>#
>#255    local
>#254    main
>#253    default
>#0      unspec
>=20
>#
># local
>#
>#1      inr.ruhep
>
>
>Could some one help me??
>
>Thanks
>
>
>Sebasti=E3o Ant=F4nio Campos
>Infojoi Computadores Ltda
>89.224-000 Joinville -SC - R. Iriri=FA, 3587
>Cml. (47) 437-0796 - Cel. (47) 9927-5349
>tiao@infojoi.com.br
>http://www.lupusnet.com.br
>
>
> =20
>




