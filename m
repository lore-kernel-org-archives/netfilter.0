From: Jason Opperisano <opie@817west.com>
Subject: Re: semi OT: default route
Date: Wed, 20 Oct 2004 12:17:25 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041020161725.GA7221@bender.817west.com>
References: <20041020132551.GA1720@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041020132551.GA1720@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

On Wed, Oct 20, 2004 at 09:25:51AM -0400, Payal Rathod wrote:
> Hi,
> I have a question which has haunted me for many months. If I have 2 ISP
> connections with me, with default gw 1.2.3.4 and 4.5.6.7 and if I add 
> both as default routes on my Linux gateway as,
> route add -net default gw 1.2.3.4
> route add -net default gw 4.5.6.7
> and if I send a packet from a windows client to internet, which ISP will it
> go through?

this will sound like a stupid answer, but it will probably always use
the route that you added first.  the 'route' command will allow you to
added multiple default routes, but the ones you add after the first one
end up getting ignored.  the 'ip' command won't let you add a default
route once you have one (it uses teq and multipath for this):

	$ ip route list | grep default
	default via 10.2.1.1 dev eth0

	$ sudo ip route add default via 10.2.1.2
	RTNETLINK answers: File exists

if you want to load-balance outbound traffic over multiple ISP links,
you'll want to use something along the lines of the 'nth' patch from POM:

	http://netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-3.html#ss3.9

if you want to split outbound traffic over multiple links by source IP
or protocol, etc--you can use the concepts from:

	http://lartc.org/howto/lartc.netfilter.html

-j

-- 
Jason Opperisano <opie@817west.com>

