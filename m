From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: wan links routing failover sheme
Date: Thu, 06 Mar 2008 23:41:22 -0600
Message-ID: <47D0D582.7060900@riverviewtech.net>
References: <003501c87f32$f6d5d3c0$56f5edc8@softplan.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <003501c87f32$f6d5d3c0$56f5edc8@softplan.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 3/5/2008 8:37 PM, Daniel wrote:
> I need a routing failover scheme to address a vpn site-to-site 
> scenario where branches offices have 2 wan links and a linux box with 
> 2 ethernet ifaces, each one reaching one wan router. Wan links should 
> working in active/passive failover mode.

First and foremost what you are wanting to do is complicated at best. 
However I think that it will be doable in the end.

How much and what of the equipment will you have full administrative 
control over?

> At each branch, I need to choose one of the 2 wan routers as the 
> linux box default gateway. For failover work, I need some mechanism 
> to monitor the active/master link, like icmp/ping, and change the 
> gateway to the passive/backup link when the active/master link fails, 
> and change back when the active/master link becomes up again. If I 
> address this with a routing scheme, the vpn on demand tunnel from 
> branch to headquarter work transparent above it.

You will need to use some sort of monitoring that tests from your Linux 
router to the Linux (concentrator) router at the headquarters.  I don't 
think you can safely rely on link level failures.  Consider what will 
happen if you have a bridging ADSL modem that has lost ADSL signal yet 
still has ethernet link to your Linux box.  The Linux box has no way to 
know that an intermediary link is down and thus the path is down.

I suppose you could find an ADSL modem that will take down the ethernet 
link when the ADSL link goes down, but now you are getting in to a more 
esoteric situation and specialized hardware that is not commodity and 
thus difficult to deal with as far as spares goes.  In short, stick with 
something that will monitor the end to end path.

> On headquarter and on each branch I will use a linux box. I thinking 
> in use openvpn as vpn server and client (I have low know hall of 
> openvpn), but other vpn solutions, like ipsec, can be suggested! On 
> branches, a fast and cheap DSL link (should be the active/master 
> link) and a realiable and slower 128kbps PPP link (should be the 
> passive/backup link). Tunnels can be started from any side, from 
> headquarter or from branches, but I will consider start tunnels from 
> branches to headquarter for this scenario, I can change this view, no 
> problem.

I don't think that the type of VPN solution is all that important yet in 
this stage of the game.  It sounds like you still have a lot of things 
up in the air that need to be worked out.

Is the PPP link always on (slower broadband) or is it billed based on 
usage?  Are we really talking about a 128 kb ISDN line?

> Should iproute2 address such solution?

IPRoute2 is not *the* solution despite it most likely being *part* of 
the solution.  IPRoute2 is a tool, just like IPTables is a tool. 
IPRoute2 allows you to alter how the Linux box routes packets, it is up 
to you to tell the Linux box how to route.

> I ask about it in openvpn-users list, one people answer that he use 
> linux eql driver driver to form a logical connection and a little bit 
> of scripting to continuously monitor the tunnels and add or remove 
> them from the bundle if needed.

I don't think you will want to use the eql driver.  To my knowledge, the 
eql driver will want to try to equally use both links at the same time, 
which you have indicated that you want an active/passive not 
active/active solution.  Or if you are not billed based on usage on the 
128 kb connection, would you like to use it as additional bandwidth in 
an active/active solution?

> As a comparision, as logn I know, Cisco solution use IPSLA as the 
> monitoring scheme and on the start vpn tunnel box a list of 2 vpn 
> servers to reach (one master and one backup), to address such 
> failover environment.
> 
> I will appreciate ny sugestions!

I think you are indeed talking about having two VPNs from each branch 
office to the central office.  If you can have both VPNs up at the same 
time (local_ext_ip_1 <-> remote_ext_ip_1 and local_ext_ip_2 <-> 
remote_ext_ip_2) and you can route through either of them, you should be 
able to use a routing protocol for each end to be able to advertise to 
the other end what routes it has.  If you use the proper routing 
protocol it will monitor the routes for you (by looking for route 
advertisements and / or hellos).  Thus if the monitoring indicates that 
the path is down, the routing protocol will remove the routes that were 
known via that path.

I have successfully used OSPF on Cisco routers to do this with two SDSL 
lines.  Other than a delay in changes when one line went down or up, 
things worked out very well.



Grant. . . .
