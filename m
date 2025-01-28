Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C08AF4E2
	for <netfilter@vger.kernel.org>; Tue, 28 Jan 2025 00:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738024632; cv=none; b=NbczsHFQDE+pBN7Jkv4YRhu5ZLgjUARiV9MKwv6qzhKmsEef7baJENqpwsDKfcN9i9c+LXJdTZNkAnzjaXYQDxveYoGK1ysBiggNYtYGm3yQRvK6TmVrlMlYGM1EKgTHBAMVPlQrbGMClKkpS48MK3iJjuhaL3hZyQLVJntJiZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738024632; c=relaxed/simple;
	bh=1K6wsyyXkfENH9W5wj+xXSh2Zzbb+kMEU/DP9L94+NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgDkBhFkymk1JU+mhwjAYf5cFBTzBK8wcj9G91PPKx6sDXH3CGF7i3qUWL8G51T3+S7faFswnOV1c2jF7XjUvgwHhgASIJC27bafKl1RB28dQlyIEhyiPGOQrmQuGQqG8JnDQgNnyYtPSl1MVcgUVtL7DAKrA0jvNujJ3gWDrNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tcZbG-0007qj-Mk; Tue, 28 Jan 2025 01:37:06 +0100
Date: Tue, 28 Jan 2025 01:37:06 +0100
From: Florian Westphal <fw@strlen.de>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Florian Westphal <fw@strlen.de>,
	"netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <20250128003706.GB29891@breakpoint.cc>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com>
 <20250126135021.GB3073@breakpoint.cc>
 <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Sunny73Cr <Sunny73Cr@protonmail.com> wrote:
> > Please elaborate as what is wrong here in listing 3.
> 
> Within the second line of the rule (@ih,80,16 set @ih,80,16 & 0x3f0 \)
> 
> The mask 0x3f0 equates to 1,008 in decimal.
> (3 * 16**2) + (15 * 16**1) + (0 * 16^0) = 1,008
> Here '**' indicates exponent.
> 
> 1,008 is far larger than the 34 bit range that I covered.

Sigh.  Why did you not say something like:

The mask is provided as '0x3f0' in the listing, but I had expected
0xfc0f, as only 6 bits should be cleared, but the mask KEEPS 6 bits.

It would have saved me a headache figuring out bug you refer to.
I am not a mind reader :-/

Use --debug=netlink, it looks like its a display bug.

I'll have a look.
