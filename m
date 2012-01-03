From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Filtering on bridges
Date: Tue, 03 Jan 2012 13:43:32 -0500
Message-ID: <1325616212.7219.123.camel@denise.theartistscloset.com>
References: <4EF1B216.50303@opendium.com>
	 <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr>
	 <4EF1E3B0.6080200@opendium.com>
	 <alpine.LNX.2.01.1112211934120.16532@frira.zrqbmnf.qr>
	 <4EF26A14.2070409@opendium.com>
	 <alpine.LNX.2.01.1112220028500.22558@frira.zrqbmnf.qr>
	 <4EF30CCC.4090703@opendium.com>
	 <alpine.LNX.2.01.1112221222570.3495@frira.zrqbmnf.qr>
	 <4EF36A9A.3040803@opendium.com>
	 <alpine.LNX.2.01.1112222302410.28561@frira.zrqbmnf.qr>
	 <4EF40499.3020005@atc.tcs.com>  <4F02FF61.5020806@opendium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F02FF61.5020806@opendium.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Hill <steve@opendium.com>
Cc: Vigneswaran R <vignesh@atc.tcs.com>, Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On Tue, 2012-01-03 at 13:15 +0000, Steve Hill wrote:
> On 23/12/11 04:33, Vigneswaran R wrote:
> 
> > Sorry for interrupting your discussion. I am following this thread from
> > the beginning. However, I couldn't get exactly how your setup looks
> > like. If possible, could you please give a simple (ascii) pictorial
> > representation of your setup. This may help more people (normal iptable
> > users like me) to understand the discussion better. Thank you.
> 
> +-----------------------------------------------------------+
> |                        Linux Server                       |
> |                                                           |
> |                            (br0)                          |
> |                              |                            |
> |     +------------+-----------+-----------+-----------+    |
> |     |            |           |           |           |    |
> |  (eth0)       (eth1)      (eth2)      (eth3)      (eth4)  |
> +-----------------------------------------------------------+
>        |            |           |           |           |
>        |            |           |           |           |
> +----------+  +--------+  +--------+  +--------+  +--------+
> | Upstream |  | Other  |  | Other  |  | Other  |  | Other  |
> |  Switch  |  | Server |  | Server |  | Server |  | Server |
> +----------+  +--------+  +--------+  +--------+  +--------+
> 
> 
> As you can see, the Linux server has several network interfaces, all of 
> which are bridged together.  I'm using iptables to filter the traffic 
> between those NICs.  Filtering bridged traffic largely works as expected 
> (although there is an issue that using REJECT filter rules causes the 
> kernel to panic as the ICMP response is injected into the bridge!)  This 
> means I can write iptables filter rules in the FORWARD chain using the 
> physdev module to reference the physical NICs (e.g. "DROP TCP traffic 
> from eth0 to eth1 that has a destination port == 25")
> 
> The issue I'm having is that traffic that has passed through the local 
> IP stack (whether that be from a local process, or routed) is handled 
> differently to traffic that is being bridged - iptables is no longer 
> aware of the physical NIC from which the traffic will egress.  I.e. for 
> this traffic I can only create rules referencing the whole bridge (br0) 
> rather than individual physical NICs (eth0, eth1, etc.).
<snip>
I wonder if you could integrate tc and iptables here.  I haven't thought
it all the way through but you could do something like setup an ingress
qdisc and use a tc filter ipt action (action ipt -j MARK --set-mark) to
mark packets based upon the iif so you know where it came and then
examine that mark on egress with a u32 filter with all the other match
parameters and drop it if necessary.  I'm not all that familiar with
using tc is such a way but that would get you back to the physical
interfaces - John

