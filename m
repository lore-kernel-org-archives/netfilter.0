From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Best hardware platform for routing/firewalling?
Date: Fri, 30 Jan 2009 13:28:02 +0100
Message-ID: <1233318482.21474.18.camel@enterprise.ims-firmen.de>
References: <4982E7F7.6050500@redpill-linpro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982E7F7.6050500@redpill-linpro.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tore Anderson <tore.anderson@redpill-linpro.com>
Cc: netfilter@vger.kernel.org

On Fri, 2009-01-30 at 12:43 +0100, Tore Anderson wrote:
> Hey list,
> 
> does anyone have an opinion on what's the better-performing/suited
> hardware platform for routing and stateful firewalling with iptables;
> AMD Opteron or Intel Xeon?  I'm need something that can sustain high
> pps/bps numbers with as low latency as possible.

Harald gave a talk about that 2 years ago, maybe it's still
somewhat applicable:

http://www.heinlein-support.de/upload/slac/network_performance.pdf

Also you might want to contact the guys from the Bifrost
distribution:

http://bifrost.slu.se/index.en.html

They seem to be testing for this sort of performance regularly,
and I've gotten hold of some of there stats last year thanks
to the help of a friendly Dane:

http://robur.slu.se/Linux/net-development/experiments/2008/080623.tyan2927

I've also done some rather unscientific tests myself and apart from best
sticking with the two onboard PCIe Gigabit NICs (Intel, Broadcom) of
quality server boards and getting the best main memory performance
you can get hold of, the main thing seems to be L2/L3 cache size,
so in my tests Intels current CPU line slightly outperformed
current Opterons last summer, but traditionally most people advised
the use of Opterons because of there better SMP memory performance.

But I was only interested in 1GiE-NICs tied to one CPU core each
at the time, so this might be meaningless in a multiqueue scenario
with 10GiE NICs.


