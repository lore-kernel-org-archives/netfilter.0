From: Nick Taylor <nickt@lightlink.com>
Subject: Re: Different routes for different src addresses
Date: Wed, 7 Jul 2004 17:02:27 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0407071653430.21043@adore.lightlink.com>
References: <20040707120502.GA23120@nihil> <200407071410.02752.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407071410.02752.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > is it possible to create a route for a single src address?
> > I mean _routing_, not natting. If I nat the pkts their destination will
> > change and I need to keep it intact.
>
> As you say, you mean _routing_, therefore this a routing question, not a
> netfilter question.
>
> You need iproute2 (see http://lartc.org)
>
This is true, but misleading.  Netfilter does provide a nice interface to
iproute2 with the fwmark feature.  You can use a:

iptables -A FORWARD -s 192.168.1.7 -d 192.168.2.0/24 -j MARK --set-mark X

to put a particular firewall mark on a particular packet, then you can use

ip rule add fwmark X lookup Y

which tells the kernel to use routing table Y to lookup the route, and
then you must maintain a seperate routing table for each firewall mark,
like:

ip route add 192.168.1.0/24 via 10.0.0.3 table Y
ip route add 192.168.1.0/24 via 10.0.0.4 table Z

Of course, X Y and Z represent integers.

