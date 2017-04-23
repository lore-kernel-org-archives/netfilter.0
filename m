From: Robert White <rwhite@pobox.com>
Subject: Re: nftables: response of nft is rising
Date: Sun, 23 Apr 2017 14:36:55 +0000
Message-ID: <02882758-b8f8-417b-8244-356426c55c5d@pobox.com>
References: <CAB_+ZOv_5-Zq94ZczEMn4ThnXn6G4+QS0HQPqO1WapsqN6n4uA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAB_+ZOv_5-Zq94ZczEMn4ThnXn6G4+QS0HQPqO1WapsqN6n4uA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Meinhardt <alexander.meinhardt@gmail.com>, netfilter@vger.kernel.org

On 04/22/17 13:37, Alexander Meinhardt wrote:
> I have a standard ruleset including 4 sets, where each of them has
> dynamic content (ip blocklists) containing set1 450 entries, set2 250
> entries, set3 5 entries and set4 1 entry.

Is this day-one size or end-of-test size? e.g. are you saying you see
the sets with 706 entires to start, or that you start empty and
accumulated 506 entries? (or is it some other scenario

> Each set was created with "type ipv4_addr" and "flags interval".
> 
> After 3 days uptime, the response-time from "nft list table ip filter"
> (where "ip" is only ipv4 and "filter" the whole ruleset of ipv4) is
> approx 0.6s.

Aside from being potentially interesting, why do you care?

This isn't a snarky question, are you seeing some other performance
issues, like with actual packet clearing rates, or are you just noticing
that the ruleset dump is taking longer?

I'm pretty sure you are experiencing the normal effects of the context
switches required to get the set members out of the kernel one element
at a time. I don't see a bulk unload operation in the module operations
structure so the enumeration time for extracting large sets might take a
lot of time. Enumerating a set is way different that checking for
membership.

So if you dump the ruleset and then reload what you just dumped, does it
take the same, more, or less time to dump the ruleset a second time?

--Rob.



