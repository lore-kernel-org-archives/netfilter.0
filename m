From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Questions about the workings of iptables
Date: Mon, 26 Jul 2004 16:04:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040726140458.GA4809@zion.homelinux.com>
References: <564DE4477544D411AD2C00508BDF0B6A21C4DABE@usahm018.exmi01.exch.eds.com> <200407261417.33159.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407261417.33159.Antony@Soft-Solutions.co.uk>
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


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Antony, hi Jim,

On Mon, Jul 26, 2004 at 02:17:33PM +0100, Antony Stone told us:
> On Monday 26 July 2004 1:51 pm, Small, Jim wrote:
>=20
> > 1)  How extensive is IPTables stateful packet filtering?  Are the seque=
nce
> > numbers carefully scrutinized as part of the state check?
>=20
> No.   AFAIK the connection tracking in netfilter checks only src+dst IP+p=
ort,=20
> nothing else.
>=20
> > Is there a listing of everything the connection tracking modules do?
>=20
> Netfilter source code is probably your best bet here.
>=20
> > If connection tracking or stateful inspection does not include TCP sequ=
ence
> > checking, is there a way to add it?
>=20
> I do not know of a patch to provide this.   It would be in patch-o-matic =
if=20
> there is one.

look at the TCP window tracking patch in pom-ng. Harald has submitted it
to davem for inclusion in the mainline 2.6.9 kernel recently. Don't know
if it will be included in 2.4, too.


regards,

Sven

--=20
Linux zion 2.6.8-rc2 #1 Sun Jul 18 15:00:48 CEST 2004 i686 athlon i386 GNU/=
Linux
 16:02:43  up 7 days, 17:31,  1 user,  load average: 1.06, 1.08, 1.02

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFBBQ+Ko4FAdB2PneQRAkf2AKCCtwGv1iHgdhhL1yk/X49HAs1v9gCfcArF
nuQtq9CAxrEJKO30g6BFnJo=
=FZ4w
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

