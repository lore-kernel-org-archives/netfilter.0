From: Ron Peterson <rpeterso@mtholyoke.edu>
Subject: Re: blocking dhcp on bridge
Date: Mon, 7 Feb 2005 13:57:11 -0500
Message-ID: <20050207185711.GA23991@mtholyoke.edu>
References: <20050206210154.GA20344@mtholyoke.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050206210154.GA20344@mtholyoke.edu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Feb 06, 2005 at 04:01:54PM -0500, Ron Peterson wrote:

> I am running a dhcp server on a bridging firewall.  The dhcp server runs
> on br0.  I have eth0 connected to my 'private' network, and eth1
> connected to my 'public' network.
> 
> I only want this dhcp server to service dhcp requests from the private
> network.  Any dhcp requests entering via eth1, or any dhcp replies being
> sent via eth1 should be dropped.

I have been kicking this some more, and the results are ... weird.

Here's some tcpdump output (tcpdump -i br0 -w /root/tmp/dhcp.dump port
67 or port 68 &).  At 11:47:25, the log changes drastically.  Prior to
that time, the only packets seen from fil49a (my bridged dhcp server)
are those sent to the private interface, which is what I want.  No
incoming dhcp requests are seen from the public network.  This is
exactly what I want.  Then suddenly dhcp requests start showing up from
the public network, and fil49a starts responding!  There were no changes
to iptables rules.

11:45:05.229455 IP must.mtholyoke.edu.bootps > n238-107.mtholyoke.edu.bootpc: UDP, length: 300
11:45:53.685620 IP must.mtholyoke.edu.bootps > kfelsent.mtholyoke.edu.bootpc: UDP, length: 300
11:45:53.687892 IP must.mtholyoke.edu.bootps > kfelsent.mtholyoke.edu.bootpc: UDP, length: 300
11:45:53.688271 IP dot.mtholyoke.edu.bootps > 255.255.255.255.bootpc: UDP, length: 319
11:45:53.690336 IP dot.mtholyoke.edu.bootps > 255.255.255.255.bootpc: UDP, length: 319
11:45:53.693789 IP ambr.mtholyoke.edu.bootps > kfelsent.mtholyoke.edu.bootpc: UDP, length: 300
11:45:53.694250 IP ambr.mtholyoke.edu.bootps > kfelsent.mtholyoke.edu.bootpc: UDP, length: 300
11:46:35.311306 IP must.mtholyoke.edu.bootps > wh1-hp.mtholyoke.edu.bootpc: UDP, length: 300
11:47:00.913538 IP must.mtholyoke.edu.bootps > n213-107.mtholyoke.edu.bootpc: UDP, length: 300
11:47:16.702384 IP must.mtholyoke.edu.bootps > 255.255.255.255.bootpc: UDP, length: 300
11:47:16.703252 IP must.mtholyoke.edu.bootps > 255.255.255.255.bootpc: UDP, length: 300
11:47:25.618022 IP must.mtholyoke.edu.bootps > 138.110.233.56.bootpc: UDP, length: 300
11:47:36.809950 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: UDP, length: 548
11:47:37.000654 IP fil49a.mtholyoke.edu.bootps > 138.110.49.166.bootpc: UDP, length: 300
11:47:37.044793 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: UDP, length: 548
11:47:37.046364 IP fil49a.mtholyoke.edu.bootps > 138.110.49.166.bootpc: UDP, length: 300
11:47:37.625675 IP ambr.mtholyoke.edu.bootps > 138.110.109.229.bootpc: UDP, length: 300
11:47:41.403244 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: UDP, length: 303
11:47:41.403672 IP fil49a.mtholyoke.edu.bootps > dw10-18.mtholyoke.edu.bootpc: UDP, length: 300
11:47:44.826415 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: UDP, length: 300
11:47:44.826823 IP fil49a.mtholyoke.edu.bootps > n227-35.mtholyoke.edu.bootpc: UDP, length: 300
11:47:44.826957 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: UDP, length: 300
11:47:44.827346 IP fil49a.mtholyoke.edu.bootps > n227-35.mtholyoke.edu.bootpc: UDP, length: 300
11:47:44.827981 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: UDP, length: 300
11:47:51.240491 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: UDP, length: 339
11:47:51.240937 IP fil49a.mtholyoke.edu.bootps > sk23-63.mtholyoke.edu.bootpc: UDP, length: 300

Here are the rules I'm running, along with packet/byte counts.  There
are a lot of them, because I'm trying all the combinations of blocking
incoming bootpc, outgoing bootps, physdev, input, output, forward,
prerouting, and postrouting for both -t filter and -t nat.

473# iptables -L -v
Chain INPUT (policy ACCEPT 371K packets, 42M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       udp  --  eth1   any     anywhere             anywhere            udp dpt:bootps
    0     0 DROP       udp  --  eth1   any     anywhere             anywhere            udp spt:bootpc
 3683 1266K DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 udp spt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 udp dpt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-in --physdev-in eth1 udp spt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-in --physdev-in eth1 udp dpt:bootps

Chain FORWARD (policy ACCEPT 785K packets, 160M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 --physdev-is-bridged udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 --physdev-is-bridged udp dpt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp dpt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 udp dpt:bootpc
 3683 1266K DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 --physdev-is-bridged udp spt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 --physdev-is-bridged udp dpt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-in --physdev-in eth1 udp spt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-in --physdev-in eth1 udp dpt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 udp spt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 udp dpt:bootps
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp spt:bootps
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp dpt:bootpc
    0     0 DROP       udp  --  eth1   any     anywhere             anywhere            udp spt:bootpc
    0     0 DROP       udp  --  eth1   any     anywhere             anywhere            udp dpt:bootps

Chain OUTPUT (policy ACCEPT 3087 packets, 905K bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp spt:bootps
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp dpt:bootpc
    4  1312 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp dpt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 udp dpt:bootpc

474# iptables -L -v -t nat
Chain PREROUTING (policy ACCEPT 7624K packets, 3349M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       udp  --  eth1   any     anywhere             anywhere            udp dpt:bootps
    0     0 DROP       udp  --  eth1   any     anywhere             anywhere            udp spt:bootpc
 4371 1494K DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 udp spt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 udp dpt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-in --physdev-in eth1 udp spt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-in --physdev-in eth1 udp dpt:bootps

Chain POSTROUTING (policy ACCEPT 2102K packets, 356M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 --physdev-is-bridged udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 --physdev-is-bridged udp dpt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp dpt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 udp dpt:bootpc
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp spt:bootps
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp dpt:bootpc

Chain OUTPUT (policy ACCEPT 613 packets, 41072 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp dpt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-out eth1 udp dpt:bootpc
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp spt:bootps
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp dpt:bootpc

Sorry for such long post.  I believe at this point I should probably try
2.6.10, although I was really hoping to avoid leaving the land of
distribution packages.  Something really odd seems to be going on,
though.

The fortune cookie in my lunch says "Your luck has been completely
changed today."  Yikes.

-- 
Ron Peterson
Network & Systems Manager
Mount Holyoke College
http://www.mtholyoke.edu/~rpeterso

