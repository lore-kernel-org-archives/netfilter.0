From: Alexander Samad <alex@samad.com.au>
Subject: Re: DNAT to another Network?
Date: Wed, 07 Jul 2004 22:10:49 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040707121049.GA5416@samad.com.au>
References: <200407071129.i67BTbP22745@ps0.linanet.is>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=gKMricLos+KVdGMg;
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200407071129.i67BTbP22745@ps0.linanet.is>
Content-Disposition: inline
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


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2004 at 11:51:02AM -0000, Svavar ?rn Eysteinsson wrote:
> Hi everybody.
>=20
> I have one question about DNAT.
>=20
> I have a computer foo.com on an ipaddress xxx.xxx.xxx.xxx
>=20
> Is there any way for me to DNAT all traffic with destination to foo.com
> to another server out-of-town, e.g. computer foobar.com with zzz.zzz.zzz.=
zzz
> that
> is not on my public network.?
>=20
>=20
>=20
> Diagram : (showing where the traffic should go)
>=20
>=20
> Traffic with destination to Computer A
>=20
>       INTERNET(ISP nr1)   -------INTERNET(ISP nr2)
>          |                |         |
>          |                |         |
>     Network A             |      Network B
>          |                |         |
>          |                |         |
>      Firewall             |    Computer B (final destination)
>          |          |-----|
>          ->Computer A
>         =20

you can do iptables -t nat -I POSTROUTING -j -d foo.com DNAT --to-destinati=
on
xxx.xxx.xxx.xxx

the only problem is if the machine xxx.xxx.xxx.xxx can talk to the
originator with talking to the machine nat'ing, then you need an SNAT
rule as well.


> Best regards,
>=20
> Svavar O
> Reykjvik - Iceland
>=20
>=20
>=20

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA6+hJkZz88chpJ2MRAoH1AJ9EcsxKKS3N6Lcb+ipFN9dP75WC7gCfUEyz
20fT3BJLHSkhdVQEO66GPGQ=
=QkOf
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

