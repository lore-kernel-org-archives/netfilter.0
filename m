From: Philip Craig <philipc@snapgear.com>
Subject: Re: Port forwarding
Date: Fri, 06 Jun 2003 18:15:10 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EE04D8E.7040306@snapgear.com>
References: <012501c32b47$abfd4340$0223a8c0@satconet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <012501c32b47$abfd4340$0223a8c0@satconet.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dhyanesh Ramaiya <dhyanesh@intafrica.com>
Cc: netfilter@lists.netfilter.org

Dhyanesh Ramaiya wrote:
> iptables -t nat -A PREROUTING -j DNAT -p tcp -d <public_ip> --dport 110 --to
> <private_ip>:110
> iptables -t nat -A PREROUTING -j DNAT -p tcp -d <public_ip> --dport 25 --to
> <private_ip>:25
> 
> What happens, is that when I try to telnet port 25 or 110 from the router
> itself, it doesn't connect and gives the error "Connection refused".
> However, from any other machine on the network it connects. Thinking that
> some firewall rules might be blocking the connection, the default policy of
> all chains is set to accept.

Packets from the router itself do not go through the PREROUTING
chain, so they aren't being NATed.  You'll need to add similar
NAT rules in the OUTPUT chain.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


