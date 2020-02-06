From: "" <kfm@plushkava.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] does redirect accept daddr?
Date: Thu, 6 Feb 2020 07:29:31 +0000
Message-ID: <235762f1-4d73-1b5d-6e5d-eaf59cb8e916@plushkava.net>
References: <d7f31893-feaa-e138-ad80-95a37d275e7b@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=j
        ZA8QRqEE97QmUZp/UMuIf3CUR1JiQXuPU0VRBBUHIc=; b=Zm2tImWC5ZopK+iE2
        2oilBjEB42dpKXJNriGELXm1tbdhx6/N4VKqDkpJYdCzlG6dt8pxogw3PFvohElo
        9JWI8AJzKAWUtBr8YYflDRK8kHmitbP39a1FXQPspeGqoMiZ6pvypJVDiPKpnh3k
        v1am66wwTnUh04cyFGwVyYI7TIAKHCLDBg4CMwhp6xkQvevtVlix4tU26z64ahGm
        NvPiDymDI2/59EmazIwgiAGo/4AN6nY7CrPyPjhwrznUqMa1KZNT324X9qdVv0Z1
        IIwHyhbdldjvZg/6COXT0foTP+h/mVm5h0nqmGBbMPP0iPrGeXxGCiOdiG4JX4aV
        +6Exw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=jZA8QRqEE97QmUZp/UMuIf3CUR1JiQXuPU0VRBBUH
        Ic=; b=y/3rOe+jWb8/U8pLgDqidAedEVIGZSguc8+FO8goYnf990AOGLxNSJpIG
        0J4tox6go4s06gFtkJBzwwA+JyZc4WSdIY3Jiifg9C1DcjeFAjFXS2y+q5yhVfVx
        J3jAumuq2UzruZJdvQDjp7O46JbpDk4I69jN6FL6Z2aWLWUDefemMFpCJy8IUL5A
        WkdJdbN5Xob1U/SAJVE1houXw/pA2sK3RAxE3st0s/g/hQvIP6ojTMKyhI/m4Ckr
        C67IPq8lACuN4roCEAeuL5v2KVv807z/HLn0+p6X5U345nNyNchD35hrQed4d5oN
        muIhzj/HhF/qgL0isC39TTWPMEwlw==
In-Reply-To: <d7f31893-feaa-e138-ad80-95a37d275e7b@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 06/02/2020 02:01, ѽ҉ᶬḳ℠ wrote:
> The aim is to prevent DNS query hijacking (e.g. as Android tries)
> 
> table nat {
>      chain prerouting    { oif br-lan ip daddr != 192.168.112.12 udp 
> dport 53 redirect to ip daddr 192.168.112.12;  }
> }
> 
> hooks/prio is otherwise defined but it prints this ominous error:
> 
> Error: syntax error, unexpected semicolon

The "redirect" statement results in the packet being directed to the 
primary address of the interface on which it was received. That's 
non-negotiable. As such, "ip daddr" is not supported as an aspect of its 
grammar. Indeed, that's not even how it works for the "dnat" statement.

For instance, these are valid:

    redirect
    redirect to :8080

This is invalid:

    redirect to 1.2.3.4:8080

However, these are valid:

    dnat to 1.2.3.4
    dnat to 1.2.3.4:8080

Once you address this, any remaining errors should begin to make more sense.

> 
> Removing the offending semicolon it then prints:
> 
> Error: syntax error, unexpected newline
> 
> It is a bit difficult to understand what the issue really is.

Granted, the initial error was not particularly helpful.

> 
> ----
> 
> Alternatively, this
> 
> table nat {
>      chain prerouting    {  oif br-lan ip daddr != 192.168.112.12 udp 
> dport 53 ip daddr set 192.168.112.12; }
> }

As I understand it, "ip daddr set" is permitted but is effectively a 
form of stateless DNAT. So, unlike "dnat", the conntrack subsystem won't 
automatically handle the rewriting of the source address along the 
inverse path. If in any doubt, that's probably not what you want.

> 
> or a bit shorter even
> 
> table nat {
>      chain prerouting    {  oif br-lan ip daddr != 192.168.112.12 udp 
> dport 53 ip daddr 192.168.112.12; }
> }

This is a rule that will never match anything because it has a logical 
conjunction of two matches which are at odds.

     ip daddr != 192.168.112.12
     ip daddr 192.168.112.12

Both of these conditions cannot hold true simultaneously. Even if this 
were not the case, the rule would have no effect because there is no 
verdict, nor is any other course of action taken.

> 
> does not throw an error but I am not sure whether that achieves the in 
> the context of the table?
-- 
Kerin Millar
