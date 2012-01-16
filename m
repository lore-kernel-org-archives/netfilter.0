From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd high cpu usage
Date: Mon, 16 Jan 2012 12:28:07 +0100
Message-ID: <20120116112807.GA11934@1984>
References: <CADdPHGu4WFrVantzmr6rn6jvPkoxmxPMdOrPzSkRYKMbbtZWKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADdPHGu4WFrVantzmr6rn6jvPkoxmxPMdOrPzSkRYKMbbtZWKQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Majer <stefan.majer@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Stefan,

On Mon, Jan 09, 2012 at 07:49:55PM +0100, Stefan Majer wrote:
> Hi,
> 
> we have 2 8core Xeon Boxes with 2 Intel X520 10GBit Adapter running
> rhel 6.1 as redundant firewall.

Interesting setup. So far, the reports of conntrackd usage that
I've received are deployments with 1GBit NICs and smaller machines
(up to 2-4 cores).

> On every node we have conntrackd installed with a FTFW mode, we
> synchronize all states.
> Synchronization is made over multicast on a dedicated vlan interface.
> The Firewall itself actually have around 300 vlans active.
> 
> Actually we see permanent ~400 new connections/sec with peaks at 800
> conn/sec.

I've been abled to reach up to 20000 sessions/sec with 6 years old
hardward (dual core, 2.4GHz, 1Gbit links). I know people that
got better results in more modern hardware.

You may want to enable the reliable synchronization option in
conntrackd. With it, conntrackd starts dropping packets if the
synchronization does not happen timely.

> With this load the conntrackd consumes about 15 - 25 % CPU from one
> CPU on the active side and about 5% CPU usage on the passive side.
> Is this expected ?

What tool are you using to obtain those measurements?

top is fine for estimated load, but it's inaccurate.

Still, full state synchronization is a resource consuming task

> This is our Testing environment, and we expect much higher (~10 - 20
> times) connection rates.
> 
> This would not be possible with the current setup, as this would be
> cpu bound on the conntrackd, as this daemon is single threaded.
> Is there any way to make this process faster, eg. make the
> synchronization multi threaded ?

There several things that we can do to improve conntrackd performance
(from the development side):

1) port conntrackd to libmnl to use recvmmsg system call.
2) implement netlink multi-queue, we discussed this during the
NFWS2010. The idea is to implement something similar to the existing
nfqueue multiqueue load balancing (see --queue-balance in iptables's
NFQUEUE). It's similar to multi-threading that you're proposing.
3) implement batching for the commit operation.

So far, nobody has come to show interest on these tasks. Recent
enhancements for conntrackd have focused on adding new features.

> I already did some perf analysis, but they didnt gave us much light.

What tools are you using?

I suggest you to have a look at Willy Tarreau's tool (httpterm). You
may want to use my http client instead of inject32.

http://1984.lsi.us.es/git/http-client-benchmark/
