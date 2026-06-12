Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45525305673
	for <netfilter@vger.kernel.org>; Fri, 12 Jun 2026 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258037; cv=none; b=enFSS4J0YYqZ7agagiI1hvKnY9Ca0ln/qswskbb9flWizepfDkGwOwvUuzyj2SxkVMh3jq5+Fx7+mXVZbDypfGrRc/y2tRcORcilaOkdqovYXSNZHDIj83jbzZe5rmHYDJujIyiMLFyKUX0e/WKTCwkDv6XQgn/TJffC5jhPj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258037; c=relaxed/simple;
	bh=wB1QYV7x4tDSXlZWDbBr8c9p+n7vTpEnT4nZO/jMzLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZZQNuuBIm/S3eutcJ4b02JdlGax/0mufGOXxJsp+8qDmOzEytqLMoEsZd8+p31892UBWqT6wJlEKey0dcdiBnwvwQuMYpdo69OfRZ1TbcRT5uQfpXYAiaizWOA76ibRGmxXhk3z11CFuwMuvNCZWQmfwtJYoPlkRi77TIWGnvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=bGRz1HNQ; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="bGRz1HNQ"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id D5FE660177;
	Fri, 12 Jun 2026 11:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1781258026;
	bh=rvfaiqGT/RFBh1cNzXj9YOQOS/GvE0HvhAginCuJ55E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGRz1HNQOK1N71wXmiSZLGvONcZJ7dPEyHAOSKOPdzUqdS/ej74rWDPhWyuw5N412
	 BpHSNPf0NatzY77twIMI6Niaz4uRPhLyjmQJehv5NgNTwHoFMFCZma9C50quV5D012
	 nmh8LEZm2h/If81RR9CNhUolQj51NUAlXKqIqQwWJxBQk0jnfVHmLrPCj9j3G1x3PB
	 8if7v6UMUu5KHJ3kkJKues+UYM+JjMcNLOgNd4CuFEB2TEBP4tTP66T+sh/a47c6gF
	 ppWU0zGLAJaL7vzB+wuGITKe/2XMqgW8Q+VtODDN9+SP4ooFPdFBP5qHEgrW9fRbGA
	 KarqapZB0Y0cA==
Date: Fri, 12 Jun 2026 11:53:43 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Jan Kasprzak <kas@fi.muni.cz>, netfilter@vger.kernel.org
Subject: Re: Logging SNAT'ed connections
Message-ID: <aivXJzuGKp3M4K2Z@chamomile>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
 <ailH6MomrFCvxH8Q@chamomile>
 <74dd050a-3587-4fdc-b06f-c82a9fd398e4@app.fastmail.com>
 <aimDYp2y_oxSIIzi@chamomile>
 <ce6502c0-8576-4672-9227-118f515f334c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce6502c0-8576-4672-9227-118f515f334c@app.fastmail.com>

On Fri, Jun 12, 2026 at 06:49:00AM +0100, Kerin Millar wrote:
> On Wed, 10 Jun 2026, at 4:31 PM, Pablo Neira Ayuso wrote:
> > Thanks for reviewing, v2 is here:
> >
> > https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610151735.192168-1-pablo@netfilter.org/
> 
> I have now applied this to a production host and tested it in a number of ways, including the use of the --src-nat option, both with and without an option-argument. In all cases, conntrack(8) behaved perfectly.

Thanks for testing, I'll apply this then.
