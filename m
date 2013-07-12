From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: iptables Qu2: how to specify !dst:port
Date: Fri, 12 Jul 2013 15:07:22 +0200
Message-ID: <51DFFF8A.7040601@plouf.fr.eu.org>
References: <51DFF160.1050607@die-optimisten.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51DFF160.1050607@die-optimisten.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Die Optimisten a =E9crit :
>=20
> Do I get a loop if I
> iptables -t nat -D PREROUTING  -p tcp -d 0.0.0.0:443  -j DNAT
> --to-destination 127.0.0.1:443

No. By the way, this rule may not have the intended effect.
Packets received from the outside will be seen with a loopback
destination address and discarded by the routing decision.
Packets sent over loopback skip the nat PREROUTING chain.

> Can I generally generate (kernel-hanging) loops with -nat , or is thi=
s
> recognized/inhibited ?

Not directly in the kernel, because, as I wrote above, packets sent ove=
r
loopback skip the nat PREROUTING chain.
