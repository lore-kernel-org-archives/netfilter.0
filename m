From: bikrant@wlink.com.np
Subject: Re: System Load
Date: Mon, 17 Nov 2003 17:39:58 +0545
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171739.58301.bikrant@wlink.com.np>
References: <200311141519.11902.bikrant_ml@wlink.com.np> <1069060584.22071.59.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069060584.22071.59.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: netfilter@lists.netfilter.org

On Monday 17 November 2003 15:01, Ray Leach wrote:
> On Fri, 2003-11-14 at 11:34, Rohit wrote:
> > Hi,
> > 	Is it possible to know how much system resources (cpu/memory load) that
> > the netfilter module(s) is using? We are using HTB to shape our client
> > traffic and there are 4 iptables rule for each client in the mangle
> > table. I think it will be helpful to gather such data and graph it using
> > mrtg.
>
> Just remember, iptables is only used to mark the traffic. tc is used to
> classify and shape the traffic.

Yeah you are right. But iptables must be using some resources(like cpu time 
etc) to mark the each and every packet. We have around 2-3 Mbps traffice 
flowing at each interface and I think that does consume some system 
resources. That is what I want to know about.

I guess it sound very foolish now :)

regds,
Rohit
>
> > I'm really sorry if someone has already asked about it.
> > Thanks a lot.
> >
> > with regards,
> > Rohit Nepali


