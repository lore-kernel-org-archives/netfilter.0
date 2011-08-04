From: =?UTF-8?Q?=22Piotr_Paw=C5=82owski=22?= 
	<piotr.pawlowski@superhost.pl>
Subject: Enable connection from host in LAN to VPN server through iptables.
Date: Thu, 4 Aug 2011 11:26:57 +0200 (CEST)
Message-ID: <2080860960.316820.1312450017847.JavaMail.open-xchange@ox-app-1.superhost.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Dear all,

=46rom several days I am trying to enable connection from host in LAN t=
o VPN
server through router with iptables (Gentoo distro). Unfortunately I am=
 unable
to configure it correctly. Below is What I have in my iptables rules:

iptables -A FORWARD -d 195.246.237.249 -j LOG --log-prefix=3D"VPN
"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0

iptables -A FORWARD -s 195.246.237.249 -j LOG --log-prefix=3D"VPN "

iptables -A FORWARD -p gre -s 10.0.0.0/16 [http://10.0.0.0/16] -j ACCEP=
T
iptables -A FORWARD -p tcp -s 10.0.0.0/16 [http://10.0.0.0/16] --dport =
1723 -j
ACCEPT
iptables -A FORWARD -p tcp --dport 1793 -j ACCEPT=C2=A0=C2=A0
iptables -A FORWARD -p udp --dport 500 -j ACCEPT
iptables -A FORWARD -p udp --dport 1701 -j ACCEPT

Of course standard NAT routing rules are present.
What I did wrong?
Thank you in advance for any help or tips.

Best Regards
--
Piotr Pawlowski
