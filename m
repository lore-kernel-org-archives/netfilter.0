From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Do I need ipt_ROUTE to do this?
Date: Wed, 14 Nov 2007 13:51:19 -0600
Message-ID: <473B51B7.70200@riverviewtech.net>
References: <5A630F46702DD1498FFD48394B4A664C27DD5909@john.ad.clarku.edu>,<473B23AE.9010106@riverviewtech.net>,<5A630F46702DD1498FFD48394B4A664C27DD590E@john.ad.clarku.edu> <5A630F46702DD1498FFD48394B4A664C27DD5910@john.ad.clarku.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5A630F46702DD1498FFD48394B4A664C27DD5910@john.ad.clarku.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/14/07 11:29, Brian S Julin wrote:
> Unfortunately, no this won't do it for us.  The situation is actually 
> a bit more complicated -- it's the same provider aggregating I2 ipv4 
> and commodity internet.  Moreover we have an intervening firewall 
> which we cannot use in a bridging mode because doing so turns off 
> features we need to use.  So the MAC will always be that of the 
> firewall, and the firewall cannot be taught to policy route even 
> based on input interface and is not VRF-aware.  Not that our ISP has 
> offered us any MPLS/VRF solution as of yet but I'm betting that's 
> what they come back to us with.

Well, just go and take all the wend out of my sai...  ;)

> Anyway, not to go too much further into that mess...

I'm sorry.

> A couple other ways this could happen would be to get iproute to run
> the routing decision twice after pulling the traffic out of the stack
> and reinjecting it.  Another would be if there were floating around
> some iptables/ebtables match module that could pre-match against a
> kernel routing table (by source or destination) PREROUTING. Then a
> mark could be put on and iproute2 would just follow that.

I'm wondering if IPSet would be able to help you out here.  If you had a 
set that contained the IPs for one route and another set that contained 
the IPs for the other route, you could match and mark based on set's and 
thus use marks to decide how to handle the traffic.  To pull this off 
you would just need something to update the ip sets in decent time. 
Granted your sets will probably contain net blocks, not IPs.

> Of academic interest, the eggheads seem to think dynamic "Source
> Address Dependent" routing is lacking and will be needed:
> 
> http://www.google.com/search?hl=en&q=BGP+SAD+-HC-BGP&btnG=Search

Hum.  Interesting idea, I'll do some reading.



Grant. . . .
