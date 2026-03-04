Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4327320468E
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 01:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772587026; cv=none; b=P8at5B6fLYyeFyAtnmW3dDjPLTqpwQE3xW1SeoyWfP+V2atWyqRDFCJS1PdNYFBXqp9W4gfNe6X5wqd8GzzKt3rfiMZYdBGjeUKYUVXoO6Oky5ldVQTSymklGSc6GXd7Hawew3aKKaBqUxfhCuU/5qXNiTn2IVoHxdLsuwbQN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772587026; c=relaxed/simple;
	bh=CMEsakFUVGwiIMilTT7ilv875dwRf/+pnVZifyePVgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lr+1gE5rb+74xTqdbGFZm8Tqj5PQfjocM45r7GWZqaVe/mXpDP2kkl11E7po+bRKN5KyWasQ3K8vk6iU/ztrx8+O9KSLCrSzuJag3oencRSLPICQV/iULmJYePyYsUrxAp/hIeYfESKTgfPQvPdmsEvAf+aoGDdzs/WJjzeCfWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=mVtsLTnE; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="mVtsLTnE"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 375BC60179;
	Wed,  4 Mar 2026 02:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1772587023;
	bh=Njqrt89+5ag34oNdfWGl4MPreKaTLIRs4XcqLUC8nnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVtsLTnE7+zCsZJdyDvdPemwhX8Y9oTXiLE7WcYcH6EDigoXm1RJWTccnaKTecAei
	 keBxknVxduzybJCoA4lmXVUczJcqmBBiMtzDCM67c0YGwHZlOg5D6Sj7g0vEDZ5XSi
	 U6hP3MzmQ+Bm4oa8LnfZYO6zmkV6WkhFyqaMaLIqurMFDYyFpxyi+MQDzlL9BypnpX
	 oUb6O/H/NoTqvvbG3X2sqQ9Unh4BSV9YMqJv27/tieKBNl20Gna0hz5JpsdwsDmuDu
	 qvZwtZtInPklYFmlU/1iyGwa+HCC1SQeu3xPlnGFqxY6+6ZddhdikEECLMCAKkgUrO
	 fwWecGpITBaZA==
Date: Wed, 4 Mar 2026 02:17:00 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: netfilter@vger.kernel.org
Subject: Re: aarch64 - netlink: Error: Could not process rule: No buffer
 space available
Message-ID: <aaeIDJigEVkDfrRg@chamomile>
References: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
 <aad2hjmYS6Bcc3xz@chamomile>
 <aad5_mnW4D4JR8ZQ@chamomile>
 <a282917a-107d-4f70-82e5-df9564d5172d@crc.id.au>
 <aad__3J15t9kzkYd@chamomile>
 <5e92cfab-a593-4679-8df2-abb8b9e32bad@crc.id.au>
 <aaeCd1rZsttYRVBf@chamomile>
 <6a13633f-3d2b-47c4-b9fa-a556e88c2188@crc.id.au>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a13633f-3d2b-47c4-b9fa-a556e88c2188@crc.id.au>

On Wed, Mar 04, 2026 at 12:05:30PM +1100, Steven Haigh wrote:
> On 4/3/26 11:53, Pablo Neira Ayuso wrote:
> --snip--
> > > Apologies - its behind the firewall that I'm debugging :)
> > > 
> > > Mirrored here: https://pastebin.com/iTa9XRCb
> > 
> > This is insane:
> > while IFS= read -r line; do
> >   ...
> >   echo "add element $TABLE_FAMILY $TABLE_NAME $set_name { $batch }" | nft -f -
> > 
> > this is one transaction per command.
> > 
> > This is as bad as a shell script with explicit iptables invocations,
> > one per line. This is an antipattern.
> 
> Yep - it isn't optimal - however it loads up to 512 lines per invocation of
> nft. It isn't meant to be a production or solution - just proof that the set
> is actually good and can be loaded successfully - even if the set is loaded
> at up to 512 elements at a time.
> 
> At this moment, I've had no success loading the entire set via the normal
> methods - being uncommenting these two lines:
> 
> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
> 
> table inet filter {
> 	set au-ipv4 {
> 	        type ipv4_addr
> 	        flags interval
> 	        auto-merge
> 	        #elements = { $AU.ipv4 }
> 	}
> 
> 	set au-ipv6 {
> 	        type ipv6_addr
> 	        flags interval
> 	        auto-merge
> 	        #elements = { $AU.ipv6 }
> 	}
> }
> 
> At best, its a workaround for now. I can work with it until nft 1.1.7 if you
> believe this should work correctly in that version?

It should work fine with nftables 1.1.7, yes.

> I don't have an aarch64 cross-compile setup on this system (its an embedded
> 8 core ARM board based on the rk3588 SOC) - so I can probably monitor
> Fedora's Bodhi instance here until 1.1.7 is released and built:
> 	https://bodhi.fedoraproject.org/updates/?search=nftables

Florian just told me that:

commit 648946966a08e4cb1a71619e3d1b12bd7642de7b
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Fri Feb 6 13:33:46 2026 +0100
 
    netfilter: nft_set_rbtree: validate open interval overlap

went into -stable 6.18, which I overlook.

Reverting this kernel patch in -stable should also address this issue.
