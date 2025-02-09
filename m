Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A067482
	for <netfilter@vger.kernel.org>; Sun,  9 Feb 2025 01:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739065687; cv=none; b=AwlJLT+FT2dyGDm9rJC3JR+w0BbpVvJSJ1uN7Ra9A0Ex5xvrUUNsNFGM/1rhYXxBGHXcJ9HPZEMk9B5fAWFxRiCdTGf5DMXAoUAYuqum0PZLZWARoThsYdLsmn3PTrY4+KWygdN6c59MgnwuJNGHKFL0kiuCf49sxN2mm++e21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739065687; c=relaxed/simple;
	bh=uSmUL+Yh8zAWQnQw6+O2jgVFVyKNQIqdsq0e2eAA7qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxrDM/CeN5I+r6hRLZFDhmfOEqciQK+x90RN/Kkcf8TVJNkg/Ydq60reN2aVGYbL3EBO94BgV+FjYH/tAIS+/dSQnRaLNM6Gdxuo0NBe3fnEGpqwnwU2X98wEFtDEaTTD5Sv2wkYOizNhg8dpO8vIbWcqUxjkKQRinsusiIBu2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tgwQL-00013H-DA; Sun, 09 Feb 2025 02:47:53 +0100
Date: Sun, 9 Feb 2025 02:47:53 +0100
From: Florian Westphal <fw@strlen.de>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	"netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <20250209014753.GA1766@breakpoint.cc>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com>
 <20250126135021.GB3073@breakpoint.cc>
 <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com>
 <20250128003706.GB29891@breakpoint.cc>
 <Z5jQgcbCXiLyPwV-@calendula>
 <PVrkUQp56-Jj22U0UNcuDB2ECbRGvxlQdpV9wqJEScEZCv87qu5FdvjBKhhAzXkGv71nnXYmPI2TlxCo-dz_Mz-2Y52rrOVQLWvmPYm7cIA=@protonmail.com>
 <omRiDfO4yHw_nf-Xsk390UcpY_66yoc_oOELR6Fwu94Nr4QtjOT_1tcjVT_wOaaVW5QwqNRBvQonQbXXayhp1CFTAKEF3Qz0ToC7HenQBpk=@protonmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <omRiDfO4yHw_nf-Xsk390UcpY_66yoc_oOELR6Fwu94Nr4QtjOT_1tcjVT_wOaaVW5QwqNRBvQonQbXXayhp1CFTAKEF3Qz0ToC7HenQBpk=@protonmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Sunny73Cr <Sunny73Cr@protonmail.com> wrote:
> I noticed there may be a floating point error or another miscellaneous approximation error when calculating the mask for raw payload expressions. It is somewhat related to this thread.

There is no approximation.  And no floating point math is involved.

> using nft -d all (debug all); I found:
> 
> inet filter output 5 4
> [ payload load 2b @ inner header + 6 => reg 1 ]
> [ bitwise reg 1 = ( reg 1 & 0x0000c0ff ) ^ 0x00000000 ]
> 
> After careful consideration, I realised that here; '2b' indicates two bytes, not two bits. I suggest it should read '2 Bytes'. Additionally, the "+ 6" section should really read as "+ 6 Bytes". "2B" or "6B" may get misread as 28, or 68; if the user makes a poor choice in font. Poor choice in font is not my concern, particularly; but fault-tolerant design is always nice.
> 
> Anyhow, with the alterations to expression; I can then match it (2 bytes, offset of 6 bytes) to the 'mangled' input of @ih,48,16
> 
> > [ bitwise reg 1 = ( reg 1 & 0x0000c0ff ) ^ 0x00000000 ]
> 
> Assuming that the mask is stored in a 32-bit integer field, the length of the string is fine. Otherwise, the mask of "0x0000c0ff" equates to 49,407 bits.

0x0c0ff in decimal notation is 49407. But I do not know how "0x0000c0ff"
equates to "49407 bits".

> Since raw payload expression includes the starting position in payload expressions; it is really 49,408 bits to match.

I don't know what that is supposed to mean.

> Via empirical calculation, the closest base 2 logarithm I can find for 49,407 (bits) is approximately ~15.5924570373.
> If the mask is intended to cover 16 bits; should it not equate to 65,535 bits; or "0x0000ffff".
> 
> Though, the intent was not to read and set the same value; rather, it was to redact 6 bits of data. Considering the intent of my input statement (@ih,58,6); I think the mask should be ((2^16) - (2^6)); or 65,472 in decimal; or 0xfff9 in hexadecimal.

I have no idea what you mean.

The mask cannot be computed by ((2^16) - (2^6)).
The location (offset) matters, not just the amount of bits
to retain/zero out.

> This leaves us with an output statement of (little endian mask, as it seems is the case):
> 
> @ih,48,16 set @ih,48,16 & 0xfff9
>
> The statement:
> 
> > [ bitwise reg 1 = ( reg 1 & 0x0000c0ff ) ^ 0x00000000 ]
> 
> Should then read:
> 
> > [ bitwise reg 1 = ( reg 1 & 0x0000fff9 ) ^ 0x00000000 ]

That mask is 1111100111111111 which translates to '@ih,53,2 set ...'

Please show a real bug, i.e.:

1. the rule you made
2. a text explaining what you wanted the rule to do
3. a packet capture showing packet after mangling
4. a text explaing what yhe packet capture SHOULD have
   shown instead

else I will never be able to help.
