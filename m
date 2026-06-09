Received: from anxur.fi.muni.cz (anxur.fi.muni.cz [147.251.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462473BED01
	for <netfilter@vger.kernel.org>; Tue,  9 Jun 2026 06:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.251.48.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985854; cv=none; b=TCjocZ5U2oS0rzgDmKcJTTuXTUblAGGiYheQ90/Mh2BuF/d4dl3o9EJy5umOtkWc3S2v2vEfd8u/OxYXdPQH5cxf2Pj+UVp/FoVvxovJWf3M4X5DkzIiyKZCiMyiqm0V8zJI3rImua+r0gIpp66ZRS0syKonMrW6hScCim6du8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985854; c=relaxed/simple;
	bh=AKHLE22GBg7BxG4Af3bTqB8o1P6uIPQItybZ3b1sYZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLmPwpBZAZCbg73pmzaaLGPV0O0nDPxEtySscjTWwqFM+hmqF0BOEMcqTqkvYWvv3k2rWNfQ8lU0CXZeHe9hTxoC0ggSHvoE/7MbK8ouOOirFWGv6k2tEfxoGgU3015OPf3HpFp5ALlgn0yObh4jQycpqa6GjjrdNVii6rcleZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz; spf=pass smtp.mailfrom=fi.muni.cz; dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b=eotSZg7O; arc=none smtp.client-ip=147.251.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b="eotSZg7O"
Received: by anxur.fi.muni.cz (Postfix, from userid 11561)
	id 7056B208DD14; Tue,  9 Jun 2026 08:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fi.muni.cz;
	s=20230215; t=1780985848;
	bh=y5Sp0k0qjbrJM1T1v/gKTGvVzw/M5JSg577ssEJRJ2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eotSZg7O/7iCEu8Z4Y4sSYqIhNM8J3rW863gH6esCDK1iPkZlTjI9m8DP7aluSl0J
	 B3YcwBj4jebZhLV62kFU9AJezOYc0Q4BhKcgMZfW23qrLheDectJ+bVWoKj4wUw8I0
	 D53N3tesLhOhDUfnqR9U7PL30ARr2qPyzS3pHXdgusQSE8G/bLKF3mpJ/xk00Kh0GD
	 iOogL2dpoksMt2e74MKKn9qi/EECcaud3RAcxK1Rcf7LMpYA9QsYH0Rgp7ai4FglSn
	 HWeFMsI46F6P/bv0uroKkrNGNt4DaDa95aFGvw0Em3w0+wTM5NZIBiH/h6ai5WaBaN
	 AiYTB61AQSj/g==
Date: Tue, 9 Jun 2026 08:17:28 +0200
From: Jan Kasprzak <kas@fi.muni.cz>
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Subject: Re: Logging SNAT'ed connections
Message-ID: <aiev+KfLwXdBNyOy@fi.muni.cz>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
 <aich5cMiSFlr1pcH@fi.muni.cz>
 <3c59323d-449d-4f1c-abf3-2df0ada64cbb@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c59323d-449d-4f1c-abf3-2df0ada64cbb@app.fastmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

Kerin Millar wrote:
> On Mon, 8 Jun 2026, at 9:11 PM, Jan Kasprzak wrote:
> > Hi, Kerin,
> >
> > Kerin Millar wrote:
> >> Unfortunately, it appears to be a bug affecting ICMP. Possibly here:
> >> 
> >> https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189
> >> 
> >> For now, I would suggest filtering with something else.
> >> 
> >> conntrack -E -o id,timestamp |
> >> perl -ne 'print if /\bsrc=(\S+).*\bdst=(\S+)/ && $1 ne $2'
> >
> > Oh, I did not expect it to be a bug.
> >
> > Anyway, you probably mean src= in both cases. Using backreferences,
> > I did it this way:
> >
> > perl -nE 'print if /\bsrc=(\S+)\s.*\bsrc=(?!\1\s)/'
> 
> The idea I had in mind was to compare orig.src against reply.dst. Where orig.src != reply.dst, NAT applies. Your approach compares orig.src to reply.src. Those will differ for most flows, whether they were subjected to NAT or not.

OK, understood. Thanks for clarification.

> I would tend not to use backreferences in that way because it becomes quite easy to make a mistake.
> 
> $ printf 'x=123.45 y=123.45\n' | perl -nE 'say "matched: $1" if /x=(\S+).*\by=(?!\1\s)/'
> matched: 123.4

This is why I had \s after the first group: (\S+)\s.* instead of (\S+).*
But yes, if we are trying to match the first src= against the second dst=,
we would hav to avoid .* to match the first dst= instead. Something like
this:

perl -nE 'print if /\bsrc=(\S+)\s.*\bdst=.*\bdst=(?!\1\s)/'

-Yenya

-- 
| Jan "Yenya" Kasprzak <kas at {fi.muni.cz - work | yenya.net - private}> |
| https://www.fi.muni.cz/~kas/                        GPG: 4096R/A45477D5 |
    I don't like Python; its lack of inline, anonymous, multi-statement
    functions makes me sad.                                --Eric Wastl
