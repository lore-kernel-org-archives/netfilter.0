From: "Brei, Matt" <mbrei@medclaiminc.com>
Subject: RE: forwarding to a honeypot
Date: Thu, 11 Sep 2003 01:06:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <091A6DF13847F44395B31658ED61C19C63A465@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

Oops, sorry about that


[cable modem]--------[hub]-------[eth1 honeypot eth0]
				|				    |=09
				|				    |
				|				    |
				[eth1 netfilter eth0]----[switch]
=09
|
=09
|
								[rest of
LAN]


Matt Brei


-----Original Message-----
From: Arnt Karlsen [mailto:arnt@c2i.net]=20
Sent: Thursday, September 11, 2003 12:45 AM
To: netfilter@lists.netfilter.org
Subject: Re: forwarding to a honeypot

On Wed, 10 Sep 2003 17:58:38 -0400,=20
"Brei, Matt" <mbrei@medclaiminc.com> wrote in message=20
<091A6DF13847F44395B31658ED61C19C63A463@yellowstone.medclaim.local>:


>=20
> I'll try my best to throw out some decent ACSII art to illustrate what
> I'm talking about.

..trim it to fit inside 72 characters width so we can=20
what you mean to show us.
=20
> 							[Cable
> modem]------------[hub]-------------[eth1 honeyd eth0]
> =09
> |   					|
> =09
> |						|
> =09
> |   					|=09
> =09
> |						|
> =09
> |[eth1 netfilter eth0]|		|
> =09
> |		|
> =09
> |		|
> =09
> |[  switch  ]
> =09
> |
> =09
> |
> =09
> |
> =09
> [ Rest of the LAN ]
>=20
> There's my sorry ASCII LAN ( I did say I'd try my best)
>=20


--=20
..med vennlig hilsen =3D with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three:=20
  best case, worst case, and just in case.



