From: Gavin Hamill <gdh@acentral.co.uk>
Subject: netfilter and iproute2
Date: Thu, 19 Aug 2004 14:33:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408191433.36850.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hullo :)

I'm trying to route based on source IP.. basically I want to send our 
mailshots out through a cheaper ISP.

I was pleased to find 
http://www.linuxguruz.com/iptables/howto/2.4routing-11.html since this is 
exactly what we're after, but I simply can't get it working, nor can I 
determine is this is a lartc or netfilter issue, hence the post here :)

Our cheaper ISP is at 213.160.115.1 and I'm already sending all data from 
213.2.4.33 out through it using iproute's own syntax, but now I'd like to get 
more granular and involve the MARK target in netfilter.

This works:

# ip rule add from 213.2.4.33 table 100
# ip route add default via 213.160.115.1 table 100

I can see the results immediately with tcpdump that all traffic is going out 
on the correct interface.

However, this doesn't work:

# iptables -A PREROUTING -i eth1 -s 213.2.4.37 -t mangle -j MARK --set-mark 50
# ip rule add fwmark 50 table 100

Packets from 213.2.4.37 continue to have their route selected by BGP / zebra 
just as everything else does.

I know the packets are getting into the right chain because of:

# iptables -t mangle -vnL
Chain PREROUTING (policy ACCEPT 962K packets, 473M bytes)
 pkts bytes target     prot opt in     out     source               
destination
27602   24M MARK       all  --  eth1   *       213.2.4.37           0.0.0.0/0          
MARK set 0x32

.. and yet the rules are there:

# ip rule ls
0:      from all lookup local
32764:  from all fwmark       50 lookup 100
32765:  from 213.2.4.33 lookup 100
32766:  from all lookup main
32767:  from all lookup default

Any ideas? :)

Cheers,
Gavin.

