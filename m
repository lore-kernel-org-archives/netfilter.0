Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E111E9B2A
	for <netfilter@vger.kernel.org>; Mon, 25 Aug 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756120279; cv=none; b=qK3WUEANYuCXOO6jmmuYczuThgOpaHWjZfhYMsUqI5gIGngPxIOWY/cUj1Ko5mWH8ZHdbmYLKqXsBERL1WzuKS0Vo+xWR2fnnjP9INbB9dOil4fsT3BTooBLGzPe8ITWFmwvgz1sSSl+NSO9DCH6gAKhQXtGmhuWMzviOWcND3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756120279; c=relaxed/simple;
	bh=uO4+7sUX2sLdGC0yajlr5tFny5fC2pzy+XFD4L4s/cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1WwSNYsi65+lmHBteyIyBamYjvoigyb9PKjQcmo8xRphUbMCBUakVVDDrVqR4AeK5orAA7fKmybsyCetboxAR72to6+sFI3e3UtggGZ2YAKmSMdI0YeNHn4PyPeq3e3bLVEBLXNe+QohT+L4K3QH6FAJTr1XT8x7so9v6LseuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=jqTaCJ7N; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=jqTaCJ7N; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="jqTaCJ7N";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="jqTaCJ7N"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id BE2426026D; Mon, 25 Aug 2025 13:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1756120274;
	bh=wc3k2R6lLFuvxt/f7Tx+TxEGe7dUzV6zInMEu/wOpEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqTaCJ7NXQ37DYJftKqDZHrcJZcaQ6IIrQpb/InW4t65uMWWLy+US4jRYrRfpMHXH
	 mQOAGuFoeIytvdQdrWFt9k74bDEbawVC2VYLTwXVo3NOWqAaQ8qg309OAkispDMCiE
	 EhKdt4QzWa0m3MB165n9XfropniquroBFfHbzUnb0/nBmss6GuQVeZhhUbWEF6vPS4
	 8H66CFWHDEHAdF0NbnCyT9qV2lGvNR9GzTmYDItQNftm6cOh3ryjK49e22w4LP9ZTI
	 cB6DtBkvMQkF5koXGHXOiKr2LTLt/I63lNGWRiMoeUD6FRXsQEOcy/339Q1P52587I
	 fu8eMM93ldw/A==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 1E7C46026D;
	Mon, 25 Aug 2025 13:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1756120274;
	bh=wc3k2R6lLFuvxt/f7Tx+TxEGe7dUzV6zInMEu/wOpEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqTaCJ7NXQ37DYJftKqDZHrcJZcaQ6IIrQpb/InW4t65uMWWLy+US4jRYrRfpMHXH
	 mQOAGuFoeIytvdQdrWFt9k74bDEbawVC2VYLTwXVo3NOWqAaQ8qg309OAkispDMCiE
	 EhKdt4QzWa0m3MB165n9XfropniquroBFfHbzUnb0/nBmss6GuQVeZhhUbWEF6vPS4
	 8H66CFWHDEHAdF0NbnCyT9qV2lGvNR9GzTmYDItQNftm6cOh3ryjK49e22w4LP9ZTI
	 cB6DtBkvMQkF5koXGHXOiKr2LTLt/I63lNGWRiMoeUD6FRXsQEOcy/339Q1P52587I
	 fu8eMM93ldw/A==
Date: Mon, 25 Aug 2025 13:11:11 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: lilydjwg <lilydjwg@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nft error Could not process rule: No buffer space available
Message-ID: <aKxEz_q5TEQT-oRV@calendula>
References: <aKrK6h2zYdqj2unR@lilyboudoir.localdomain>
 <aKw4DikLFS8MVGVY@calendula>
 <aKw_GLWO53mX2ELx@lilyforest.localdomain>
 <aKw_XTxe24gOAreu@calendula>
 <aKxBrp9tMSbM6Pw0@lilyboudoir.localdomain>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKxBrp9tMSbM6Pw0@lilyboudoir.localdomain>

On Mon, Aug 25, 2025 at 06:57:50PM +0800, lilydjwg wrote:
> On Mon, Aug 25, 2025 at 12:47:57PM +0200, Pablo Neira Ayuso wrote:
> > On Mon, Aug 25, 2025 at 06:46:48PM +0800, lilydjwg wrote:
> > > On Mon, Aug 25, 2025 at 12:16:46PM +0200, Pablo Neira Ayuso wrote:
> > > > Hi,
> > > > 
> > > > On Sun, Aug 24, 2025 at 04:18:50PM +0800, lilydjwg wrote:
> > > >> I'm switching from iptables+ipset to nftables, and as part of it, I need to
> > > >> import a set containing ~2400 IPv6 networks. The file looks like this:
> > > > 
> > > > What nftables version are you using?
> > > 
> > > Sorry I forgot to mention that I'm using nftables 1:1.1.4-1 on Arch Linux
> > > and the linux kernel version is 6.15.8.
> > 
> > Provide your example listing to reproduce this issue.
> 
> OK, I'm pasting the whole file that could reproduce the issue below.
> The ruleset is empty when executing the "nft -f" command.
> 
> define domestic_ip6 = {
>   2001:250::/31,
[...]
> table ip6 gravity {
>   set domestic_ip6 {
>     type ipv6_addr
>     flags dynamic,interval

Error reporting is misleading, combination of dynamic and interval is
not supported.

Looking at the example below, you do not need dynamic, remove it.

ENOBUFS is reported because each element hits an error and

I am going to take a look to improve error reporting for this case.

>     elements = $domestic_ip6
>   }
>   chain output {
>     type route hook output priority -150;
>     tcp flags & (syn | ack) == syn ip6 daddr @domestic_ip6 counter reject with icmpv6 reject-route
>   }
> }
