From: "David C. Hart" <DCH@TQMcube.com>
Subject: Re: IP Spoofing
Date: Wed, 05 Nov 2003 15:08:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068062902.1494.25.camel@main.tqmcube.com>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>
	 <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>
Reply-To: IPTables Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-BtlwU8PuC2rTbQMFqSPc"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: Iptables Mailing List <netfilter@lists.netfilter.org>


--=-BtlwU8PuC2rTbQMFqSPc
Content-Type: text/plain; charset=
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-11-05 at 14:51, Antony Stone wrote:
> On Wednesday 05 November 2003 7:31 pm, Leandro Takashi Hirano wrote:
>=20
> > Now I would like to know about the IP Spoofing rule, how does it works?
> >
> > -	iptables -A INPUT -s 192.168.1.0/24 -i ! eth0 -j DROP
>=20
> Any packet with a source address in the Class C range 192.168.1.x which d=
oes=20
> not come from eth0 will be DROPped.

Funny I was similarly confused. What happens to packets from the LAN
given that they don't originate from eth0?
>=20
> > I don=C2=B4t know how can it block ip spoofing attack...
>=20
> These rules assume that eth0 is your internal network, and your internal=20
> network range is 192.168.1.0/24.
>=20
> No packets with your own source address should come from outside (rule 1)=
 and=20
> all packets from inside should have your own source address (rule 2).
>=20
> Therefore these two rules stop people on the outside pretending that they=
=20
> live on your network, and people on the inside pretending that they don't=
.
>=20
> Antony.

--=-BtlwU8PuC2rTbQMFqSPc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/qVi2ol4OE0cpGaIRAjlNAKCBDAyKPApY14A+rkmSe37K3a86wgCghDo4
Uqlq/dJxIa4C/dkX/P+/N/4=
=irE4
-----END PGP SIGNATURE-----

--=-BtlwU8PuC2rTbQMFqSPc--


