From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: STATELESS
Date: 16 Sep 2003 15:54:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063720447.31093.166.camel@raylinux.internal>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew>
	 <200309161256.15286.gdh@acentral.co.uk>
	 <1063716386.31093.160.camel@raylinux.internal>
	 <20030916131153.GA16559@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-mqnMN/FNkgT2bgDsV98B"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030916131153.GA16559@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-mqnMN/FNkgT2bgDsV98B
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-09-16 at 15:11, Ramin Dousti wrote:
> On Tue, Sep 16, 2003 at 02:46:27PM +0200, Ray Leach wrote:
>=20
> > >=20
> > > Don't load the ip_conntrack module, and / or don't use any iptables r=
ules that=20
> > > use "-m state"  in the arguments :)
> > Yeah, connection tracking automagically implies state inspection.
>=20
> OK. Thanks for the informative comments but can you lay out the steps to
> prevent stateful inspection? For example, how to unload "ip_conntrack" an=
d
> to prevent it from being reloaded again?
>=20
Personally, I would re-compile the kernel without connection tracking
support.

> Thanks again.
>=20
> Ramin
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-mqnMN/FNkgT2bgDsV98B
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/ZxX/h1fuR/Bv+ygRAvD1AJ4q9W+9LHJ4wByB0iCpoglzaOM+JgCeIslU
61ojBtDACOvvaAOJtXL4lsg=
=qxwf
-----END PGP SIGNATURE-----

--=-mqnMN/FNkgT2bgDsV98B--


