Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A051917F0
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582547; cv=none; b=L2dVzW+xfdxPwjFo+oAtmAvhorGwSAtbAiKRSEKD4D2zHdX8crTHY+3jdYUEi8BHFin9ItcFlEmEe3XQonmiKwn6XlMGBVLYvxt3wGBwKQRHCLN0Cg/w9IJgoAJGgWQbOTPIvO6w2FIDTpnahnIeeRRvDHAdlS5Ta3s1cpuo9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582547; c=relaxed/simple;
	bh=JF36gmgQVGQGZlkzgOwrTbiPZIgiFk5lly9cwuEMLAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRp+GBVArHjslT11GdzqevL5jJf70scLF3n4SInde2ZUrjBZOGXt9RgjtfHZ+IfA685fGGNvyk4EqWnLWBLyCFi41ljoMNR2Zihzb3TY+m4fN8+KXB9KPRMYy4CWKRXmSgpv9tGA5DRN/rTdIYiaLeAF9fGRbVJceOPo4hyxf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=QEHRSAU4; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="QEHRSAU4"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 174D760251;
	Wed,  4 Mar 2026 01:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1772582537;
	bh=jW09nfTS/o4ezIf/k20wJRiuXR/+K0P3Obv/4K1vIKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QEHRSAU4DbT29/pRWZ7UdS39OHU3DlIWtVWh3NnH6h1ZzNw62spa5rk94v8xu344v
	 LL8HJVU8Hw+cXoq2RlpviTHqpEMxsWjH0TWB1QFVUJ1pT7nuVzprZby+aHJMDE6ReL
	 KHvmfl3IOIB+B7JyiTTtsEkvDlcSpDeKDKukmLyO0pX+vQ+/xtfVyn2sxhTEEfhUC3
	 4OkJUUTWe46NP/d4LIxPUHjfRJx6NL2KYF4I/d0p46XD24x+NIvCy74R3snirYI/sH
	 ukjIdEOhJZNrAoGUUL+jv9kqO+jBAu5amh1EV5EOu1xB4LcDZBuoiXXcQZQRdxxbEX
	 r9fK2aexiaHLw==
Date: Wed, 4 Mar 2026 01:02:14 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: netfilter@vger.kernel.org
Subject: Re: aarch64 - netlink: Error: Could not process rule: No buffer
 space available
Message-ID: <aad2hjmYS6Bcc3xz@chamomile>
References: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>

Hi,

On Wed, Mar 04, 2026 at 10:36:20AM +1100, Steven Haigh wrote:
> Hi all,
> 
> Firstly, please CC me in replies as I'm not subscribed to the list.
> 
> I am currently loading some named sets into nftables using the following
> configuration:
> 
> set au-ipv4 {
>         type ipv4_addr
>         flags interval
>         auto-merge
>         elements = { $AU.ipv4 }
> }
> 
> set au-ipv6 {
>         type ipv6_addr
>         flags interval
>         auto-merge
>         elements = { $AU.ipv6 }
> }
> 
> These sets are loaded in the config via:
> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
> 
> The files are created using the geo-nft.sh script here:
> https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh
> 
> When loading these, I get the following fatal error:
> netlink: Error: Could not process rule: No buffer space available
>
> This only seems to happen on the aarch64 installs. The same kernel version +
> tools version on x86_64 architecture seems to load just fine.
> 
> $ cat /proc/version
> Linux version 6.18.15-200.fc43.aarch64
> (mockbuild@835a9c7eeabc46d3b99996c22f20c9cf) (gcc (GCC) 15.2.1 20260123 (Red
> Hat 15.2.1-7), GNU ld version 2.45.1-4.fc43) #1 SMP PREEMPT_DYNAMIC Fri Feb
> 27 22:55:30 UTC 2026
> 
> $ nft --version
> nftables v1.1.3 (Commodore Bullmoose #4)

Can you try latest nftables version to confirm this bug on aarch64 is
current? Otherwise, try nftables git HEAD snapshot?

> I've had no success in hunting for why this would be the case.
> 
> I've found that I can batch-load the sets in ~500 rules at a time, and the
> entire set will load - but including them at the nftables service level
> always fails.
> 
> How should I fix this?
> 
> -- 
> Steven Haigh
> 
> 📧 netwiz@crc.id.au
> 💻 https://crc.id.au
> 
> 
> 
