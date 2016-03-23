From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Packets (sometimes) not marked as RELATED/ESTABLISHED
Date: Wed, 23 Mar 2016 21:17:24 +0100
Message-ID: <56F2F9D4.7040109@chello.at>
References: <20160322185530.GA3152@anthem.async.com.br>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160322185530.GA3152@anthem.async.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Robottom Reis <kiko@acm.org>, netfilter@vger.kernel.org

On 22.03.2016 19:55, Christian Robottom Reis wrote:
> Hello there,
>
>      In periodically looking at my firewall logs I've always noticed that
> from time to time a certain pattern will show up in my logs which
> indicates that a legitimate stream which should have been marked
> RELATED/ESTABLISHED isn't. I have the following rules set up to allow
> related incoming traffic:
>
>      -A INPUT -i eth3 -p tcp -m tcp --dport 10000:65535
>          -m state --state RELATED,ESTABLISHED -j ACCEPT
>      -A INPUT -i eth3 -p tcp -m tcp --sport 10000:65535
>          -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> AIUI this is what allows the response from a website request to be
> targeted ACCEPT in the INPUT chain. However, my logs show that sometimes
> this doesn't work. Here's a recent example:
[...]

Hello,

try to drop --state INVALID and check if you still see them.

Best regards,
Mart

