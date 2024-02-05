Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E56713AC7
	for <netfilter@vger.kernel.org>; Mon,  5 Feb 2024 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707126470; cv=none; b=jM0E/ZYpNTK+Xm7qoMPIWg+np1PSIV8Hf8saBOac8wFUyerBqoFp0GQXupmlxf89wFFa9Zbq+y0XkUjz96DTCRLWduMbTu8T6W1hG2/FfEqlrlGLrpQQ7WgtB4AoOXROqmOHT8IvtxpxY5dhJmE4HQxdyNs8l7VgINxTD9YHSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707126470; c=relaxed/simple;
	bh=WP9iY8QW5zSezpYXyFfY8FA+slbu1X8lTF2q3pZXdmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwKe1sJtL8dWf3hx8GXNm6/A2zSNFe/w+qgsWyAh9YX24n52YRXfNfNL3gH0dkSwCNGLn+l/fyJXq4Jsdwu4z/AiJaRDQ8lQDUBFbYw55208rYB1UPiQKVOQkzN6+zXLBEmfp1MM/LgPJhgggOUBodOWFxf85a3XAZOiwNnnlWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.41.52] (port=52202 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1rWvZe-005ry6-Np; Mon, 05 Feb 2024 10:47:36 +0100
Date: Mon, 5 Feb 2024 10:47:33 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZcCutfqrH/SHlaRw@calendula>
References: <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
 <ZbrLg8luc8tbZALr@calendula>
 <exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me>
 <Zby0eB9G4Qi2DJbT@calendula>
 <2_5uNX_sumsVU038csU_coYap0tNQR6gTiA1GDY4Onp16EhEPGkvRE80rAwirPIiGCn9eVKjFNzc8D_zQG98pDys1uxfCIeYh6k3KG6jGXU=@proton.me>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2_5uNX_sumsVU038csU_coYap0tNQR6gTiA1GDY4Onp16EhEPGkvRE80rAwirPIiGCn9eVKjFNzc8D_zQG98pDys1uxfCIeYh6k3KG6jGXU=@proton.me>
X-Spam-Score: -1.9 (-)

On Sat, Feb 03, 2024 at 03:49:54PM +0000, Eric wrote:
> On Friday, February 2nd, 2024 at 01:23, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > Works fine with -stable 5.15 and 6.1 here.
> > 
> > Does your kernel turn on this?
> > 
> > CONFIG_NETFILTER_NETLINK_HOOK=m
> 
> Like Slavko, my test devices (both OpenWrt builds) have
> 
> # CONFIG_NETFILTER_NETLINK_HOOK is not set
> 
> I'll have to check and see how much it grows the kernel when enabled, as this
> seems like it would be useful to have on by default.

It should not take much, it is a simple netlink interface that
iterates over a few existing datastructures.

> Re the seg fault, I'm still trying to find a minimal reproducer, but it looks
> like just about anything fires it off with k5.15 (I see it on x86, MIPS and
> aarch64 devices).

Strange that userspace crashes depending on the kernel version.

What is your userspace nft version there?

Thanks.
