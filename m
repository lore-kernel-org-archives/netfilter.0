Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [203.4.137.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319E23C39A
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 00:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.4.137.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583582; cv=none; b=mkzeCcfEAT8rDjkdNqy7L4y5aCgA57Zra/l2F5GqBkVqkCrFQKjRoq0Fg/dMpRM9S+5hGVkssVHVoqamOs0tOUN9vIYnAVFkrHrfM3U6sPD4bwuWvP2x2nqbll04h9OL1jh4NbfIuiOP0q0k7j6hVF+dTFQ/WIEy8v2jcrG0hPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583582; c=relaxed/simple;
	bh=2ExAvbPrjUnEiyjSC7uTr8pCvc+v6JbvZqfvg6cpV5U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t0FDcPAHSvtnfs3Dk8hINL2H+phgb72ZyMxcaBIXz937x1FxanySay3hiowNo92/GBBoAEBzZqOvR7DYHXRwOERZfJq2zXyKfGukwWWriMwArBD/uvGgDiNhqBFgvLU6rFYZBa3ghcZzTNY2v7O94t0bIVkxLjVF79n0xX4BPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au; spf=pass smtp.mailfrom=crc.id.au; dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b=jtCvSKrc; arc=none smtp.client-ip=203.4.137.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crc.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="jtCvSKrc"
Received: from mailfilter.crc.id.au (localhost.localdomain [127.0.0.1])
	by mailfilter.crc.id.au (Proxmox) with ESMTP id DA8AD62307;
	Wed, 04 Mar 2026 11:19:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=default; bh=l4pHVzfESmbvvMKS+
	uiTWJZBgnbwErCLYe+a6Ztb+ow=; b=jtCvSKrce01h0SHxedimzsbrK6Qj68qnJ
	SLveS1uzshu3MPs9QlwG45HCQNTyFP1PpE3F7cByjWas9YJKKz6XzXMGZ6Z71cMP
	+GBFdRENu4TzoSQ1WeTG/f09SQXWtPXL4fy479VxGRSQAyHYPTHji1JQOs4rfABZ
	99csyakc9KRBUZb00xv5fX9GyFVAaYeAhg7r2mbTnmqG+rcLUMrR/mBVqYGhMF6G
	Y+SHr8afIMop+0P5UEZyRegC9chvgDOuKHgFNTSp+5KU+SFSTeNwFF6PUi703MZu
	gCuNzl1VYEodtYLU/v+vPpqWWpeoapWFXZq9/tZQWS9soF2Lr/Sm2NqaX2cszVNZ
	ktRQNANtD6dzwEfdIGLfKc9OMrBNNhZnIcZzfH6tS6XYBzTYwZaSVTS9bSvnhBVA
	So18/85vjzXmTS6DuCxeXWaxoeGARXn5Gd4ZfT/xB7XAkHCAjeg5aJi9WRVqpXM2
	PcnySxzVMnwJ+QWAvdMsfC6XnGYFM02SC8AwItADSu38fMuotBQEtixN7T7xISQF
	zCBFYoWE7hjuL+kITXEV+buG/IbS+qofgDfyW37e7iUDVTlYaI+ySNAQXoSllbAA
	jNQfsPVyfYMxYDm46a0VC1EN1riAasILtgl1h7Ol/oeeKcXmdQSiNkJpNGuT88K2
	KFIU5BGhkg=
Message-ID: <2a780701-f1e4-4ff4-b796-889f7ee19ead@crc.id.au>
Date: Wed, 4 Mar 2026 11:19:36 +1100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: aarch64 - netlink: Error: Could not process rule: No buffer space
 available
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
References: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
 <aad2hjmYS6Bcc3xz@chamomile>
Content-Language: en-US
In-Reply-To: <aad2hjmYS6Bcc3xz@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Pablo,

Thanks for the reply.

On 4/3/26 11:02, Pablo Neira Ayuso wrote:
> Hi,
> 
> On Wed, Mar 04, 2026 at 10:36:20AM +1100, Steven Haigh wrote:
>> Hi all,
>>
>> Firstly, please CC me in replies as I'm not subscribed to the list.
>>
>> I am currently loading some named sets into nftables using the following
>> configuration:
>>
>> set au-ipv4 {
>>          type ipv4_addr
>>          flags interval
>>          auto-merge
>>          elements = { $AU.ipv4 }
>> }
>>
>> set au-ipv6 {
>>          type ipv6_addr
>>          flags interval
>>          auto-merge
>>          elements = { $AU.ipv6 }
>> }
>>
>> These sets are loaded in the config via:
>> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
>> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
>>
>> The files are created using the geo-nft.sh script here:
>> https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh
>>
>> When loading these, I get the following fatal error:
>> netlink: Error: Could not process rule: No buffer space available
>>
>> This only seems to happen on the aarch64 installs. The same kernel version +
>> tools version on x86_64 architecture seems to load just fine.
>>
>> $ cat /proc/version
>> Linux version 6.18.15-200.fc43.aarch64
>> (mockbuild@835a9c7eeabc46d3b99996c22f20c9cf) (gcc (GCC) 15.2.1 20260123 (Red
>> Hat 15.2.1-7), GNU ld version 2.45.1-4.fc43) #1 SMP PREEMPT_DYNAMIC Fri Feb
>> 27 22:55:30 UTC 2026
>>
>> $ nft --version
>> nftables v1.1.3 (Commodore Bullmoose #4)
> 
> Can you try latest nftables version to confirm this bug on aarch64 is
> current? Otherwise, try nftables git HEAD snapshot?

I grabbed some scratch builds from Fedora 44 which updated:
	* libnftnl 1.2.9 -> 1.3.1
	* nftables 1.1.3 -> 1.1.6

When processing the files though, a new error occurs:

In file included from ./firewall.nft:7:1-61:
/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4:1646:2-24: Error: 
Could not process rule: File exists
         103.4.84.0-103.4.87.255,
         ^^^^^^^^^^^^^^^^^^^^^^^

Looking at the ranges at / around this line however, I can't see any 
kind of duplicate:

         103.4.16.0-103.4.19.255,
         103.4.55.0-103.4.55.255,
         103.4.60.0-103.4.63.255,
         103.4.84.0-103.4.87.255,
         103.4.120.0-103.4.120.255,
         103.4.122.0-103.4.123.255,
         103.4.132.0-103.4.133.255,

Checking the datafile:
$ grep 103.4.84 geo-nft/countrysets/AU.ipv4
         103.4.84.0-103.4.87.255,

 From what I understand, even if this range did overlap - the auto-merge 
flag should handle this.

>> I've had no success in hunting for why this would be the case.
>>
>> I've found that I can batch-load the sets in ~500 rules at a time, and the
>> entire set will load - but including them at the nftables service level
>> always fails.
>>
>> How should I fix this?
-- 
Steven Haigh

📧 netwiz@crc.id.au
💻 https://crc.id.au


