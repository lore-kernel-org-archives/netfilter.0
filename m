From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Fairly complex multi-ISP firewall/router problem
Date: Fri, 02 Apr 2004 16:36:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080941765.17616.61.camel@localhost>
References: <c4kjrg$lqm$1@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <c4kjrg$lqm$1@gatekeeper.tmr.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Bill Davidsen <davidsen@tmr.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-04-02 at 15:57, Bill Davidsen wrote:
> I am trying to set up a single Linux router, RH9.0, for a non-profit I 
> am supporting with some free consulting. They have two ISP lines, each 
> of which has a three bit CIDR block, and an internal network.
> 
> Part one:
> 
> I want to have an IP for each of the services, mail and http, on each 
> ISP, so that is DSL is down I can use cable, and vice-versa. I will do 
> NAT in the firewall, and forward the packets to the actual server. 
> Eventually the servers will move to a DMZ after the other stuff settles 
> down.
> 
> The problem is that a packet can come from any IP outside, and when the 
> reply packet is sent out, it may go out either NIC. And that's the root 
> of the problem, getting the source IP to match the NIC. I've added rules 
> to the mangle table to MARK the packets, that just doesn't seem to work 
> reliably.
> 
> I want very much to do this without patching the kernel, I have two 
> patches which seem to solve the problem on other systems, but 
> maintaining a patched kernel long term is really undesirable, and makes 
> it hard to turn over the job in the future.
> 
> All I want to do is send packets out the interface which matches the 
> source IP, and I don't think there's any reasonable way to get there 
> without patches or BSD.
> 
> Yes, I know about the lartc docs, nano.txt and several other things. The 
> problem is that the marks don't reliably WORK, routing by destination IP 
> is being used in some cases (but not all, which is really odd).

Hmmm . . . I admit to not having tried this and only giving it five
minute's thought but I'm not sure I see the problem.  Well, I see why
one can't be guaranteed to send the packet out the same interface but
I'm not sure why that is a problem.

If the packet comes in and is DNAT'd (I assume that is what you are
doing), wouldn't it be entered in conntrack so that the reply packets
will be SNAT'd to the same source address as the destination address of
the original packet? That should make the reply packet acceptable to the
originating device.  One cannot ensure which interface it goes out (I am
assuming that the source address alteration of the reply packet occurs
post routing and thus iproute2 is useless here) but it should make its
way back to the originating device via the magic of Internet routing
regardless of interface -- shouldn't it?

In the case of an interface or ISP failure, I assume you would disable
the interface which would eliminate the route.

So I would think the packet path would be from originating device to one
of the FW interfaces, DNAT to the private address, reply from the
private address, SNAT of the reply according to conntrack, out either of
the interfaces, back via Internet routing to the originating device.

Of course, I could be brain-cramping here as I am eager to return to my
current task from this quick e-mail break but I missed seeing the
problem - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


