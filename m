From: "Shaun T. Erickson" <ste@smxy.org>
Subject: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 12:01:54 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41334F72.4010402@smxy.org>
Reply-To: ste@smxy.org
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have a SonicWall Pro 330 that's giving me no end of grief, and so I 
want to replace it. It's my primary firewall. Becase we have two LANs 
and the SonicWall only has one LAN port, I have an iptables 
router/firewall that's connected to the LAN port of the SonicWall. The 
two LANs hang off of the iptables machine. The SonicWall provides our 
DMZ, as well.

I want to collapse the two systems into one, but I'm not quite sure how 
to do it.

I want one iptables-based firewall, with four NICs, that connect to our 
external router, our DMZ switch, and each of our two internal LAN switches.

I believe I know how to set it up so that traffic from either internal 
LAN gets NAT'd to the firewall's external IP address, for traffic headed 
to the Internet, and de-NAT'd on the way back. I also believe I know how 
to allow traffic to flow back and forth between the two LANs, where 
NAT'ing isn't needed.

However, I'm not sure how to handle the external network and the DMZ. We 
have a /28 subnet from our ISP. Our router uses one address on the 
subnet. From the router, you proceed to a switch, where three devices 
are plugged in: a wireless access point, a VPN device, and the external 
interface of the SonicWall firewall. All three devices have addresses on 
the same /28 subnet as the router. Additionally, the SonicWall's DMZ 
interface does not have and address assigned to it - it is somehow 
logically bridged to the external interface. The systems in the DMZ are 
also on the same /28 subnet. You tell the SonicWall which IP addresses 
are in use in the DMZ, so that it knows which interface to send traffic 
for that subnet out of. Internal traffice, heading out either the 
external or DMZ interfaces of the SonicWall, appear to come from the 
external address of the SonicWall. I have no idea how to replicate this 
setup under iptables.

Lastly, some systems in the DMZ need to access database servers on one 
of the internal LANs. The LANs use private, non-routable address space 
(192.168.32.0 & 192.168.40.0). So, I need certain systems in the DMZ, to 
be able to initiate connections through the firewall, to systems on my 
40-net. No NAT'ing is needed for these connections, but I'm not sure how 
to set them up, either. On the SonicWall, we just put a rule in that 
allows it, and two static routes, so it knows to forward traffic for 
those nets to the linux box. Somehow I think it isn't as simple under 
iptables, but hopefully I'm wrong.

Sorry for the length of this, but I wanted to try and describe it all 
accurately. I've never set up an iptables firewall that is so 
(seemingly) complicated before.

Thanks, in advance, for any guidance you can give me.

	-ste

