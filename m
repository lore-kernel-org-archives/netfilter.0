From: David A Golden <david@hyperbolic.net>
Subject: Re: Followup on Checkpoint VPN through Iptables
Date: Thu, 26 Sep 2002 09:58:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20020926091300.00aba1d0@secure.hyperbolic.net>
References: <5.1.0.14.2.20020926073737.00acd7f0@pop.mindspring.com>
 <5.1.0.14.2.20020926073737.00acd7f0@pop.mindspring.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020926122640.GA725@Ajftl1.ajfthome.on.ca>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, Alistair Tonner <Alistair@alistairt.ath.cx>

Great idea, Alistair!  At the time you wrote, my INPUT rules were turned 
off, but I was surprised to see that nothing had hit the FORWARD rules.  So 
I tried turning off the FORWARD rules and it still worked.  ?!?  So now I'm 
baffled.

I suppose I deserve a slap on the wrist for at some point in the past 
changing too many things at once and not following a nice scientific method 
so I really knew what was necessary and what not.

Based on what I just saw, my advice now seems to collapse down to "ignore 
what everyone says, don't set any special firewall rules, and just don't 
use UDP encapsulation or IKE over TCP".  Was there some "recent" change to 
netfilter to properly do connection tracking for IPSEC protocols that's 
making this work?

I've turned all the rules back on and will watch vi iptables -L -v to see 
if any of the rules are being hit.  (Ha! a job for MRTG!)

Regards,
David

At 08:26 AM 9/26/2002, Alistair Tonner wrote:

>         Hi David:
>            If this is working, I suspect that you could figure out which
>         rules aren't being used by iptables -L -v|more ... if its up and
>         running and working, and the rule has a 0 byte/packet count ..
>         its likely not doing anything...
>
>         I'm going to keep *this* one handy ...I'm going to need it 
> shortly              as I get VPN to work soon... Thanks David
>
>         Alistair Tonner


