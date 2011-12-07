From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: SOLVED: What happens after PREROUTING/nat ?
Date: Wed, 07 Dec 2011 19:23:02 +0100
Message-ID: <4EDFAF06.3050702@freemail.hu>
References: <4EDFA920.4040804@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EDFA920.4040804@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

Hi list,

I found the problem and the solution... :D

I was just trying to find the bug when I simply started tcpdump... and=20
it all started to work...
I did not told you that the LAN is a bridge with an ethernet interface=20
on one side and a vpn on the other side...
And somehow the PROMISC flag was deleted on this interface on the "A"=20
firewall... (tcpdump sets and resets this flag...)

Can anyone explain it to me why it is needed to have a PROMISC flag for=
=20
the triangle setup?

Thanx

Swifty

2011-12-07 18:57 keltez=E9ssel, G=E1sp=E1r Lajos =EDrta:
> Hi list,
>
> I know that the answer is routing...
> But...
> I have a triangle problem...
>
> Take this example:
>
> "A": the local router/gateway/firewall connected to the Internet and=20
> the LAN
> "B": a server on the LAN
> "C": a client on the same LAN or on the other side (Internet)
>
> If "C" connects from the Internet to a service on "A" (in reality the=
=20
> service is on "B") then everything is fine because I can DNAT the=20
> packets to "B"...
> But if "C" is in the LAN then the packets are simply disappearing...
>
> I made some logging and the !!LAST!! TRACE in my syslog is (a bit=20
> cleaned up version):
>
> Dec  7 18:35:55 TRACE: nat:PRE_LAN_POP3:rule:1 IN=3Dbr1 OUT=3D=20
> PHYSIN=3Dvlan100 SRC=3DLAN_IP_OF_C DST=3DWAN_IP_OF_A PROTO=3DTCP SPT=3D=
59036=20
> DPT=3D110 SEQ=3D3967862358 ACK=3D0 WINDOW=3D14600 RES=3D0x00 SYN URGP=
=3D0 OPT=20
> (020405B40402080A26E062280000000001030304) MARK=3D0x5c
>
> ... and the rule:
>
> #iptables -vnL PRE_LAN_POP3 -t nat
> Chain PRE_LAN_POP3 (3 references)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>    12   720 DNAT       tcp  --  *      *       0.0.0.0/0          =20
> !LAN_IP_OF_B         to:LAN_IP_OF_B
>
> So what happens next? Any thoughts?
>
> sysctl settings:
> net.ipv4.ip_forward =3D 1
> net.ipv4.conf.all.forwarding =3D 1
> net.ipv4.conf.all.accept_redirects =3D 0
> net.ipv4.conf.all.accept_source_route =3D 0
> net.ipv4.conf.all.log_martians =3D 1
> net.ipv4.conf.all.proxy_arp =3D 0
> net.ipv4.conf.all.rp_filter =3D 0
> net.ipv4.conf.all.secure_redirects =3D 1
> net.ipv4.conf.all.send_redirects =3D 0
> net.ipv4.conf.default.proxy_arp =3D 0
> net.ipv4.conf.default.rp_filter =3D 0
> net.ipv4.icmp_echo_ignore_broadcasts =3D 1
> net.ipv4.icmp_ignore_bogus_error_responses =3D 1
> net.ipv4.tcp_abort_on_overflow =3D 1
> net.ipv4.tcp_ecn =3D 2
> net.ipv4.tcp_fack =3D 1
> net.ipv4.tcp_low_latency =3D 1
> net.ipv4.tcp_mtu_probing =3D 1
> net.ipv4.tcp_sack =3D 1
> net.ipv4.tcp_syncookies =3D 1
> net.ipv4.tcp_timestamps =3D 1
> net.ipv4.tcp_window_scaling =3D 1
> net.ipv6.conf.all.disable_ipv6 =3D 1
>
> Thanks for your help,
>
> Swifty
>
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
