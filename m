Received: from achilles.binarus.de (achilles.binarus.de [167.235.4.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39111863E
	for <netfilter@vger.kernel.org>; Sun,  2 Feb 2025 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.4.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738514863; cv=none; b=WRArcR6pUQIJb3XFCFDG4GWIOUoxooo8Fn5AuTenwyuYO9Tt9q77iW+nqGegwca5I9NjCu/CA9LWm0yWCxGbNMknncU14HZ29IjLuxRT0uu3rylKnJKDRTI9LPUnmLwX5MI9XOdejM++l5KGV4H5gSiDSKVbRkeomjnAmEaS/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738514863; c=relaxed/simple;
	bh=PT4fmeBE4ZECxP5RlbkNmBTAqLRZmuPUurkm1ew3AAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O4ZVPPfL1vyBvg5nH0Dii6lxasb60SklndmamBYqWvFJcViRMbxsGSocoPpGa8qsTO+04DRanZ6sTwK1SyUwtir93F9CaIZPunkdmdBCkRaLYphoppRsgQWdVJsueWng5Lsi6lJep3DwxzelahSz9Mo2FSEBbZv8iyjickCEXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=Scu3+TEt; arc=none smtp.client-ip=167.235.4.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="Scu3+TEt"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1738514857;
	bh=PT4fmeBE4ZECxP5RlbkNmBTAqLRZmuPUurkm1ew3AAQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From:Reply-To:Subject:
	 Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:In-Reply-To:
	 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	 List-Post:List-Owner:List-Archive;
	b=Scu3+TEtzKqDKUx50vQ7FB3uX2qVa2ghK3qoFiwr0N+mbUJovfoVBbWHVO4Z7vh1O
	 X/I9j9ulzYuGAzgKyqLmRnRIBTvMpIc3o6aOmwU0+OuDKivsj9o0aNhNxg1QU2iZet
	 bNytbMInQzvzWfHDfAfTovlXxd781eUJ+9EZMwFHxsvW8qUIygXPXuBIFr0K7lvhhm
	 vZ1YsHRbwSmTGjiFMs3t6MT5HiKwUQ7oqED0AdlX6pduscgLPjeCicMFQRVpOZj6u6
	 IC3bmPJ/pLV7ICEWpbHeT6kLh7MnhY/fKq+1RrJQz7YBbKzu0POA9SsdzsSW0EFgTD
	 YqAc80HGQMcDK9fTdiEUSHWMIbejZz0iCTLx3cS5sMlFfR4ohLXfaWW0P/VvSud2ui
	 APDllLeqfYypthch5RT3fLA+AdwnKYE0Ug1GoBpNhNwU1ZTutjcZD2KnL7dk408RSg
	 RG7Q9gyuJQ4LC9DzYaWmmE4u53AiytbgrU61Jgxm1zYSzS0JxQ/Z6NziHd1DWewIOn
	 G0jg1XIrutRK1yYZm4OgzFuDP0DCy8gcTPt6hrIqN0feVvTsw7OmsDvHP/piChenul
	 pvG/c1X6tXOuKXfyuVBtq1L0Kgi/b4pslX00LZPZFMQEZQWnz+gk/28Ff1zep6ZCOW
	 nG6YtKaDmFLI995Yuk3Uy6io=
Received: from [192.168.20.100] (p54969e67.dip0.t-ipconnect.de [84.150.158.103])
	(authenticated bits=0)
	by achilles.binarus.de (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTPSA id 512Glbji3393417
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sun, 2 Feb 2025 17:47:37 +0100
Message-ID: <1ce0ce05-d876-4ec2-8602-6485055c9719@binarus.de>
Date: Sun, 2 Feb 2025 17:47:36 +0100
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


On 01.02.2025 11:30, Berto Furth wrote:
> I went ahead and loaded your listed configuration into my /etc/nftables.conf file.
> 
> I got an error when I tried to load your configuration and as such IP traffic was allowed because there were essentially no nftables rules operating.
> 
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

You are completely right. I must have messed up something. The ruleset that I have posted now causes the same errors at my side, and the only solution is to replace "dstnat" and "srcnat" by their numerical values as you have shown.

However, this clearly contradicts the documentation. The link below refers to table in the netfilter wiki which lists nft keywords (names) for priorities. "dstnat" and "srcnat" clearly are among them. So either the documentation is correct and our nft versions are too old, or the documentation is wrong.

https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook

Sadly, it seems that I not only have messed up the syntax, but have made further mistakes, because I cannot reproduce the problem any more. With your changes applied, everything works as expected. That is, policy drop in an otherwise empty chain indeed is equivalent to having an explicit drop verdict for all packets in that chain.

Thank you very much for your help. I'd like to apologize for having wasted your time.

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

