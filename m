From: "" <kfm@plushkava.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] ICMPv6 ingress dropped despite
 accept rule
Date: Mon, 3 Feb 2020 12:33:14 +0000
Message-ID: <343cb9ea-7cb7-e0cd-b2ad-ab4eb96ccee0@plushkava.net>
References: <f8914acf-6487-c9bd-e452-d253069aebe5@gmx.net>
 <20200203115603.GA32621@dimstar.local.net>
 <20200203121508.GB32621@dimstar.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=N
        uoWqjlAvjC3Hcxm6Z1vbSwaaF2aYwxzDaxsM1VXWSk=; b=LiqDcGehE2YgGZJwH
        qrGNQ7sGQYo80psUJBdx1ankn7GKu8SmnLkhNGAXze050JWrpE6e2CRTlyRDI3n4
        SFcA336c3hMv7FrcPg33YljcWqJR0hH72UHoIQC0qO3qu+9YizwlXV/GmdDrBjaQ
        3unzCHohmQ4DmAemCfXg5ie/JIDkWYBzjI9BCPP+A7juT1o75gIxwkE3xg6/RS9j
        TDoeTSkpCFjaFdUplslhHcHcTolRWpdZ4bmPUAKWPHlUdA9Nqf7q4jA8ti2fn/N5
        VXpTKdrXhM6F+Fybu2+ClxF0ptfCUxJr6gMil7vo4TQac+ELxaI4sKryTd8o8lPH
        fI4xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=NuoWqjlAvjC3Hcxm6Z1vbSwaaF2aYwxzDaxsM1VXW
        Sk=; b=GmGZs71SQqMF35nigir7XZAQuP+XbkwNGr8yl/SolfXqHS+kREBInYFxX
        2wOljbdJqGZ1M4NHSzSZxcjVZsTqgLi8EMUCvJt3ag9vBYR/t8ybOjK3tqOawwpE
        30ZGj6C2Xo/Vb1r6noroxtm5XluKov3LaIGL6GSq5E9iLin73d3/BXCYuFZ36lKE
        +FJX/iDnI6EdWtr8oe5quxsx+heHzRl6x00WappR54DMKwhKyKfW2iJ96LrbcMts
        bw5r+kBcqHVZHkQ4YzSM6ncH6w3CYl6rv6YnEOg7GRzVbyMho5ZhN7IspCaAfX96
        UcdxQ0wYFUkJcXxDm8RMcI/Kg+apA==
In-Reply-To: <20200203121508.GB32621@dimstar.local.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/02/2020 12:15, Duncan Roe wrote:
> On Mon, Feb 03, 2020 at 10:56:03PM +1100, Duncan Roe wrote:
>> On Mon, Feb 03, 2020 at 10:56:24AM +0000, ????????????? wrote:
>>> Appreciate if someone could be obliged and have a look at the below ruleset
>>> and let me know where I am going wrong since ICMPv6 is being (policy)
>>> dropped:
>>>
>>> DROP_WAN_IN IN=pppoe-wan OUT= MAC=
>>> SRC=fe80:0000:0000:0000:e2ac:f1ff:fe65:51ba
>>> DST=ff02:0000:0000:0000:0000:0000:0000:0001 LEN=72 TC=224 HOPLIMIT=255
>>> FLOWLBL=0 PROTO=ICMPv6 TYPE=134 CODE=0
>>>
>>> despite an accept statement
>>>
>>> --- ruleset
>>>
>>> table arp filter { # handle 141
>>>          chain input { # handle 1
>>>                  type filter hook input priority filter; policy accept;
>>>                  iif "eth2" drop # handle 3
>>>          }
>>>
>>>          chain output { # handle 2
>>>                  type filter hook output priority filter; policy accept;
>>>                  oif "eth2" drop # handle 4
>>>          }
>>> }
>>> table inet filter { # handle 142
>>>          chain input { # handle 1
>>>                  type filter hook input priority filter; policy drop;
>>>                  ct state established,related accept # handle 4
>>>                  ct state invalid drop # handle 5
>>>                  iif "lo" accept # handle 6
>>>                  iif "br-lan" accept # handle 7
>>>                  iif "lan0" accept # handle 8
>>>                  iif "lan1" accept # handle 9
>>>                  iif "lan2" accept # handle 10
>>>                  iif "lan3" accept # handle 11
>>>                  iif "lan4" accept # handle 12
>>>                  log prefix "DROP_WAN_IN " # handle 13
>>>          }
>>> }
>>> table ip6 filter { # handle 145
>>>          chain input { # handle 1
>>>                  iif "eth2" ip6 saddr fc00::/6 udp sport 547 udp dport 546
>>> ip6 daddr fc00::/6 accept # handle 3
>>>                  icmpv6 type destination-unreachable meta nftrace set 1
>>> accept # handle 4
>>>                  icmpv6 type packet-too-big meta nftrace set 1 accept #
>>> handle 5
>>>                  icmpv6 type time-exceeded meta nftrace set 1 accept # handle
>>> 6
>>>                  icmpv6 type parameter-problem meta nftrace set 1 accept #
>>> handle 7
>>>                  icmpv6 type echo-reply meta nftrace set 1 accept # handle 8
>>>                  icmpv6 type nd-router-advert meta nftrace set 1 accept #
>>> handle 9
>>>                  icmpv6 type nd-neighbor-advert meta nftrace set 1 accept #
>>> handle 10
>>>                  icmpv6 type nd-redirect meta nftrace set 1 accept # handle
>>> 11
>>>                  icmpv6 type 149 meta nftrace set 1 accept # handle 12
>>>                  icmpv6 type 151 meta nftrace set 1 accept # handle 13
>>>                  icmpv6 type 153 meta nftrace set 1 accept # handle 14
>>>          }
>>> }
>>>
>> table ip6 filter chain input is probably not run at all becaue it is missing
>> type, hook and priority parameters which the man page says are mandatory for
>> base chains.
>>
>> Even if it were run, table inet filter chain input will drop icmpv6 anyway. This
>> will happen whichever of the 2 chains runs first, since accept is only final
>> w.r.t the current chain. Drop is completely final btw.
>>
>> You need to do 3 things:
>>
>>   1. Make sure table ip6 filter chain input runs first, by e.g. giving it
>> priority filter-1
>>   2. In table ip6 filter chain input, set a packet mark on accepted packets
>>   3. In table inet filter chain input, accept packets with the packet mark set by
>> item 2
>>
>> Cheers ... Duncan.
> 
> Simpler solution: rename table ip6 filter chain input (to input2, say), then
> move that chain into table inet filter.
> 
> Insert the rule "icmpv6 jump input2" into chain input somewhere before the log
> rule.

Apparently, we are thinking along the same lines but that's not a valid 
icmpv6 header expression. A rule such as "meta l4proto ipv6-icmp jump 
input2" should do the trick.

-- 
Kerin Millar
