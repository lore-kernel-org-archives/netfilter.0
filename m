From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: conntrackd internal cache growing indefinitely in active-active
 setup
Date: Mon, 11 Oct 2021 14:27:51 +0200
Message-ID: <b686a9f6-7147-63bf-5db8-ae9214b854a5@netfilter.org>
References: <CANQxXxoHEb=v8WoFPsr29cNPBYo5NYAOH4UoPNkDUX8DRk_jrg@mail.gmail.com>
 <YUkvvO3HnXVJiV+R@salvia>
 <CANQxXxpDvsyZ-LGd1tYx8xBwM+JJ09NyBBZ=X8PRtiH72G+0Vw@mail.gmail.com>
 <CANQxXxqt48dD2kUSj8YYicKfvSKWtgi-RQX1=OU8p02uyt157A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANQxXxqt48dD2kUSj8YYicKfvSKWtgi-RQX1=OU8p02uyt157A@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Mercer <matt.mercer@menlosecurity.com>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

On 10/4/21 9:07 PM, Matt Mercer wrote:
> Hi Pablo,
> 
> We tested a very silly patch to internal_cache_ct_event_del() that
> skips the CTD_ORIGIN_INJECT check:
> 

Hi Matt,

wanted to chime in to confirm that I've been experiencing the same issue you're 
describing.

There were only 2 differences in our setup compared to yours:
* both internal & external caches were disabled
* using TCP as transport method

I had problems debugging the setup, because the firewall was a live system, 
receiving 6Gbps of traffic. Obtaining a clear pattern was difficult.
I couldn't replicate the problem when replicating the setup on a system with 
more "manageable" traffic. So I only observed the bug when conntrackd was under 
high load (which probably means: under "real world" traffic patterns).

Eventually lost my time budget to work on this (and interest) and moved on...

So, just wanted to confirm that this bug exists, thanks for the report!
We should probably track something on https://bugzilla.netfilter.org/ for the 
time being.
