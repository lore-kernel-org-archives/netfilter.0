From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: 2.4.23 ipchains/MASQ problems
Date: Thu, 04 Dec 2003 13:35:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070537706.936.69.camel@raylinux.internal>
References: <Pine.LNX.4.58.0312041054500.532@stum.gink.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-JlR8P5KXE50PXzOW3Enb"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0312041054500.532@stum.gink.org>
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


--=-JlR8P5KXE50PXzOW3Enb
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Why are you still using ipchains?

Ray

On Thu, 2003-12-04 at 13:07, gARetH baBB wrote:
> Has anyone else had serious problems with 2.4.23 death when using ipchain=
s
> and masquerading ?
>=20
> I've had two boxes die with a panic as soon as they tried to do any form
> of masq, going back to .22 results in happiness.
>=20
> One box is essentially a Slackware 8.1 base, and the other 9.0.
>=20
> Both have similar ipchains rules.
>=20
> The 8.1 box is my test box and I upgraded to .23 on it and everything was
> fine, it shifted over 4G of non-masq data during the day and showed no
> problems.
>=20
> I then upgraded the 9.0 box to .23, and it died within seconds of
> networking going with a panic.
>=20
> Whilst I investigated what was going on I shited the routing so the 8.1
> box did masq for the internal network. Not immediately, but within minute=
s
> that box too paniced. Rebooting the 8.1 box resulted in panic pretty much
> in the same way as the 9.0 box.
>=20
> I put both back to .22 and sanity was restored.
>=20
> I notes lots of changes in the .23 patch to the masq code and network cod=
e
> in general.
>=20
> Anyone else seen these problems ? [though I presume most of you are using
> iptables and this *could* be ipchains specific]
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-JlR8P5KXE50PXzOW3Enb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/zxvqh1fuR/Bv+ygRAh/uAJ9SILfklDIW0gsMMHs/WmDfVfOCtgCgg2Cn
3oRE4rFm4T7yn/50rua8/0Y=
=vbZh
-----END PGP SIGNATURE-----

--=-JlR8P5KXE50PXzOW3Enb--


