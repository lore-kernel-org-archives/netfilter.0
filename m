From: Rvfg <i@rvf6.com>
Subject: Re: ct state vmap no longer works on 6.3 kernel
Date: Wed, 3 May 2023 15:49:28 +0800
Message-ID: <03175e31-29bd-1588-1042-5931af102348@rvf6.com>
References: <a2c6386f-d339-9774-387a-f20fa8aa28e6@rvf6.com>
 <ZFH86op04R2rWPbi@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rvf6.com; s=dkim;
        t=1683100173; bh=iLOZZ+ORuSbPCodmM4SMyYkluTVfJNzeJY9kIsnvIG8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Cat0NMCFPpPH+YWK6+Ua8RzcNkNka4XCVwL5QAwy2ufa8IdUKH6bAaAqBwR1xkQUK
         cmjMY1MDsVpEd9M5E4RGdydQ2kBLbnAOOaias0RmjCU9Czbvzd8c1DLr5E8qvW3MVj
         5qFi9L8yKuWge94cCwCA0KT5yh1/mPz2wOZjfA1uZ74JY5EeNUEFW6AEE8xb4m4P1c
         xolGTEcu0UIeulwdG4/4Vjc/gBkvRRv0qEDXNDzlPwhOzND8wP0dncCUQ8AwiXHzNZ
         UBs7bThhl5KA3P++bEI/N3zoiLyd83L7bry6kiJSJJU/OLSimr3roNNEaQiVsJBa0b
         ymSK4GnryCgjQ==
Content-Language: en-US
In-Reply-To: <ZFH86op04R2rWPbi@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org



On 5/3/23 14:19, Pablo Neira Ayuso wrote:
> I don't see anything bad with this patch.
> 
> Did you enable conntrack logging to understand why conntrack is
> marking your packets as invalid?
> 
> # sh -c 'echo 58 > /proc/sys/net/netfilter/nf_conntrack_log_invalid'
> 
> where 58 is ICMPv6.

Thanks for your reply. I tried enable conntrack logging. But nothing 
printed in dmesg. Actually on 6.2.13 kernel, those RA packets are 
untracked. Not invalid. Here's a trace on 6.2.13 kernel:

trace id d8e73ea3 inet nixos-fw input packet: iif "wlp1s0" ether saddr 
20:76:93:40:f4:a5 ether daddr a8:7e:ea:ed:dd:a2 ip6 saddr 
fe80::2276:93ff:fe40:f4a5 ip6 daddr fe80::aa7e:eaff:feed:dda2 ip6 dscp 
cs0 ip6 ecn not-ect ip6 hoplimit 255 ip6 flowlabel 804199 ip6 nexthdr 
ipv6-icmp ip6 length 120 icmpv6 type nd-router-advert icmpv6 code 
no-route icmpv6 parameter-problem 1086326536 @th,64,96 0x1012076
trace id d8e73ea3 inet nixos-fw input rule meta l4proto ipv6-icmp meta 
nftrace set 1 (verdict continue)
trace id d8e73ea3 inet nixos-fw input rule ct state untracked jump 
input-allow (verdict jump input-allow)
trace id d8e73ea3 inet nixos-fw input-allow rule icmpv6 type != { 
nd-redirect, 139 } accept

But on 6.3 kernel, none of the 5 ct states could match my packets. 
Here's another trace on 6.3 kernel:

trace id bc3d036f inet nixos-fw input packet: iif "wlp1s0" ether saddr 
20:76:93:40:f4:a5 ether daddr a8:7e:ea:ed:dd:a2 ip6 saddr 
fe80::2276:93ff:fe40:f4a5 ip6 daddr fe80::aa7e:eaff:feed:dda2 ip6 dscp 
cs0 ip6 ecn not-ect ip6 hoplimit 255 ip6 flowlabel 804199 ip6 nexthdr 
ipv6-icmp ip6 length 120 icmpv6 type nd-router-advert icmpv6 code 
no-route icmpv6 parameter-problem 1086326536 @th,64,96 0x1012076
trace id bc3d036f inet nixos-fw input rule meta l4proto ipv6-icmp meta 
nftrace set 1 (verdict continue)
trace id bc3d036f inet nixos-fw input verdict continue
trace id bc3d036f inet nixos-fw input policy drop
