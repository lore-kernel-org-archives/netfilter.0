From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Usefulness of xt_recent's "last seen" and "oldest_pkt" on a
 tickless system
Date: Sun, 11 Jan 2015 19:49:34 +0100 (CET)
Message-ID: <alpine.LSU.2.11.1501111925200.24030@nerf60.vanv.qr>
References: <alpine.LSU.2.11.1501111106300.616@nerf60.vanv.qr> <54B29C5A.3010708@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54B29C5A.3010708@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hagood <david.hagood@gmail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>


On Sunday 2015-01-11 16:52, David Hagood wrote:
> On 01/11/2015 04:23 AM, Jan Engelhardt wrote:
>>
>>> are just a count of the number of jiffies since boot. However, on a
>>> tickless kernel, there is really no well defined number of jiffies per
>>> second as far as I can tell
>>
>> You might want to have a look at
>> static void tick_do_update_jiffies64(ktime_t now) in
>> kernel/time/tick-sched.c ;-)
>
>I looked over the function in question, and it does not seem to
>address my points.

>there has to be some way to know what the conversion was at the time
>the packet was logged

Let me highlight the places in tick-sched.c:

	delta = ktime_sub(now, last_jiffies_update);
	ticks = ktime_divns(delta, incr);
	do_timer(++ticks);

jiffies gets incremented by as much as time has elapsed, which means
there is a linear mapping between monotonic time and jiffies, even
though the timer interrupts themselves can occur aperiodically.

And I would expect that (the other million LoC) were written such
that even after a long tickless period - IIRC davem was able to let
the timer not tick in excess of 30 minutes - an incoming event would
cause an update of jiffies before using the value, such as in the
network receive path (skbs may be timestamped here).


: 2) By inspection, my machine is running a jiffies
>per second value that varies between 2145 and 2150 jiffies per
>second from /proc/stat

/proc/stat contains no jiffies counter in 3.19, at least not that
I can spot.

The jifs/sec is set by CONFIG_HZ, for which a common kernel only
offers the compile-time choices of 100, 250, 300, 1000, not 2150.
If you find a value of 2150, you are probably looking at the wrong
value, or have a heavily modified custom kernel.


>1) It's a kernel only function. I am concerned about access from user space.
>(computed by reading the jiffies value

TTBONK, there is no reliable way for userspace to tell the value of
CONFIG_HZ, so yes, _showing_ jiffies in /proc/net/xt_recent is
useless - but at least you can compare the numbers against each other
(not that that seems useful, either).
