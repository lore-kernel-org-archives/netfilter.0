From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: conntrack too eager to track everything
Date: 16 Feb 2003 15:17:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045405071.682.29.camel@tux.rsn.bth.se>
References: <20030216102510.GA19285@fermat.math.technion.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030216102510.GA19285@fermat.math.technion.ac.il>
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
To: Nadav Har'El <nyh@math.technion.ac.il>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Sun, 2003-02-16 at 11:25, Nadav Har'El wrote:
> In a transparent-proxy-like application, I'm redirecting connections
> forwarded through the machine and destined to some port (say, 80) into
> a local port.
> Tracking these NATed connections by conntrack is obviously necessary, so
> the ip_conntrack modules needs to be run.
> 
> However, in some cases most of the connections (as much as 100%) that pass
> through the computer, or originate in it, or a destined to it, have nothing
> to do with these NATed connections. There is absolutely no reason to track
> these other connections, as no iptables filters, NAT, or anything else will
> ever affect them.
> 
> So I was wondering, is there a way for me to configure ip_conntrack (or
> modify its code) not to track any connections except those explictly created
> by netfilter while doing NAT?
> 
> Note that what bothers me isn't only the issue of time wasted while
> needlessly tracking connections - it's more the space issue of the space
> needed to track all these (potentially, hundreds of thousands) connections,
> and what happens when the connection tracking hash-tables gets filled up.
> 
> I'd be greatful for any hints or pointers,

Apply the raw.path from the userspace/ directory in patch-o-matic and
then use the NOTRACK target in table raw and chain PREROUTING to tell
conntrack what packets not to track.
It also contains a patch against the userspace iptables to get support
for the NOTRACK (and TRACE) targets. I'm not sure how well patch-o-matic
can apply userspace patches right now... (you can always patch that part
manually with patch)

example:

iptables -t raw -A PREROUTING -p tcp --dport \! 80 -j NOTRACK

I hope that helps.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

