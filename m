From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 16:59:34 +0200
Message-ID: <4704FFD6.8050304@plouf.fr.eu.org>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net>	 <1191503642.13379.12.camel@localhost.localdomain>	 <4704F5F5.7010601@plouf.fr.eu.org> <1191507779.13379.50.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1191507779.13379.50.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

John Madden a =E9crit :
>>If traffic does not flow without it, it could mean that the mail serv=
er=20
>>does not send the reply traffic back to the NAT box. This is a routin=
g=20
>>problem. Does the mail server use the NAT box as its default gateway =
?
>=20
> Ah, now we're getting somewhere.  No, the mail server doesn't use the
> NAT box as it's default gateway, it's using a general default route
> somewhere else in the network for it.  The NAT box and the mail serve=
r
> are on different VLAN's, but that's about all that separates them --

Do you mean that they are in different subnets ?

> both have globally routable IP's. =20

Private/public addressing does not matter here. You can have public=20
addresses behind a NAT box, although it may sound unusual (NAT is mostl=
y=20
used to hide private addressing when you don't have enough public=20
addresses). The important word is "behind", meaning that traffic in bot=
h=20
directions flows through the NAT box. This is important because the NAT=
=20
box changed the source and/or destination address on the original=20
traffic, so it must put it back on the reply traffic in order for the=20
client to accept it as a reply. It's not the SNAT rule which puts the=20
original address back, it only makes the server see the NAT box as the=20
client and send the reply traffic back to it. But the drawback is that=20
the server does not see the real client source address.

Without SNAT, the mail server could use the NAT box as a gateway at=20
least for SMTP reply traffic (this could be done with advanced routing=20
if the mail server runs Linux) if they are in the same subnet or if a=20
tunnel can be established directly between them.

> I'm literally just trying to emulate the functionality of LVS here,
> where port 80 on an IP goes to one machine and port 25 goes somewhere
> else.

Sorry, I do not know how LVS works. I just know how Netfilter NAT works=
=2E
