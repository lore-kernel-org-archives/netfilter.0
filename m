From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: pop3 and dns
Date: Wed, 12 May 2004 09:15:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084346112.24001.35.camel@raylinux.internal>
References: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>
	 <162701c4375d$1f28a4a0$49caa8c0@caris.priv>
	 <20040512042251.GB24345@samad.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zUp6EdZx4umP7TnF5oNx"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040512042251.GB24345@samad.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


--=-zUp6EdZx4umP7TnF5oNx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-05-12 at 06:22, Alexander Samad wrote:
> On Tue, May 11, 2004 at 10:37:36AM -0300, Peter Marshall wrote:
> > I have an aside question ... Do you need to listen on both tcp and udp =
port
> > 53 for DNS ?  Can you just listen on the UDP one ?  Does it require bot=
h ?
> >=20
>=20
> udp for normal requests
> tcp for zone transfers

and large answers ...

>=20
> A
>=20
> > Thank you,
> >=20
> > Peter Marshall
> >=20
> >=20
> > ----- Original Message -----=20
> > From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
> > To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>
> > Sent: Tuesday, May 04, 2004 6:40 AM
> > Subject: pop3 and dns
> >=20
> >=20
> >=20
> > Greetings!
> > I have been looking for the answer to this through google...
> >=20
> > How do I allow POP3 through my iptables rules?
> >=20
> > I have done this...
> > $IPTABLES -A FORWARD -p tcp --dport 53 -j ACCEPT
> > $IPTABLES -A FORWARD -p udp --dport 53 -j ACCEPT
> >=20
> > $IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT
> >=20
> > I included the dns forward rule to allow the internal clients to be abl=
e to
> > resolve pop3 domain names.
> >=20
> > The problems:
> > 1) They still can't resolve domain names.
> > 2) POP3 can't seem to pass through going outside from the internal clie=
nts.
> >=20
> > Please advise me to what I still need to add. Thanks.
> >=20
> > Cheers,
> >=20
> > fritz <www.mesedilla.com>
> > ---
> > + Basta Ikaw Lord
> >=20
> >=20
> >=20
> > ----------------------------------------------------------------------
> > This email and any files transmitted with it are confidential and
> > intended solely for the use of the individual or entity to whom they
> > are addressed. If you have received this email in error please notify
> > the sender immediately by e-mail and delete this e-mail from your
> > system. Please note that any views or opinions presented in this
> > email are solely those of the author and do not necessarily represent
> > those of the company. Finally, the recipient should check this email
> > and any attachments for the presence of viruses. The company accepts
> > no liability for any damage caused by any virus transmitted by this
> > email.
> >=20
> > Overture Media, Inc.
> > Direct Line: (632) 635-4785
> > Trunkline:   (632) 631-8971 Local 146
> > Fax: (632) 637-2206
> > Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave.=
,
> > Quezon City 1100
> >=20
> >=20
> >=20
> >=20
> >=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-zUp6EdZx4umP7TnF5oNx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAoc8Ah1fuR/Bv+ygRAp+AAJ9R+sOmGfHeWEL5TGCuLR6bI+D2UwCgmNeb
jgAvhlHFe1Gd6y5tF5K79/U=
=13jE
-----END PGP SIGNATURE-----

--=-zUp6EdZx4umP7TnF5oNx--


