From: Eric Leblond <eric@inl.fr>
Subject: RE: Netfilter / ldap authentication
Date: Tue, 07 Mar 2006 00:19:43 +0100
Message-ID: <1141687183.3292.16.camel@porky>
References: <648A21EA469E3848922D9860785CD5EF23D487@aspen-mail01.aspenview.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-QJ9g9WCF5xMtAA2rNk3v"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <648A21EA469E3848922D9860785CD5EF23D487@aspen-mail01.aspenview.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Jason Sigurdur <Jason.Sigurdur@aspenview.org>
Cc: netfilter@lists.netfilter.org


--=-QJ9g9WCF5xMtAA2rNk3v
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-03-06 at 16:02 -0700, Jason Sigurdur wrote:
> Hi, windows2k/xp systems in a 2k domain. Currently using proxy server 2.0=
; do not want to upgrade to ISA server. Our vpn/gateway infrastructure is e=
ntirely linux  based.

You can use NuFW : http://www.nufw.org

It provides enhanced Netfilter capabilities by adding authenticated
rules that can be based on AD group.

More infos available on the website.

>=20
>=20
> Thx jason
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@lis=
ts.netfilter.org] On Behalf Of Seferovic Edvin
> Sent: Monday, March 06, 2006 3:21 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: Netfilter / ldap authentication
>=20
> What do you want to authenticate with LDAP?
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason Sigurdu=
r
> Sent: Montag, 06. M=E4rz 2006 23:16
> To: netfilter@lists.netfilter.org
> Subject: Netfilter / ldap authentication
>=20
> Hi, is there any known methods of a integrated netfilter and ldap
> authentication? For example: in a windows AD domain?
>=20
> Thx jason
>=20
>=20
>=20
>=20
--=20
Eric Leblond <eric@inl.fr>
INL

--=-QJ9g9WCF5xMtAA2rNk3v
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEDMOPnxA7CdMWjzIRAuI5AKCKhNBswVjOvHznL+MKW456FFSKZwCeI91R
4uh+x2OywjeDqtVgMH7zw3I=
=HXsk
-----END PGP SIGNATURE-----

--=-QJ9g9WCF5xMtAA2rNk3v--


