From: Tom <tom@then.fr>
Subject: Re: NAT, DROP and walled-gardens (~= captive portal)
Date: Tue, 15 Jan 2013 21:18:40 +1000
Message-ID: <50F53B10.7050305@then.fr>
References: <201301150131.52465.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201301150131.52465.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

Re,

>> *Question*
>> Now, as you know we cannot DROP anymore in a NAT table. Therefore my
>> gardens are useless because I cannot drop at the end anymore. For the
>> moment I really don't see how I can easily have the same behaviour than
>> before. I can see a possible solution with more chains that would
>> involve the software to iptables -A to different chains which I'd like
>> to avoid :)

> If you cannot rely on default policy, then rely on active policy.
It is too bad you can't setup a default policy (-P) for your own chains. 
It would have been too easy otherwise :)

> Pick an unused bit in packet MARKs; say it's bit 32 (mask 80000000). Have INPUT,
> OUTPUT and FORWARD chains in nat end with a rule to set the high-order bit in
> the packet's MARK; the assumption is that allowed packets will have caused a
> return before reaching the end of these chains. Then in INPUT, OUTPUT and
> FORWARD in filter, you first check that bit; if set, drop the packet.
I thought I could only mark in the mangle table and not in the nat 
tables ? I will have to read the man again.

A solution, I am using at the moment is to DNAT to an IP I am 
"blackholing" (ip route add blackhole). It's ugly and it works for now 
but I am after a better and neater solution.

Thomas
