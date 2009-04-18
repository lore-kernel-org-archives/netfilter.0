From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Sat, 18 Apr 2009 20:48:09 +0200
Message-ID: <20090418184809.GA15649@internet24.de>
References: <op.uskfabufx1lyi3@localhost> <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <op.usld3aqfx1lyi3@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Sat, Apr 18, 2009 at 11:12:36AM -0600, Lloyd Standish wrote:
> Thanks for the reply, Thomas.  I've got iptables 1.3.8 because I downloaded it (and the patch-o-matic stuff) quite a while back when it was the most current version.  I'm using it because my kernel is not the stock Etch kernel (it is in fact a Ubuntu kernel, necessary to get a module that Debian removed over licensing issues).  I recompiled my kernel and installed itables 1.3.8 out of desperation, since I have studied this load-balancing  stuff pretty thoroughly and it seems what I have ought to work.

> My kernel 2.6.20.3 does not have a CONFIG_IP_ROUTE_FWMARK configuration setting!  Has this been absorbed into another configuration setting?

Ok, I've never used 2.6.20, but 2.6.27 definitely has all the required features,
but the *_ROUTE_FWMARK seems indeed to be gone, advanced router and policy
routing should be enough though.

>How can I be sure fwmark is working?  Judging by my setup, which is very simple, packets and connections are being marked, but routing is not affected by fwmark.

You can check the routing cache using "ip route show cache", and see what routing
decisions were taken.

> I have the kernel config options IP_NF_CONNTRACK_SUPPORT and XFRM_SUB_POLICY both set OFF.  Might this be a problem?

XFRM_SUB_POLICY is IPsec related, and IP_NF_CONNTRACK_SUPPORT doesn't exist anymore
in 2.6.27, but you've got /proc/net/ip_conntrack so connection tracking support
is clearly there.

Maybe you could post your connmark related iptables rules as well.

Also you could try to remove those two routes in the default table, which I
gather from your description are routes for $gw0=$gw1=10.60.255.254 (btw, the
second will normally never be used anyway), I remember having problems before
when routes matched after the policy route tables in the main table.

Why are you using the same IP (10.60.255.254) on different links? Possibly you could
try different IPs for that. I've haven't used PPP links for policy routing so far,
could be that they behave differently in some significant way wrt. to all this,
compared to broadcast networks.
