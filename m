Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [203.4.137.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E838235F60B
	for <netfilter@vger.kernel.org>; Tue,  3 Mar 2026 23:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.4.137.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581501; cv=none; b=rgWBY8nKOXa4aIUCwh4XRjZh7nzC8PMs0tgQZuuk52QsbTWC5M1F1OZ2vAgQW1em7SsLkuB6Nvh+RURPnNEsxEzT/8U97QmEAV59qVw09POG8J/qV3Bq0KVtkVzZcu8tXNS4LMGLKffsZHySfEo3k6ja2IFYi5CiYUg261OLtaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581501; c=relaxed/simple;
	bh=u45MtW6Ps0Zip1SO/doIpsSPr9XXJiz/634imRSuT/0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qFejCHzRmX7J6MpwZ6I1r8r6STCfxbpalBF6/JncBh/xaEZRxJC8oT9kOBr4FdMuAH9MEbadpAdlNccQWhFXCcPhn5pz12dUjvRVInroH9fI6fy1I78xlZh9Ic96K7YbljdHGTiNNAZugY5UU0AR+Z4t6QTuVqZh0/5O6YG2rSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au; spf=pass smtp.mailfrom=crc.id.au; dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b=uqJXROrF; arc=none smtp.client-ip=203.4.137.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crc.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="uqJXROrF"
Received: from mailfilter.crc.id.au (localhost.localdomain [127.0.0.1])
	by mailfilter.crc.id.au (Proxmox) with ESMTP id DD08062306
	for <netfilter@vger.kernel.org>; Wed, 04 Mar 2026 10:36:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:message-id:mime-version:reply-to:subject:subject:to:to; s=
	default; bh=TBPQEDVezuDjxT52zpqmEQ0BT1INDO6XL1KLvGvtGks=; b=uqJX
	ROrFWFEn3UM+vAJDsiQpcE4XtTiNJqsW8Y7bnOutFWbnKR51spVW4hABRBTDdwOv
	wjNBYN3JGDrkaG+X8GWFXqCJGaaVNJTMPzxOBYL3FaeFl+nI8kGrjAs5iJD8247m
	+TsLtqn83r/BBAcNs84hVBP0MuQMfd3E8KWbNvBYLugom4I5JBA5K4GheHNGobha
	HaJmugv6aJiCIrPU0xJMR2RF5lNIyj1UCD4XCOljlE4NBd65Df6Kv3dCks5GAG7T
	fYrTPc7ZAirX3r82MlUXSoQQnQy1DVN3oz2J2kviuOso/Y4lOft92xKIbSzESM0k
	1ma7DYkjx/TWCknIazE7o8D+DwHvD4XdEuU/7zUfpeQJ/RBT/5TffU20g9rh/JWR
	PS2BBAqiIHzejvimulgagk5PnERNaXRwK8s7vTEYbP0C9+JxHpN05HrNe9rj1EDc
	QUm749oPZf4fHfSy56TKKqrYEHnBEN4DmGxox9vmNE+IpnuxI/DSSDEoXe9LhkCE
	oM6YrFfm0kNahdgKGrrggre93evd/3q0KxzyEN/sYUcJHwWJzlm6itcSDQash1eU
	5nAbGfI/hp2UeQgRHBgBI4rCxF/uLaR0hKiyoB6JhgkAOTIQFtSO8eCJHecbMCtl
	whOT6oL2r9gPE7U7ZBKaEtbh8V7jFY4nuwJDSBk=
Message-ID: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
Date: Wed, 4 Mar 2026 10:36:20 +1100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US
From: Steven Haigh <netwiz@crc.id.au>
Subject: aarch64 - netlink: Error: Could not process rule: No buffer space
 available
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Firstly, please CC me in replies as I'm not subscribed to the list.

I am currently loading some named sets into nftables using the following 
configuration:

set au-ipv4 {
         type ipv4_addr
         flags interval
         auto-merge
         elements = { $AU.ipv4 }
}

set au-ipv6 {
         type ipv6_addr
         flags interval
         auto-merge
         elements = { $AU.ipv6 }
}

These sets are loaded in the config via:
include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";

The files are created using the geo-nft.sh script here:
https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh

When loading these, I get the following fatal error:
netlink: Error: Could not process rule: No buffer space available

This only seems to happen on the aarch64 installs. The same kernel 
version + tools version on x86_64 architecture seems to load just fine.

$ cat /proc/version
Linux version 6.18.15-200.fc43.aarch64 
(mockbuild@835a9c7eeabc46d3b99996c22f20c9cf) (gcc (GCC) 15.2.1 20260123 
(Red Hat 15.2.1-7), GNU ld version 2.45.1-4.fc43) #1 SMP PREEMPT_DYNAMIC 
Fri Feb 27 22:55:30 UTC 2026

$ nft --version
nftables v1.1.3 (Commodore Bullmoose #4)

I've had no success in hunting for why this would be the case.

I've found that I can batch-load the sets in ~500 rules at a time, and 
the entire set will load - but including them at the nftables service 
level always fails.

How should I fix this?

-- 
Steven Haigh

📧 netwiz@crc.id.au
💻 https://crc.id.au


