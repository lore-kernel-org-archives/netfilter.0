From: "J. Nerius" <jnerius@gmail.com>
Subject: Re: bandwidth monitoring
Date: Thu, 06 Jan 2005 14:19:44 -0600
Message-ID: <1105042784.27950.12.camel@josh-desk>
References: <200501061128.04741.patrick.leduc@novipro.com>
	<41DD9AE3.4060207@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DD9AE3.4060207@utilitran.com>
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
To: Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

How many hosts and how much traffic are you running through it? I've
wanted to come up with a solution similar to the one you've described to
replace my current bandwidthd setup but I'm thinking that my network may
be too large with too much traffic to support something like that
without building a monster box just to capture the stats. 

J.N.

On Thu, 2005-01-06 at 13:09 -0700, Michael Gale wrote:
> Hello,
> 
> 	To run NTOP permanitly you just have to clear the stats nightly. I have 
> a php script that makes a HTTP connection, downloads the stats from NTOP 
> and saves them in a mysql database. It then makes another connection and 
> tells NTOP to reset the stats.
> 
> That keeps the memory and CPU usage low ... so you could run it 
> continuously.
> 
> Michael.
> 
> 
> patrick.leduc@novipro.com wrote:
> > Hello
> > 
> > Does somebody know a program for monitoring bandwidth by ip? I have one 
> > internet interface and I must monitor many ips adresses on this interface. I 
> > tried Ipac-ng and, I worked a lot to do this config but it seems not working 
> > this way.
> > 
> > thanx
> > 
> 


