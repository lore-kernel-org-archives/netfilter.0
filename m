From: =?iso-8859-15?Q?Roland_H=E4der?= <r.haeder@web.de>
Subject: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Sat, 03 Jan 2009 22:02:53 +0100
Message-ID: <662506031@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi together,

I have a Debian Unstable (Sid) here with vanilla kernel 2.6.28. I use t=
he Bastille firewall script to setup firewall rules.

When I now start a service e.g. Tor which needs open ports at 9001 and =
9030 it can connect to itself when the firewall is done.

But when I start it it's self-connections got blocked.

Here is my ruleset exported with "iptables-save > iptables.list":
http://www.mxchange.org/downloads/firebox/iptables.list

The rule with log-prefix "INPUT DROP 10" blocks Tor's own connection at=
tempt.

Additonally no masq is working.

My router has IP 192.168.1.1 on internal NIC and 192.168.20.1 on extern=
al NIC where the ADSL box is connected.

If you need kernel config or output of "route -n" I can upload it on my=
 server as well.

Please assisst me here. :)

Regards,
Roland
_______________________________________________________________________
Sensationsangebot verl=E4ngert: WEB.DE FreeDSL - Telefonanschluss + DSL
f=FCr nur 16,37 Euro/mtl.!* http://dsl.web.de/?ac=3DOM.AD.AD008K15039B7=
069a

