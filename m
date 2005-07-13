From: Jason Opperisano <opie@817west.com>
Subject: Re: dnatting
Date: Wed, 13 Jul 2005 00:48:48 -0400
Message-ID: <20050713044848.GA22255@bender.817west.com>
References: <20050711151830.GA26670@tranquility.scriptkitchen.com>
	<20050711184520.GA17202@bender.817west.com>
	<12984bb0050712202131980c46@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <12984bb0050712202131980c46@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jul 12, 2005 at 09:21:43PM -0600, Donald Murray wrote:
> Because the destination server is on the same subnet, users on the inside
> could indeed connect directly to that machine. Alternatively this could be
> handled via DNS.
> 
> 
> However, if the destination server is inside a DMZ, the firewall needs
> to DNAT in
> PREROUTING and SNAT in POSTROUTING. The DNAT gets traffic to
> the DMZ, the SNAT allows it back. Something like:

no--it doesn't.  if by "the destination server is inside a DMZ" you mean
the web server is on a different layer3 subnet than the client, routed
through the firewall.  you are applying the half-assed SNAT solution where
it's not even needed.  this is worse than the SNAT for the OP's scenario;
at least there the SNAT serves to create some semblance of functionality.

NAT is the duct tape of networking; if you can route, route.

-j

--
"Peter: I'm going to microwave a bagel and have sex with it.
 Quagmire: Butter's in the fridge."
        --Family Guy

