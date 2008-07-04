From: Eric Leblond <eric@inl.fr>
Subject: Re: NFQUEUE hello world-style program
Date: Fri, 4 Jul 2008 11:26:38 +0200
Message-ID: <20080704092637.GA30729@bayen.regit.org>
References: <200807031607.21168.simon.perreault@viagenie.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200807031607.21168.simon.perreault@viagenie.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Simon Perreault <simon.perreault@viagenie.ca>
Cc: netfilter@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thursday, 2008 July  3 at 16:07:21 -0400, Simon Perreault wrote:
>=20
> #include <stdio.h>
>=20
> int cb( struct nfq_q_handle* q, struct nfgenmsg *nfmsg,
>         struct nfq_data *nfad, void *data )
> {
>     char* payload;
>     printf( "received %d bytes\n", nfq_get_payload(nfad, &payload) );
>     return 0;
> }
>=20
> int main()
> {
>     struct nfq_handle* h =3D nfq_open();

You are missing the unbind  bind=20
=09
	nfq_unbind_pf(h, AF_INET);
	nfq_bind_pf(h, AF_INET);

You can have a look at for working  code:=20
 * utils/nfqnl_test.c in libnetfilter_queue sources
 * http://software.inl.fr/trac/browser/mirror/edenwall/nufw/trunk/nufw/src/=
nufw/packetsrv.c#L219

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIbezNnxA7CdMWjzIRAkITAJkB6BnjrHxTqvHPCt2nHfY7uCQ4MgCfQddO
STSjo44BrAohfDhWNDXo7fs=
=olYZ
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
