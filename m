From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Subject: icmp forward
Date: Fri, 30 Jan 2009 09:18:59 +0100
Message-ID: <4982B7F3.4020603@cetrtapot.si>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,

I'm an absolute beginner on the netfilter stuff, so please bear with me=
 here.

We have a device running linux 2.6.19 kernel with iptables installed. I=
t acts
a a gateway for a another mobile device that connects to linux device v=
ia irda
port - ppp connection. I've managed to port forward telnet port to mobi=
le device
with the help of this page http://kreiger.linuxgods.com/kiki/?Port+forw=
arding+with+netfilter.
Our customers want to be able to ping the mobile device behind the linu=
x firewall
and IMHO it is not possible for ICMP packets to be forwarded since it i=
s a protocol
by itself (not a TCP/UDP style service).


Is it possible to 'port forward' ICMP requests?

Thank you,
HK

--=20
Hinko Ko=E8evar, OSS developer
=C8ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar@cetrtapot.si
http    www.cetrtapot.si

