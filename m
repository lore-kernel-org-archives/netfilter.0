From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: load balance problem
Date: 23 Jan 2003 00:03:35 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043301815.2968.5.camel@runabout.noc.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

I've been trying to test the load balancing in our lab and it doesn't
appear to be working.  I have a RH 8.0 firewall, which appears to have
all the specified options set in the kernel .config.  I am running a
sniffer on both out-going links, and only ever see traffic go down one
or the other, never both.  It's always the one I list first:

ip route add default scope global equalize \
        nexthop via 172.27.3.3 dev eth1 weight 1 onlink \
        nexthop via 172.27.1.1 dev eth0 weight 1 onlink

What looks weird is the output:
# /sbin/ip route list
172.27.15.0/24 dev eth2  scope link
172.27.1.0/24 dev eth0  proto kernel  scope link  src 172.27.1.200
172.27.3.0/24 dev eth1  scope link
127.0.0.0/8 dev lo  scope link
default equalize
        nexthop via 172.27.3.3  dev eth1 weight 1 dead onlink pervasive
        nexthop via 172.27.1.1  dev eth0 weight 1 onlink

The 172.27.3 and .1 are both the external links, but I haven't found an
explanation for what "dead" and "pervasive" are.  I also don't see those
showing up in any of the examples I've seen.  So any clues why this only
goes out the first link?  I first thought kernel or default gateway, but
made sure the original default gateway was not specified, and the kernel
appears to be correct.  Something else I've obviously missed?

Thanks!
Dan


