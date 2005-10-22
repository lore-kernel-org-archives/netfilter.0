From: Rod <Snaketails@optusnet.com.au>
Subject: Re: Routing from private to bridge
Date: Sat, 22 Oct 2005 12:21:11 +1000
Message-ID: <4359A217.9060109@optusnet.com.au>
References: <43598481.8040306@internode.on.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43598481.8040306@internode.on.net>
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



Tom Gaudasinski wrote:

> Greetings,
>    I have a problem in regards to the routing i've set up. I have a 
> public subnet bridged from my ISP(DSL), it's a full bridge. So in 
> order to use this subnet i have created a bridge out of two eth 
> interfaces so that i may also firewall what will be behind the router. 
> In addition to this I have a private subnet (192.168.1.x) that I NAT 
> to the public IP of the router. My setup looks like this:
>
>          DSL Modem (in bridge mode)
>                        |
>                  / eth0 \
>                  <br0> 120.40.60.194/29
>                  \ eth1 /
>                 /           \__ Publically addresses machines
>             eth2             192.168.1.1___Privately NATted machines
>
> So eth0 and eth1 are part of the bridge (which has 1 ip address), and 
> eth2 has a private address. eth0 plugs directly into the dsl modem, 
> eth1 into a switch that contains publically addressed computers and 
> eth2 logically so as well. I've set the rules up so that the users 
> behind eth2 get natted and the public users also get internet. This 
> works, what doesn't work however is that the 192.168.1.x users cannot 
> communicate with the publically addressed users through the router. 
> Even when the firewall has been cleared out (of natting rules) they 
> still cannot ping or communicate. It seems there's a different 
> procedure for routing to a bridge. my route -n output is:
>
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    
> Use Iface
> 120.40.60.192  0.0.0.0         255.255.255.248 U     0      0        0 
> br0
> 192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        
> 0 eth2
> 0.0.0.0         120.40.60.193  0.0.0.0         UG    0      0        0 
> br0
>
> How can i get the private LAN users to route to the publically bridged 
> subnet?
>
> Thankyou.

    Hello, I had a similar problem until I setup my IPTables rules for 
the configuration I have running..

eth0 = Dialin access & Wireless Access
eth1 = cable Internet
eth2 = gigabit network to my main machine
bt0 = Bluetooth WAP only when a BT connection is established (down 
otherwise)

Bridge (Jumpgate) = eth0, eth2

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
192.168.3.0      *               255.255.255.0   U     0      0        0 
jumpgate
211.28.229.0    *               255.255.255.0   U     0      0        0 eth1
loopback           *               255.0.0.0           U     0      
0        0 lo
default         211.28.229.1.op 0.0.0.0         UG    0      0        0 eth1

    Also here are the sections from my IPTABLES..

iptables/rules-save
-A SWITCH -i jumpgate -o lo -j OUTG
-A SWITCH -i jumpgate -o eth1 -j OUTG
-A SWITCH -i eth1 -o jumpgate -j INCOM
-A SWITCH -i lo -o jumpgate -j INCOM
-A SWITCH -i jumpgate -o jumpgate -j OUTG

    I am able to Ping from the machines on eth2 -> the wireless (across 
the bridge) also eth2 -> the world, World -> eth2

brctl show
bridge name     bridge id                          STP enabled     
interfaces
jumpgate          8000.001195ed1217       no                    eth0
                                                                                       
eth2

    Bridge Info (brctl showstp jumpgate) I'm just showing the relevent info

 brctl showstp jumpgate
eth0 (1)
 port id                8001                    state                
forwarding
eth2 (2)
 port id                8002                    state                
forwarding

    As with you, I wasn't able to ping past the bridge until I setup the 
firewall with the "-i" & "-o" routines, I even checked the ip_forwarding 
= "1" under /proc/sys/whatever.

    Hope this helps.

