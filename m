From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: NATing on a single interface?
Date: Thu, 26 Oct 2006 18:52:44 -0500
Message-ID: <ehrhod$17a$1@sea.gmane.org>
References: <ehptuc$bo6$1@sea.gmane.org> <ehql65$f08$1@sea.gmane.org>
	<ehr6m6$v00$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ehr6m6$v00$1@sea.gmane.org>
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

Philip Pemberton wrote:
> It appears to be mangling the packets - e.g. an inbound packet from 
> 12.34.56.78 to 98.76.54.32 (PPP_IP) gets its destination IP changed to 
> the DMZ address (e.g. 10.0.0.1 for my server). Return packets are sent 
> to the source (e.g. 12.34.56.78 in the example) using the DSL router 
> (10.1.0.2) as the gateway.
>
> What I need to figure out is how to actually set up the firewall. I > 
> did find a nice IPTables tutorial, but it's 357 pages long! Guess I'd 
> better stop procrastinating and start reading....

If your other machines are set up to use the DSL router as the default
route, of course that's where the return packets will go.  You have
two choices:

1. (Preferable) Set up the default route on your other machines so
    that they use the firewall machine as their gateway to the outside
    world.

2. SNAT the forwarded packets so that they appear to come from the
    firewall machine.  This really screws up logging on your other
    machines (all traffic will appear to originate on the firewall
    machine), so you probably don't want to do it that way.

If that's Oskar Andreasson's tutorial you've got, you'll find you
really don't need to read through the whole thing.  The section on
the DNAT target is what you need right now.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.



