From: Nils Juergens <ju@isf.rwth-aachen.de>
Subject: Re: strange packets on loopback
Date: Wed, 23 Jun 2004 14:37:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040623123720.GA5390@koala7>
References: <1087982478.7946.50.camel@dharmu.nsecure.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1087982478.7946.50.camel@dharmu.nsecure.net>
Content-Disposition: inline
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

On Wed, 23.06.04, "Dharmendra T." <dharmu@nsecure.net> wrote:

> Why the MAC is not displayed proerly? Getting doubt whether someone is
> trying to spoof!(Possible, not too scary as the packets are getting
> dropped).
> 
> If this is the valid mac just try to find out from which ip it is coming
> by using arp.

Thats the first thing i checked, the PC on the local lan has a valid
MAC-Address, and there is no 00:00:00:00:00:00 MAC anywhere on the net.
I've got arpwatch running and it reports no such MAC. Neither does the
arp-table on my firewall.

I do have, however, a DNAT rule in PREROUTING that redirects all http
requests to z.z.z.z:80. It is _not_, however, redirected to the external
interface y.y.y.y but rather to the internal address z.z.z.z.

In short, http traffic from clients directly to the squid (from mozilla with
proxy setting) go to y.y.y.y:8080, http traffic from other browsers (beyond
our control) is redirected to z.z.z.z:8080.

DNAT       tcp  --  a.a.a.a.0/24      anywhere           tcp dpt:www to:z.z.z.z:8080

The 'strange' packet had DST=y.y.y.y so i was thinking the REDIRECT does not
play a role here.

Also, localy generated packets never pass through PREROUTING, so packets
from 'lo' should never be touched by this rule.

thanks,

Nils Juergens


