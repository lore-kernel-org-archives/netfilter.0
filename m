From: Alexander Samad <alex@samad.com.au>
Subject: Re: route outgoing smtp via a specific interface
Date: Mon, 3 May 2004 12:13:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040503021343.GJ4200@samad.com.au>
References: <16533.31553.47397.464571@jane.localdomain> <200405030005.33281.Antony@Soft-Solutions.co.uk> <86y8oatnsf.fsf@poke.localdomain> <200405030045.56089.Antony@Soft-Solutions.co.uk> <86u0yytkrb.fsf@poke.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+RZeZVNR8VILNfK"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <86u0yytkrb.fsf@poke.localdomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--x+RZeZVNR8VILNfK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2004 at 02:30:32AM +0200, Christer Ekholm wrote:
> Antony Stone <Antony@Soft-Solutions.co.uk> writes:
>=20
> > Ah.   Sorry if my previous response seemed a little terse - I did not r=
ealise=20
> > you were aware of iproute2 and had tried so much of it already.
>=20
> Don't be sorry, your assumption was perfectly valid.
>=20
> >
> >> I think my problem is that I need this to work from the host with the
> >> connections to the providers. (localhost).
> >>
> >> My next thought was to use iptables to add a SNAT rule. But SNAT is on=
ly
> >> allowed in POSTROUTING, and I think I would need that in OUTPUT
> >
> > I would recommend that you do try such a rule, since POSTROUTING happen=
s after=20
> > OUTPUT (and FORWARD).
> >
> > Try:
> >
> > iptables -A POSTROUTING -t nat -p tcp --dport 25 -j SNAT --to 217.215.1=
83.181
> >
>=20
> Ok, that almost makes it work. tcpdump shows the packets with the
> correct sourceaddr, and I can see the returnpackets also. But they
> doesn't seem to reach my telnet process, because it just sits waiting.
>=20
> $telnet vishnu.netfilter.org 25
> Trying 213.95.27.115...

On a different thought can't you tell your mta to bind to a specific
interface or use a specific address ( I can with exim)

>=20
> --
>  Christer
>=20
>=20

--x+RZeZVNR8VILNfK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAlarXkZz88chpJ2MRAo/uAJ93DWQ1KJS8JuK9Vu07rabmUDt71wCg6j8G
dBq1M6F10DAF5sH4ZUfL3UU=
=S7fL
-----END PGP SIGNATURE-----

--x+RZeZVNR8VILNfK--

