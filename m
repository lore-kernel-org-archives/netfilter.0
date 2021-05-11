From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Running an active/active firewall/router (xt_cluster?)
Date: Tue, 11 May 2021 14:24:23 +0200
Message-ID: <20210511122423.GA19865@salvia>
References: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
 <20210510221907.GA15863@salvia>
 <d05f4990-b3d3-52e6-ac22-ad55620b866a@physik.uni-bonn.de>
 <6279603e-9db2-c519-7834-3217c809edd5@physik.uni-bonn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6279603e-9db2-c519-7834-3217c809edd5@physik.uni-bonn.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Cc: netfilter@vger.kernel.org

Hi Oliver,

On Tue, May 11, 2021 at 11:28:23AM +0200, Oliver Freyermuth wrote:
> Hi Pablo,
> 
> a short additional question after considering this for a while longer:
> 
> Am 11.05.21 um 00:58 schrieb Oliver Freyermuth:
> > > > [...]
> > > > Basic tests show that this works as expected, but the details get messy.
> > > > 
> > > > 1. Certainly, conntrackd is needed to synchronize connection states.
> > > >     But is it always "fast enough"?  xt_cluster seems to match by the
> > > >     src_ip of the original direction of the flow[0] (if I read the code
> > > >     correctly), but what happens if the reply to an outgoing packet
> > > >     arrives at both firewalls before state is synchronized?
> > > 
> > > You can avoid this by setting DisableExternalCache to off. Then, in
> > > case one of your firewall node goes off, update the cluster rules and
> > > inject the entries (via keepalived, or your HA daemon of choice).
> > > 
> > > Recommended configuration is DisableExternalCache off and properly
> > > configure your HA daemon to assist conntrackd. Then, the conntrack
> > > entries in the "external cache" of conntrackd are added to the kernel
> > > when needed.
> > 
> > You caused a classic "facepalming" moment. Of course, that will solve (1)
> > completely. My initial thinking when disabling the external cache
> > was before I understood how xt_cluster works, and before I found that it uses the direction
> > of the flow, and then it just escaped my mind.
> > Thanks for clearing this up! :-)
> 
> Thinking about this, the conntrack synchronization requirements
> would essentially be "zero", since after a flow is established, it
> stays on the same machine, and conntrackd synchronization is only
> relevant on failover — right?

Well, you have to preventively synchronize states because you do not
know when your router will become unavailable, so one of the routers
in your pool takes over flows, right? So it depends on whether there
are HA requirements on your side for the existing flows.

> So this approach would not limit / reduce the achievable bandwidth,
> since the only ingredient are the mangling filters — so in case we
> can't go for dynamic routing with Quagga and hardware router stacks,
> this could even be a solution for high bandwidths?

I think so, yes. However, note that you're spending cycles to drop
packets that your node does not own though.

In case you have HA requirements, there is a number of trade-offs you
can apply to reduce the synchronization workload, for example, only
synchronize TCP established connections to reduce the amount of
messages between the two routers. There is also tuning that your could
explore: You could play with affinity to pin conntrackd into a CPU
core which is *not* used to handle NIC interruptions. IIRC, there is
-j CT action in iptables that allows to filter the netlink events that
are sent to userspace conntrackd (e.g. you could just send events for
"ct status assured" flows to userspace).
