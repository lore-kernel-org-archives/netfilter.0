From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Routing decision?
Date: 15 Sep 2003 11:08:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063616905.31092.78.camel@raylinux.internal>
References: <3F657D37.1010000@able.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hZsGlEVL+s6yw9tVXHmd"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F657D37.1010000@able.be>
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


--=-hZsGlEVL+s6yw9tVXHmd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-09-15 at 10:49, Wim Ceulemans wrote:
> Hi
>=20
> In paragraph 6.2 of the iptables-tutorial the following is said:
> "The OUTPUT chain is used for altering locally generated packets (i.e.,=20
> on the firewall) before they get to the routing decision.
>=20
> But in paragraph 3.1, the "Traversing of tables and chains" diagram, we=20
> see the "Routing decision" is listed after the "Local process" and
> BEFORE! the packet goes to the output chain.
>=20
> So which one is right? Does the routing decision take place after or=20
> before the packet travels through the output chain?

Are you not getting confused with 'locally generated' and 'local
process'. They are not the same thing.

>=20
> Regards
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-hZsGlEVL+s6yw9tVXHmd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/ZYGJh1fuR/Bv+ygRApyPAKCTdIdrE8mHZalHyye7QeMrCHrHDQCgnM4k
S/TuHKXnTplR1XvwpQ/y+Ak=
=kDQs
-----END PGP SIGNATURE-----

--=-hZsGlEVL+s6yw9tVXHmd--


