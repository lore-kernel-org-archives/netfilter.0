From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Bridging selected MACs
Date: Sun, 15 May 2005 19:22:50 -0500
Message-ID: <4287E7DA.9020302@riverviewtech.net>
References: <1115888494.12824.18.camel@ghanima>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115888494.12824.18.camel@ghanima>
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

> I like to ask, if there is way to construct a bridge, but only for two
> selected MAC addresses.  This can be achieved by 2 rules,
> 
> (Assuming 
> MAC0 is on eth0 and 
> MAC1 is on eth1)
> 
> MAC0 -> (MAC1 or broadcast MAC):      copy ethernet frame to eth1
> MAC1 -> (MAC0 or broadcast MAC):      copy ethernet frame to eth0
> 
> For this construction, there would be 2 new things needed in netfilter:
> 
> 1. a --mac-dest rule
> 2. a simple ethernet frame copy to a designated network device.
> 
> These capabilities are not present, and the reason for this -- I presume
> -- is the bridge code in net/bridge.  Unfortunately, I have not found a
> way to get an operational bridge, as there are no filtering capabilities
> in the bridge control interface.  I'm also not sure if I should even aim
> for a bridge, because the box is doing NAT between eth0 and eth1.
> 
> However, I would be thankful for any insight.
> 
> (Please don't ask why I'm trying to construct this strange
> configuration. In a nutshell, I have a VOIP box supplied by my ISP that
> needs to sit on the external network, and talks to some radius DHCP in
> alien languages.  I simply don't want to wire the external network in my
> house to separate my DHCP traffic.)

What you are really asking for is a function of EBTables, the layer 2 filtering technology for the Linux kernel.  You would ultimately write a rule (in what ever syntax that EBTables uses (I think it is similar to IPTables)) that would test to see if the source and / or destination MAC addresses were the MACs that you are interested in, if they were you would bridge then.  If the traffic was not the explicit traffic that you would want to bridge you would tell EBTables to send the traffic on up to the routing layer.  I personally have not played with this but from my reading you would want to do something like this:

(Assuming that you have EBTables patch applied and compiled in or as a module)

# Set a default policy of DROP in the broute table BROUTING chain which will cause traffic (that is not explicitly ACCEPTED) to be routed.
ebtables -t broute -P BROUTING DROP
# Flush the broute table BROUTING chain for good measure.
ebtables -t broute -F BROUTING
# Bridge traffic from your upstream ISPs equipment to the VoIP equipment.
ebtables -t broute -A BROUTING -i <INet interface> -o <LAN interface> -s <MAC of ISP equipment> -d <MAC of your VoIP equipment> -j ACCEPT
# Bridge (normal) traffic from your VoIP equipment out to the upstream ISPs equipment.
ebtables -t broute -A BROUTING -i <LAN interface> -o <INet interface> -s <MAC of your VoIP equipment> -d <MAC of ISP equipment> -j ACCEPT
# Bridge (DHCP) traffic from your VoIP equipment out to the upstream ISPs equipment.
ebtables -t broute -A BROUTING -i <LAN interface> -o <INet interface> -s <MAC of your VoIP equipment> -d ff:ff:ff:ff:ff:ff -j ACCEPT

Something to keep in mind is that (if memory serves) DHCP traffic is sent out from the unicast MAC address of the equipment that is DHCPing to the broadcast MAC address of ff:ff:ff:ff:ff:ff.  Replies from the DHCP server will be from the DHCP server's unicast MAC address to the unicast MAC address of the DHCP client.  This is why you will need two rules in side of ebtables to match and ACCEPT (bridge) traffic from your internal LAN to your INet connection.

Below is a snip it from the ebtables man page to explain the ACCEPT vs DROP in the broute table BROUTING chain.

<snip it from the ebtables man page talking about the broute table>
broute, is used to make a brouter, it has one built-in chain: BROUTING. The targets DROP and ACCEPT have special meaning in the broute table. DROP actually means the frame has to be routed, while ACCEPT means the frame has to be bridged. The BROUTING chain is traversed very early. It is only traversed by frames entering on a bridge enslaved NIC that is in forwarding state. Normally those frames would be bridged, but you can decide otherwise here. The redirect target is very handy here.
</snip it from the ebtables man page talking about the broute table>

If I have understood your request correctly I think this solution will definitely put you on the right path if not resolve your problem.



Grant. . . .

