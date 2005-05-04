From: Jason Opperisano <opie@817west.com>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Wed, 4 May 2005 12:39:48 -0400
Message-ID: <20050504163948.GA19878@bender.817west.com>
References: <4278C3DE.7010403@au-kbc.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4278C3DE.7010403@au-kbc.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, May 04, 2005 at 06:15:18PM +0530, bharathi wrote:
> Hi all,
>         I am planning to implement iptables log feature on a server
> machine(Dual xeon processor,Intel e100 cards,80GB SCSI and 2GB RAM)
> which is running in bridge mode (On RH 7.3).The average traffic on this
> machine is vary from 40-60Mbps.Hence I require some suggestion for some
> my questions like,

60Mpbs is not a ton of traffic, i'd be interested in what the expected
packets per second (pps) rate is, as that can be the
forwarding/filtering killer.  in the extreme case, think about 60 Mbps
of 1250 byte UDP packets vs. 60 Mbps of 60-300 byte TCP traffic...big
difference.

i'd also be so bold as to suggest you'd be much better off with e1000
cards over e100 cards.  in my experience, if you can get 80 Mbps
sustained out of a 100M card; you're kicking butt, and it's not
something you'd want to do indefinitely.

> 1) On this High traffic the kernel will be stable/crash ?
> 2) What would be the CPU Load and the server is able to do this job
> without any pain ?

it's possible that the NICs could peg the CPU servicing interrupts.
there are docs out there on how to nail a specific NIC to a specific
CPU, as you'll often see all your NICs being serviced by a single CPU.

i'd also note that in my experience, on both linux and the BSD's;
bridging is *much* more CPU intensive than routing; which is probably
counter-intuitive, since from a networking perspective bridging is a
simpler operation than routing.  dunno if this has to do with
implementation issues or just that it's being done in software vs.
hardware.

> 3) Up to how much traffic the iptables/kernel can able to handle without
> any issue and what should I do additionally if I need the
>    iptable-log should handle this much traffic?

if you want to do a lot of logging, add a 3rd NIC to the box; setup a
syslog server on that segment and let the syslog server deal with the
disk I/O.

-j

--
"Chris: So, what are you wearing?  Wow. I bet you can see right through
 that.
 Lois: Chris, who are you talking to? 
 Chris: Grandma."
        --Family Guy

