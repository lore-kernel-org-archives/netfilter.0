From: Eric Leblond <eric@inl.fr>
Subject: Re: NFQUEUE handler source example
Date: Tue, 22 Apr 2008 22:17:27 +0200
Message-ID: <20080422201727.GB15732@bayen.regit.org>
References: <c1ae779f0804220704s3a419fbu2e507ced85a6aa06@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c1ae779f0804220704s3a419fbu2e507ced85a6aa06@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mike Herms <mherms@gmail.com>
Cc: netfilter@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tuesday, 2008 April 22 at 10:04:18 -0400, Mike Herms wrote:
> Short question:
> Does anyone have example source code for user land handling of packets
> off of NFQUEUE in a bridged environment?  I believe that I've
> successfully created a bridged environment as follows:
=2E..
> Version information:
> bridge-utils v1.2
> iptables v1.4.0
> ebtables v2.0.8-1 (May 2007
> arptables v0.0.3-3

Which kernel do you use, we did not succeed in queueing packet on 2.6.22
but 2.6.24 was clean. The effect was the same as your: no routed packet as
soon as NFQUEUE application is launched.

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIDkfXnxA7CdMWjzIRAs6LAJ9OMpT3Xvol3Tr63kQW+kXgzLN16QCfch0A
06tCfdA77fW6CSQnk4qCd1U=
=xy4t
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
