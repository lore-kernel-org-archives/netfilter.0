From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Matching streaming services
Date: Wed, 6 Jan 2021 19:18:02 +0100
Message-ID: <ae566d41-2114-536e-9f86-6392a0e4ef76@thelounge.net>
References: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: nikolai@lusan.id.au, netfilter@vger.kernel.org



Am 06.01.21 um 19:05 schrieb Nikolai Lusan:
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

the point of https is to clap on dirty fingers of anyone in the middle 
of the connection, no matter if his intention is good or bad

if you can distinct the content of https traffic we have a problem houston
