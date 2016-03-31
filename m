From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Split traffic between VPN and local interface
Date: Thu, 31 Mar 2016 14:23:26 +0200
Message-ID: <56FD16BE.6050605@plouf.fr.eu.org>
References: <CAL6-xCbC6gDCYMZ9KhctcGRQ=6kQZL2oZGNEV6NT9NQRO44BUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAL6-xCbC6gDCYMZ9KhctcGRQ=6kQZL2oZGNEV6NT9NQRO44BUQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Perol.Chen" <perol.chen@gmail.com>
Cc: netfilter@vger.kernel.org

Le 31/03/2016 07:32, Perol.Chen a =C3=A9crit :
> Dear all:
>
> I start one vpn client on my computer, but I want my country's traffi=
c
> direct from local interface,
>
> because the ip list is large, so I save them to ipset named chinaip.
>
> I use commands below split the traffic, 192.168.1.1 is local interfac=
e
> gateway, 10.7.0.2 is the vpn tun ip.
>
>
> id=3D"11"
> ip rule add fwmark $id lookup $id
> ip route add default via 192.168.1.1 table $id
> iptables -t mangle -I OUTPUT 1 -m set --match-set chinaip dst -j MARK
> --set-mark $id
> iptables -t nat -A POSTROUTING -s 10.7.0.2 -o eth0 -j MASQUERADE
>
>
> wireshark show the traffic send to eth0, but the local process can no=
t
> receive data.
>
> 128    5.583482000    192.168.1.118    180.149.134.141    TCP    74
> 33474 > http [SYN] Seq=3D0 Win=3D27840 Len=3D0 MSS=3D1392 SACK_PERM=3D=
1
> TSval=3D17843425 TSecr=3D0 WS=3D128
>
> 129    5.586962000    180.149.134.141    192.168.1.118    TCP    66
> http > 33474 [SYN, ACK] Seq=3D0 Ack=3D1 Win=3D14600 Len=3D0 MSS=3D144=
8
> SACK_PERM=3D1 WS=3D128
>
> 249    6.332233000    192.168.1.118    180.149.134.141    TCP    74
> [TCP Retransmission] 33473 > http [SYN] Seq=3D0 Win=3D27840 Len=3D0 M=
SS=3D1392
> SACK_PERM=3D1 TSval=3D17843613 TSecr=3D0 WS=3D128
>
> 250    6.335188000    180.149.134.141    192.168.1.118    TCP    66
> [TCP Retransmission] http > 33473 [SYN, ACK] Seq=3D0 Ack=3D1 Win=3D14=
600
> Len=3D0 MSS=3D1448 SACK_PERM=3D1 WS=3D128
>
> There are all TCP Retransmission, Are there something problems?

You probably need to disable rp_filter on eth0.
