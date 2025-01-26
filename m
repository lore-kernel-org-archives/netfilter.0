Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA482890
	for <netfilter@vger.kernel.org>; Sun, 26 Jan 2025 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737899426; cv=none; b=Vtrn5eFR0Yx9VJAA68U9TLhaYuh6x+qO01FAqi+32RdxRKpjyfKLrEnFJuGhiZ6JL13m0vuouOAnkck1rjTSHpB9lCIMAN0YpaDjeTNtFqTQTUR7CEdvsrvTuY+WTFIHt7umHrq8zyE12HI0qBbRnR/clqWxRay2u3xRDgTVgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737899426; c=relaxed/simple;
	bh=Mc8Uc1rZsjV4QdwfU27V87vg+EqHIEvOQ3mmF8GkA7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgrr1x5As4T8+zCf1L0eYDnYYJ0hhR7VChiboRJuLV8ab4s3xo47swi5nR+4S03RdJ8e+SgxxSiLuBaNjEyyu38/V9mdugp4+dAY8wIRvth+xqX5UM7FK3nIAMYNYyPxh/TFQDTrKcsHK0yVPWuucTl5sE37/WBGCoJxlgFueu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tc31p-0001Jz-OZ; Sun, 26 Jan 2025 14:50:21 +0100
Date: Sun, 26 Jan 2025 14:50:21 +0100
From: Florian Westphal <fw@strlen.de>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <20250126135021.GB3073@breakpoint.cc>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Sunny73Cr <Sunny73Cr@protonmail.com> wrote:
>   @ih,58,6 set 0 \
>   @ih,86,6 set 0 \
>   @ih,170,22 set 0 \

> 3. Output ruleset (/usr/sbin/nft list rulset):
> 
> chain output {
>  type filter hook output priority filter; policy accept;
>  @ih,48,16 set @ih,48,16 & 0x3f \
>  @ih,80,16 set @ih,80,16 & 0x3f0 \
>  @ih,160,32 set @ih,160,32 @0x3fffff \
>  accept;
> }
> 
> The mask appears correct for the first re-write, but subsequent re-writes appear to be too large.

What do you mean?
Please elaborate as what is wrong here in listing 3.

The nft interpreter cannot load individual bits,
the length/size has to be byte aligned.

6 bits from offset 86 straddles two bytes (bits 86-7,88-91).

22 from offset 170 touch 4 bytes: bits 168-169, 170-177, 178-185,
186-195.
