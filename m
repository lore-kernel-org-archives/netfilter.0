From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Why aren't INPUT and FORWARD chains available to a
 locally-generated packet?
Date: Wed, 11 Aug 2021 16:31:59 +0200
Message-ID: <ac4eed88-b4e0-353d-42e4-17f92418bad9@thelounge.net>
References: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Harry S <simonsharry@gmail.com>, netfilter@vger.kernel.org



Am 11.08.21 um 16:12 schrieb Harry S:
> Hello,
> 
> I'm unable to understand why in Netfilter there are no INPUT versus
> FORWARD chain choices right after the packet has traversed the OUTPUT
> chain? Currently, a locally-generated packet goes straight from OUTPUT
> to POSTROUTING!
> 
> Let's say a process on a router host generates a packet. This packet
> goes to the OUTPUT chain, following which a routing decision is made.
> Now, this packet could be destined either for the loopback interface,
> or for one of the host's many ethernet interfaces. If so, why
> shouldn't Netfilter bring the packet to the same INPUT / FORWARD
> decision-fork in the path that exists for an incoming packet soon
> after it has crossed PREROUTING?

because it did not enter from the network nor is it forwarded which 
means you are a middlebox
