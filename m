From: "J. Nerius" <jnerius@gmail.com>
Subject: Re: bandwidth monitoring
Date: Thu, 06 Jan 2005 11:56:17 -0600
Message-ID: <1105034177.27950.7.camel@josh-desk>
References: <200501061128.04741.patrick.leduc@novipro.com>
	<1105033328.14796.18.camel@moola.futuresource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105033328.14796.18.camel@moola.futuresource.com>
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
To: Les Mikesell <les@futuresource.com>
Cc: netfilter@lists.netfilter.org

ntop is great for *short term* monitoring. Generally it will become
unmanageable if run for too long. If you want to monitor and keep stats
over a longer period of time, bandwidthd will probably work better for
you.

J.N.

On Thu, 2005-01-06 at 11:42 -0600, Les Mikesell wrote:
> On Thu, 2005-01-06 at 10:28, patrick.leduc@novipro.com wrote:
> 
> > Does somebody know a program for monitoring bandwidth by ip? I have one 
> > internet interface and I must monitor many ips adresses on this interface. I 
> > tried Ipac-ng and, I worked a lot to do this config but it seems not working 
> > this way.
> 
> Ntop might do what you need.  http://www.ntop.org.  It can summarize and
> sort traffic by address/port/protocol, etc.  I don't use it continuously
> but fire it up for a while if I think something is hogging the network.
> 


