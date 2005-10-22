From: Tom Gaudasinski <cetus@internode.on.net>
Subject: Routing from private to bridge
Date: Sat, 22 Oct 2005 00:14:57 +0000
Message-ID: <43598481.8040306@internode.on.net>
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

Greetings,
    I have a problem in regards to the routing i've set up. I have a 
public subnet bridged from my ISP(DSL), it's a full bridge. So in order 
to use this subnet i have created a bridge out of two eth interfaces so 
that i may also firewall what will be behind the router. In addition to 
this I have a private subnet (192.168.1.x) that I NAT to the public IP 
of the router. My setup looks like this:

          DSL Modem (in bridge mode)
                        |
                  / eth0 \
                  <br0> 120.40.60.194/29
                  \ eth1 /
                 /           \__ Publically addresses machines
             eth2       
       192.168.1.1___Privately NATted machines

So eth0 and eth1 are part of the bridge (which has 1 ip address), and 
eth2 has a private address. eth0 plugs directly into the dsl modem, eth1 
into a switch that contains publically addressed computers and eth2 
logically so as well. I've set the rules up so that the users behind 
eth2 get natted and the public users also get internet. This works, what 
doesn't work however is that the 192.168.1.x users cannot communicate 
with the publically addressed users through the router. Even when the 
firewall has been cleared out (of natting rules) they still cannot ping 
or communicate. It seems there's a different procedure for routing to a 
bridge. my route -n output is:

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
120.40.60.192  0.0.0.0         255.255.255.248 U     0      0        0 br0
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth2
0.0.0.0         120.40.60.193  0.0.0.0         UG    0      0        0 br0

How can i get the private LAN users to route to the publically bridged 
subnet?

Thankyou.



