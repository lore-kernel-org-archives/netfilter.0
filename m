From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: newbie question - what is the iptables equivalent of a Linksys
	"DMZ" ?
Date: Sat, 13 Nov 2004 19:57:36 -0500
Message-ID: <1100393855.5934.408.camel@grendel>
References: <1100392955.4894.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100392955.4894.25.camel@localhost.localdomain>
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
To: David Williamson <nospam1@nullcutter.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-11-13 at 19:42, David Williamson wrote:
>
> When a machine behind the router was
> going to serve as a, for example, game server (like Unreal Tournament
> 2004), the only way I could get it to work was to put that particular IP
> on the DMZ, which, I gather, meant that it looked like it was right on
> the net, unprotected, unrouted, unmasqed, et cetera.  
> 
> Since I'm trying to understand what the Linksys box did and give the new
> router box the same abilities, it would help if I knew what the heck
> that feature was really called, and/or how to implement that in
> iptables. 

Check out the docs located here:
http://www.netfilter.org/documentation/index.html#documentation-howto

and do some reading on SNAT (rewrites source IP address) and DNAT
(rewrites destination IP address). This will mimic the feature you
describe above.

HTH,
Chris



