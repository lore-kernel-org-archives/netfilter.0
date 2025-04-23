Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7DFFC08
	for <netfilter@vger.kernel.org>; Wed, 23 Apr 2025 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409087; cv=none; b=b+5K/hVqbQjXLRHAyJSJxBqeYOEpaBH0pSZZS/Mfd8hWBEaS06Ir/EVgtsFp0KmXnL/P6/rOWfTS/l78DF+L6qxvcsj3OKeUsBJh0Hsb0yxi0uQ82ih05mcOJSSVXbdRXV5O3VMiaN2cwIvkTG0zCip3oFCaRmBYSYcc/1Jm2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409087; c=relaxed/simple;
	bh=g9SNA/A/tqBwlfkIeZeejeU3Dj3kPCoHnzIc+bevGHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+RhYutCpkbMBSjhra/aVgKN2g6Sr28u3lBch7VSgzN4lgamxOSzQWOBPX2JegC953D9F0IM9Mo3nVZCOAl+eOU89K+NT6Dz1ce9UyGEZXcU3B7+MoFRsqvmyYNO9i4A6fc2o0ObQ8KByrCFLZ+fdt/8llcmsfzL8+gyinsUYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=Gge/Dx2B; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=pa9AHrxY; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="Gge/Dx2B";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="pa9AHrxY"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 1169760955; Wed, 23 Apr 2025 13:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1745409080;
	bh=j3aPUfcBFKb3afOYwcqm+X0znNx7QdgHLkm5D70MiXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gge/Dx2Bu+TAqAqUwYAqop8Nlngu86Os22/4AFl+aipHENxLMczUy/pmYCkL1+3AP
	 lXYX1TDTKwNIpWKGHBrwZbffTmkHcrGKxof/5+Fl/BdOemSQB6U2M99xGkJHtjdEnz
	 Klnsd8UYyKS1bCrfJyV+t6OM+/zIJGMQCSn9F7oW/VvoqEvhSzN7unEmoVoPNFJhup
	 +MNFrFGFoBUCgZ4wNzUWomsJV5GmVSqtRX9O8WT2dXgiJVw9BZtgY7XtgHZbGfOBf5
	 m7c6ke3kf6dmbEOgPN9IsjTbFJKOSp8Ii6M/C/fBxq5CyiLiMsirImEmDs0hJKLhpH
	 5iCoKPSWWM8QQ==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 258516092E;
	Wed, 23 Apr 2025 13:51:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1745409079;
	bh=j3aPUfcBFKb3afOYwcqm+X0znNx7QdgHLkm5D70MiXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa9AHrxYq5T+AxNnbds/FFZGpoZHnCf7Q9eD0RQNYTp6pFH4Pc+PobuCQIhX9WUOB
	 K6tzH5kkaICTO/z430H72/11et3w4KZ+4FoVze/Nzk6ufwOwtHUI1nBAEqot8ybrRA
	 s6q7Waf40oW2oxn53K5nTDxVKLbLFdUkhYhdt/BwdFDCzQUxkRG0Vh00KduGourvvO
	 a8lCWdDTfXlUprpOQ+JHKmHWGvdRpLQ/DFHhxNQRlLm9kga0ZDgeN9Selveii4/fxF
	 GMAI8RPh4p1HPDnyfqITZc990YiMQ/gHej28OxsqD0fTZZ12CzH/lng4dIfef2ip0U
	 Aq9xd+lhK4A1w==
Date: Wed, 23 Apr 2025 13:51:16 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Slavko <linux@slavino.sk>, netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <aAjUNAdHpiIi1Pw9@calendula>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
 <20250422114352.GA2092@breakpoint.cc>
 <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
 <20250422125351.GC2092@breakpoint.cc>
 <aAeknJtZBVycJKCm@calendula>
 <20250423091020.GA4038@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423091020.GA4038@breakpoint.cc>

On Wed, Apr 23, 2025 at 11:10:20AM +0200, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > Florian, is it worth to request to include this update to -stable
> > kernels? Or you prefer the manpage note as it has been suggested?
> 
> I'll send a patch to update the nft_fib selftest to cover this,
> then make a backport of the change that doesn't include the the
> socket optimzation.
>
> When I changed it I did not realize that this fixes a bug; I would
> have split the change in two if I had.

Yes, I didn't notice either. Anyway, unless you can forecast any
issue, I'd suggest to backport the entire patch? IIRC patch is
relatively small and keeping it in sync with main could possibly help
with cherrypicking fixes.

But your way is also fine with me.

Thanks.
