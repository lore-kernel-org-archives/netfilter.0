From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 19 Jun 2009 12:18:26 +0200
Message-ID: <200906191218.27220.ben@differentialschokolade.org>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Friday 19 June 2009, 10:31 David Bala=C5=BEic wrote:
> I have set up a (SixXS[1]) IPv6 tunnel on my linux router and have th=
e
> problem, that after a while I become unavailable over IPv6 for the
> outside world.
> Then I I perform some IPv6 activity, like "ping6 ipv6.google.com" I
> become accessible again for a while.

This indeed sounds like netfilter is dropping proto-41 packets when the=
=20
connection tracker thinks that your connection has timed out.

> A SixXS FAQ entry[2] suggests adding an iptables rule:
>  iptables -t nat -A POSTROUTING --proto ! 41 -o [Your IPv4 Interface]
> -j MASQUERADE
>
> This way I get (iptables -t nat -L ...):
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> postrouting_rule  all  --  anywhere             anywhere
> MASQUERADE  all  --  anywhere             anywhere
> MASQUERADE !ipv6 --  anywhere             anywhere  # the added rule
>
> I am not an iptables expert, but to me it seems the first MASQUERADE
> rule matches all packets and the new one does not make any difference=
=2E
> Can someone confirm that ?

That's absolutely true. The rule from the FAQ is meant to replace your=20
original rule, exempting proto-41 traffic from masquerading and thus=20
connection tracking.

Benedikt
