From: Jeff Simmons <jsimmons@goblin.punk.net>
Subject: Routing and DNAT question
Date: Tue, 7 Jun 2005 18:37:37 -0700
Message-ID: <200506071837.37877.jsimmons@goblin.punk.net>
Reply-To: jsimmons@goblin.punk.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I'm not sure I'm asking the right question here, but I have to start 
somewhere.

When I do a DNAT on an outside interface, it takes place prerouting. So it 
overrwrites the destination address with the new address and sends the packet 
on to the routing function (and then to the forward chain of iptables). It 
also creates a state, so that return packets to the original address:port get 
their source rewritten.

This overwriting of the source address on the return packets: does it happen 
pre-routing or post-routing?

Trying to do some source routing via iproute2 on this scenario, and not having 
much luck.

-- 
Jeff Simmons                                   jsimmons@goblin.punk.net
     Simmons Consulting - Network Engineering, Administration, Security

"You guys, I don't hear any noise. Are you sure you're doing it right?"
	-- My Life With The Thrill Kill Kult

