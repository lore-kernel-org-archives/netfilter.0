From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: publishing 2 web server on one valid IP
Date: Mon, 29 Sep 2003 14:38:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064839127.16244.36.camel@raylinux.internal>
References: <Law15-F11L2m9lHiu3f0003d05e@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-0qCUTt01udoWIOXtGKHR"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law15-F11L2m9lHiu3f0003d05e@hotmail.com>
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


--=-0qCUTt01udoWIOXtGKHR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-09-29 at 14:12, Afshin Lamei wrote:
> hi
> I have 2 web servers in my DMZ. when there was one, I used DNAT to publis=
h=20
> the single web server on port 80 of the external interface of my firewall=
.=20
> now I don't know how to distinguish between the requests of 2 web servers=
,=20
> because I have only one IP address available for the external interface.
> Is there any solution using iptables, to know that which http request mus=
t=20
> be DNAT to which web server?
> regards,
> afshin
>=20
How about adding an ip alias to the xt iface of your firewall for the
second web server?

> _________________________________________________________________
> Add photos to your e-mail with MSN 8. Get 2 months FREE*.=20
> http://join.msn.com/?page=3Dfeatures/featuredemail
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-0qCUTt01udoWIOXtGKHR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/eCfWh1fuR/Bv+ygRAplRAKCxPFxNc2XkaOzrveFk/YJrgqxBPACgiNJe
rbXaCHpRLn2iY/veaazOids=
=HRcU
-----END PGP SIGNATURE-----

--=-0qCUTt01udoWIOXtGKHR--


