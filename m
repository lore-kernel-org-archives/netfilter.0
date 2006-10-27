From: Philip Pemberton <usenet06@philpem.me.uk>
Subject: Re: NATing on a single interface?
Date: Fri, 27 Oct 2006 10:09:39 +0100
Message-ID: <ehsic6$has$1@sea.gmane.org>
References: <ehptuc$bo6$1@sea.gmane.org>
	<ehql65$f08$1@sea.gmane.org>	<ehr6m6$v00$1@sea.gmane.org>
	<ehrhod$17a$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ehrhod$17a$1@sea.gmane.org>
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

Robert Nichols wrote:
> If your other machines are set up to use the DSL router as the default
> route, of course that's where the return packets will go.  You have
> two choices:
> 
> 1. (Preferable) Set up the default route on your other machines so
>    that they use the firewall machine as their gateway to the outside
>    world.

Which is what's happening now. DNSMasq (lightweight DHCP/DNS server) allocates 
IP addresses based on /etc/ethers and /etc/hosts, and tells those machines to 
use 10.0.0.1 as the gateway. 10.0.0.1 (the firewall server) forwards those 
onto their eventual destination, and handles masquerading in the opposite 
direction, so that one or more LAN-based machines can access the Internet 
using only one public IP address.

> 2. SNAT the forwarded packets so that they appear to come from the
>    firewall machine.  This really screws up logging on your other
>    machines (all traffic will appear to originate on the firewall
>    machine), so you probably don't want to do it that way.

Based on

> If that's Oskar Andreasson's tutorial you've got, you'll find you

Yep.

> really don't need to read through the whole thing.  The section on
> the DNAT target is what you need right now.

Well, I've read the chapter on TCP/IP, now I'm just skimming through the stuff 
on DNAT and Masquerading. Problem with DNAT is that it seems to be more of a 
port-forwarding system rather than allowing more than one machine to access 
the Internet from one public IP.

I think I'll spend tonight playing around with firewall rules and routing 
tables. No doubt I'll take some flak from the rest of the family in the 
process ("why can't you just use the old modem?" and stuff like that)

I was going to use "Arno's IPTables Firewall" to do this, but it doesn't seem 
to support single-NIC NAT routing. Guess I'll have to write my own firewall 
script.. in at the deep end, as always :)

Thanks.
-- 
Phil.                         |  (\_/)  This is Bunny. Copy and paste Bunny
usenet06@philpem.me.uk        | (='.'=) into your signature to help him gain
http://www.philpem.me.uk/     | (")_(") world domination.
If mail bounces, replace "06" with the last two digits of the current year.


