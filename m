From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Unable to Block Individual Ports from the LAN to the Internet
Date: Sun, 23 Feb 2014 20:09:14 +0100
Message-ID: <530A475A.8040207@plouf.fr.eu.org>
References: <CAPNjXEmGdBJaFFRs0xsLHQxBui6SFZ9ku=sr816Pd+xcw_nU8A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPNjXEmGdBJaFFRs0xsLHQxBui6SFZ9ku=sr816Pd+xcw_nU8A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: test account <850.test.email@gmail.com>
Cc: netfilter@vger.kernel.org

test account a =E9crit :
> eth0 as Internet side and eth1 as the LAN user's side.
>=20
>            # FLUSH TABLE RULES
>            $IPTABLES -F
>=20
>            # FLUSH NAT-CHAIN TABLE RULES
>            $IPTABLES -t nat -F
>=20
>            # ENABLE IP FORWARDING
>            echo 1 > /proc/sys/net/ipv4/ip_forward
[...]
> I would think with this configuration I should be able to browse the
> Internet from a LAN PC, but I cannot.  ??????

Probably because your LAN uses (possibly private) IP addresses not
routed on the public internet (at least not routed back to you).

> If I add this rule to rc.iptables
>=20
>           $IPTABLES -t nat -A POSTROUTING -o eth0 -j MASQUERADE

So that outgoing packets take the public IP address of your router as
their source address and the replies can be routed back to you.

> If I then add this rule.
>=20
>           IPTABLES -A INPUT -i eth1 -p tcp --dport 1:1054 -j DROP
[...]
>  I would think that would block just about everything again

Not quite. It is the INPUT chain, so it just blocks packets destined to
the ports 1-1054 of the router itself. It does not block packets
destined to the outside, nor packets destined to a port above 1054 (why
this value by the way ?).

If you want to filter packets between the LAN and the public internet,
use the FORWARD chain instead.
