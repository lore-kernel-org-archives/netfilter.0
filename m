From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: netfilter performance dependent on arch
Date: Tue, 7 Feb 2012 19:54:11 +0100
Message-ID: <20120207195411.05a70f67@catus>
References: <20120207183453.522fa74b@catus>
	<4F316C1C.5020400@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F316C1C.5020400@hp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rick Jones <rick.jones2@hp.com>, netfilter@vger.kernel.org

>> Can anyone point me to some performance comparison of netfilter on
>> i686 and x86_64? I have a few linux routers doing a lot of
>> firewalling and QoS. Currently those routers use i686 arch on 64-bit
>> hardware. Would I notice any performance gain after moving to 64-bit
>> kernel?

>Apart from the obvious "Try it on your workload and see." suggestion, 
>you could I suppose make the assumption that a netfilter workload
>looks similar to one or more components of something like 

Thanks for the response. Anyway moments ago I found answer to the first
question on vyatta forum here:
http://www.vyatta.org/forum/viewtopic.php?t=823&sid=3cec85f2cf7866ca26040ec491415ee1

shemminger "The researchers at Uppsla University who are measuring 10G
routing performance found that 64bit kernel is slower than 32bit kernel
for routing. Most likely the increased code size caused a larger number
of CPU cache misses. 64 bit would be an advantage if you are trying to
run lots of services."

DaveRoberts "This result is actually not too surprising. Networking code
is typically very cache sensitive. This gets worse with 64-bit. If
you're running code that uses data structures with lots of pointers
(which networking code often has) and you don't needed the expanded
address space, then you're wasting half your d-cache with 32 upper bits
of zeros. While the additional registers are a benefit, they aren't
enough to make up for the increased cache miss rate.

But as you say, without knowing the compiler, optimizer, and
instrumenting the heck out of the code with all the hardware analysis
counters, it's difficult to say what's really going on. All that is on
our list of things to do over time. The main takeaway is that it's
definitely not a slam dunk one way or another."

Best regards,
Marek Kierdelewicz
