From: Bill Davidsen <davidsen@tmr.com>
Subject: Fairly complex multi-ISP firewall/router problem
Date: Fri, 02 Apr 2004 15:57:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <c4kjrg$lqm$1@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am trying to set up a single Linux router, RH9.0, for a non-profit I 
am supporting with some free consulting. They have two ISP lines, each 
of which has a three bit CIDR block, and an internal network.

Part one:

I want to have an IP for each of the services, mail and http, on each 
ISP, so that is DSL is down I can use cable, and vice-versa. I will do 
NAT in the firewall, and forward the packets to the actual server. 
Eventually the servers will move to a DMZ after the other stuff settles 
down.

The problem is that a packet can come from any IP outside, and when the 
reply packet is sent out, it may go out either NIC. And that's the root 
of the problem, getting the source IP to match the NIC. I've added rules 
to the mangle table to MARK the packets, that just doesn't seem to work 
reliably.

I want very much to do this without patching the kernel, I have two 
patches which seem to solve the problem on other systems, but 
maintaining a patched kernel long term is really undesirable, and makes 
it hard to turn over the job in the future.

All I want to do is send packets out the interface which matches the 
source IP, and I don't think there's any reasonable way to get there 
without patches or BSD.

Yes, I know about the lartc docs, nano.txt and several other things. The 
problem is that the marks don't reliably WORK, routing by destination IP 
is being used in some cases (but not all, which is really odd).

-- 
bill davidsen <davidsen@tmr.com>
   CTO TMR Associates, Inc
   Doing interesting things with small computers since 1979

