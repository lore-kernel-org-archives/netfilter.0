From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: newbie: forward rule to itself
Date: Thu, 28 Oct 2010 10:01:37 +0200
Message-ID: <4CC92DE1.4030204@plouf.fr.eu.org>
References: <4CC8774C.1070908@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC8774C.1070908@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mauricio Tavares <raubvogel@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Mauricio Tavares a =E9crit :
> 	Let's say I have server1 with two ports, eth0 and eth0, and server2=20

Did you mean "eth0 and eth1" ?

> whose eth0 port is connected to server1's eth1. And let's say the sub=
net=20
> between them is 192.168.1.0/24 while the one server1's eth0 is connec=
ted=20
> to is 192.168.4.0/24.
>=20
> I have the following rules to forward port 6969 coming on eth0 on=20
> server1 to port 6969 on server2's eth0:
>=20
> iptables -A PREROUTING -t nat -p tcp --dport 6969 -j DNAT --to=20
> 192.168.1.server2:6969
> iptables -A INPUT -d 192.168.4.server1 -p tcp -m tcp -m state --state=
=20
> NEW --dport 6969 -j ACCEPT

This rule in INPUT is pointless because
1) packets have already been DNATed by the previous rule in PREROUTING,
2) the new destination is a remote address, so packets go through
=46ORWARD, not INPUT.

> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>=20
> Any machine in 192.168.4.0/24 seems to be able to get to server2 by=20
> using 192.168.1.server1:6969. But, if I try to connect to=20
> 192.168.1.server1:6969 on server1 itself, I will not be forwarded to=20
> server2. What am I missing here?

As Jan explained, the PREROUTING chain of the 'nat' table sees only
incoming packets received from outside. DNAT for locally generated
packets must be done in the OUTPUT chain.

PS : If you want the connection to work from server2 too, you must add =
a
 specific MASQUERADE/SNAT for it too in POSTROUTING.
