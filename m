From: "Shaun T. Erickson" <ste@smxy.org>
Subject: Re: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 16:23:52 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41338CD8.30603@smxy.org>
References: <D5C9032B2B09C64EA2409D6214E91AC9051304@asimail2.alphanumeric.com>
Reply-To: ste@smxy.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051304@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: netfilter@lists.netfilter.org

>>I believe I know how to set it up so that traffic from either internal
>>LAN gets NAT'd to the firewall's external IP address, for traffic headed
>>to the Internet, and de-NAT'd on the way back. I also believe I know how
>>to allow traffic to flow back and forth between the two LANs, where
>>NAT'ing isn't needed.
> 
> 
> just to be clear:
> 
> 	iptables -t nat -A POSTROUTING -o $EXTERNAL_IF \
> 	  -s $INTERNAL_NET_1 -j SNAT --to-source $EXTERNAL_IP
> 
> 	iptables -t nat -A POSTROUTING -o $EXTERNAL_IF \
> 	  -s $INTERNAL_NET_2 -j SNAT --to-source $EXTERNAL_IP

Ok, and I know how to do the inter-LAN stuff, as I'm doing it on the 
current linux box, where the database LAN is substantially firewalled 
off from the corporate LAN and everything else.

>>However, I'm not sure how to handle the external network and the DMZ. We
>>have a /28 subnet from our ISP. Our router uses one address on the
>>subnet. From the router, you proceed to a switch, where three devices
>>are plugged in: a wireless access point, a VPN device, and the external
>>interface of the SonicWall firewall. All three devices have addresses on
>>the same /28 subnet as the router. Additionally, the SonicWall's DMZ
>>interface does not have and address assigned to it - it is somehow
>>logically bridged to the external interface. The systems in the DMZ are
>>also on the same /28 subnet. You tell the SonicWall which IP addresses
>>are in use in the DMZ, so that it knows which interface to send traffic
>>for that subnet out of. Internal traffice, heading out either the
>>external or DMZ interfaces of the SonicWall, appear to come from the
>>external address of the SonicWall. I have no idea how to replicate this
>>setup under iptables.
> 
> 
> if you desire to replicate this exactly with netfilter, you would create
 > a bridge between the external and DMZ interfaces (man 8 brctl), and use
> ebtables to do the bridge filtering (http://ebtables.sourceforge.net/).

Ok.

> your other option could be to leave the /28 of public space outside the
 > firewall, re-address the DMZ hosts to use private space, and setup
 > one-to-one NATs for the DMZ hosts, and keep your firewall solely layer 3
 > (my bias--i love the routing).

I like this idea better, but I'm confused about a couple of things. 
First, I've never done one-to-one NAT, but I'm sure I can look that up. 
Second, will I require any special rules to allow internal LAN hosts to 
access the DMZ systems by their public IP addresses? I want to be sure 
internal systems access them the same way as external systems. Third, 
when I write rules for what access is allowed to what systems in the DMZ 
from either the Internet or the LANs, what do I write the rule against: 
the real, pulic IP of the DMZ server, or it's private IP address?

>>Lastly, some systems in the DMZ need to access database servers on one
>>of the internal LANs. The LANs use private, non-routable address space
>>(192.168.32.0 & 192.168.40.0). So, I need certain systems in the DMZ, to
>>be able to initiate connections through the firewall, to systems on my
>>40-net. No NAT'ing is needed for these connections, but I'm not sure how
>>to set them up, either. On the SonicWall, we just put a rule in that
>>allows it, and two static routes, so it knows to forward traffic for
>>those nets to the linux box. Somehow I think it isn't as simple under
>>iptables, but hopefully I'm wrong.
> 
> 
> well--the linux box in the new scenario will be directly connected to those LANs (as it is now)--so you won't need static routes to them.  you will need rules that allow the DMZ hosts to connect, though:
> 
>   iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
>   iptables -A FORWARD -i $DMZ_IF -o $LAN_IF1 -p tcp --syn \
>     -s $DMZ_HOST --sport 1024:65535 -d $LAN_HOST --dport $DB_PORT -j ACCEPT
> 
>   [ repeat as necessary ]

Ok.

> let me know what i missed.

So far, so good. I may have more questions after your reply. :) Thanks 
for your help. :)

	-ste

