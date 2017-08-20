From: khawar shehzad <shehzad.khawar@gmail.com>
Subject: Re: Why can't we use DNAT in the INPUT Chain?
Date: Sun, 20 Aug 2017 08:31:29 +0100
Message-ID: <f93751b4-db84-1e4b-0a79-3a58424b787f@gmail.com>
References: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
 <20170819132827.GY2027@harrier.slackbuilds.org>
 <6ae93686-46d2-416e-b736-ca6e7fa45231@gmail.com>
 <8980c2d3-8a82-651f-2553-8e15fbebfec8@plouf.fr.eu.org>
 <20170820021515.GA3396@dimstar.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=JVeU7FUrxRXt8PwUWsldudK9n3nGi6C5mGAaPv6UkYI=;
        b=odvgFFGL+OtgWu/89fX+aPM1XM+xbVf/ivIrJJvaKfywATht2ihHZMrUfU7+LDdjhu
         dEfuzpTwmacifDGocj4aoD7xLoCCbb+0GD2JhydPCvvY8pJDS9G1vxpvbx7nxrCzKQ4w
         0HqPJT6IwdgqAYJHQWmNRWTXE9wTx54qUqD4EobxMh0LzhjToJ+ss54BDk0X3XRYMtGD
         i3OQ3sumJBaJpebm6VVd7QVziyH1EEjTv1apYmkpkOOcQKftJeMz3Cou+QqygBBkhHI1
         DyB7RI/lB3m1AhEinyFjv33GBxtQ70QjcjFwUlr50KDOwiOMExmmYP6c9o3hzmml/Ykn
         ir3w==
In-Reply-To: <20170820021515.GA3396@dimstar.local.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

So, the question is: Can we FILTER packets (in my case accepting packets 
which have a specific source IPv6 Addresses) before doing NAT in the 
same box/machine/server (using iptables or nftables)?


On 8/20/2017 3:15 AM, Duncan Roe wrote:
> On Sat, Aug 19, 2017 at 07:07:41PM +0200, Pascal Hambourg wrote:
>> Le 19/08/2017 à 16:16, khawar shehzad a écrit :
> [SNIP]
>>> My solution is like the following, which is not working.
>>>
>>> table ip6 natcap {
>>>           map natcap_vmap {
>>>                   type ipv6_addr . ipv6_addr : verdict
>>>                   elements = { 2001::20 . 2001::1:0:0:2 : accept}
>>>           }
>>>           chain prerouting_filter {
>>>                   type filter hook prerouting priority -101; policy drop;
>>>                   ip6 saddr . ip6 daddr vmap @natcap_vmap
>>>           }
>> (...)
>>
>> What is this syntax ? This is not iptables.
> It's nftables, the reason I joined this list (to get my head around nftables ;)
>
> Cheers ... Duncan.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

