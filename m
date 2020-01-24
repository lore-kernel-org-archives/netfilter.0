From: "" <kfm@plushkava.net>
Subject: Re: nft icmp type all?
Date: Fri, 24 Jan 2020 21:29:01 +0000
Message-ID: <ea408bc8-2171-d329-5606-62dbebbe428c@plushkava.net>
References: <a0fa4c0b-d8d8-752b-6926-753720a00796@heinlein-support.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=+
        NUF21mt8Rkt6Nvku9m1Zlaxcdyto4ipAOZd896zACk=; b=KEdveCDvWbcvvwCnb
        /+L9lN1QaJeekMNoFWEyKWskSBdStEciAoToYydA7EaAxhfnl5BV4vuBsRa7TOjZ
        ArJjH01XVBzCWBUEEG403GBLoZ5HMHo+EWR5j6vBt3Ly9ukOghuu2gcD5+L+kZug
        cC1HT7Fx1OA0EgWeHR6TYWD2UOtEv8+iP+gtocTOdCPwLI5ZLg488SoKaUZtapCs
        k2KcElMJ331Ge08SREUop1SsZTDZCcSQQs0zba3xv8sc7dBwnUQQGGuuLZxPwL4e
        2u9Gd+e6h5kvo190vJFu4DY4EbGXT6m23jEPpk9yIKdN3Nis0lYuC462RdpMvt0c
        +6EdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=+NUF21mt8Rkt6Nvku9m1Zlaxcdyto4ipAOZd896zA
        Ck=; b=WwfqcaR2a/IZ0tl2spELJlMXJqeK3WhgLB+p1kzELXINjciMRYNwZPMV8
        fP2tD0eqVwFi74Ifc0ZygTHP27m4cxIAu1IfF7fSQ6AoF+rfl6B9QGyejCaA+YOq
        kEcj85mjeLIO9IWGiVBmvPom85CxHQA7YRWdICTQRJErOyL9t3WNqC2u/m3Sfpyi
        2vL0UmjzooW3QTTCccMCNcush8NuUuFi2Fig+DDESPhkOQQLBL9q/oWXwp9kc5X9
        Gc1XYbzJcSvoPBfd8V24J6aH0bA8ODQcf6yyasmdxIxCRnwfqmhCo+OPHJlRH+0p
        q6wpumsjLo6heVccDzAzG9jY2SMjQ==
In-Reply-To: <a0fa4c0b-d8d8-752b-6926-753720a00796@heinlein-support.de>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 24/01/2020 21:16, Robert Sander wrote:
> Hi,
> 
> how do I specify a rule to match all ICMP packages?
> 
> nft add rule ip filter input icmp accept
> 
> does not work.

nft add rule ip filter input meta l4proto icmp accept

-- 
Kerin Millar
