From: "david@hajes.org" <david@hajes.org>
Subject: Re: Matching streaming services
Date: Wed, 6 Jan 2021 19:44:37 +0100
Message-ID: <43dc8a26-faa8-a0b7-bd2d-065e2e29aa96@hajes.org>
References: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1609958679; bh=9oHzHaNtkZBmp6u0tcWNjkUPZJGkpYo2Jzyw+IvVzW4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=a0pVEsYv7tAIxSzOvtRG130ih8vnrmDtSotsblTYaI74TUHtv7y4f089BSs5fcyas
         JmGwHo0vXkAsuWtlelRb5G1K/vVhYy0R7NqmN3TB+xL2x3vg+V8jmy63naNu0yKdd8
         caiu8UVyseFfRMkYZemgyh7qMFZ3JnfI/y2wxueGLYjWwKZNHLY5d8xZB6eyTy/B6F
         7yrFUV5A14MLw2vwSxedfvjdldwV8xJVjlKV71kq19f/XnnvK/WxxrNqc6xxbBXEh0
         QmJG2eMMsYfl2iBrNiR0iAYtdtK+WGpqCASoAEsAGvCbNV+ganR3BkGtClHjzWegaa
         GPJkiQbe7fasw==
In-Reply-To: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On Mikrotik routers there is possibility of burst rate setting that 
determines whether it is simple web surfing or continuos data stream.

I think it is possible also in iptables and may be also in 
nftables...unsure, whether you need some additional modules or not.


On 06/01/2021 19:05, Nikolai Lusan wrote:
> Hi,
>
> I have been looking for a way to differentiate traffic from streaming
> services (Netflix, Amazon Prime, <insert_locally_available_service>)
> from other https traffic, with not much luck. The goal is to add rules
> to nftables and tc to ensure quality while allowing the rest of the
> link to function normally.
>
> I tried using tcpdump to see if there was something in the packets that
> I could use, but they look like any other bit of https traffic.
>
> Does anyone have a method for determining which http/https traffic is
> streaming video, and which is not?
>
> Thanks
 >

