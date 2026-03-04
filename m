Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32661226863
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 00:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772584549; cv=none; b=VFnjSLJ1jwRyICfdNzf/j6ju69A80B8WlN4qKSrzZyxnpamnMOyCdTvRR9NpSagmpRZCt5FdjsTx36AQ1N4Ptl6oi4GhISlttrgYwDmu3shxZDC1iY44+nuT167N5h+Cpw80oc4iN7GUTVXliG0lkfL2HhGLKl+ryTuoBox13t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772584549; c=relaxed/simple;
	bh=SRX2xbKrAf6JBxhmdIMyQfEaDykm/JO24cx6Ap1I4cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnkNhgitl9cWEF/unOhgADDIJkiAYEbwvSZSDsESTc1PY5f5EF66c0IxHzVK8N78NBV65KR8XfAhfmMVs9Ybqnxg+X7URiyyLTF5IKKt0NtSaFIRZDp9bhcdfmfzStg4WfaYQdNqF5taLz/wfqXvywHk6W4njuRWL1Gt0LaWNWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=pL0eTlOn; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="pL0eTlOn"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 33D9E60179;
	Wed,  4 Mar 2026 01:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1772584545;
	bh=Be5zEFI69DNj0za5mlujX+qTHLHYiaxA0g+QzVItF6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pL0eTlOnOCRJUYTIg32W/KUd0c2JXRycBbk6V2xpuXYMDsN0tm7uflP0JgzuN975N
	 6/2qCwUMpgNNQt0o9s97pyDYDJ9009igi5z1Q5Gi+3G3SixWeMez0NLY0P51LbWkqH
	 QzxdnH8EeOccQff60nlwAoJOYoy2noPA3mEKEHNnsXkFSg8FQAA1g+nlIAVWOUSPe5
	 d3nUJcpBMykupg9Pc4S7lBb5jRvGFmKwwWKEXYEjxoF6pRvB/j3eA5kBu4XBA6hMyr
	 8MdccfvDyMfLgZBVPyMT11CoJmqDfEKerMkmkMB0Cw013K9y11ckolt5dM45uwzRiH
	 dQHlFuwyXrKnA==
Date: Wed, 4 Mar 2026 01:35:42 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: netfilter@vger.kernel.org
Subject: Re: aarch64 - netlink: Error: Could not process rule: No buffer
 space available
Message-ID: <aad-Xq9qYU1QQ0jB@chamomile>
References: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
 <aad2hjmYS6Bcc3xz@chamomile>
 <2a780701-f1e4-4ff4-b796-889f7ee19ead@crc.id.au>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a780701-f1e4-4ff4-b796-889f7ee19ead@crc.id.au>

On Wed, Mar 04, 2026 at 11:19:36AM +1100, Steven Haigh wrote:
> Hi Pablo,
> 
> Thanks for the reply.
> 
> On 4/3/26 11:02, Pablo Neira Ayuso wrote:
> > Hi,
> > 
> > On Wed, Mar 04, 2026 at 10:36:20AM +1100, Steven Haigh wrote:
> > > Hi all,
> > > 
> > > Firstly, please CC me in replies as I'm not subscribed to the list.
> > > 
> > > I am currently loading some named sets into nftables using the following
> > > configuration:
> > > 
> > > set au-ipv4 {
> > >          type ipv4_addr
> > >          flags interval
> > >          auto-merge
> > >          elements = { $AU.ipv4 }
> > > }
> > > 
> > > set au-ipv6 {
> > >          type ipv6_addr
> > >          flags interval
> > >          auto-merge
> > >          elements = { $AU.ipv6 }
> > > }
> > > 
> > > These sets are loaded in the config via:
> > > include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
> > > include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
> > > 
> > > The files are created using the geo-nft.sh script here:
> > > https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh
> > > 
> > > When loading these, I get the following fatal error:
> > > netlink: Error: Could not process rule: No buffer space available
> > > 
> > > This only seems to happen on the aarch64 installs. The same kernel version +
> > > tools version on x86_64 architecture seems to load just fine.
> > > 
> > > $ cat /proc/version
> > > Linux version 6.18.15-200.fc43.aarch64
> > > (mockbuild@835a9c7eeabc46d3b99996c22f20c9cf) (gcc (GCC) 15.2.1 20260123 (Red
> > > Hat 15.2.1-7), GNU ld version 2.45.1-4.fc43) #1 SMP PREEMPT_DYNAMIC Fri Feb
> > > 27 22:55:30 UTC 2026
> > > 
> > > $ nft --version
> > > nftables v1.1.3 (Commodore Bullmoose #4)
> > 
> > Can you try latest nftables version to confirm this bug on aarch64 is
> > current? Otherwise, try nftables git HEAD snapshot?
> 
> I grabbed some scratch builds from Fedora 44 which updated:
> 	* libnftnl 1.2.9 -> 1.3.1
> 	* nftables 1.1.3 -> 1.1.6
> 
> When processing the files though, a new error occurs:
> 
> In file included from ./firewall.nft:7:1-61:
> /etc/nftables/firewall/geo-nft/countrysets/AU.ipv4:1646:2-24: Error: Could
> not process rule: File exists
>         103.4.84.0-103.4.87.255,
>         ^^^^^^^^^^^^^^^^^^^^^^^
> 
> Looking at the ranges at / around this line however, I can't see any kind of
> duplicate:
> 
>         103.4.16.0-103.4.19.255,
>         103.4.55.0-103.4.55.255,
>         103.4.60.0-103.4.63.255,
>         103.4.84.0-103.4.87.255,
>         103.4.120.0-103.4.120.255,
>         103.4.122.0-103.4.123.255,
>         103.4.132.0-103.4.133.255,
> 
> Checking the datafile:
> $ grep 103.4.84 geo-nft/countrysets/AU.ipv4
>         103.4.84.0-103.4.87.255,
> 
> From what I understand, even if this range did overlap - the auto-merge flag
> should handle this.

Are you using the 'create element' command?

This is fixed in git HEAD, this is a bug in 1.1.6.

commit e83e32c8d1cd228d751fb92b756306c6eb6c0759
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Mon Jan 12 12:59:26 2026 +0100
 
    mnl: restore create element command with large batches
    
    The rework to reduce memory consumption has introduced a bug that result
    in spurious EEXIST with large batches.
