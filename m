From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: RE: anti-dos
Date: Thu, 29 Jan 2004 07:55:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075355725.1999.73.camel@raylinux.internal>
References: <F22386C3FEB012449238672E38ED61E71642B6@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-cRSrfzkSTxMij889DDxg"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E71642B6@overlord.overturemedia.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Fritz Mesedilla <fritz.mesedilla@overturemedia.com>
Cc: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


--=-cRSrfzkSTxMij889DDxg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-01-29 at 05:34, Fritz Mesedilla wrote:
> I forgot to ask.
> I am putting this before the rest of my rules, right? Will this allow leg=
it transaction to get through?
>=20
Yes, the rules to redirect to the syn-flood chain must be the first
rules of each chain.
> Thanks.
>=20
>=20
> Cheers,
>=20
> fritz <www.mesedilla.com>
> ---
> + Basta Ikaw Lord
>=20
>=20
>=20
>=20
> -----Original Message-----
> From: Ray Leach [mailto:raymondl@knowledgefactory.co.za]
> Sent: Wednesday, January 28, 2004 4:14 PM
> To: Netfilter Mailing List (E-mail)
> Subject: Re: anti-dos
>=20
>=20
> On Wed, 2004-01-28 at 09:18, Fritz Mesedilla wrote:
> > in preparation to sco's feb 1. dos attack, is there any special iptable=
s rules that i can use to avoid dos attacks?
> > all i have right now is i blocked all ports then opened the mail and in=
ternet.
> >=20
> > what else can i do for rules?
> >=20
> You can use the limit support to limit packet rates:
>=20
> ### syn-flood chain
> $IPTABLES -N syn-flood
> $IPTABLES -A syn-flood -i $IFACE_INET -m limit --limit 75/s
> --limit-burst 100 -j RETURN
> $IPTABLES -A syn-flood -i $IFACE_DMZ -m limit --limit 75/s --limit-burst
> 100 -j RETURN
> $IPTABLES -A syn-flood -i $IFACE_INT -j RETURN
> $IPTABLES -A syn-flood -j LOG --log-prefix "SYN-FLOOD: "
> $IPTABLES -A syn-flood -j DROP
>=20
> $IPTABLES -A INPUT -i $IFACE_INT -p tcp --syn -j syn-flood
> $IPTABLES -A INPUT -i $IFACE_DMZ -p tcp --syn -j syn-flood
> $IPTABLES -A INPUT -i $IFACE_INET -p tcp --syn -j syn-flood
>=20
>=20
> > thanks.
> >=20
> >=20
> > Cheers,
> >=20
> > fritz <www.mesedilla.com>
> > ---
> > + Basta Ikaw Lord
> >=20
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
> > email.=20
> >=20
> > Overture Media, Inc.
> > Direct Line: (632) 635-4785
> > Trunkline:   (632) 631-8971 Local 146
> > Fax: (632) 637-2206
> > Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave.=
, Quezon City 1100
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-cRSrfzkSTxMij889DDxg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAGKBNh1fuR/Bv+ygRApweAKCu7tu4BSuK3gS/jdEAs/xW1M4UvgCfWVXh
p0rYegdyZ/8m4UNm2ZdB+Sg=
=D+mv
-----END PGP SIGNATURE-----

--=-cRSrfzkSTxMij889DDxg--


