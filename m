From: Patrick Chemla <patrick.chemla@perfaction.net>
Subject: Re: I can't make forwarding
Date: Tue, 16 Feb 2010 16:05:41 +0200
Message-ID: <4B7AA635.2010002@perfaction.net>
References: <4B7A7F39.5090808@perfaction.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <4B7A7F39.5090808@perfaction.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I tried more and doing this I can access to internet from a computer in=
=20
the local network:
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables --table nat --append POSTROUTING --out-interface eth1 -j MASQU=
ERADE
iptables --table nat --append POSTROUTING --out-interface eth0 -j MASQU=
ERADE

But the computer is viewed with the NAT router external local IP.

I need to have internal computers viewed with a different IP external=20
address.

Patrick


Le 16/02/2010 13:19, Patrick Chemla a =E9crit :
> Hi,
>
> I have problems to setup a NAT router using iptables.
>
> My NAT Router is running Fedora 11.
>
> I have 2 interfaces, eth0 10.0.0.1 is internal, eth1 172.25.2.2 is=20
> external.
>
> I have 10 external public addresses coming to the interface eth1 that=
=20
> I want to forward to 10 internal computers on eth0.
>
> When I try to ping or access an external web server from the NAT=20
> server itself, it works very fine. I see on the remote server the=20
> external address of the NAT router itself.
> When I try to ping or wget an external web server from an internal=20
> 10.0.0.151 computer,  using TCPDUMP both on the foreign server=20
> interface and on the eth1 of the NAT router, I see  that packets reac=
h=20
> the external server with the right IP 192.114.84.144, I see that the=20
> external server send back something, but I can't get it back on the=20
> eth1 tcpdump.
>
> Here is my iptables:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> iptables -n  -L -v
> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>  1664  208K ACCEPT     all  --    *       *      =20
> 0.0.0.0/0             0.0.0.0/0           state NEW,RELATED,ESTABLISH=
ED
>     0     0 ACCEPT           icmp --  *       *      =20
> 0.0.0.0/0             0.0.0.0/0
>     0     0 ACCEPT            all  --   lo      *      =20
> 0.0.0.0/0             0.0.0.0/0
>     0     0 ACCEPT             tcp  --  *       *      =20
> 0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22
>
> Chain FORWARD (policy ACCEPT 3499 packets, 213K bytes)
>  pkts bytes target     prot opt in     out        =20
> source               destination
>     0     0 ACCEPT         all  --    eth0   eth1   =20
> 10.0.0.151           192.114.84.144      state NEW,RELATED,ESTABLISHE=
D
>     0     0 ACCEPT         all  --    eth1   eth0   =20
> 192.114.84.144       10.0.0.151          state NEW,RELATED,ESTABLISHE=
D
>
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target      prot opt in     out     source              =20
> destination
>   466 71467 ACCEPT     all     --  *        *      =20
> 0.0.0.0/0            0.0.0.0/0           state NEW,RELATED,ESTABLISHE=
D
>     0     0       ACCEPT     icmp --   *        *      =20
> 0.0.0.0/0            0.0.0.0/0
>
> Here is my NAT table:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> iptables -n -t nat -L -v
> Chain PREROUTING (policy ACCEPT 915 packets, 129K bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>     0     0        DNAT      tcp    --  eth1   *      =20
> 192.114.84.144       0.0.0.0/0           to:10.0.0.151
>
> Chain POSTROUTING (policy ACCEPT 75 packets, 6372 bytes)
>  pkts bytes target     prot opt in      out     source              =20
> destination
>    16   960     SNAT       all     --    *      eth1   =20
> 10.0.0.151           0.0.0.0/0           to:192.114.84.144
>
> Chain OUTPUT (policy ACCEPT 36 packets, 3998 bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>
>
> I think I ACCEPT and FORWARD all, I have both SNAT and DNAT, but I=20
> missed something.
>
> Help will be welcome.
>
> Patrick
>
>
>
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

