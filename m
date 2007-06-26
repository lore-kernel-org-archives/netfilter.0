From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Two gateway for two diff eth in one machine
Date: Tue, 26 Jun 2007 23:59:29 +0200
Message-ID: <46818C41.8050605@rtij.nl>
References: <005c01c7aead$58077f10$1664a8c0@ssplscu22>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005c01c7aead$58077f10$1664a8c0@ssplscu22>
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
To: "rajeev.sekhar" <rajeev.sekhar@sumasoft.net>
Cc: netfilter@lists.netfilter.org

rajeev.sekhar wrote:
> Hi list ,
>
> My senario is simple to u guys , but i cant find solution.

Well it is not simple to me either.

>
> i am having a mail server with two eth
> eth0  192.168.1.2
> eth1  192.168.1.3

OK. What do you think this accomplishes? Absolutely nothing! This is 
exactly the same as having one ethernet card with two addresses:
- Both will listen to their own AND the other address (unless you've 
done some serious trickery, which I can tell you haven't)
- Outgoing connections will choose one of the IPs. You can have control 
over which one is choosen, but that has nothing to do with to which card 
it is bound.
- Forwarded connections will use one or the other ethernet card, as 
these are connected to the same subnet, it doesn't matter one bit which one.

You seem seriously confused on how tcp/ip works.

>
> i want gateway of eth0 (192.168.1.2) to be 192.168.1.41   &
> gateway of eth1 (192.168.1.3) to be 192.168.1.51

This is nonsense. There can be only one gateway.


>
>
> I will explain in detail.
> I have two seperate VPN server( which is the same as 192.168.1.41 & 
> 192.168.1.51), where i want to DNAT port 25 from both VPN servers to 
> my qmail server ( mail server got two ip 192.168.1.2 & 192.168.1.3). I 
> am doing this because my MX record of mail server & VPN servers are 
> the same.
> My DNAT rule is right in both VPN servers. You can say my VPN server 
> is the gateway for my mail server.

OK.

> my eth file on qmail server is
>
(snip config files with both gateways set)

>
> i givin the GATEWAY on both eth,  but when i do   route -n   it looks 
> like
>
> [root@mail ~]# route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    
> Use Iface
> 192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        
> 0 eth0
> 192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        
> 0 eth1
> 169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        
> 0 eth1
> 0.0.0.0         192.168.1.51    0.0.0.0         UG    0      0        
> 0 eth0
> [root@mail ~]#

Yes, you can only have one gateway.

>
> now my eth1  is only working, because the default gateway is 
> 192.168.1.51.
>
> i want gateway of eth0 (192.168.1.2) to be 192.168.1.41   &
> gateway of eth1 (192.168.1.3) to be 192.168.1.51   which are on the 
> same machine.
>

I don't see the problem. Well I do, you have two VPN servers serving 
remote clients. What you have to do is to get your routing correct and 
everything will work.

Start here:
- Forget about iptables, you have a routing problem.
- Make sure your VPNned users use unique IPs/subnets (if not, see below)
- Get rid of one of the ethernet cards, you don need two.
- Get rid of the second IP address for your mail server, you don need 
that as well (in other words, when getting rid of one ethernet card, don 
assign the address as an additional address to the other card).
- Make sure you have routes for VPN users on VPN-server A to go to VPN 
server A, idem for B. If these are assigned dynamically and can be on 
either server, you need a routing protocol to dynamically set up your 
routing (or some very deep trickery that I will not go into unless paid 
at least E200,-/hr :-)

If all this makes no sense to you, get a good book on tcp/ip. Actually 
more than one.

If not all VPN users have unique IPs/subnets, you have a very serious 
challenge before you. It can be done, but you REALLY don want that. 
Because you have shown you do not really understand tcp/ip (the two 
ethernet cards that accomplish absolutely nothing), let me assure you, 
you don want this. Really.

Hope this helps,
M4


