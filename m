From: Leigh Peterson <warpig369@hotmail.com>
Subject: =?windows-1256?Q?multiple_NIC_traffic_forwarding=FE?=
Date: Mon, 29 Oct 2007 09:08:53 +0000
Message-ID: <BAY119-W5D1A138C2C78AB9C1390CE9910@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org


Hi All,

I have a question regarding iptables traffic forwarding. I have a machi=
ne with 2 NICs (which are on different subnets) and all inbound traffic=
 is coming in on eth0.

I currently have some rules that accepts traffic on a port range and th=
en forwards that traffic to another host (like this one):
-A FORWARD -d 192.168.18.3 -i eth0 -p tcp -m tcp --dport 6660:6669 -j A=
CCEPT
as well as some rules that accept traffic for services on this host (li=
ke this):
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1900 =
-j ACCEPT

My first question is, how can I force the traffic from these two types =
on rules to respond via eth1?

I also have ProxyPass rules in Apache the traffic of which I would also=
 like to forward to eth1. What would be the best way to do this? If you=
 need any more information, please let me know.

Regards,
Leigh


_________________________________________________________________
100=92s of Music vouchers to be won with MSN Music
https://www.musicmashup.co.uk
