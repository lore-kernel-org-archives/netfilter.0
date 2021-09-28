From: Daniel <tech@tootai.net>
Subject: Re: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Tue, 28 Sep 2021 13:05:06 +0200
Message-ID: <e60b7109-c570-881f-3ba5-8496bf436559@tootai.net>
References: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
 <20210916092924.GB31336@salvia>
 <48e95c8a-2469-08dd-0620-55187252653c@tootai.net>
 <20210916125858.GA9451@salvia>
 <24b4d340-d951-103b-27d4-9bb97afd9c4c@tootai.net> <YUkjwU8YNmogNY8d@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1632827106; bh=P2dvCHgTE1tqPw1Re3rZjTtQSGjViWdArO+dY08cVxI=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=k8FbVxyDgUHwelbdrWkCRMpo+z/4iY9NZaPv46SwDlLbohEUiVgGlqDhe9o5PmIoJ
         lGxu8vtYU5fDTB+30zY7+sxHYbDxPDxhevWrO44jo68oheeKg736T3CioV6w+llPms
         XFxxrD2bEynqxmWAPVsjWu08Izyfg6BzxOvXEOBA=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1632827106; bh=P2dvCHgTE1tqPw1Re3rZjTtQSGjViWdArO+dY08cVxI=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=k8FbVxyDgUHwelbdrWkCRMpo+z/4iY9NZaPv46SwDlLbohEUiVgGlqDhe9o5PmIoJ
         lGxu8vtYU5fDTB+30zY7+sxHYbDxPDxhevWrO44jo68oheeKg736T3CioV6w+llPms
         XFxxrD2bEynqxmWAPVsjWu08Izyfg6BzxOvXEOBA=
In-Reply-To: <YUkjwU8YNmogNY8d@salvia>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi Pablo,

sorry for delay, I had to install 1.0.0 from snap on my Ubuntu 20.04.

Le 21/09/2021 à 02:13, Pablo Neira Ayuso a écrit :
> On Fri, Sep 17, 2021 at 12:18:12PM +0200, Daniel wrote:
>> Le 16/09/2021 à 14:58, Pablo Neira Ayuso a écrit :
>>> [...]
>>> so you want to redirect all ports except a few of them?
>>>
>>>     add map x mymap { type ipv4_addr : ipv4_addr ; }
>>>     add rule x y ip protocol { tcp, udp } th dport 1-65534 dnat to ip saddr map @mymap
>>>
>>> This allows you to dnat depending on the IP source address, skipping 0
>>> and 65535 for TCP and UDP.
>> I don't get I so lets be more explicite with an example.
>>
>> I want to redirect udp port 10000-20000 to another IP (typically asterisk
>> RTP ports from host to a VM) What I have today which work with single ports
>> (bash script, yes I know ;))
>>
>>      nft add map $1 nat fwdtoip_tcp.$IFACE { type inet_service :
>> $mytype\; flags interval\; }
>>      nft add map $1 nat fwdtoip_udp.$IFACE { type inet_service :
>> $mytype\; flags interval\; }
>>      nft add map $1 nat fwdtoport_tcp.$IFACE { type inet_service :
>> inet_service\; flags interval\;}
>>      nft add map $1 nat fwdtoport_udp.$IFACE { type inet_service :
>> inet_service\; flags interval\;}
>>      nft add map $1 nat redirect_tcp.$IFACE { type inet_service :
>> inet_service\; flags interval\;}
>>      nft add map $1 nat redirect_udp.$IFACE { type inet_service :
>> inet_service\; flags interval\;}
>>
>> where $1 is ip or ip6, $mytype is ipv4_addr or ipv6_addr
>>
>> Then from a list of ports I extract each value -including ranges like above
>> exemple- and do
>>
>> If src address != to dst address
>> nft add element $1 nat fwdtoip_$myproto.$IFACE { $tmpsport : $mydaddr
>> }
>> nft add element $1 nat fwdtoport_$myproto.$IFACE { $tmpsport :
>> $tmpdport } ; this is not accepted when a range is given like 10000-20000
>>
>> If src address = dst address
>> nft add element $1 nat redirect_$myproto.$IFACE { $tmpsport :
>> $tmpdport }
>>
>> where $1 is ip or ip6, $myproto is udp or tcp, $tmpsport port or range of
>> port to redirect, $myaddr is destination ip. $tmpdport can be equal or a
>> different value from $tmpsport
>>
>> Finally rules
>>
>> nft add rule ip nat prerouting ip daddr == $myaddripv4 dnat tcp dport
>> map @fwdtoip_tcp.$IFACE : tcp dport map @fwdtoport_tcp.$IFACE
>> nft add rule ip nat prerouting ip daddr == $myaddripv4 dnat udp dport
>> map @fwdtoip_udp.$IFACE : udp dport map @fwdtoport_udp.$IFACE
>> nft add rule ip nat prerouting ip daddr == $myaddripv4 meta l4proto
>> tcp dnat to : tcp dport map @redirect_tcp.$IFACE
>> nft add rule ip nat prerouting ip daddr == $myaddripv4 meta l4proto
>> udp dnat to : udp dport map @redirect_udp.$IFACE
>>
>> This works perfectly with single ports but as soon as I want to redirect a
>> range of ports it fail.
>>
>> Where is my mistake ? Is it to complicate to achieve something which should
>> be easy ?
> You require nftables 1.0.0 for the snippet below:
>
> table ip nat {
>          map fwdtoip_th {
>                  type ipv4_addr . inet_service : interval ipv4_addr . inet_service
>                  flags interval
>                  elements = { 1.2.3.4 . 10000-20000 : 192.168.3.4 . 30000-40000 }
>          }
>
>          chain prerouting {
>                  type nat hook prerouting priority dstnat; policy accept;
>                  meta l4proto { tcp, udp } dnat to ip daddr . th dport map @fwdtoip_th
>          }
> }

I can't get it, map is OK but creating rule fail

map in nat prerouting:

map fwdtoip_th {
         type ipv4_addr . inet_service : interval ipv4_addr . inet_service
         flags interval
         elements = { 192.168.10.24 . 58194-58198 : 192.168.10.254 . 
58194-58198 }
     }

Now I add the rule

sudo nft add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip 
daddr . th dport map @fwdtoip_th ; from your example

and error is

Error: datatype mismatch: expected IPv4 address, expression has type 
concatenation of (IPv4 address, internet network service)
add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip daddr . 
th dport map @fwdtoip_th

OK, after to ip should be the daddr so I insert it

sudo nft add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip 
daddr daddr . th dport map @fwdtoip_th

and error is

Error: syntax error, unexpected newline
add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip daddr 
daddr . th dport map @fwdtoip_th

What's wrong ?

Thanks for your help

-- 
Daniel
