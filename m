From: Daniel <tech@tootai.net>
Subject: Re: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Tue, 28 Sep 2021 14:41:57 +0200
Message-ID: <82b7ac87-ace3-d235-4b7a-2890ed7705b6@tootai.net>
References: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
 <20210916092924.GB31336@salvia>
 <48e95c8a-2469-08dd-0620-55187252653c@tootai.net>
 <20210916125858.GA9451@salvia>
 <24b4d340-d951-103b-27d4-9bb97afd9c4c@tootai.net> <YUkjwU8YNmogNY8d@salvia>
 <e60b7109-c570-881f-3ba5-8496bf436559@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1632832918; bh=ap98JExqxC7m6qggxmhyUrwk2RDpypcUAfGKuPTf71U=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=ge3DDepBG51t6+8rPTDWTgsPTVAu1brv3Y79cQwEhkGt6RbaIQpy9VcXOsvXBd80c
         6LjWiuswrUpnnoEPZGWOa4FMRFPJGtZIs//woZ3YXxm2FO2Pgoh1eEuON4DguEI6Be
         Hyr6FuZ9CVKwJraeilGv/ygu69OSKslP80SFkr7Q=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1632832918; bh=ap98JExqxC7m6qggxmhyUrwk2RDpypcUAfGKuPTf71U=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=ge3DDepBG51t6+8rPTDWTgsPTVAu1brv3Y79cQwEhkGt6RbaIQpy9VcXOsvXBd80c
         6LjWiuswrUpnnoEPZGWOa4FMRFPJGtZIs//woZ3YXxm2FO2Pgoh1eEuON4DguEI6Be
         Hyr6FuZ9CVKwJraeilGv/ygu69OSKslP80SFkr7Q=
In-Reply-To: <e60b7109-c570-881f-3ba5-8496bf436559@tootai.net>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>



Le 28/09/2021 à 13:05, Daniel a écrit :
> Hi Pablo,
> 
> sorry for delay, I had to install 1.0.0 from snap on my Ubuntu 20.04.
> 
> Le 21/09/2021 à 02:13, Pablo Neira Ayuso a écrit :
> [...]
>> You require nftables 1.0.0 for the snippet below:
>>
>> table ip nat {
>>          map fwdtoip_th {
>>                  type ipv4_addr . inet_service : interval ipv4_addr . 
>> inet_service
>>                  flags interval
>>                  elements = { 1.2.3.4 . 10000-20000 : 192.168.3.4 . 
>> 30000-40000 }
>>          }
>>
>>          chain prerouting {
>>                  type nat hook prerouting priority dstnat; policy accept;
>>                  meta l4proto { tcp, udp } dnat to ip daddr . th dport 
>> map @fwdtoip_th
>>          }
>> }
> 
> I can't get it, map is OK but creating rule fail
> 
> map in nat prerouting:
> 
> map fwdtoip_th {
>          type ipv4_addr . inet_service : interval ipv4_addr . inet_service
>          flags interval
>          elements = { 192.168.10.24 . 58194-58198 : 192.168.10.254 . 
> 58194-58198 }
>      }
> 
> Now I add the rule
> 
> sudo nft add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip 
> daddr . th dport map @fwdtoip_th ; from your example
> 
> and error is
> 
> Error: datatype mismatch: expected IPv4 address, expression has type 
> concatenation of (IPv4 address, internet network service)
> add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip daddr . 
> th dport map @fwdtoip_th
> 
> OK, after to ip should be the daddr so I insert it
> 
> sudo nft add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip 
> daddr daddr . th dport map @fwdtoip_th
> 
> and error is
> 
> Error: syntax error, unexpected newline
> add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip daddr 
> daddr . th dport map @fwdtoip_th

Something is wrong when calling a named map (in this case). If I do

sudo nft add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip 
daddr . th dport map { 192.168.10.24 . 10000-20000 : 192.168.10.254 . 
3000-40000 }

everything is fine. But if I call the map like

sudo nft add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip 
daddr . th dport map @fwdtoip_th

I get

Error: datatype mismatch: expected IPv4 address, expression has type 
concatenation of (IPv4 address, internet network service)
add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip daddr . 
th dport map @fwdtoip_th

Expression recognize that map is a concatenation but not that the "to ip 
daddr . th dport" should also be treated as concatenation
-- 
Daniel
