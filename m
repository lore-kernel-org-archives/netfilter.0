From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Seamless communication across VPN link
Date: Thu, 17 Mar 2005 02:03:54 -0600
Message-ID: <423939EA.2090107@riverviewtech.net>
References: <1110871981.692.68.camel@localhost.localdomain>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1110871981.692.68.camel@localhost.localdomain>
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
To: Paul Dorman <pauld@cwa.co.nz>
Cc: netfilter@lists.netfilter.org

Paul, do you have to maintain the 192.168.130.x/24 network on both sides of your VPN?  In other words do you have equipment on both sides of your VPN that has a 192.168.130.x/24 address that can not be changed?  Or could you use standard routing to point to your 192.168.130.x/24 network via the other side VPN router?  If you can do the latter it is much easier, you just need to set up some manual routing on your main 10.10.10.1 main_inet_router, 10.10.10.5 this_side_VPN_router, and 10.10.15.253 other_side_VPN_router.  If you can not do that you are probably looking at something like ProxyARP, if it will even work across a VPN, or some extremely complex S/DNATing rules on both sides with your VPN routes.

For the sake of discussion let's presume the following to be true:

1)  You do have to maintain the 192.168.130.x/24 subnet on both sides of the VPN for some untold / does not matter reason(s) and you are thus stuck doing it the hard way.
2)  A.B.C.D (Any given IP of a device talking to your VC equipment) is TXing to 192.168.130.4 (on the other_side).
3)  Both systems use eth0s as their LAN, and eth1s as their VPNs.
4)  The this_side_VPN_router has an internal alias interface eth0:4 with an address of 192.168.130.4.
5)  The other_side_VPN_router has an internal alias interface eth0:1 with an address of 192.168.130.1.

On the this_side_VPN_router you will have an IPTables rule (rule #1) along the lines of "iptables -t nat -A PREROUTING -i eth0:4 -d 192.168.130.4 -j DNAT --to-destination 10.10.15.4"
On the other_side_VPN_router you will have an IPTables rule (rule #2) along the lines of "iptables -t nat -A PREROUTING -i eth1 -d 10.10.15.4 -j DNAT --to-destination 192.168.130.4".
This way any traffic on this_side that is destined for 192.168.130.4 will be handled by the 10.10.10.5 systems alias interface eth0:4 and DNATed to 10.10.15.4 which is on the other side of the VPN.  When the traffic enters the other_side_VPN_router (from the VPN) you will then DNAT the destination back to 192.168.130.4 which will be attached to eth0:4 on the other_side_VPN_router.

Any return traffic will proceed as follows.

On the other_side_VPN_router you will have an IPTables rule (rule #3) along the lines of "iptables -t nat -A PREROUTING -i eth0:1 -d 192.168.1.1 -j DNAT --to-destination 10.10.10.1".
On the this_side_VPN_router you will have an IPTables rule (rule #4) along the lines of "iptables -t nat -A PREROUTING -i eth1 -d 10.10.10.1 -j DNAT --to-destination 192.168.130.1".
This way any traffic on the other_side that is destined for 192.168.130.1 will be handled by the 10.10.15.253 systems alias interface eth0:1 and DNATed to 10.10.10.1 which is on the other side of the VPN.  When traffic enters this_side_VPN_router (from the VPN) you will then DNAT the destination back to 192.168.130.1 which will be attached to eth0:1 on this_side_VPN_router.

Now for some caveats / points of interest:

1)  These rules are assuming that you are going to have an address in a subnet talking directly to an address in the same subnet on the other side of a VPN/tunnel.  What this means is if 192.168.130.4 tries to talk to 192.168.25.8 the rule (rule #3) on the other_side_VPN_router will not work as is b/c the traffic is not destined for 192.168.130.1 even though it would pass through it.  Thus the rule (rule #3) would have to be modified / tweaked to match the traffic destined to 192.168.25.8.  I'm guessing the traffic in your VC network is all in the 192.168.0.0/255.255.0.0 (16) network?  If this is the case you could have a rule below all the other rules for other devices in the 192.168.130.0/255.255.255.0 (24) network that would be something like this "iptables... -d 192.168.0.0/255.255.0.0...".  But then you have to worry about the fact that you will have to get the traffic destined back
  to the correct network on the "this_side" side of the VPN as it would be DNATed to an add

ress on this_side.

2)  You are looking at having a 192.168.130.x and 10.10.1x.x IP for each VC device on both sides of your VPN.  Thus each piece of VC equipment will monopolize 3 IPs, one on each subnet.

3)  You will need to probably come up with a numbering convention for all your interfaces and psuto IP addresses so that you can associate them on each end of the links.  I.e. 10.10.10.1 <-> 192.168.130.1 <-> 10.10.15.1, 10.10.10.4 <-> 192.168.130.4 <-> 10.10.15.4, and 10.10.10.253 <-> 192.168.130.253 <-> 10.10.15.253.  I would also recommend using eth0:<last octet of the IP> to indicate what IP should go on this interface per side.  You could use any IPs and / or alias interfaces that you want, but it will just serve to make the configuration MUCH MUCH more complex and harder to diagnose when things go wrong.

4)  This is probably the BIGGEST point of contention.  it is nearly 1:30 in the morning and I've been up for 17+ hours dealing with LOTS of different things and I am just speculating on this.  It all sounds reasonable to me and in theory it should work.  But there could be blatant mistakes like the wrong chain in side of the nat table is used, or the wrong interface for traffic inbound from the VPN.  So that being said, take a look at this and see if you can figure out what I'm grasping at.  If you are thinking "...everything in this rule makes sense but this interface..." you are probably right, try it both ways.

5)  I do ask that you let me know if this helped you in any way.  Or if you would like more help in optimizing this or trying to use routing for the bulk of it to the other_side and using this method to bring a few IPs back to this_side I'd love to try to help.

