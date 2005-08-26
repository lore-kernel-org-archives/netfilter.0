From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: restricting connections from a single connection to a single
 destination
Date: Fri, 26 Aug 2005 16:25:55 -0500
Message-ID: <430F88E3.4090203@riverviewtech.net>
References: <fdb0cf3905082601211b085c1c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fdb0cf3905082601211b085c1c@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

psihozefir wrote:
> I have a small LAN with my neighbours and they have access to the
> Internet through my router. I once needed to block pc to pc traffic
> because the LAN is made of about 10 low cost ethernet switching hubs
> on four level tree and they could not manage the connections between
> machines. So I had a lot of unuseful traffic in the network. They
> started to act like non-switching hubs. The maximum transfer speed
> dropped to 2.5 Mbyte/s (that's unacceptable). [ They are 48 neighbours
> connected to this LAN. ]

This is not your typical "Small LAN".  I would be willing to bet that you are breaking the 3-4-5 rule for ethernet if I am guessing at your LAN correctly.  I HOPE that you have a hub / switch in each apartment and then are uplinking them all to a master switch (no hub for the master).  I'm guessing that you are not using any managed switches and that they are all layer 2 at that.  With this in mind there is not much that can be doen to establish redundant / additional links to handle more of the bandwidth.  If for some reason you are not able to physically cable the hubs / switches in each apartment back up to a central switch you should at least cable as many as you can to say three or four intermediary switches that then cable back up to the central switch.  If you do have a couple of apartments that have a lot of traffic that they send back and forth between each other I would try to 
 put them on the same upstream switch thus limiting their traffic to that switch and two li
nks not the entire network.  If you could spend a little bit of money on at least a low end managed layer 2 switch for the center, say a D-Link DES-3226, I think you could bond together multiple 10/100 links from your router to the switch thus giving you more bandwidth to work with too.

> Solution:
> Each switch has its own subnet and the router is virtually on all
> subnets with the lowest address on that subnet. The router has aliases
> for eth1 (10 aliases). Problem: the traffic between subnets goes
> through the router. The router has one 100 Mbit/s connection to LAN.
> Concurrent connections slow each other, if they are all betweeen
> different subnets. The router is unnecesarily loaded.

If you only need to send traffic from one subnet to a limited number of hosts on another subnet try multi homing the device that is on the other subnet back to the first subnet so it is included in the subnet and thus does not have to have it's traffic go through the router.

> I had to develop the solution fast, and I know nothing about vlans. I
> googled for docs but none I've found was short and step-oriented. I
> also looked for solutions that explaind in terms of "for this feature
> to work these are the minimum requirements: a), b) and c)". This could
> improve troubleshooting in case of something is not working. I just
> verify the a), b) and c) conditions to be fulfilled.
> 
> I've found sites where the concept was explained, but it was too much
> to read and experiment until I could be able to do something useful.
> The network should be operational during the tests with short times of
> inoperability.

*nod*  If you have never messed with VLANs they can be a bit much to take in at one time.  However having read what your network layout is I don't think that VLANs are a good choice for you b/c you would have to have support for it in your end equipment as it sounds like your hubs / switches will not have support for it.  Thus it is not the best candidate for your situation.

> Sorin...
> P.S. If you can explain the VLAN concepts and write a How-to I would
> very much appreciate your effort. Thank you.

I have a client now that is a sorority with 22 rooms (4 computers per room) plus a small computer lab (4 computers) and the house mother's room.  Last year the network would go down at least once per month b/c of viral activity running rampant on the network.  What I'm going to be doing is setting up a VLAN for each room.  Thus I'm going to have to configure the 2 network switches to put the ports for each room in to a VLAN and then set up an interface on the router that is also in that VLAN.  I'll have to trunk (802.1q tag) the traffic between the switches and the router that I'm going to put in to place.  I'm having to replace the router that is there b/c it does not understand VLANs.  Once I have all 24 VLAN interfaces on the router configured I'm going to set up bridging between all the interfaces so that the router's IP can be on the bri0 interface.  I'll use EBTables to make sure t
 hat the VLANs will not be able to talk to each other, just the VLAN and the router.



Grant. . . .

