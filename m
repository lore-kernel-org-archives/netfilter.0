From: Alexander Samad <alex@samad.com.au>
Subject: Re: pop3 and dns
Date: Wed, 12 May 2004 14:22:51 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040512042251.GB24345@samad.com.au>
References: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com> <162701c4375d$1f28a4a0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <162701c4375d$1f28a4a0$49caa8c0@caris.priv>
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


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2004 at 10:37:36AM -0300, Peter Marshall wrote:
> I have an aside question ... Do you need to listen on both tcp and udp po=
rt
> 53 for DNS ?  Can you just listen on the UDP one ?  Does it require both ?
>=20

udp for normal requests
tcp for zone transfers

A

> Thank you,
>=20
> Peter Marshall
>=20
>=20
> ----- Original Message -----=20
> From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
> To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>
> Sent: Tuesday, May 04, 2004 6:40 AM
> Subject: pop3 and dns
>=20
>=20
>=20
> Greetings!
> I have been looking for the answer to this through google...
>=20
> How do I allow POP3 through my iptables rules?
>=20
> I have done this...
> $IPTABLES -A FORWARD -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A FORWARD -p udp --dport 53 -j ACCEPT
>=20
> $IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT
>=20
> I included the dns forward rule to allow the internal clients to be able =
to
> resolve pop3 domain names.
>=20
> The problems:
> 1) They still can't resolve domain names.
> 2) POP3 can't seem to pass through going outside from the internal client=
s.
>=20
> Please advise me to what I still need to add. Thanks.
>=20
> Cheers,
>=20
> fritz <www.mesedilla.com>
> ---
> + Basta Ikaw Lord
>=20
>=20
>=20
> ----------------------------------------------------------------------
> This email and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed. If you have received this email in error please notify
> the sender immediately by e-mail and delete this e-mail from your
> system. Please note that any views or opinions presented in this
> email are solely those of the author and do not necessarily represent
> those of the company. Finally, the recipient should check this email
> and any attachments for the presence of viruses. The company accepts
> no liability for any damage caused by any virus transmitted by this
> email.
>=20
> Overture Media, Inc.
> Direct Line: (632) 635-4785
> Trunkline:   (632) 631-8971 Local 146
> Fax: (632) 637-2206
> Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave.,
> Quezon City 1100
>=20
>=20
>=20
>=20
>=20

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAoaabkZz88chpJ2MRAjq+AJ90STtQIZqXol5jNNO4Qv6qsve7bACeJ6/o
/1IySDow+pF+kDYP2/9V3LM=
=ljE1
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--

