From: Joshua Snyder <josh@imagestream.com>
Subject: Problem with ipconntrack+snat and changing routes
Date: Thu, 03 Nov 2005 17:42:52 -0500
Message-ID: <436A926C.8080803@imagestream.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have ran into this more than once and I just wanted to know if anyone 
else has ever seen this; I know everything I am talking about it valid 
for 2.4 kernels.  I don't think this is different in 2.6 but it might be.

What seems to be going on is the following.  Say we have a machine with 
two connections to the Internet and we are doing Nat on both of the 
external interfaces.  Something like...

                                          Eth2
                    Eth0  *-----------*--------> Cable 12.23.32.15
Internal network --------| Linux box |
  192.168.0.0/24          *-----------*--------> Dsl 34.36.23.89
                                          Eth1

Then we setup some Source Nat like...

# Snat for Cable
iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 12.23.32.15
# Snat for Dsl
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 34.36.23.89

This works just fine... now here is where things start breaking.  If you 
use routing tables to statically put traffic onto one or the other 
external links things work as you would expect.  But you try to do route 
load balancing or you change which link your transmitting packets on you 
can end-up with very odd results.

So, if we do this to load balance traffic...

ip route add default scope global \
	nexthop via 12.23.32.1 dev eth2 weight 1 \
	nexthop via 34.36.23.1 dev eth1 weight 1

Now we are doing route based load balancing.  And everything will work 
fine until the route cache for a tracked connection expires.  For 
instance if you ssh into a machine but you go idle for an hour or so... 
Then what happens is the following, the Linux box will do a new route 
lookup if the new route lookup matches what you had before everything 
will still work fine.  But if the machine picks the other interface as 
the new route, packets will get sent out on the wrong interface still 
snated with the ip address of the other interface.

For example what you see is this... In the example above if you had a 
connection that was originally using eth2 so it was getting nated to 
12.23.32.15.  But if later on the route changes so your now going out 
eth1 you will still be transmitting packets with the Ip address of 
12.23.32.15 on your DSL link which has an ip address of 34.36.23.89. 
Most of the time this traffic will be dropped by your Isp.

Now, I understand that you can't just start sending packets for this 
connection with a new ip address.  But it doesn't sound like we should 
be sending these packets down the wrong interface.  I am not sure what 
the best thing to do in this case is... The above example is just one of 
a few ways you can see this problem(manually changing routing and 
Ospf/Bgp for example).  The worst case is if you have a routing change 
but your conntrack doesn't expire and routing doesn't change again after 
the first time... the only way to get stuff to work again is to unload 
ip_conntrack from the kernel.  I have ran into these issues a few times 
now and I was just wondering if anyone else has seen this or how SNAT 
should handle these cases.

			Josh

