From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: Today's Brain Teaser.
Date: 12 Mar 2003 12:31:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047465092.11442.35.camel@raylinux.internal>
References: <4D613EBFB75BD6118A5B00508BEEC62C0111CBC1@JESS>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-2geewS0KyQA8IamjcJBe"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4D613EBFB75BD6118A5B00508BEEC62C0111CBC1@JESS>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-2geewS0KyQA8IamjcJBe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-03-12 at 11:20, Jonathan Humphrey wrote:
> As a company we have two t1's (greedy i know!)
>=20
> the aaa.aaa.aaa.aaa address range is the external address's for one T1
> xxx.xxx.xxx.xxx is the address range for the other T1
>=20
How does the xxx.xxx.xxx.xxx connect to the linux router? eth1:1? Or are
the two t1's connected to the router (something like a Cisco 2501)? If
that's the case, then I would check the routing tables (and interfaces)
on the router first ...

> Does that make sense!
>=20
> -----Original Message-----
> From: Raymond Leach [mailto:raymondl@knowledgefactory.co.za]
> Sent: 12 March 2003 09:09
> To: Netfilter Mailing List
> Subject: Re: Today's Brain Teaser.
>=20
>=20
> On Wed, 2003-03-12 at 10:35, Jonathan Humphrey wrote:
> > I've been struggling with this one for some time, i am currently at
> > the end of my teather so if anyone has any great ideas about why
> this
> > happens let me know.
> > =20
> > Basically, i have a linux server that has three interfaces;
> > =20
> >     eth1          aaa.aaa.aaa.202        External Facing network
> >     eth0          bbb.bbb.bbb.254        Internal protected network
> >     eth1:0       aaa.aaa.aaa.197        External IP Address for
> > FTPServer
> > =20
> > I have a device that sits on xxx.xxx.xxx.5 that cannot get to any
> > service on aaa.aaa.aaa.197, however every other ip address i have
> > tried can.  I suspect that if i release the real ip address of
> > aaa.aaa.aaa.197 then everyone reading this list could too.
> > =20
> > And it's on the .5 address, if i try from xxx.xxx.xxx.15 i can
> > connect.
> Where is xxx.xxx.xxx.5? Is it on the internal or external network?
>=20
> > =20
> > Nothing is being show as dropped in the logs either.   =20
> > =20
> > Thanks,
> > =20
> > Jonathan Humphrey
> > =20
> >=20
> >
> **********************************************************************
> > This email and any files transmitted with it are confidential and
> > intended solely for the use of the individual or entity to whom they
> > are addressed. If you have received this email in error please
> notify
> > the system manager.
> >=20
> > This footnote also confirms that this email message has been swept
> by
> > MIMEsweeper for the presence of computer viruses.
> >=20
> >
> **********************************************************************

--=-2geewS0KyQA8IamjcJBe
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+bwyEh1fuR/Bv+ygRAkALAKCgE0LYltR2VuC1o46RN4YeahqQQwCfQ/wQ
51CHVkVlYYrKOROdgOeIwEc=
=RFUx
-----END PGP SIGNATURE-----

--=-2geewS0KyQA8IamjcJBe--


