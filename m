From: dynexbeats <dynexbeats@protonmail.com>
Subject: SNAT not translating all iperf3 packets
Date: Tue, 29 Mar 2022 15:20:51 +0000
Message-ID: <jj26twKvrI-lipy4OQOUOoSWPTixiZ6deMQSMefpuvI5yOBJ6GTguGkgAWONg-p8M1kihbGah28aZRYlXVtzqtLjCpNPci9CXpGwK3fhB8s=@protonmail.com>
Reply-To: dynexbeats <dynexbeats@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1648567252;
        bh=TTmA3EoITPUItT4JM6hQ+pQz3JF6IPFdAG3bItwy8pM=;
        h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
         Reply-To:Feedback-ID:Message-ID;
        b=J1AlHVy++YnyiXx6AdZpcE7LZwmB3rry1LaxY+2sYypcuqqIh6fUz+h5J94b0sjPw
         MIVibsz+mLg6t7kXaRq7+LX2EVJ5MCGMAZwx8D1v6SBk62ZEIuxid+XPY5TQBPvQbd
         UxsUiep2X2P6wqNwNiyJXHbQVBv1n1cfLF/Gd1xIvmRKYsquQq0it+nG2GJTuJ5F5F
         DFY7FydlKM5M44swuxWsIgnuR6tBaNUusx+IgC8lhsMLVOKwMsE83N6LBrT7MYwIZ8
         nkvGVFerFTQuIV2hi4mI0j/qiSm5dS5Kwikh4TdmqGV9DRgt3nfUOS2xLePsGGVQhN
         fXZH8WcLfU4/A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I am doing testing with iperf3 (multiple connections) through a Linux node =
that is performing SNAT on all IP traffic to a pool of IPs, and I am notici=
ng that a few iperf3 packets are not being SNAT'ted at all:

*snip of iperf3 server output*
[ 85] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37646
[ 87] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37648
[ 89] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37650
[ 91] local 2.2.2.110 port 5201 connected to 192.168.20.20 port 37652
[ 93] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37654
[ 95] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37656
*/snip*

I noticed a few threads in this mailing list mentioning that conntrack pack=
ets/flows that are viewed as INVALID will not be SNAT'ted, however I am not=
 understanding how that can be with the traffic I am generating with iperf3=
. It appears that all the connections iperf3 is generating are essentially =
the same with the exception of the source port (look to be increments of 2)=
.

The session does appear to be normal (or valid) as per the " conntrack -L "=
 output:

*snip of ' conntrack -L ' output*
tcp      6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D3764=
6 dport=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37646 [AS=
SURED] mark=3D0 use=3D1
tcp      6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D3764=
8 dport=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37648 [AS=
SURED] mark=3D0 use=3D1
tcp      6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D3765=
0 dport=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37650 [AS=
SURED] mark=3D0 use=3D1
tcp      6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D3765=
2 dport=3D5201 src=3D2.2.2.110 dst=3D192.168.20.20 sport=3D5201 dport=3D376=
52 [ASSURED] mark=3D0 use=3D1
tcp      6 431982 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D3=
7654 dport=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37654 =
[ASSURED] mark=3D0 use=3D1
tcp      6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D3765=
6 dport=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37656 [AS=
SURED] mark=3D0 use=3D1
*/snip*


Is there anything that I am missing or not taking into consideration??


Here is the iperf3 (client side) command I am using:
iperf3 -Z -t 300 -P 37 --connect-timeout 2000 -c 2.2.2.110

 -Z =3D zerocopy /// -t =3D duration in seconds (5min) /// -P =3D parallel =
connections or streams

Here is the nftables ruleset for the forwarding and SNAT function:

table inet testing {

=09chain forward {
=09=09type filter hook forward priority 0; policy drop;
=09=09ct state { established,related } limit rate 200 mbytes/second burst 6=
4 kbytes counter accept;
=09=09ct state { new } counter accept;
=09}

=09chain postrouting {
=09=09type nat hook postrouting priority srcnat;
=09=09ip protocol {tcp,udp,icmp} oif vlan2001 snat to 3.3.3.3-3.3.3.4;
=09}
}


Linux node performing SNAT is running 5.13.0-27 kernel.
