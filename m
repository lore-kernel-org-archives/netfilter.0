From: Kerin Millar <kerframil@gmail.com>
Subject: Re: Conntrackd entries timing out
Date: Sun, 04 Mar 2012 05:03:20 +0000
Message-ID: <jiut2p$t3m$1@dough.gmane.org>
References: <4ECE7F12.6080004@opendium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ECE7F12.6080004@opendium.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 24/11/2011 17:29, Steve Hill wrote:
>
> I'm configuring conntrackd to support an active/active pair of
> firewalls. I would like to keep them as synchronised as possible so am
> setting it up with FTFW mode and "DisableExternalCache On".
>
> I'm monitoring the connection tracker records on both hosts with
> "conntrack -L".
>
> If I send a single ping to something from firewall A, I correctly see
> the conntrack entry appear for that on both firewalls. Since the I only
> sent 1 ping, I see the timer on both ticking down from 30 seconds, after
> which the entry disappears from both firewalls - this bit seems fine.
>
> The problem I'm having is if I start a continuous ping from firewall A,
> sending 1 packet per second, I again see the conntrack entry appear on
> both firewalls as expected. However, whilst firewall A shows the timer
> sat at 30 seconds since it is regularly being reset by each packet,
> firewall B's connection again ticks down and is then removed. So now,
> the conntrack tables are unsynchronised - firewall A is still seeing the
> pings and keeps the conntrack entry alive whilst firewall B has removed
> the entry.
>
> If I turn the external cache on and monitor it with "conntrackd -e", it
> appears to behave correctly - the entry stays in the external cache so
> long as it it in firewall A's conntrack table.
>
> The only way I've found of keeping these machines correctly synchronised
> with the external cache disabled is to run "conntrackd -n" every few
> seconds on both hosts to force a resynchronisation, which does appear to
> reset the timers correctly.
>
> So I'm hoping someone is able to answer these questions:
> 1. Is this a bug or is there something I'm missing about the way it is
> expected to work?
> 2. Is running "conntrackd -n" on both machines every few seconds a safe
> and feasible workaround, or am I asking for trouble?

You could use conntrack -E -p icmp to monitor the propagated events in 
both cases. That is, with and without the external cache active. In my 
case, I use the external cache and the lifecycle of the ICMP state is as 
thus:-

[NEW] src=x.x.x.x  dst=8.8.8.8 type=8 code=0 id=9243 [UNREPLIED]
       dst=196.34.134.87 type=0 code=0 id=9243

[UPDATE] src=x.x.x.x dst=8.8.8.8 type=8 code=0 id=9243
          src=8.8.8.8 dst=x.x.x.x type=0 code=0 id=9243

Eventually, after terminating ping ...

[DESTROY] src=x.x.x.x dst=8.8.8.8 type=8 code=0 id=9243 src=8.8.8.8
           dst=x.x.x.x type=0 code=0 id=9243

Observing the behaviour where the cache is not active might help shed 
some light on the situation.

Cheers,

--Kerin

