From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: Recommended hardware for iptables based firewall/router
Date: Sun, 09 Nov 2014 02:11:27 +0100
Message-ID: <545EBF3F.60801@conversis.de>
References: <5455AA40.6050302@conversis.de> <201411021738.56897.neal.p.murphy@alum.wpi.edu> <545EB804.3080903@conversis.de> <CAJygYd07-y0bDSr8THXWjNEW-e1rK5ZhGiE8aeJ_jXYJpFiL2A@mail.gmail.com> <CAJygYd1FOu7XPbP00i_jjpMm_zWnuYJAiKXudBbQgjwBQ1rxGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd1FOu7XPbP00i_jjpMm_zWnuYJAiKXudBbQgjwBQ1rxGQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yucong Sun <sunyucong@gmail.com>, Neal Murphy <neal.p.murphy@alum.wpi.edu>, netfilter@vger.kernel.org

On 09.11.2014 01:49, Yucong Sun wrote:
> Dennis Jacobfeuerborn <dennisml@conversis.de>
> 
> The EdgeRouter 's asic couldn't handle all use cases ,  Having some
> special rule will make it go to "offload" disabled mode.  You should
> research if that's the problem.

Yes that seems to be the problem. Unfortunately the only things we use
are vlan's and iptables+conntrack which I consider the be fairly
standard features required for basic firewalling. I the system cannot
handle traffic at a decent rate with these features than its hardware
seems to be ill-spec'ed for its purpose.

Things got better when I was able to enable vlan offloading...until the
cpu stalled and the system rebooted itself. Apparently the offloading is
unstable.

None of this inspires confidence in a Product that is specifically
advertised as a router/firewall that is sold with 8 Gbit ports and
promises to handle 2 Mio+ pps.

> As for Linux as a router, the key thing you want to test for is PPS,
> not BPS.  Commodity hardware should be able to handle up to 1Mpps. Buy
> the best Xeon within your budget. Don't bother look at anything else.
> (if your project is serious and need to survive a ddos attack)

For now I have chosen a 2 quad-core cpu Xeon system I already have here
and that has multiqueue capable Intel nics and have configured the
appropriate irq affinity and XPS so each queue is handled by a dedicated
core. I think this should provide relatively decent performance.

Regards,
  Dennis
