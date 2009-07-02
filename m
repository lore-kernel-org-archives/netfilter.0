From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: nf_conntrack_sip problem
Date: Thu, 2 Jul 2009 11:04:40 +0200
Message-ID: <20090702090440.GI9285@Redstar.dorchain.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net> <4A4B509C.3080600@trash.net> <20090701144321.GB9285@Redstar.dorchain.net> <4A4B7B4D.5090900@trash.net> <20090701161029.GC9285@Redstar.dorchain.net> <4A4B8BD5.6060907@trash.net> <20090701205616.GE9285@Redstar.dorchain.net> <20090702081741.GH9285@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hSsVBZHIO2Q9XETc"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1246525481;
	bh=l+aABkR75LlMCzyCD6QCWzZOzYsaH1FFGIrQYtFNYsY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=DDkaOmHWFFtoVuohuHUfCYNWJ7/xIkMq+CWT7QyY35pvPt4Fk8EWLkFJRdgR2b5i4
	 8RmrYFmVsvpoGBSdMIE5qEy3AN7SjlSvTG4kZO8NVoQVXzjTuWgXRDzGXvZFVCMVt+
	 VM+xzbkLxvgnmihe1lCHZ58SxKMKN041Gn5BaVZ8=
Content-Disposition: inline
In-Reply-To: <20090702081741.GH9285@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org


--hSsVBZHIO2Q9XETc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2009 at 10:17:41AM +0200, Joerg Dorchain wrote:
>=20
> I works, but somewhat ugly.
> # conntrack -E expect
> 180 proto=3D17 src=3D0.0.0.0 dst=3D85.93.219.122 sport=3D0 dport=3D11080
> 180 proto=3D17 src=3D0.0.0.0 dst=3D85.93.219.122 sport=3D0 dport=3D11081
> 180 proto=3D17 src=3D0.0.0.0 dst=3D212.88.133.153 sport=3D0 dport=3D7076
> 180 proto=3D17 src=3D0.0.0.0 dst=3D212.88.133.153 sport=3D0 dport=3D7077
>=20
> All the places where the ip is 0.0.0.0 or the port is 0 could be
> filled more specifically. The necessary information is available
> in the same SIP/SDP flow as the used information. Besides the two
> RTP stream are unidirectional, so I'd like to have something like
> this:
> 180 proto=3D17 src=3D212.88.133.153 dst=3D85.93.219.122 sport=3D7076 dpor=
t=3D11080
> 180 proto=3D17 src=3D85.93.219.122 dst=3D212.88.133.153 sport=3D11081 dpo=
rt=3D7077

Sorry for replying to often to myself, I have another addendum:
In case of asterisk reinvites in order to have to RTP stream
moved away from the machine, there are still connections expected
despite that these invites are explicitly meant to stop rtp
streams to the local machine.

Joerg

--hSsVBZHIO2Q9XETc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iHcEARECADcFAkpMeCgwFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zghZcAmwWZKyJGfSHVc/80JweVxOjb
WAxzAJ4h+6ZqH07+Zcp/IHCVzBoYZF3AHA==
=GJ3N
-----END PGP SIGNATURE-----

--hSsVBZHIO2Q9XETc--
