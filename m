Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906B23814F
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 22:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041444; cv=none; b=DCtpnx/IRB2FtS1TS7Qqqy9HCzEbGqp5zYVgtozEBCCMq92vaN/O84ry17Q8Z41XMoYoJP+ah4zzsonJ6jnt/8Alda1JfCTzeaeBkLSAsUGwXXWGOecioPFfEIQbeiWkQhem48HkF9b/m+m7/XdSYYEwpsqUIB3OHcVDluMgu68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041444; c=relaxed/simple;
	bh=/nM47ZHzRuri8ytJRc8QjjMN2SUCeMlZxDHNRS3QLto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXAyz/Ozgu3qmIoekC/rdPff8ai/eTr+yNFnZeHyCgFK3cSMaxsnZt2oDTDCIaCB3cF7RoaJ48kzx0qKE4iNjjVJ4ruTcFEGeLM+VA8PMyia4cvulhqIQzqB5z0uy+R4NH4QW0QgMTTz0KWZpU7FFvhV2QM2TLdJczVOjZETdM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=rp7sf00f; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="rp7sf00f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Pc7wDP6Hs+Uw/G7Q9oXoIui88Y6Ilu3SclMRTHM0nOg=; b=rp7sf00feexAxmAGNiITE+vxdJ
	5TtcuQpCw9TH4ksTU5D3H+6uzPBtUaAEjNdPekBhU8B98GWPB4H+VGCJmh7PrYvpMRHi6ULmu+Rom
	ATfAxtAIxJIPSTUdX6DbgwWqKgzUQHGnQ7Q8y7LPOP2TqAMosb2+Ssfdw8ugnh7FM+wzDIqlcj68v
	70e+azDQhyVCoqDdiQWx8P3RDRbqtEZU15nfV4/bEB8hiroHv/1o3Vl6wPzE9DOFgE/0dFekeYP1+
	+llj6olHIiNOmu+3FCwV1gBUvops63L0NZceLvatTlukABWsP+Td48cCKLDzk9JwawDmMtCaicQ6b
	w5nB2rGg==;
Received: from celephais.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f] helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1tpDqK-00Af1o-1m;
	Mon, 03 Mar 2025 22:00:56 +0000
Date: Mon, 3 Mar 2025 22:00:55 +0000
From: Jeremy Sowden <jeremy@azazel.net>
To: Netfilter <netfilter@vger.kernel.org>
Cc: Slavko <linux@slavino.sk>
Subject: Re: Log ARP headers
Message-ID: <20250303220055.GA4034310@celephais.dreamlands>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
 <20250303193533.GA16225@breakpoint.cc>
 <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eH8hoytd106Udl8L"
Content-Disposition: inline
In-Reply-To: <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
X-SA-Exim-Connect-IP: 2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--eH8hoytd106Udl8L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-03-03, at 21:52:07 +0000, Slavko wrote:
> On 3. marca 2025 19:35:33 UTC, Florian Westphal <fw@strlen.de> wrote:
> > This is only required for logging that is triggered internally,
> > e.g. for nf_conntrack.log_Invalid.
>
> Oh, many thanks, that was not clear for me from any related article.
>
> > I think this is missing support in ulogd2.
> >
> > Untested, to give you some starting point:
> > (3 is NFPROTO_ARP).
> >
> > --- a/filter/raw2packet/ulogd_raw2packet_BASE.c
> > +++ b/filter/raw2packet/ulogd_raw2packet_BASE.c
> > @@ -959,6 +959,8 @@ static int _interp_pkt(struct ulogd_pluginstance *pi)
> >                 return _interp_ipv6hdr(pi, len);
> >         case AF_BRIDGE:
> >                 return _interp_bridge(pi, len);
> > +       case 3:
> > +               return _interp_arp(pi, len);
> >         }
> >         return ULOGD_IRET_OK;
> >  }
>
> Unfortunately, i don't speak C ;-)

I do.

> I understand this change, but i cannot see all consequence,
>
> Any chance that it will go to ulogd itself? Or i have to maintain
> this patch locally only? (I mean for future versions)

I'll look at this when I get a moment.

J.

--eH8hoytd106Udl8L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsG7BAABCgBvBYJnxiaJCRAphqwKvfEEDUcUAAAAAAAeACBzYWx0QG5vdGF0aW9u
cy5zZXF1b2lhLXBncC5vcmcj2UbG/biiZ88cfU6jrvwyC2TSYXA91SKsrWg+IfyM
ihYhBGwdtFNj70A3vVbVFymGrAq98QQNAAD0IA/9HJ1DDYOOkXqOOXn0bVYd3CJ+
exCP4wTjtc9VKGxoE95r6Xw+AnlMck+kEaOgoWbYcwl14InqHbZ0anTvpfq/b6i4
bajWOUDL3fLGpwW4ZphtluI9L75+NDaOYeugQeH53zDPrlIf9uoQLmMQZK5TUUcM
MxEJZoo+1iIeIkPj/NoF1V9LSpK67nUNEz8xlpoqRsH1ZYGhATwX1QLA5lcZx8yI
U6HoFm/v0f3My9F003xudhUXw54L9x9SLCJWDuHPJVCuPPt3O/5s4zikmaXkPExT
0WXEC+K1uRUTe2FqdqEcxfeZ5dF3RS/Xq47EzFF7UZUNXm4/lURkTlTxwUmajr4H
WIBopW3QdLuW+AL6DkMuq+jJZ4V1U/Uhd8V0uDsHPm6Tv0h/POfpF3DV+Hr19fg3
Kx2/opFkCZ9gEma6nwL8RkZCuPlmFGUw3PGRfipenwHtd76uFbpu+9mrlpG0wTcZ
8N3yJKSruWdLaUH31d12gGn0S+iRWCzUQGAXEvn7hWPAJELOrrVrmQ6VzLnavMva
4pTa1d0dwQNdzwmTkQ8mY8raQCVdDz9CfWy3WChw+vrw3wmsI1g7/yQMbVdOWnFR
eaAq6XGnVp/w0WoIJvVoMPAxaTBjQh++0QbSPpJ5mQFYZKOv0FJsTGT9jC4fjcCF
t0uVT95vDB3ZHMLVdaQ=
=JaOn
-----END PGP SIGNATURE-----

--eH8hoytd106Udl8L--
