From: Alexander Samad <alex@samad.com.au>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Thu, 14 Apr 2005 07:00:49 +1000
Message-ID: <20050413210049.GA29686@samad.com.au>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
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
To: netfilter@lists.netfilter.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2005 at 01:50:50PM -0700, Christian Seberino wrote:
> I want first rules that packets encounter to be my DROP_CHAIN
> that weeds out suspicious packets including packets addressed
> to and from 127.0.0.1 (loopback):
>=20
> # -------------------------------------------------------------
> $IPTABLES -t filter -P INPUT   DROP
> $IPTABLES -t filter -P OUTPUT  DROP
> $IPTABLES -t filter -P FORWARD DROP
> =20
> $IPTABLES -t filter -A INPUT   -j DROP_CHAIN
> $IPTABLES -t filter -A OUTPUT  -j DROP_CHAIN
> $IPTABLES -t filter -A FORWARD -j DROP_CHAIN
>  =20
> $IPTABLES -t filter -A INPUT  -i $LOOPBACK_INTERFACE -j ACCEPT
> $IPTABLES -t filter -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT
> # ------------------------------------------------------------
>=20
> How can I make DROP_CHAIN drop bogus 127.0.0.1 addressed packets
> but still allow **legitimate** loopback traffic?

$IPTABLES -t filter -A INPUT -s 127.0.0.0/8 -i ! lo+ -j DROP_CHAIN

I am presuming that a legitimate 127/8 address will only originate from
a lo interface

>=20
> Chris
>=20
>=20
>=20
>=20

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCXYiBkZz88chpJ2MRAlv8AKCj0pZw7do0vcLLbs+D9OnEmz3OZgCg/QFA
FuHlcCKzsvLA4fFMhn1bPL4=
=WV/6
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

