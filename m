From: "david@hajes.org" <david@hajes.org>
Subject: Re: Matching streaming services
Date: Wed, 6 Jan 2021 20:29:13 +0100
Message-ID: <56547ef1-ea5a-ebb6-30a4-1c12345571e1@hajes.org>
References: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
 <43dc8a26-faa8-a0b7-bd2d-065e2e29aa96@hajes.org>
 <7ea6241b-57f6-2204-a6a0-c245f1fe7521@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1609961355; bh=m125eX4GBGO286sJgi+aQ8FJ64ol0x8rtcgQbag4vjU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=mfakNlX1hiWsW4cRuvWxqH35XL0/Kub+tSBt9zS95O1QJo49yeN+mR9CjAjK4iv4y
         7HQhP2e+7NHb0GjQxAcRFopMQgFrLhAWHzxuVKnvws36by2ECZYu07TkhUlUOP84EM
         QE4kxRnN6Ehae9T2l8piLnyCk3YeXJTvCNqCdltlxvioQCglgahLreQbSJopg2Fds3
         B6Va24optNUyKVcMgcHMtSKTzXaeo6/nrF+QzH3hh+h1KdYZ7+xQ/LlsMJFyy26yl4
         1UiFcjY/5oi9EyF5uF5vtnidvcqXTyJ5kjT7/0wdjO0a522APYxR06XcSwy81mWt4H
         QtrhD/rELhKSg==
In-Reply-To: <7ea6241b-57f6-2204-a6a0-c245f1fe7521@thelounge.net>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


> and how do you imagine distinct between a large download which can 
> finished one hour later and nobody cares or streaming?
>
> and whenever you manage it - it's something that need to be fixed and 
> changed ASAP sou will have a moving target
>
Streaming service never runs flat out, you have to observe data rates. 
Amazon max. data rate is barely 20Mbps for example.

Whereas data download usually saturates whole line. It is not perfect 
QoS but it worked on 500Mbps cable Internet for me.

Mikrotik also have so called "Layer 7" filtering designed specially for 
filtering per service requests that requires lots of resources to 
inspect packets.

I think netfilter allows such filtering as well.

