Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED9D16B744
	for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378813; cv=none; b=D+sF6RUqscE6YzQgl3N7RahmGecIqXB5veAlRoksyd538iIDwNzr6+MQ9uEBBv3U4hc7zNTIfeF7ESOMkwBEhk7UC6w4PQ8u92e8r9un6bdxrO0UfEJC5CZIrVjdnlGBTaihdUrVi47yWlFa0xpGyuOv0xrSvGZmS7GlIlHVha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378813; c=relaxed/simple;
	bh=fgPK8x1SGCU0y4Xr2IZdCS9FMZYbn3z1L+34OT3TSQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKSCZC7GwxFbmWBdhbvdyRGVxcEoPNc0F+6fhioNwrhB/y7RCt6p4dDwokDY5/sPQhSRkMbJCngrkvpVyQTZnbKhbqB6zsDb4xbysaeUXCQhsORxEaNLhh9yHfmjYS0a6UuspZrw/0G5Jug4l3H/qFl7f497pEKrvpCuJjVncys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=58330 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sI8pC-007HQd-IX; Fri, 14 Jun 2024 17:26:48 +0200
Date: Fri, 14 Jun 2024 17:26:45 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Pawel Kraszewski <pawel@kraszewscy.net>
Cc: netfilter@vger.kernel.org
Subject: Re: Writing own match module for modern ebtables.
Message-ID: <ZmxhNfpflittbRVc@calendula>
References: <CALnT2Lj0eo5FTgAiJB-napcNuZt4fhXAeMF35=4k408hpuBC6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALnT2Lj0eo5FTgAiJB-napcNuZt4fhXAeMF35=4k408hpuBC6A@mail.gmail.com>
X-Spam-Score: -1.8 (-)

On Fri, Jun 14, 2024 at 09:01:22AM +0200, Pawel Kraszewski wrote:
> Hello!
> 
> I'm trying to write a simple match module for ebtables. Nothing fancy,
> just check ethertype and first 2 bytes of payload. I need to make
> ebtables' dnat, based on a custom in-packet tag:
> 
> > ebtables -t nat -A PREROUTING -i eth0 --MYMATCH-tag 10 -j dnat --to-destination SO:ME:MA:CA:DD:RS
> 
> Kernel module ebt_MYMATCH.ko is almost ready (it just accepts
> everything now, just a PoC for now), based mostly on ebt_vlan.
> 
> What I am absolutely stuck on is xtables/libebt_MYMATCH.so library. I
> mean, it is written, compiled properly, and objdump reports the same
> structure as existing ones (say, libebt_vlan.so). The only slight
> problem is that ebtables doesn't detect or recognize it.
> 
> When running the above ebtables example under strace, it does iterate
> over "standard" libebt_* libraries (with newfstatat() and openat() )
> but doesn't even try to touch mine with a long stick. It doesn't even
> check if it is there.
> 
> When I do a match with existing libebt_* (say vlan), it still does
> iterate over all standard libraries (for iteration's sake) and then
> (apparently, there's no dload() or sth) just ignores libebt_vlan.so
> and pulls NFT gun.
> 
> That's Arch system:
> * ebtables 1.8.10 (nf_tables)
> * iptables v1.8.10 (tried both legacy and nf_tables, no change in behaviour)
> * kernel 6.9.3-hardened1-1-hardened
> 
> I even tried with manually compiled ebtables v2.0.11 (legacy), which
> is, um, dated 2011.
> 
> What are my options now? Any guides on writing both nft kernel modules
> and matching userspace libraries?
> Or just forget all that and use raw @base,offset,length matches?

That is an option, if you provide more info what --MYMATCH-tag 10 does.
