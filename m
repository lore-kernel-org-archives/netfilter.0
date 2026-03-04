Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [203.4.137.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E5133688A
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 00:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.4.137.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772584485; cv=none; b=AVduvL+s5rh4XFnrQ2uSVYX91OumCDV4xkcjNRsuuqGhLkieuNScglm6nP/zt4ICHAce4z452t8y6lbHb6jTCNSv6gB5JqdvtCEvYK833JlojE1olCDdugxlso6na6KSBBI1OizMCnNuhE+6rs9W8j3FVOqJlS/HIgrzqMkVI+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772584485; c=relaxed/simple;
	bh=FCa0IwdHMdB0pTywwXYtRPWsSvQDSGovQnYh9Vnziz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXTacme/oLwGFWOhXEdbNsrjS/uc+ep+o2XTLcxX+0GztpN9S8Nh2e23twPY5uRNJjO2wZxwrL/2csGAlu1/VWx/yJfD8eH3fKjGo5JliqW0YAl4a1rsCtgYtQdzPGHOfJBPWmTeoGSlYH4bpUn4qurd6aRmauAH8UjsNd6xk8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au; spf=pass smtp.mailfrom=crc.id.au; dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b=c8iwc0Zd; arc=none smtp.client-ip=203.4.137.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crc.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="c8iwc0Zd"
Received: from mailfilter.crc.id.au (localhost.localdomain [127.0.0.1])
	by mailfilter.crc.id.au (Proxmox) with ESMTP id 511DD62307;
	Wed, 04 Mar 2026 11:34:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=default; bh=FVmOkuwhYYg4JMWlG
	9DIMJGvc3Yh6de+gXMo2vko5Yw=; b=c8iwc0ZdmiZ4I/nHlwasRNsKMBJtmgho2
	w3tHyEnZ85YJBtIpCyGjbUKAW0pVzCivgQQ6JQnWGgRm8GnrYxY10atsn21tXrtJ
	iDCwj5W224SUvi2ZzxV+77alAUVKcF0C5vxSB+ESyQMiUTnqByT0J+hiTc3vlycl
	3OZ4+w9WATOjvXWApglucFUIlveGEhvHmEL/22yivEohyaYI7nMrhx4GVqlCA1Tk
	8JBtfbCGPxeQU9Q0nX8X5xVZvDdILYpTZZr3l1pl5OHRLQaK69Tp5qy4rPmYcAyV
	XxH1wYAczkImvYIMRg/e6sWzSLIX3LqYKHdYt/zFpg3oaRX+2HnDg4Wn7k7Ft+F7
	qgr7hQIAIml8x92lsok5d3HC2crY7i+oBvPQ2UVGB2R0AxlWGnJqtXb+HFs5OqIW
	I2hdpwvNYCJl3Tg8fTOCgMY5nPW63Mv3EcCQdTjZjA08wIbSrXou6Xt1jEvdxGRe
	OT1K9uTksqbFgVaKEYejSHvqTfMB6W0NB2YNOwRgkipAw31BlZkvjSDFHG3zxPYs
	pvScHFkJiNkL2Dl+cvmOP1UhzKS4O75o2+Ow7Elpe60S3/2lRw55gGO0tZeYsmne
	fBr++5kcYO4u0hU9f+Z4/9DM9Cs2qCWn2h37IdMJg2fftZ/fo32zOG/PAerCaEoD
	3xhfJdmb/E=
Message-ID: <a282917a-107d-4f70-82e5-df9564d5172d@crc.id.au>
Date: Wed, 4 Mar 2026 11:34:39 +1100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: aarch64 - netlink: Error: Could not process rule: No buffer space
 available
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
References: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
 <aad2hjmYS6Bcc3xz@chamomile> <aad5_mnW4D4JR8ZQ@chamomile>
Content-Language: en-US
From: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <aad5_mnW4D4JR8ZQ@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/3/26 11:17, Pablo Neira Ayuso wrote:
> On Wed, Mar 04, 2026 at 01:02:14AM +0100, Pablo Neira Ayuso wrote:
>> Hi,
>>
>> On Wed, Mar 04, 2026 at 10:36:20AM +1100, Steven Haigh wrote:
>>> Hi all,
>>>
>>> Firstly, please CC me in replies as I'm not subscribed to the list.
>>>
>>> I am currently loading some named sets into nftables using the following
>>> configuration:
>>>
>>> set au-ipv4 {
>>>          type ipv4_addr
>>>          flags interval
>>>          auto-merge
>>>          elements = { $AU.ipv4 }
>>> }
>>>
>>> set au-ipv6 {
>>>          type ipv6_addr
>>>          flags interval
>>>          auto-merge
>>>          elements = { $AU.ipv6 }
>>> }
>>>
>>> These sets are loaded in the config via:
>>> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
>>> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
>>>
>>> The files are created using the geo-nft.sh script here:
>>> https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh
>>>
>>> When loading these, I get the following fatal error:
>>> netlink: Error: Could not process rule: No buffer space available
> 
> Just to be sure and discard something simple.
> 
> Maybe you made a mistake in your ruleset in the aarch64 box? With lots
> of errors coming from the kernel, older userspace nftables versions
> report ENOBUFS.
> 
> Try loading AU.ipv4 and AU.ipv6 with only one element to see if
> userspace reports a different error.
> 
> commit 47e9aaf0227daf16f43a7442e1dceae8851817a5
> Author: Pablo Neira Ayuso <pablo@netfilter.org>
> Date:   Tue Aug 26 10:09:13 2025 +0200
>   
>      mnl: continue on ENOBUFS errors when processing batch
>      
>      A user reports that:
>      
>        nft -f ruleset.nft
>      
>      fails with:
>      
>        netlink: Error: Could not process rule: No buffer space available
>      
>      This was triggered by:
>      
>      table ip6 fule {
>        set domestic_ip6 {
>          type ipv6_addr
>          flags dynamic,interval
>          elements = $domestic_ip6
>        }
>        chain prerouting {
>          type filter hook prerouting priority 0;
>          ip6 daddr @domestic_ip6 counter
>        }
>      }
>      
>      where $domestic_ip6 contains a large number of IPv6 addresses.
>      
>      This set declaration is not supported currently, because dynamic sets
>      with intervals are not supported, then every IPv6 address that is added
>      triggers an error, overruning the userspace socket buffer with lots of
>      NLMSG_ERROR messages (or too big NLMSG_ERROR message to fit into the
>      socket buffer)

--snip--

Interesting.

I have noticed that if I split the set into multiple 'chunks', then the 
set can be populated properly.

As an example, this crude claude code authored script here does function 
as expected and the entire set is loaded successfully:
	https://lamp.crc.id.au/paste/e0e9DD01E48E46e27F5ad1bc0e/

It does take some time, but it does work:

$ time ./load-countrysets.sh
Loaded 8480 elements into au-ipv4
Loaded 11577 elements into au-ipv6

real    0m22.202s
user    0m20.335s
sys     0m1.798s

-- 
Steven Haigh

📧 netwiz@crc.id.au
💻 https://crc.id.au


