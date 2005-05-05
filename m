From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP + MAC filter -  wireless client
Date: Thu, 05 May 2005 11:24:50 -0500
Message-ID: <427A48D2.6070202@riverviewtech.net>
References: <d2c267d2bde2.d2bde2d2c267@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d2c267d2bde2.d2bde2d2c267@vsnl.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> We have an AP that transmits via a omni antenna.
> 
> On the client side we have AP in client mode.
> 
> What I see that in these wireless devices we have 
> atleast two MAC address : 
> 
> 1. The lan MAC address.
> 2. The wireless MAC address.

I suppose this is normal.

> So for every client we have :
> 
> 1. The lan MAC address.
> 2. The wireless MAC address.
> 3. The ethernet MAC address.

This is contrary to everything that I know of when you are talking about Ethernet Layer 2 (802.2 Link Level Control) networking standard with hubs and switching.  If this is indeed the case I'm not sure why this is the case.

> In wireless networing when we did mac filtering
> we had to enter all three for the client to gain
> access.

What filtering were you doing?  Was it the allowed source and / or destination MAC addresses in your wireless devices?  If so you may have had to do this for the AP transceiver to allow the traffic to flow through correctly, but this does not seem like an Ethernet Layer 2 (802.2 Link Level Control) network issue but more one of wireless. 802.2 LLC specifically allows for one source and one destination MAC address in the frame.  I say 802.2 LLC because ethernet, fiber, wireless are all starting to use / have been using 802.2 LLC frames for a long time now.  This is really what is making ""ethernet so compatible with other equipment / technologies.

Have you tried to set up any iptables rules rules to match just the client MAC (and IP)?  Do you see any packets passing through that rule?

> Based on that I was wondering how would you one handle 
> these wireless clients using iptables.
> 
> Thanks

No problem.

