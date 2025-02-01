Received: from achilles.binarus.de (achilles.binarus.de [167.235.4.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301BB20318
	for <netfilter@vger.kernel.org>; Sat,  1 Feb 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.4.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738412726; cv=none; b=ih9GMFT/zzUAnn1vqzum83tAiWNChgbeADydbZTninueTdT0G1NqfIiPER4SDqdW2lszmBbJMbpnp1/8m6N9Fo+NHYW2Jjzzf2AycGmZWREr04GyCXE5JC1jB4+qL5vMXHjawjVfC5fBmHzGhPfeSmnSlAQhfxuLqW0x07bK3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738412726; c=relaxed/simple;
	bh=6C4akIgtcEJjx+xR5oCjB0LbTFAEHckKe3yl+1Op4n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q7xF/aWpO1HI2DjAGBaR0cxYL5N+ooJpXNNzBd5ekh5Jc1Iu6GX/mZtiQv6Of7DAnimo1p7DmGSBtfDXjd88Oy2E5urILCJwrwnSx4SBdeoOSyqy2TD0g04Oqj5bRZEIeGVh9Wgnj8/NTlh6M8BuNF0FwL7a6s3Ml981XZZVwUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=DJcXRK7D; arc=none smtp.client-ip=167.235.4.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="DJcXRK7D"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1738412714;
	bh=6C4akIgtcEJjx+xR5oCjB0LbTFAEHckKe3yl+1Op4n4=;
	h=Date:Subject:To:References:From:In-Reply-To:From:Reply-To:Subject:
	 Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:In-Reply-To:
	 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	 List-Post:List-Owner:List-Archive;
	b=DJcXRK7DKRyqm9Em6Vblosw+ocTrMgUQCIzl1JYeEUrDjpvgq1ZDOUSAa1JrkdA3w
	 F5FIB+JCyuUr2BCmXIzOehmBAVZ4GdJifXAxn1FetZ8wBinQAHczKQZPBiuUfwh/4E
	 2yO1bKLPxSOKjKjY4Im+P1lsU323GH5jfOyhvY7kiCu4nAqZrlGXl9JZcX3ir8ADae
	 oR2OCqletzW0nYGDJAZ5gAIta6ERZWYxApECWc6kNOrG8g0SxaY5zItUu2yUOU2G4/
	 eGxvD8+NPg3HoeycWQj3TcFgl/lbMCwFnxDIIshZBy2NA3nC64xzBeTn1pwNgDurGc
	 uDVpyY2oZ6TUycLl4sLHsMc4gmP3HghQQTJnn1c4agHufpPlRCxjnKhkjv4eXG1gvW
	 HglbskgTZYbLm7uJsVFYYCwjm8Di+zKIph98c++qDfvUm0RqNNXDYb6E38WOKhhwo1
	 J8RILrtYubZV1wExSCn4eYtz0RTeeqPCJ3skApXrTp5UsiKNN5SS8ZE57O73U7rkZf
	 Pq+yCK+ygvQXgW9FT9F8ci0XSF4dYjvSsFy15ocSPgO1FEFMp5OnEt9z5RrJTZGV2y
	 jhPvb3ZYgUSbgyOb0H5Be7vekVxdWqGyZAlvtsftbYv+0QFtFuJPPJ4vpadZa6jKQN
	 plOQRqqWgcapK6XGddKf3bPg=
Received: from [192.168.20.100] (p5496968b.dip0.t-ipconnect.de [84.150.150.139])
	(authenticated bits=0)
	by achilles.binarus.de (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTPSA id 511CPCT42016367
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sat, 1 Feb 2025 13:25:14 +0100
Message-ID: <d610baff-a032-403e-b0cf-57c5dea4c005@binarus.de>
Date: Sat, 1 Feb 2025 13:25:12 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: Netfilter not dropping packets as it should
To: netfilter@vger.kernel.org
References: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
 <5c0ffbb9-1bb7-403f-af74-dca23f8fefd6@app.fastmail.com>
Content-Language: en-US, de-DE
From: Binarus <lists@binarus.de>
In-Reply-To: <5c0ffbb9-1bb7-403f-af74-dca23f8fefd6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

At first, thank you very much for taking the time!

On 01.02.2025 11:30, Berto Furth wrote:
> Hi Binarus,
> 
> A non expert here....so my answer if probably rubbish...but anyway...
> 
> I went ahead and loaded your listed configuration into my /etc/nftables.conf file.
> 
> I got an error when I tried to load your configuration and as such IP traffic was allowed because there were essentially no nftables rules operating.

At least, I understand that part. If there is an error when loading, then no rules are active and everything is allowed (unless you had another ruleset in place before).

> The lines that generated an error were as follows..
> 
> # nft -c -f /etc/nftables.conf
> /etc/nftables.conf:27:26-40: Error: invalid priority expression value in this context.
>       type nat hook input priority dstnat; policy drop;
>                           ^^^^^^^^^^^^^^^
> /etc/nftables.conf:41:27-41: Error: invalid priority expression value in this context.
>       type nat hook output priority srcnat; policy drop;
>                            ^^^^^^^^^^^^^^^
> However when I replaced "dstnat" with "-100" and "srcnat" with "100" the nftables filers were accepted and IPv4 traffic to the unit stopped.

I believe (but may be wrong) that this might be due the different versions we use. I am not sure if previous (or later) versions understand the same symbolic names for priorities.

Unfortunately, in my initial post I forgot to mention what versions I am on: It is kernel 6.1.0 and nftables 1.0.6 (nice permutation by the way ...). This is a vanilla Debian bookworm box, updated to the latest patches at the time of writing.

I'll now add info about the versions as a direct reply to my first post, and I'll try tracing as instructed by the very first reply in this thread.

Best regards,

Binarus


> 
> The diffs between what I used and what you posted are as follows
> 
> *** /etc/nftables.conf.binarus  2025-02-01 21:25:46.418090954 +1100
> --- /etc/nftables.conf  2025-02-01 21:25:22.198057049 +1100
> ***************
> *** 24,30 ****
>       }
>    
>       chain input-nat {
> !      type nat hook input priority dstnat; policy drop;
>         log prefix "ip4-input-nat:" drop;
>       }
>       chain input-filter {
> --- 24,30 ----
>       }
>    
>       chain input-nat {
> !      type nat hook input priority -100; policy drop;
>         log prefix "ip4-input-nat:" drop;
>       }
>       chain input-filter {
> ***************
> *** 38,44 ****
>       }
>    
>       chain output-nat {
> !      type nat hook output priority srcnat; policy drop;
>         log prefix "ip4-output-nat:" drop;
>       }
>       chain output-filter {
> --- 38,44 ----
>       }
>    
>       chain output-nat {
> !      type nat hook output priority 100; policy drop;
>         log prefix "ip4-output-nat:" drop;
>       }
>       chain output-filter {
> 
> I hope that helps.
> 
> Berto.
> 
> 
> On Fri, 31 Jan 2025, at 06:35, Binarus wrote:
>> Dear experts,
>>
>> this is a cross posting, see
>> https://unix.stackexchange.com/questions/789174/netfilter-not-dropping-packets-as-it-should.
>> Since I didn't get an answer there for a couple of weeks, I am
>> repeating the question here in the hope that the problem can easily be
>> reproduced. For me this is a very important key point in understanding
>> netfilter / nftables.
>>
>> Please consider the ruleset that's at the end of this post. It doesn't
>> make any sense, but it lets everybody reproduce the problem easily.
>>
>> With this ruleset, all IPv4 packets that come in via enp0s3 are
>> accepted in the ingress hook, but finally traverse a chain with a drop
>> policy. Each of these chains does not contain any explicit rule besides
>> the drop policy, and thus should behave as it would (only) contain an
>> explicit drop verdict for all packets.
>>
>> Hence, applications on that machine should not see any IPv4 packets
>> that originate from other machines.
>>
>> But they definitely do. For example, I have an SSH daemon running on
>> that machine. The daemon listens on an IPv4 address only (in fact, I
>> have disabled IPv6 on that machine completely by adding ipv6.disable=1
>> to the kernel command line). Even after I have loaded the ruleset
>> below, I can connect to the SSH daemon via IPv4 from the outside
>> without any issue.
>>
>> Can somebody please explain why the rules below don't make the kernel
>> drop all incoming IPv4 packets? Did I misunderstand the purpose of the
>> drop policy?
>>
>> Thank you very much in advance, and best regards,
>>
>> Binarus
>>
>>
>>
>>
>>
>> table netdev t_NETDEV_enp0s3 {
>>     chain enp0s3-ingress-filter {
>>       type filter hook ingress device "enp0s3" priority filter; policy drop;
>>       ether type 0x0806 arp ptype 0x0800 accept
>>       ether type 0x0800 accept
>>       log prefix "foo: " drop
>>     }
>> }
>>
>> table ip t_IP {
>>
>>     chain prerouting-nat {
>>       type nat hook prerouting priority dstnat; policy drop;
>>       log prefix "ip4-prerouting-nat:" drop;
>>     }
>>     chain prerouting-filter {
>>       type filter hook prerouting priority filter; policy drop;
>>       log prefix "ip4-prerouting-filter:" drop;
>>     }
>>
>>     chain input-nat {
>>       type nat hook input priority dstnat; policy drop;
>>       log prefix "ip4-input-nat:" drop;
>>     }
>>     chain input-filter {
>>       type filter hook input priority filter; policy drop;
>>       log prefix "ip4-input-filter:" drop;
>>     }
>>
>>     chain forward-filter {
>>       type filter hook forward priority filter; policy drop;
>>       log prefix "ip4-forward-filter:" drop;
>>     }
>>
>>     chain output-nat {
>>       type nat hook output priority srcnat; policy drop;
>>       log prefix "ip4-output-nat:" drop;
>>     }
>>     chain output-filter {
>>       type filter hook output priority filter; policy drop;
>>       log prefix "ip4-output-filter:" drop;
>>     }
>>     chain output-route {
>>       type route hook output priority mangle; policy drop;
>>       log prefix "ip4-output-route:" drop;
>>     }
>>
>>     chain postrouting-nat {
>>       type nat hook postrouting priority srcnat; policy drop;
>>       log prefix "ip4-postrouting-nat:" drop;
>>     }
>>     chain postrouting-filter {
>>       type filter hook postrouting priority filter; policy drop;
>>       log prefix "ip4-postrouting-filter:" drop;
>>     }
>> }

