From: "Nadav Har'El" <nyh@math.technion.ac.il>
Subject: conntrack too eager to track everything
Date: Sun, 16 Feb 2003 12:25:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030216102510.GA19285@fermat.math.technion.ac.il>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

In a transparent-proxy-like application, I'm redirecting connections
forwarded through the machine and destined to some port (say, 80) into
a local port.
Tracking these NATed connections by conntrack is obviously necessary, so
the ip_conntrack modules needs to be run.

However, in some cases most of the connections (as much as 100%) that pass
through the computer, or originate in it, or a destined to it, have nothing
to do with these NATed connections. There is absolutely no reason to track
these other connections, as no iptables filters, NAT, or anything else will
ever affect them.

So I was wondering, is there a way for me to configure ip_conntrack (or
modify its code) not to track any connections except those explictly created
by netfilter while doing NAT?

Note that what bothers me isn't only the issue of time wasted while
needlessly tracking connections - it's more the space issue of the space
needed to track all these (potentially, hundreds of thousands) connections,
and what happens when the connection tracking hash-tables gets filled up.

I'd be greatful for any hints or pointers,

	Nadav.

-- 
Nadav Har'El                        |      Sunday, Feb 16 2003, 14 Adar I 5763
nyh@math.technion.ac.il             |-----------------------------------------
Phone: +972-53-245868, ICQ 13349191 |A messy desk is a sign of a messy mind.
http://nadav.harel.org.il           |An empty desk is a sign of an empty mind.

