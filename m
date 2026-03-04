Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [203.4.137.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C4C23C39A
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 01:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.4.137.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772586336; cv=none; b=eaSXHJ8jYME5SR7ZTKTwjEi6R9FJJ5BJAe82qJp2jUNJh5l5PEWfwJMi7wz3ehwnKjgb1EXsxlqtIVXDFLF0K12dntMoAVpUwYgt6h+DwttnNSfuaUZZGZ6ui9CmoaaWBiEtttvtsYr+VBf4NOCJxx02YvG12aBmMAW5hA8P5Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772586336; c=relaxed/simple;
	bh=k6mMXQlC09SzjZ7dTFRrwiCVIze84fiW8+7WCEGK2GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttrqiDlGi/fK7f+keBdoJPPpRLhesCRWA1zLLGWmOHr6rvhQIb+iWb5lYrAH8wSVWFtsX/NLR3/UgY/0Ud4fxUqkg7ZUrNGaRi492vCYpuAoyFFWOhVP+ZzBxYDxnUVL5Hsb4LWhAwLo5c+ezOSfPyjU5hGaMRyFZo9s7CcD6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au; spf=pass smtp.mailfrom=crc.id.au; dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b=Pi9up+rE; arc=none smtp.client-ip=203.4.137.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crc.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="Pi9up+rE"
Received: from mailfilter.crc.id.au (localhost.localdomain [127.0.0.1])
	by mailfilter.crc.id.au (Proxmox) with ESMTP id 7C969622FB;
	Wed, 04 Mar 2026 12:05:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=default; bh=ze/9UidfKnqwtr9xV
	+qy/gSmfpYz3L6Vv++D4D4mrJg=; b=Pi9up+rEstWd85RzLrGEcBgaEaEVI6VCR
	O6eKbQdiZ2mByQViwrg/2YCkqRlyNZ8kML3pH7X9l0NaJJH9/+L3Is/WaWnNld7X
	MxJJYGjBLsLgFZepTAe+E9CVB/45C9QVn3AWgh8PBZDKyOLjrHYbInFlakmZs9md
	u9c80MjYYtpuJaYkJp2Qs+cgnoxr+9Zayu+F1QAUar+ThHstK/Gbw73Hpj1/qQPn
	m4pqVoUwZKj6dYoeE5X9uJoswDY7Vdb9xTysv+aqJXjtcMJIaSXKSvN5aG/YiBZh
	VE5PUoXIv0PYpF9nuBFVttFV4A6bqrM1zZoaVp6i3VSkL4ijKf/qg5F7MKm/lHh4
	T5fqYY+/8+ShwTboNae5JLlD4C71Ubqs6KNe6JEtSwZNmxA5ezdzu+3ySMrOh4DO
	n5ELBF0NWMV/BZwbzKtWTcW1f+LTQy2MVIWvVPNCDZeevwpPdXDYOOY08ewsRC1U
	2/0I8JGkXrr5ohVFr/I3NwqTBb34/sbfUsUuEjjBhHFIzI8wCGX8CQHUPpNyfNWv
	TxtJkVmVYiwL3ez+FFc5LKLsyUIXn+3aBWDzhk8g9US6Q7KKnbxfumN7R+Sp/3gW
	wRjezAC4DhOSadI5DPYavRCpXRK7LyPpRf0asOhuOT3c9CSKAEfbHANMfj2ZK7Nb
	U8vOtQIiGw=
Message-ID: <6a13633f-3d2b-47c4-b9fa-a556e88c2188@crc.id.au>
Date: Wed, 4 Mar 2026 12:05:30 +1100
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
 <5e92cfab-a593-4679-8df2-abb8b9e32bad@crc.id.au> <aaeCd1rZsttYRVBf@chamomile>
Content-Language: en-US
From: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <aaeCd1rZsttYRVBf@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/3/26 11:53, Pablo Neira Ayuso wrote:
--snip--
>> Apologies - its behind the firewall that I'm debugging :)
>>
>> Mirrored here: https://pastebin.com/iTa9XRCb
> 
> This is insane:
> while IFS= read -r line; do
>   ...
>   echo "add element $TABLE_FAMILY $TABLE_NAME $set_name { $batch }" | nft -f -
> 
> this is one transaction per command.
> 
> This is as bad as a shell script with explicit iptables invocations,
> one per line. This is an antipattern.

Yep - it isn't optimal - however it loads up to 512 lines per invocation 
of nft. It isn't meant to be a production or solution - just proof that 
the set is actually good and can be loaded successfully - even if the 
set is loaded at up to 512 elements at a time.

At this moment, I've had no success loading the entire set via the 
normal methods - being uncommenting these two lines:

include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";

table inet filter {
	set au-ipv4 {
	        type ipv4_addr
	        flags interval
	        auto-merge
	        #elements = { $AU.ipv4 }
	}

	set au-ipv6 {
	        type ipv6_addr
	        flags interval
	        auto-merge
	        #elements = { $AU.ipv6 }
	}
}

At best, its a workaround for now. I can work with it until nft 1.1.7 if 
you believe this should work correctly in that version?

I don't have an aarch64 cross-compile setup on this system (its an 
embedded 8 core ARM board based on the rk3588 SOC) - so I can probably 
monitor Fedora's Bodhi instance here until 1.1.7 is released and built:
	https://bodhi.fedoraproject.org/updates/?search=nftables

-- 
Steven Haigh

📧 netwiz@crc.id.au
💻 https://crc.id.au


