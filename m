From: "Shaun T. Erickson" <ste@smxy.org>
Subject: Re: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 14:41:01 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413374BD.7050701@smxy.org>
References: <41334F72.4010402@smxy.org>
Reply-To: ste@smxy.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41334F72.4010402@smxy.org>
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
To: ste@smxy.org
Cc: netfilter@lists.netfilter.org

I wrote:

> However, I'm not sure how to handle the external network and the DMZ. We 
> have a /28 subnet from our ISP. Our router uses one address on the 
> subnet. From the router, you proceed to a switch, where three devices 
> are plugged in: a wireless access point, a VPN device, and the external 
> interface of the SonicWall firewall. All three devices have addresses on 
> the same /28 subnet as the router. Additionally, the SonicWall's DMZ 
> interface does not have and address assigned to it - it is somehow 
> logically bridged to the external interface. The systems in the DMZ are 
> also on the same /28 subnet. You tell the SonicWall which IP addresses 
> are in use in the DMZ, so that it knows which interface to send traffic 
> for that subnet out of. Internal traffice, heading out either the 
> external or DMZ interfaces of the SonicWall, appear to come from the 
> external address of the SonicWall. I have no idea how to replicate this 
> setup under iptables.

It occurs to me that I'm running out of IPs anyway, so maybe what I 
should do is get two subnets from my ISP: a subnet of 16 (14 usable) 
addresses for the router, the firewall's external interface, and 
everything in between, and a subnet of 32 (30 usable) addresses for my 
DMZ. That would work, yes?

	-ste

