From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Forwarding help
Date: Thu, 27 Nov 2003 15:14:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069938876.20811.5.camel@raylinux.internal>
References: <000701c3b469$17203ba0$14d36c50@anonymous>
	 <200311271134.06406.Antony@Soft-Solutions.co.uk>
	 <000701c3b4e4$b32a8fc0$14d36c50@anonymous>
	 <200311271258.29327.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-utRAdKOAkBLlHAFn3f/o"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311271258.29327.Antony@Soft-Solutions.co.uk>
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


--=-utRAdKOAkBLlHAFn3f/o
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-11-27 at 14:58, Antony Stone wrote:
> On Thursday 27 November 2003 12:48 pm, sc2@gmx.at wrote:
>=20
> > > So "iptables -I FORWARD -m state --state >ESTABLISHED,RELATED -j ACCE=
PT"
> > > might be a good idea.
> >
> > i should include this ?
>=20
> This will alloow the reply packets pack again - if you don't have this, y=
ou=20
> need a specific rule to allow those the same as you have a specific rule =
to=20
> allow the original packets.   Don't forget communications go both ways=20
> through a firewall :)
>=20
> > b.) the port / service is a udp/tcp , port of a half - life game server=
, so
> > the clients are not on the same subnet
> > they are connecting to x.24.51 > and should FW to .24.58:
>=20
> Does halflife work through NAT?
>=20
> I don't know (maybe someone else here does), but you should be aware that=
=20
> there are some protocols which just work through NAT, some which are a bi=
t of=20
> a challenge, and some which won't work at all.
>=20
Halflife like most network games uses UDP, so should be able to work
through nat.

> I don't know which group halflife falls into.
>=20
> Antony.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-utRAdKOAkBLlHAFn3f/o
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/xfi7h1fuR/Bv+ygRAsjZAJ0fncoTYD1rV5ERvAE6hhUqoe514ACePapd
vpURYwOAzuDSgk3DQbiMVVs=
=8bl4
-----END PGP SIGNATURE-----

--=-utRAdKOAkBLlHAFn3f/o--