6)  You, or any one else can tell me to route my self and my comments to /dev/null.

Below is an example script for each side for 5 IPs where .1 and .2 are on this_side and .3, .4, and .5 are on the other_side of the VPN.

this_side
iptables -t nat -A PREROUTING -i eth1 -d 10.10.10.1 -j DNAT --to-destination 192.168.130.1
iptables -t nat -A PREROUTING -i eth1 -d 10.10.10.2 -j DNAT --to-destination 192.168.130.2
iptables -t nat -A PREROUTING -i eth0:3 -d 192.168.130.3 -j DNAT --to-destination 10.10.15.3
iptables -t nat -A PREROUTING -i eth0:4 -d 192.168.130.4 -j DNAT --to-destination 10.10.15.4
iptables -t nat -A PREROUTING -i eth0:5 -d 192.168.130.5 -j DNAT --to-destination 10.10.15.5

other_side
iptables -t nat -A PREROUTING -i eth0:1 -d 192.168.1.1 -j DNAT --to-destination 10.10.10.1
iptables -t nat -A PREROUTING -i eth0:2 -d 192.168.1.2 -j DNAT --to-destination 10.10.10.2
iptables -t nat -A PREROUTING -i eth1 -d 10.10.15.3 -j DNAT --to-destination 192.168.130.3
iptables -t nat -A PREROUTING -i eth1 -d 10.10.15.4 -j DNAT --to-destination 192.168.130.4
iptables -t nat -A PREROUTING -i eth1 -d 10.10.15.5 -j DNAT --to-destination 192.168.130.5


Grant. . . .

Paul Dorman wrote:
> Hi everyone, I've been struggling with a problem for a while now, and
> haven't have any success, so I'm writing to you all in the hope that
> someone will be able to point out the error(s) of my ways.
> 
> We have two networks connected via two smoothwall VPN machines and a
> wireless link. On one side (I'll call it "this_side") we have a
> 10.10.10.x network and the VPN router's address is 10.10.10.5. On the
> other ("the_other_side") there is a 10.10.15.x network and the VPN
> router's address is 10.10.15.253. The 10.10.15.x network connects to the
> Internet via the link and uses our 10.10.10.1 gateway. All of this works
> well.
> 
> We recently shifted a video conference system from this_side to
> the_other_side, and this unfortunately must preserve its network
> settings. The main unit has an IP address of
> 192.168.130.4/255.255.255.248, which must be seen from both our network,
> as well as our provider's 192.168.0.0/255.255.128.0 network.
> 
> On the_other_side I have assigned an alias to the VPN router's internal
> ethernet adapter of eth0:1 192.168.130.1, which acts as the gateway to
> the 192.168.130.x computers associated with the VC unit.
> 
> On this_side I have set the gateway on our main router (10.10.10.1) to
> 10.10.10.5 for the 192.168.130.x network.
> 
> If I give this directive to this_sides VPN router:
> 
> iptables -t nat -A PREROUTING -d 192.168.130.1 -i eth0 -j DNAT
> --todestination 10.10.15.253
> 
> What I was hoping was that I could do a host route on our main router to
> this 192.168.130.1 address and a network route to the rest of the
> 192.168.130.x machines using 192.168.130.1 as the gateway. No luck
> there :o(.
> 
> My current plan is to set up three additional aliases on the
> other_side's VPN router of 192.168.130.2-4 and to use these lines to get
> the 192.168.130.x traffic to the other_side's VPN router:
> 
> iptables -t nat -A PREROUTING -d 192.168.130.2 -i eth0 -j DNAT
> --todestination 10.10.15.250
> 
> iptables -t nat -A PREROUTING -d 192.168.130.3 -i eth0 -j DNAT
> --todestination 10.10.15.251
> 
> iptables -t nat -A PREROUTING -d 192.168.130.4 -i eth0 -j DNAT
> --todestination 10.10.15.252
> 
> This works insofar as I can get to the other_side's VPN router through
> any of the 192.168.130.x addresses.
> 
> What I would *like* to do is use the same method to redirect packets
> sent to the 10.10.15.250-252 addresses to the 192.168.130.2-4 addresses
> on the other_side's network. So:
> 
> iptables -t nat -A PREROUTING -d 10.10.15.250 -i eth0 -j DNAT
> --todestination 192.168.130.2
> 
> etc.
> 
> My hope is to make the link completely invisible and allow traffic to
> get to the VC unit from both this network and the VC network provider
> outside our network. Unfortunately this doesn't work for me and my lack
> of experience at this stuff is really letting me down. All I get when I
> try the 192.168.130.x addresses is the other_side's VPN router. I've
> spent hours trying to understand the problem and how iptables works, but
> the task is still beyond me.
> 
> I hope that I've provided enough information here for someone to
> immediately see what I'm trying to achieve and perhaps post some
> possible solutions.
> 
> Thanks very much for taking the time to read through this. It's not the
> nicest of problems and I would like to set up a better VPN link using
> something other than Smoothwall, but at the moment it's not a
> possibility as the other office depends on this link being continuously
> available. 
> 
> Sorry for the long post! I'll be happy to provide more information if
> necessary on or off the list.
> 
> Regards,
> Paul


