From: "David C. Hart" <DCH@TQMcube.com>
Subject: Re: IP Spoofing
Date: Fri, 07 Nov 2003 08:34:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068212092.1438.8.camel@main.tqmcube.com>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>
	 <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>
	 <60250.200.180.160.130.1068063541.squirrel@www.alcidesmaya.com.br>
	 <200311052039.hA5KdYr13351@agate.rockstone.co.uk>
	 <1068208010.29753.10.camel@tarkus>
Reply-To: IPTables Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-E/FcyOhxXCiI1TrsKgw9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068208010.29753.10.camel@tarkus>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: tedkaz@optonline.net
Cc: Iptables Mailing List <netfilter@lists.netfilter.org>


--=-E/FcyOhxXCiI1TrsKgw9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-11-07 at 07:26, Ted Kaczmarek wrote:
> I would add an input established on that as well, makes it easier to do
> upgrades.
>=20
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

Hi Ted:

If you have a moment, could you please explain (for the comparative IPT
nitwits - including me) what that does?
>=20
> I wish everyone did implicit DROP's, it would make the web a safer
> place.

IBID

Thanks
>=20
> :-)
>=20
>=20
>=20
> Ted
>=20
>=20
> On Wed, 2003-11-05 at 15:39, Antony Stone wrote:
> > On Wednesday 05 November 2003 8:19 pm, Leandro Takashi Hirano wrote:
> >=20
> > > Thanks Antony...
> > >
> > > Do you have a script or something where I can find protection rules?
> >=20
> > You tell us what protection you want and we can suggest some rules to d=
o it.
> >=20
> > There's no single "magic ruleset" for netfilter / iptables which "prote=
cts=20
> > your network", otherwise every distribution would include it as standar=
d.
> >=20
> > It depends what you want to do.
> >=20
> > A good starting point is:
> >=20
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -P FORWARD DROP
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A FORWARD -i $intIF -o $extIF -j ACCEPT
> >=20
> > That will allow nothing in or out of the firewall machine itself, and w=
ill=20
> > allow all access from your internal network to the Internet, blocking=20
> > everything except reply packets from the Internet to your network.
> >=20
> > I do not recommend that you simply implement the above rules before you=
=20
> > understand what they are designed to do.
> >=20
> > Check Oskar Andreasson's excellent tutorial for more information about =
this=20
> > sort of configuration, or any of the other documentation at=20
> > http://www.netfilter.org
> >=20
> > Antony.
>=20
>=20

--=-E/FcyOhxXCiI1TrsKgw9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/q598ol4OE0cpGaIRAiILAJ9Vp8oD+HRtRsRjUe25jEZUhsvCjwCfafsb
+3m2IsBNbtCp5Y5tMbL4Cig=
=UNHq
-----END PGP SIGNATURE-----

--=-E/FcyOhxXCiI1TrsKgw9--


