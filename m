From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: Fairly complex multi-ISP firewall/router problem
Date: Fri, 02 Apr 2004 22:17:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406E2CDD.2070900@tmr.com>
References: <200404022250.54788.Antony@Soft-Solutions.co.uk> <1080943679.3421.4.camel@4100.internal.techforless.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080943679.3421.4.camel@4100.internal.techforless.com>
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

Joe Thompson wrote:
> What is the architecture between the rest of the world and your
> firewall?  Is it possible to use BGP and only one of the public
> subnets?  This would in effect move the redundancy of the public side to
> the router(s) allowing you to use standard method's at the firewall.

All of the internal stuff is on a 192.168.x.x net. So that a packet 
comes in NIC1 and gets DNAT'd to the internat address, then the reply 
comes back to the firewall with the correct destination address, and the 
source address gets reset correctly. That's where the problem comes in, 
since now the packet can go back our through the NIC to either ISP. But 
if it goes out the *wrong* NIC, the ISP thinks I'm spoofing and drops 
the packet.
> 
> We run a similar situation with one of our subnets, we have two circuits
> from separate provider's who were both gracious enough to add the routes
> in they're tables, if we lose one connection the rest of the world just
> uses the other route in and we of course use the other route out.  The
> downside is getting both upstream providers to cooperate in routing, the
> upside is that you can utilize both links and keep things simple from an
> addressing perspective.

I actually left out a bit of the complexity, some of the outgoing 
connections *must* go through one NIC or the other, because the 
destination will only accept from a given source IP (and that IP will 
only go out through the appropriate ISP).

There are two ways to patch this, one by addint the IP to the ARP table 
with the MAC of the correct router, one by some code to ignore any NIC 
which doesn't have an alias for the source address. Both are patches I 
don't want to maintain.

-- 
bill davidsen <davidsen@tmr.com>
   CTO TMR Associates, Inc
   Doing interesting things with small computers since 1979

