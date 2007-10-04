From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 18:01:47 +0200
Message-ID: <47050E6B.1020403@plouf.fr.eu.org>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net>	 <1191503642.13379.12.camel@localhost.localdomain>	 <4704F5F5.7010601@plouf.fr.eu.org>	 <1191507779.13379.50.camel@localhost.localdomain>	 <4704FFD6.8050304@plouf.fr.eu.org> <1191510830.13379.73.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1191510830.13379.73.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

John Madden a =E9crit :
>>>The NAT box and the mail server
>>>are on different VLAN's, but that's about all that separates them --
>>
>>Do you mean that they are in different subnets ?
>=20
> Sure.  But they could easily be on the same subnet. =20

Ok. That may be useful.

> What I want instead is for the NAT box to change the destination
> IP to direct the flow to the mail server.  I don't care where the rep=
ly
> traffic goes (back through the NAT box is fine), I just need to maint=
ain
> the source IP's

Then do not use SNAT.

> (which implies not going back through the NAT, but
> rather directly back to the real client)

On the contrary, it implies going back to the NAT, else the reply=20
traffic arrives at the client with the wrong source address. See Grant'=
s=20
reply about the triangle ABC.

> Imagine troubleshooting Outlook POP3 clients when everyone's coming f=
rom
> the same IP.... *shudder*...=20

I'd rather not. :-s

>>Without SNAT, the mail server could use the NAT box as a gateway at=20
>>least for SMTP reply traffic (this could be done with advanced routin=
g=20
>>if the mail server runs Linux) if they are in the same subnet or if a=
=20
>>tunnel can be established directly between them.
>=20
> The box does run Linux, but let's assume it doesn't.  I really don't
> want to be horking with that machine in this manner.

Ok, then the easiest solution is to put the NAT box and the server in=20
the same subnet and use the NAT box as the default gateway on the=20
server. You may have trouble with ICMP "Redirect" messages sent by the=20
NAT box if its own default gateway is also in the same subnet, but you=20
can disable them on the NAT box or ignore them on the server.

> If the box could just modify the headers to change the destination IP
> and drop the packets back on the wire without any change to the sourc=
e
> IP happening, I think I'd be happy.

That's just what DNAT does. The rest is about routing.
