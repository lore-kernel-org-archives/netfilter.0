From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: System Load
Date: Mon, 17 Nov 2003 12:04:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171204.hAHC4uj21996@agate.rockstone.co.uk>
References: <200311141519.11902.bikrant_ml@wlink.com.np> <1069060584.22071.59.camel@raylinux.internal> <200311171739.58301.bikrant@wlink.com.np>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311171739.58301.bikrant@wlink.com.np>
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

On Monday 17 November 2003 11:54 am, bikrant@wlink.com.np wrote:

> On Monday 17 November 2003 15:01, Ray Leach wrote:
> > On Fri, 2003-11-14 at 11:34, Rohit wrote:
> > > Hi,
> > > 	Is it possible to know how much system resources (cpu/memory load)
> > > that the netfilter module(s) is using? We are using HTB to shape our
> > > client traffic and there are 4 iptables rule for each client in the
> > > mangle table. I think it will be helpful to gather such data and graph
> > > it using mrtg.
> >
> > Just remember, iptables is only used to mark the traffic. tc is used to
> > classify and shape the traffic.
>
> Yeah you are right. But iptables must be using some resources(like cpu time
> etc) to mark the each and every packet. We have around 2-3 Mbps traffice
> flowing at each interface and I think that does consume some system
> resources. That is what I want to know about.

Presumably your traffic is not continuous, 24 hours a day, so here's a 
suggestion:

Measure your system load when the traffic is at its lowest (middle of the 
night perhaps?), and at its highest, then compare the two.

My guess is that with 2-3Mbits/sec you will hardly notice a thing.   Unless 
your netfilter is running on a 486 I don't think you'll be able to measure it 
(and even then I think it would do a perfectly good job).

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.

