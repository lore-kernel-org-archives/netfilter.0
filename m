From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: IPV6 and Pre/post routing
Date: Wed, 3 Feb 2010 08:48:30 +0100
Message-ID: <20100203074830.GI8505@Redstar.dorchain.net>
References: <034DEBCAE934A74991E6E76B8DA72D141884A1929E@HSSBS.holdstead.local>
 <4B687862.7010204@plouf.fr.eu.org>
 <034DEBCAE934A74991E6E76B8DA72D141884A192A0@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kF9LAPPYk2MosVMu"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1265183312;
	bh=ge7PcRvddsP7/yfzWUs41dG2xkPiNVuQ0a1lnFuLN5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=eCKu3Wu9TOvWSR4zu3VIqqLAzcTwFIVtvql9Q6oEAvEy9Ff4cYdmGOvfbLplJkmLm
	 Pl0OyowXmq9WGf0JhXs+QIVFSgT29GTYvAlO9VcmZi7Mz2ddNDozT3QuKE8d4UaNec
	 SgdfHjJ5bo6MXZR4+5B17NfWDDZypPNFEk0nl3XE=
Content-Disposition: inline
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D141884A192A0@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gary Smith <gary.smith@holdstead.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


--kF9LAPPYk2MosVMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2010 at 12:35:43PM -0800, Gary Smith wrote:
> > > What I'm wondering, after reading some old documentation on iptables,
> > > if this is possible with IPV6.
> >=20
> > Netfilter has no support for IPv6 NAT, and hopefully never will.
> > Can't the DNS records for mail just point directly to the addresses of
> > the mail servers ?
>=20
> If there is no support for NAT in IPV6, then we will need to do something
> like that.  The problem is getting clients to update their settings with =
as

IMHO you normally have enough IPv6 adresses to bind each service
to a dedicated address, even on the same host, if needed.
Besides, there are SRV records. If your clients use them, you are
lucky.

Bye,

Joerg

--kF9LAPPYk2MosVMu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iHcEARECADcFAktpKk4wFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zg8DAAn0Nkxi4GgSayNNHC1MajHIpI
5kxyAJsFtSLVLtZ6aqK5aTnzlxbtRh0D8g==
=/woB
-----END PGP SIGNATURE-----

--kF9LAPPYk2MosVMu--
