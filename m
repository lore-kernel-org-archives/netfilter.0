From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: semi OT: default route
Date: Wed, 20 Oct 2004 17:37:34 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041020163734.GR21006@metastasis.org.uk>
References: <20041020132551.GA1720@tranquility.scriptkitchen.com>
	<20041020161725.GA7221@bender.817west.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041020161725.GA7221@bender.817west.com>
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
To: netfilter@lists.netfilter.org

On Wed, Oct 20, 2004 at 12:17:25PM -0400, Jason Opperisano wrote:
> On Wed, Oct 20, 2004 at 09:25:51AM -0400, Payal Rathod wrote:
> > Hi,
> > I have a question which has haunted me for many months. If I have 2 ISP
> > connections with me, with default gw 1.2.3.4 and 4.5.6.7 and if I add 
> > both as default routes on my Linux gateway as,
> > route add -net default gw 1.2.3.4
> > route add -net default gw 4.5.6.7
> > and if I send a packet from a windows client to internet, which ISP will it
> > go through?

Looking at this from a slightly different, well, simpler, point of view
than Jason...

> this will sound like a stupid answer, but it will probably always use
> the route that you added first.

On the host I've just tried this on - admittedly just the once, it tried
the route I added *last*.  But this is about thirty seconds worth of
testing :)

> the 'route' command will allow you to added multiple default routes,
> but the ones you add after the first one end up getting ignored.  the
> 'ip' command won't let you add a default route once you have one (it
> uses teq and multipath for this):
> 
> 	$ ip route list | grep default
> 	default via 10.2.1.1 dev eth0
> 
> 	$ sudo ip route add default via 10.2.1.2
> 	RTNETLINK answers: File exists

However if you want to give the routes different metrics....

ip route add default via 1.2.3.4 metric 1
ip route add default via 4.5.6.7 metric 2

"ip" will accept that input.

That should mean if the host can't send the traffic via 1.2.3.4 it will
realise this ( I presume solely if it gets no arp-reply for 1.2.3.4) it
will try and send the traffic via 4.5.6.7 instead.

That seems to be the way it should work, however on a test box my host
is happily trying to arp for 1.2.3.4 continuosly.

Anyone help me finish off this answer ;)

-- 
We are the Willing, led by the Unknowing,
Are doing the Impossible, for the Ungrateful.
We have done so much, for so long, with so little,
We are now qualified to do anything with nothing.

