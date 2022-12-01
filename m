From: Dave Osbourne <dave@osbourne.uk.eu.org>
Subject: Re: Which of these 2 rules will consume more CPU? Please guide.
Date: Thu, 1 Dec 2022 17:17:08 +0000
Message-ID: <e2788767-5f5c-3c94-9ff0-a25e7647c957@osbourne.uk.eu.org>
References: <c8a98a59-7ff1-6a2f-f579-d604848074d3@gmail.com>
 <em2a539bbd-3a83-48d0-8e9e-df4f6211c2e9@2c5303e8.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <em2a539bbd-3a83-48d0-8e9e-df4f6211c2e9@2c5303e8.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>


On 01/12/2022 12:31, Brskt wrote:
> Hi,
>
> Using mangle table means that in any case, even if the packet is in 
> the NEW or any other state, it's in the conntrack.
>
> The raw table is before mangle which does not have conntrack, it will 
> gain CPU usage and drop packets more efficiently.
>

Probably not relevant for the netfilter list, but I use a list (many) 
similar to this and found (if you're lookng for a L3) the "cheapest" IRO 
of latency/CPU is just to ip route add /xxxxx/ lo


Rgrds,
Dave
