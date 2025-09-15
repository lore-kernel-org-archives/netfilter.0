Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064B36D
	for <netfilter@vger.kernel.org>; Mon, 15 Sep 2025 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757927483; cv=none; b=g++/vaAUT9iCn6yWjwZeR9ji0FV9oQAG6lnUB9aUaAQnfAbU76eKNo9HIr68Ea5x7+p0sA4EH7i824rT7VicV9yed4/Jz2Sk/pI5f3FSQlmcgE7/4ezneSIpJARV2Hr4XAsIJtAXBQU4LbVyPl3fkwxK1jZMALe6OaUSNmt7Pds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757927483; c=relaxed/simple;
	bh=HprcY8gKXh5hyb7ACICnWbEEGQoz7YECIJTH00cmqyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUxNi2Y2nKHpKqk85SMHy57nO5JjfkTK9fgajAyDDJyciiZigc55YVcm+gzUroq/yVBWlRo95AOsNVnH5h01w7u2rLClF/iahKlIPPGAqT4KsAMWflXpqFxKDNiCCPtNchQ8lz1rVbOX3xcMmbKQM5UHZszfdBPNe4bf2H22oiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=h0WIr9yg; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=UdN5DSic; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="h0WIr9yg";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="UdN5DSic"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 9756A60264; Mon, 15 Sep 2025 11:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1757927468;
	bh=C4Yx8ODTAZHUO0ggCmA4gCNJxRljtw9B5liVmDnpwEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0WIr9ygp09Aqx+63Hj+1YHwZhsyCbpkpfiJssLY4TOHNUW/AXZ2HMbatL1f1Bkzp
	 KljGqpyrnvMi2YCDvEnmiFyEj1pq7a1fyfsnhHFq8EEIJ6fe4zl08fGO0U+Mt84XEO
	 DOdlXxtvNS3wYAa6uUqNETsuGtjOn4KytNOWbR4L7P+gJqKvQQKk+4817x3bUj6dCJ
	 je8DlfUhMsfK6ZbXjqvrwMHGUwtckxpBMcMwkB9skloRiKmk4KQRycxYdINHb6udRQ
	 RugJMu/o+PFslB4wbw8YXYXYqNf9yWjf5jbzI3q0SlUs/ppUFoe8dkrngBvuVhgln7
	 GFpILDsEiGSCg==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 93C1A60254;
	Mon, 15 Sep 2025 11:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1757927467;
	bh=C4Yx8ODTAZHUO0ggCmA4gCNJxRljtw9B5liVmDnpwEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdN5DSicwebIYgOWTfyuwuq6wUOLgr9+mnSJP46Q9X7MCitL6YMXISnmrjpYST6nP
	 8xg5mVb8L0r9Xjlu0U4Z7uBtvGawxzIwf8Xu59HqGY3fjrZ+iDYIOvzcj/W+ufYnt8
	 t1fa1+peajzOF+ktUnBhYjzzLm+XNjjOYQE2Nl5tq4+0U7zJeSqzj9CrEHdT2l/FdI
	 JZdQxx8dkg2p2/AjMvSWLBmigCZRpYbSIffBcbqIgifQoziZdj0cgUp5og/keMHpQu
	 hyhbxlgcqeCoA77jj8M4VJJiu2m3vpUD5SL5s/fb2ec8CyQ3haaNcCnjRjMzNK7Jwk
	 6qnjxYJj558CA==
Date: Mon, 15 Sep 2025 11:11:05 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Juan Carlos Lazcano <juan@placidnetworks.com>,
	"netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Stateless NAT in nftables with maps for performance
Message-ID: <aMfYKTfEF7RsRvm8@calendula>
References: <1643443761.529082.1757676483522@email.ionos.com>
 <aMQMg33uIM63vKAC@strlen.de>
 <aMQQ0vB83DCfeboy@strlen.de>
 <1714012059.534025.1757681233048@email.ionos.com>
 <aMQiIC9016sR9Djw@strlen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aMQiIC9016sR9Djw@strlen.de>

On Fri, Sep 12, 2025 at 03:37:36PM +0200, Florian Westphal wrote:
> Juan Carlos Lazcano <juan@placidnetworks.com> wrote:
> > My echo/reply base icmp functionality for v4 is working atleast at a cursory glance, without further testing I'm not sure what other parts of icmp are not working with this approach.
> 
> Internal addresses leak via icmp dst unreach, redirects etc. which contain copies of
> the (rewritten or original) addresses.
> That in turn breaks path mtu discovery for instance:
> 
> Server may see internal address reflected in embedded header.
> Client can receive error for source address it doesn't have.
> 
> NAT engine also rewrites embedded headers, see e.g. nf_nat_ipv4_fn()
> in net/netfilter/nf_nat_proto.c and nf_nat_icmp_reply_translation() to
> avoid this.

I think this can be fixed by extending userspace to mangle the icmp
payload, I would like to reach this at some point.
