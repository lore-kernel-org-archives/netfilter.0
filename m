From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Bandwidth Monitoring
Date: 01 Sep 2003 09:33:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062401622.8490.22.camel@raylinux.internal>
References: <04a901c36e18$ad2d6650$2a0110ac@SAMHP>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Tvf/gSOepBywKC4HPcUl"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04a901c36e18$ad2d6650$2a0110ac@SAMHP>
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


--=-Tvf/gSOepBywKC4HPcUl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-08-29 at 12:31, Sathi wrote:
> Hello All,
>=20
> Is there any way to findout the bandwidth used by a client(LAN user), fro=
m
> Linux gateway server.
>=20
Have a look at bwacct. It's real easy to setup and works well.
www.bwacct.org

> I have to take monthly statistics of bandwidth used by a client (LAN user=
).
>=20
> FYI i am using CBQ for bandwidth control
>=20
> Regards
> Sathi
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-Tvf/gSOepBywKC4HPcUl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/UvZWh1fuR/Bv+ygRAiFhAJ9vC3cpAx5JLMLfnScK67mAF6eoVgCfTD4n
zaApSwFgkLh7NyuIZm1e+G8=
=u3HE
-----END PGP SIGNATURE-----

--=-Tvf/gSOepBywKC4HPcUl--


