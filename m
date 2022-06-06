From: "Alov, Igor" <alov.igor@gmail.com>
Subject: Re: mixed address family sets and rules in nft
Date: Mon, 6 Jun 2022 12:00:42 +0300
Message-ID: <11887a4a-7a1d-a2a6-79cf-7c61738c2de0@gmail.com>
References: <YptiDLW0raHPYCgg@torres.zugschlus.de>
 <87r144mra8.fsf@alfa.kjonca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=SB132vCv95i+dFIEP/xPYrc58NfQEi4WEtJXQzz5GNU=;
        b=bRHtQ1orCtTq9MpzfbG7G7VeX73qBN2W2xoiXEXZTRSGwXvO2FHY7O8RIwR0SU7ZAC
         jO3mAckCxGbXfeQAapJ2JOyys1+BNUxdp0vNmFnRZNH0bYgz/R2qVhbNO30SDQX20zzT
         qHeAaR2pJ9NZQR+Cnv0K/DN87UlF9hKoo6BpX5hKq3wMZZUQM1vgzN5J1pLPnkP87LR7
         xwW24xTtQlZutfysbD0AwBWmyc8KAkElls3vw5jJUNpp7gA5+BN4+3TTQmLO6hqcT+Nc
         NatDAstvD4MB1zvW3PEUF6UzvqhssLcJL3V6OhMJsULS8A67U0gZg3BCIjt2XbcnGar4
         JDnA==
Content-Language: en-US
In-Reply-To: <87r144mra8.fsf@alfa.kjonca>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Kamil_Jo=c5=84ca?= <kjonca@op.pl>, netfilter@vger.kernel.org

On 04.06.2022 17:34, Kamil Jońca wrote:
> --8<---------------cut here---------------start------------->8---
> tcp dport ssh ip saddr $host_6 accept;
> --8<---------------cut here---------------end--------------->8---
>

Bear in mind, you should use ip6 whenever you want filtering V6 addresses
tcp dport ssh ip6 saddr $host_6 accept;

On 04.06.2022 17:34, Kamil Jońca wrote:
> Marc Haber <mh+netfilter@zugschlus.de> writes:
>
>> Hi,
>>
>> I am somewhat a newbie to nft, but I have been doing Linux packet
>> filtering for way more than 20 years, starting with ipfwadm back in 1997
>> or 1998.
>>
>> In nft, I would like to be able to write something along the lines of
>>
>> |@@def $host = (85.214.160.151 2a01:238:42bc:a101::2:100)
>> |
>> |chain INPUT saddr $host proto tcp dport 22 ACCEPT
> I think that strictly speaking this (=mixing ipv6 and ipv4 in one
> set[1]) is not possible.
>
> but there is no problem separately (as you probably know this)
>
> --8<---------------cut here---------------start------------->8---
> define host_4 = { 85.214.160.151 , .. and other hosts.. }
> define host_6 = { 2a01:238:42bc:a101::2:100 , and other hosts }
>
> tcp dport ssh ip saddr $host_4 accept;
> tcp dport ssh ip saddr $host_6 accept;
> --8<---------------cut here---------------end--------------->8---
>
> When you talking about "hundreds" of addresses - you probably will need
> to use some kind of script to split ipv6/ipv4 addresses.
> Or use named set and manipulate them separately on the fly.
>
>
> KJ
>
> [1] - i know that ipv4 space is mapped into some subset of ipv6
>
>
>

-- 
With Best Regards
Alov, igor

