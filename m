From: Alexander Samad <alex@samad.com.au>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 20:39:32 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040311093932.GV1072@samad.com.au>
References: <001201c40744$1f34a190$2a245cc2@cea05> <200403110859.53154.Antony@Soft-Solutions.co.uk> <003301c40749$b68e4280$2a245cc2@cea05> <200403110926.26421.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yzwzo2Lpb9tBI5S/"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403110926.26421.Antony@Soft-Solutions.co.uk>
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
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--Yzwzo2Lpb9tBI5S/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2004 at 09:26:26AM +0000, Antony Stone wrote:
> On Thursday 11 March 2004 9:17 am, Tomasz Macioszek wrote:
>=20
> > > > iptables -P FORWARD DROP
> > > iptables -F FORWARD
>=20
> > I know but I would like to block only p2p traffic??
> > Is patch which blocks only p2p??
>=20
> I do not know of a way to block p2p without blocking other protocols.

=46rom memory MSN can use http, i block it in squid as well as netfilter.

>=20
> However, does not mean there isn't one, just that I don't know about it.
>=20
> Regards,
>=20
> Antony.
>=20
> --=20
> There's no such thing as bad weather - only the wrong clothes.
>=20
>  - Billy Connolly
>=20
>                                                      Please reply to the =
list;
>                                                            please don't C=
C me.
>=20
>=20
>=20

--Yzwzo2Lpb9tBI5S/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAUDPUkZz88chpJ2MRAo/6AJ9XvVB87T2inJrTVQEcVGq/7wbk0QCfRuAJ
baB07IHaNmXCN5e2YyerDb8=
=Byvi
-----END PGP SIGNATURE-----

--Yzwzo2Lpb9tBI5S/--

