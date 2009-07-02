From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: nf_conntrack_sip problem
Date: Thu, 2 Jul 2009 10:17:41 +0200
Message-ID: <20090702081741.GH9285@Redstar.dorchain.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net> <4A4B509C.3080600@trash.net> <20090701144321.GB9285@Redstar.dorchain.net> <4A4B7B4D.5090900@trash.net> <20090701161029.GC9285@Redstar.dorchain.net> <4A4B8BD5.6060907@trash.net> <20090701205616.GE9285@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xVUAO+xN0VJlKSe3"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1246522664;
	bh=jO1cqwdDokjwF0Vnxkx3sUQS816ih7IKm6dFoECNOak=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=v/wrXceps8KbBVISUpmv8+m2w8YE1vA09gujVMfr1TpLbxBgGDFHYE2d5HpmJrvoS
	 Z1h5sXh+HuDO2Qt4wDFHu3p9ad+aQPuzJJRYN5oh3VsBTPol7oCNAosMJqtzxPpbWp
	 4mBHMsUwu+UJ5UUi/9zncJErX+GVvJhifK95JB78=
Content-Disposition: inline
In-Reply-To: <20090701205616.GE9285@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org


--xVUAO+xN0VJlKSe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2009 at 10:56:16PM +0200, Joerg Dorchain wrote:
>=20
> Aehm, 85.93.219.122 is the address from the SDP payload for the
> RTP stream as attached. 85.93.219.114 is is address of where the SIP REGI=
STER
> is sent to.
>=20
> I will try again with only sip_direct_media=3D0.

I works, but somewhat ugly.
# conntrack -E expect
180 proto=3D17 src=3D0.0.0.0 dst=3D85.93.219.122 sport=3D0 dport=3D11080
180 proto=3D17 src=3D0.0.0.0 dst=3D85.93.219.122 sport=3D0 dport=3D11081
180 proto=3D17 src=3D0.0.0.0 dst=3D212.88.133.153 sport=3D0 dport=3D7076
180 proto=3D17 src=3D0.0.0.0 dst=3D212.88.133.153 sport=3D0 dport=3D7077

All the places where the ip is 0.0.0.0 or the port is 0 could be
filled more specifically. The necessary information is available
in the same SIP/SDP flow as the used information. Besides the two
RTP stream are unidirectional, so I'd like to have something like
this:
180 proto=3D17 src=3D212.88.133.153 dst=3D85.93.219.122 sport=3D7076 dport=
=3D11080
180 proto=3D17 src=3D85.93.219.122 dst=3D212.88.133.153 sport=3D11081 dport=
=3D7077

Bye,

Joerg

--xVUAO+xN0VJlKSe3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iHcEARECADcFAkpMbSUwFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zgPDgAn2905ijKVSWZqO5y12/gZjwv
MJr7AJ4111EbicoXXqUNo9/3HHPTK7AnFQ==
=BMF1
-----END PGP SIGNATURE-----

--xVUAO+xN0VJlKSe3--
