Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [203.4.137.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B93125A0
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 00:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.4.137.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772585387; cv=none; b=UQYEooigtopyCuF9Kw7xX6TUjNdO/izL/OLGGbaU5hFvgl3ohkBSy//CxWX1wRgW3ENMs3FZYfY1fE5z8aLcR9rLUrU0+cz99cw7vk36eJUNADQJNInu2LtfSICA3xbjSry5RQMns/iVoUEQr7PUKr808gSV3Fz+WX17Vl4aZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772585387; c=relaxed/simple;
	bh=Hu1Ufc2uxUaNRK/z2E/8bk6lUGRnRScKeGTOulWq2x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siJw831cdOKR8WUoRdapy4YhT22jaGkIlB89KbMnEwF2fw+rB/TT3/aFG5+rCt1pqdrSMlGSM+WK0CSzXaHR/PEI8npoDvihNKbuCRVdmE+xSdKvKvJ/mUauSCAZk75plq5BEkDW8od+KzAb2SOUCNjkHMQQ7aKemjFvd7unQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au; spf=pass smtp.mailfrom=crc.id.au; dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b=iT+SWt8v; arc=none smtp.client-ip=203.4.137.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crc.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="iT+SWt8v"
Received: from mailfilter.crc.id.au (localhost.localdomain [127.0.0.1])
	by mailfilter.crc.id.au (Proxmox) with ESMTP id B7A3162306;
	Wed, 04 Mar 2026 11:49:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=default; bh=RBTl4o/qnaN7qfymP
	X3fGMI33V//xqJYwtulC1WvbKE=; b=iT+SWt8vtpvmFryrGxZ+lUdtSNzzBF7It
	jDHVoli0iL/ZCEc2UfkPEC4E4u0kpaMigw4eBFuV+O4TjNbcd7gLmGLZe4Sx1dQ2
	I998dQV9YZpyWtjbNf4esPGswPmlr1nhdr9teThKqRT12s9UqQ2YjQbE5wXv+xn8
	5m8LYCPB+sWKk+Vex1PioKZ1hMNA0yoahlYnITFUxL83JCj7Qau9LtM+xgnnJccb
	/HxNLlsQ1zmxpluB5gCrW+oCDBZ3sib+1Dv0n8Bs9rSR8T5CGu89AHpgrgPcFSWF
	fpqIEn/4EMHAt3KR3J6bHjs9yEIg7kTKuj6JlA3/qRvquRJ0pY5YgX3phTeiMkF/
	DY0iwfm0FqTS9qvyq7DJNcHdGMMV4QWqkozStrO+lnxTcMcpoE1Cwz1oe5KRau1s
	824BPv6nFjctye8ERZDjp0hEjt2ds2yMRxq7JSY9KBtd0wGPaG23IerRvL7SZuMZ
	wJCgx+OtglLn4cGxHHo/2wD9wDVXploKBBRQ8b2IaqPIS4rXI4p6RrPYJkOj9Ot9
	5uXo9LveKvRuYG5s0+U+l1yY3sIGclnHr9alGQhARUQkEnsdFSaznB/a1Ks5wKJZ
	fUbACRG1D1eP5sRerqkrwhVHMckaT30brhc0ijtO1eEs/ExjRGozL5qcJnM7YT0Q
	iOhBE1lsFI=
Message-ID: <5e92cfab-a593-4679-8df2-abb8b9e32bad@crc.id.au>
Date: Wed, 4 Mar 2026 11:49:41 +1100
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
 <a282917a-107d-4f70-82e5-df9564d5172d@crc.id.au> <aad__3J15t9kzkYd@chamomile>
Content-Language: en-US
From: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <aad__3J15t9kzkYd@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/3/26 11:42, Pablo Neira Ayuso wrote:
> On Wed, Mar 04, 2026 at 11:34:39AM +1100, Steven Haigh wrote:
>> On 4/3/26 11:17, Pablo Neira Ayuso wrote:
>>> On Wed, Mar 04, 2026 at 01:02:14AM +0100, Pablo Neira Ayuso wrote:
>>>> Hi,
>>>>
>>>> On Wed, Mar 04, 2026 at 10:36:20AM +1100, Steven Haigh wrote:
>>>>> Hi all,
>>>>>
>>>>> Firstly, please CC me in replies as I'm not subscribed to the list.
>>>>>
>>>>> I am currently loading some named sets into nftables using the following
>>>>> configuration:
>>>>>
>>>>> set au-ipv4 {
>>>>>           type ipv4_addr
>>>>>           flags interval
>>>>>           auto-merge
>>>>>           elements = { $AU.ipv4 }
>>>>> }
>>>>>
>>>>> set au-ipv6 {
>>>>>           type ipv6_addr
>>>>>           flags interval
>>>>>           auto-merge
>>>>>           elements = { $AU.ipv6 }
>>>>> }
>>>>>
>>>>> These sets are loaded in the config via:
>>>>> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
>>>>> include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
>>>>>
>>>>> The files are created using the geo-nft.sh script here:
>>>>> https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh
>>>>>
>>>>> When loading these, I get the following fatal error:
>>>>> netlink: Error: Could not process rule: No buffer space available
>>>
>>> Just to be sure and discard something simple.
>>>
>>> Maybe you made a mistake in your ruleset in the aarch64 box? With lots
>>> of errors coming from the kernel, older userspace nftables versions
>>> report ENOBUFS.
>>>
>>> Try loading AU.ipv4 and AU.ipv6 with only one element to see if
>>> userspace reports a different error.
>>>
>>> commit 47e9aaf0227daf16f43a7442e1dceae8851817a5
>>> Author: Pablo Neira Ayuso <pablo@netfilter.org>
>>> Date:   Tue Aug 26 10:09:13 2025 +0200
>>>       mnl: continue on ENOBUFS errors when processing batch
>>>       A user reports that:
>>>         nft -f ruleset.nft
>>>       fails with:
>>>         netlink: Error: Could not process rule: No buffer space available
>>>       This was triggered by:
>>>       table ip6 fule {
>>>         set domestic_ip6 {
>>>           type ipv6_addr
>>>           flags dynamic,interval
>>>           elements = $domestic_ip6
>>>         }
>>>         chain prerouting {
>>>           type filter hook prerouting priority 0;
>>>           ip6 daddr @domestic_ip6 counter
>>>         }
>>>       }
>>>       where $domestic_ip6 contains a large number of IPv6 addresses.
>>>       This set declaration is not supported currently, because dynamic sets
>>>       with intervals are not supported, then every IPv6 address that is added
>>>       triggers an error, overruning the userspace socket buffer with lots of
>>>       NLMSG_ERROR messages (or too big NLMSG_ERROR message to fit into the
>>>       socket buffer)
>>
>> --snip--
>>
>> Interesting.
>>
>> I have noticed that if I split the set into multiple 'chunks', then the set
>> can be populated properly.
>>
>> As an example, this crude claude code authored script here does function as
>> expected and the entire set is loaded successfully:
>> 	https://lamp.crc.id.au/paste/e0e9DD01E48E46e27F5ad1bc0e/
> 
> Unfortunately, I cannot reach this link.

Apologies - its behind the firewall that I'm debugging :)

Mirrored here: https://pastebin.com/iTa9XRCb

>> It does take some time, but it does work:
>>
>> $ time ./load-countrysets.sh
>> Loaded 8480 elements into au-ipv4
>> Loaded 11577 elements into au-ipv6
>>
>> real    0m22.202s
>> user    0m20.335s
>> sys     0m1.798s
> 
> Even with ASAN enabled I can load such a small ruleset a lot faster,
> not sure what this script is doing.
> 

-- 
Steven Haigh

📧 netwiz@crc.id.au
💻 https://crc.id.au


