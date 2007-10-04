From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 16:17:25 +0200
Message-ID: <4704F5F5.7010601@plouf.fr.eu.org>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net> <1191503642.13379.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1191503642.13379.12.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

John Madden a =E9crit :
>=20
> Hmm, well here are the rules I'm running.  The port forward:
>=20
> echo "1" > /proc/sys/net/ipv4/ip_forward
> iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 25 -j DNAT --t=
o
> $MAILSERVER:25
>=20
> And the SNAT for return traffic:
>=20
> iptables -t nat -A POSTROUTING -d $MAILSERVER -j SNAT --to $EXTIP

Ok, this is the rule that changes the source address. The DNAT rule in=20
the PREROUTING chain could not do it, even with a kernel 2.6.9.

> ...At least, I found that traffic wouldn't flow without this addition=
al
> rule.  Have I gotten something else fundamentally wrong here?

The above SNAT rule itself is not for return traffic. First, it matches=
=20
packets destined to the mail server, i.e. original traffic. Second,=20
return traffic skips the nat table chains.

If traffic does not flow without it, it could mean that the mail server=
=20
does not send the reply traffic back to the NAT box. This is a routing=20
problem. Does the mail server use the NAT box as its default gateway ?
