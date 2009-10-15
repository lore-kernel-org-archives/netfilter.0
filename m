From: "Roderick Groesbeek" <r.groesbeek@triple-it.nl>
Subject: conntrack generates UDP 'ghost traffic'
Date: Thu, 15 Oct 2009 18:23:45 +0200
Message-ID: <3F6AD08836AD044C935E9FAC3A764742024241BE@pandora.triple.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi list,

We have a situation where the result is that UDP traffic is flooded to =
all our ports on our switch infrastructure.

Situation:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Android <-> {wifi} <-> Linux Nat <-> Tiss (Triple streaming server prod=
uct)

We have an ESTABLISHED TCP connection...

[root@pollux conntrack-tools-0.9.13 ]# conntrack -L -p tcp --dport 554
tcp      6 405224 ESTABLISHED src=3D192.168.14.57 dst=3D93.187.9.29 spo=
rt=3D54148 dport=3D554 packets=3D11 bytes=3D1733 src=3D93.187.9.29 dst=3D=
213.132.176.3 sport=3D554 dport=3D54148 packets=3D7 bytes=3D1877 [ASSUR=
ED] mark=3D0 secmark=3D0 use=3D1
conntrack v0.9.13 (conntrack-tools): 1 flow entries have been shown.

And running UDP connections with it...
[root@pollux conntrack-tools-0.9.13 ]# cat nf_conntrack|grep 93.187.9.2=
9|grep udp
ipv4     2 udp      17 178 src=3D192.168.14.57 dst=3D93.187.9.29 sport=3D=
8634 dport=3D13104 packets=3D3 bytes=3D120 src=3D93.187.9.29 dst=3D213.=
132.176.3 sport=3D13104 dport=3D8634 packets=3D100514 bytes=3D34886806 =
[ASSURED] mark=3D0 secmark=3D0 use=3D1
ipv4     2 udp      17 179 src=3D192.168.14.57 dst=3D93.187.9.29 sport=3D=
8632 dport=3D13102 packets=3D3 bytes=3D120 src=3D93.187.9.29 dst=3D213.=
132.176.3 sport=3D13102 dport=3D8632 packets=3D333066 bytes=3D266119819=
 [ASSURED] mark=3D0 secmark=3D0 use=3D1
ipv4     2 udp      17 28 src=3D93.187.9.29 dst=3D213.132.176.3 sport=3D=
13105 dport=3D8635 packets=3D6251 bytes=3D525064 [UNREPLIED] src=3D213.=
132.176.3 dst=3D93.187.9.29 sport=3D8635 dport=3D13105 packets=3D0 byte=
s=3D0 mark=3D0 secmark=3D0 use=3D1
ipv4     2 udp      17 29 src=3D93.187.9.29 dst=3D213.132.176.3 sport=3D=
13103 dport=3D8633 packets=3D28080 bytes=3D2358680 [UNREPLIED] src=3D21=
3.132.176.3 dst=3D93.187.9.29 sport=3D8633 dport=3D13103 packets=3D0 by=
tes=3D0 mark=3D0 secmark=3D0 use=3D1
[root@pollux conntrack-tools-0.9.13 ]#=20
(Btw the RTCP are UNREPLIED, that's probably because the android is not=
 sending RTCP back? At least not on the same ports?)

But the SOURCE is dead!
[root@pollux conntrack-tools-0.9.13 ]# ping  -w 3 192.168.14.57
PING 192.168.14.57 (192.168.14.57) 56(84) bytes of data.
--- 192.168.14.57 ping statistics ---
4 packets transmitted, 0 received, 100% packet loss, time 2999ms
[root@pollux conntrack-tools-0.9.13 ]#
[root@pollux conntrack-tools-0.9.13 ]# arp -na |grep 192.168.14.57
[root@pollux conntrack-tools-0.9.13 ]#

Problem:
=3D=3D=3D=3D=3D=3D=3D=3D
In this situation the UDP traffic is flooded through our SWITCH infrast=
ructure!


Question:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
How can we avoid this?

--
Vriendelijke Groeten/Kind Regards,

Roderick
--
TRIPLE IT
straat://Keesomstraat 10e
postcode://1821 BS
plaats://Alkmaar=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
tel://+31(0)72-5129516
fax://+31(0)72-5129520=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
http://www.triple-it.nl=A0 "Laat uw Net Werken!"=20

