From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: DNAT + 2 uplinks + route = nogo
Date: Wed, 15 Oct 2003 12:36:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066214218.672.101.camel@raylinux.internal>
References: <DAAAFFB7B8C62F40BC87BF3E729F79E101199077@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-EI5hTgaqPQoVw26tRHDJ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DAAAFFB7B8C62F40BC87BF3E729F79E101199077@ibfdmail.ibfd.oin>
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


--=-EI5hTgaqPQoVw26tRHDJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-10-15 at 10:23, Gaby Schilders wrote:
> I'm in real trouble here so I hope somebody is able to answer this today =
(I know, my mistake in planning doesn't mean you will rush. I can try, can'=
t I? ;)
>=20
> Problem as follows:
>=20
> - 1 linux box with 4 interfaces. Internal (private space), DMZ (can be ig=
nored for this issue), 2 uplinks to different providers with different publ=
ic ranges.
> - DNAT (actually portforwarding) set up to to a few internal boxes on 1 u=
plink.
> - I want to do DNAT to the same internal IP-addressess over the second li=
nk (obviously with different public ip-addressess).
> - Routing chooses the wrong uplink (gateway) for the return packets.
>=20
> Cause:
> DNAT is only undone at the last moment so even with iproute2's "ip rule" =
trick I can't discern between connections coming in through one link or the=
 other for the return packets.
>=20
> Solution that I can think of:
> If connections are DNATted, recall the routing routing after undoing the =
DNAT for the return packets. Problems with said solution: I can read C code=
, but only barely, and not write it. Also, I have only a very shallow under=
standing of the routing code and I'm running out of time. I don't know if t=
he code allows the distinction between DNAT return packets from all other p=
ackets so that this can be done at all.
>=20
> Question:
> I have no idea how complex it would be to create this 'hack'. Does anyone=
 know of a patch that realises this feature or is someone prepared to creat=
e such a patch? If not, whom should I ask instead?
>=20
You could try the P-O-M ROUTE target patch.
> Desperatly yours,
>=20
> Gaby Schilders
> IBFD network admin
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-EI5hTgaqPQoVw26tRHDJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/jSNKh1fuR/Bv+ygRArg4AKC0qnQ5UR/1que+qlcSAwVIw8bokQCeKsoX
PjUG/YuF86ZcJEVyV4wkKXk=
=vwnj
-----END PGP SIGNATURE-----

--=-EI5hTgaqPQoVw26tRHDJ--


