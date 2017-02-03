From: zrm <zrm@trustiosity.com>
Subject: Re: dnat port range to single port, udp, between two local machines
 on a LAN
Date: Fri, 3 Feb 2017 15:19:07 -0500
Message-ID: <9adf1d44-a888-5aed-80f1-c19c9fedd31c@trustiosity.com>
References: <CAM9he-WzEXUf-oWa3yV6-raXudF6ce2TYn2qFbiq4xXDVx_5nw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1486153130; bh=fxxbFXY7v3MBTezEXmNUXY301xaPdSnoTB0pfrcvuXY=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=ya+GD8UrnB6UZDrYdzDO7o8xBgoa+lZcL7nBXL0ldh68KvkDT4jzU44rQcjMw/KuH
         8ev09u25O3LLJ7H9E4ZW+1xN26QhK2x1FRuMNUwHOCO/wOmwVwdG7+pPBKm59HjPtt
         rdGLFcdTTQ+VjA0yq4nDf7jJ7c8oz/ld6wZVKdrU=
In-Reply-To: <CAM9he-WzEXUf-oWa3yV6-raXudF6ce2TYn2qFbiq4xXDVx_5nw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Bostwick <bostwick.brian@gmail.com>, netfilter@vger.kernel.org

On 02/03/2017 11:04 AM, Brian Bostwick wrote:
> Thanks for the help! I realized that my goal is not attainable because
> I do not have control over the initial connection. I believe your
> suggestion would work if that weren't the case.
>
> However, I came across this picture, which seems misleading. It is an
> example of how not to use NAT, which is admittedly what I am doing,
> but it suggests I can change the destination. Can anyone confirm that
> it is just meant as an illustration of why this scenario is improper?
>
> http://inai.de/images/dnat-mistake.png

What the picture shows is DNAT of the destination IP address. What you 
are trying to do is DNAT/DNPT of only the destination port.

In the picture, the original packet goes to the DNAT host but the reply 
packet goes directly to the source host which prevents the DNAT host 
from translating it back.

In your case, the *original* packet goes directly to the destination 
host and the DNAT host has nothing to say about it at all.

You can actually fix the case in the picture by adding the SNAT rule. 
Then the traffic would look like this:

original packet:
src 1.3.3.7:1111 dst 1.3.3.8:2222 -> src 1.3.3.8:3333 dst 1.3.3.9:2222
reply packet:
src 1.3.3.9:2222 dst 1.3.3.8:3333 -> src 1.3.3.8:2222 dst 1.3.3.7:1111

Which is hideous and causes 1.3.3.9 to see the peer's IP as 1.3.3.8 
instead of 1.3.3.7, but the traffic actually gets there.

In your case there is nothing you can do from the DNAT host because it 
never even sees the packets.

The thing you could do is to change that. Put the source and destination 
hosts in different subnets so they always have to go through the router. 
Then you would only need the DNAT rule and both would see the correct IP 
addresses.
