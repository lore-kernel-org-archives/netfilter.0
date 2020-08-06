From: "" <kfm@plushkava.net>
Subject: Re: Correct syntax for dnat in inet table?
Date: Thu, 6 Aug 2020 12:27:51 +0100
Message-ID: <39eebfff-022b-7271-9c39-e7d8ca81c58a@plushkava.net>
References: <6D405016-FCB8-44C5-86CF-EE18A9F75839@plutonium24.de>
 <F31DCA98-C7C6-4C25-9B97-035E10C96ED0@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=r
        qTn4eSHJk2kefaVBJhH31MzQyWMnEOWeQjJ6m4WhVI=; b=TczqOPVqxvYckbfYd
        BR46q3M+fmjttYBthZ8v/uS1UwNmg4DtCNdo6bYcESVyzDkoKZN//pXffz+Ks9g0
        y/q0+JQu6JV9+Tb9IZ7NQlm2H6gyfjY2jkUcuQz9+Htl7BV7xHjM1TQwkV93Let1
        FLPE2xDkbFr1R98icETWocjCxR5vG99qLNUTyYToY9s0c6aRqYnWhElUOiXFLQSA
        pvFvF+G6E5G8fCdABrOLVCWCpCjRLyHf/L9mvR/ktDNCXSfR7vRVbU96HnNI0W0z
        xYgTlLzj02P9qm0A282dzPnjjHf2paE0WPxtW4n+ZsO7h00WIP/bnqIj2pLCF7VQ
        Ts/7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=rqTn4eSHJk2kefaVBJhH31MzQyWMnEOWeQjJ6m4Wh
        VI=; b=ZgCKYnrgABJRbjrz1KCFggfdnHAxnneIDLsv+qsgEw8o4uUOSUrsCzqGK
        E26sz5nUfT0kLSyo1cnVOr4X5t+hGp5pb/o8uPEnHhvVvLNNTpMexIhZbmaSGtvt
        DGShcI6bALjznUJGTAFxISwUQbN87HvPm7ur2H/7l22tN7d5nTZChQQ+vcMlFUW5
        6g4mYn8WQEks7WSg3VZ2LO1Fhg3cIc77U8Z8nIcXgW6rAam3xpsMqe0cE2S//wVO
        3ge4mydM5NEj+djmdGyr6IdZPBt2tnaDvU8rZPRLiz+iGGXO6Ikovs/I3x9/pMhB
        xjkTeQDKb3doSK0bdtC9Jr6je2ADQ==
In-Reply-To: <F31DCA98-C7C6-4C25-9B97-035E10C96ED0@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank-Ulrich Sommer <orofuhin@gmail.com>, netfilter@vger.kernel.org

On 05/08/2020 17:04, Frank-Ulrich Sommer wrote:
> 
> 
> Hello,
> 
> I'm using "nftables v0.9.0 (Fearless Fosdick)" on a Debian Buster based Raspberry Pi OS.
> 
> I'm getting syntax errors when trying to redirect a port to another host via nftables.conf with the two lines starting with "iif eth0.100". The file does not contain a complete setup because I removed all rules not related to the problem.
> 
> The first line produces "nftables.conf:10:41-42: Error: syntax error, unexpected to, expecting newline or semicolon". According to the manpage I would have expected the correct syntax for an inet table to be "...dnat ip to..."
> 
> The second line without "to" produces "nftables.conf:11:56-56: Error: syntax error, unexpected newline".

Both error messages are of poor quality.

> 
> What would be the correct syntax if I want e.g. to forward traffic to port 1234 to IPv4 123.123.123.123 in an inet table?
> 
> Here is the reduced nftables.conf causing these errors:
> 
> #!/usr/sbin/nft -f
> 
> flush ruleset
> 
> table inet myfilter {
> 
>    chain port_forwarding {
>      type nat hook prerouting priority 0; policy accept;
> 
>      iif eth0.100 tcp dport 1234 dnat ip to 123.123.123.123

"eth0.100" isn't a valid iface_index. Use iifname instead.

-- 
Kerin Millar
