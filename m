From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem with FORWARD hook
Date: Tue, 11 Nov 2003 22:12:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311112212.hABMCmj17939@agate.rockstone.co.uk>
References: <Pine.SOL.4.20.0311111655550.29271-100000@csa.bu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.20.0311111655550.29271-100000@csa.bu.edu>
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
To: netfilter@lists.netfilter.org

On Tuesday 11 November 2003 9:59 pm, Leonid Veytser wrote:

> When I dump the output of all the packets traveling thru my machine, I
> notice that none go thru FORWARD hook.

There's no other way packets are going to get routed through your machine 
except by passing through the FORWARD chain.

> So, I tried to make a packet have
> to go thru the FORWARD hook (ie by changing the packet dest at PREROUTING
> hook), but the packet never goes to the FORWARD hook, but disappears.

Show us an example of your rules so we can see what you are trying to do.

> Can there be some incorrect configuration on my machine that would cause
> it not to be able to forward packets?

There are many ways of (mis)configuring a machine so that it doesn't forward 
packets.   Some people might say this is a highly secure router :)

Antony.

-- 

Your email has been returned due to insufficient voltage.
                                                     Please reply to the list;
                                                           please don't CC me.

