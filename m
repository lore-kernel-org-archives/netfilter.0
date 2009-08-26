From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: SIP conntrack defeating Asterisk canreinvite
Date: Wed, 26 Aug 2009 09:15:10 +0200
Message-ID: <20090826071510.GZ6724@Redstar.dorchain.net>
References: <1251248668.6450.59.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRtZRu2mMGBZ6YQ7"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1251270911;
	bh=NMpFYRZNDLZwNjyFhAD/kMN6juwlTbtIgnUY8uK5Djc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=SU29CZZRaSizcupWdUQTpExERuUSmLyySscLmolN8un0gYZvUA1se2ujeRosDhVs5
	 cczWiEnJS/wtdn+KsZCfRABCUTxTFqrTmDc95LY66H7RC+7HGiwSDMO+TfVHsmU81R
	 54YSOxqRYzYDTskZuGCqh7zaz5MlA18m6w02D57A=
Content-Disposition: inline
In-Reply-To: <1251248668.6450.59.camel@jaspav.missionsit.net.missionsit.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org


--wRtZRu2mMGBZ6YQ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2009 at 09:04:28PM -0400, John A. Sullivan III wrote:
> The reinvite works by the Asterisk server sending a SIP invite after the
> call has been set up. The new invite contains the address of the phone
> in the SDP portion of the packet rather than the address of the PBX.
> This should redirect the media stream to flow directly between the
> phones.  However, it appears conntrack is rewriting the SDP so that the
> address is reverted to the PBX address.

Rewriting sounds like nat. I am using conntrack_sip to be able
to have the rtp connections accepted as related to a sip
connection. Are you sure that you aren't using the sip nat helper
by change?

To have reinvites working, I needed sip_direct_media=0 as option
to nf_conntrack_cip

Bye,

Joerg

--wRtZRu2mMGBZ6YQ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iHcEARECADcFAkqU4P0wFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zgxUkAnR3C2LsIC9UYwhJq0TB//D13
uAk1AJ9+xa/oBi/QDZCVyn/i7n4oE0DSrQ==
=piCt
-----END PGP SIGNATURE-----

--wRtZRu2mMGBZ6YQ7--
