From: Martijn Lievaart <m@rtij.nl>
Subject: Re: NAT on stateless firewall ?
Date: Mon, 06 Aug 2007 07:01:25 +0200
Message-ID: <46B6AB25.3050906@rtij.nl>
References: <46B26400.7050504@andrei.myip.org>	<46B2FB97.3090605@plouf.fr.eu.org>	<46B3729A.8030605@andrei.myip.org>	<46B37DD2.8020606@andrei.myip.org>	<46B37EB5.3060803@rtij.nl>	<46B38856.1020003@andrei.myip.org>	<46B39567.5080004@riverviewtech.net>	<46B6300A.7020404@rtij.nl>
	<46B673A5.6030303@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B673A5.6030303@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant Taylor wrote:
> You stated "... arp makes the packet arrive ...", which I must disagree
> with.  The sending host sends the traffic to the target hosts / gateways
> NIC.  Arp is used by the sending host to learn the MAC address of the
> target host / gateway in the event that the sending host does not
> already know it.  Other than converting an IP address to MAC address,
> ARP has nothing to do with the communications between two systems.
>   


The sender wants to send a packet. It uses arp to find out which MAC to 
send to. It sends it. The packet arrives at the destination nic. That's 
all I ment, not more, not less.

However, having arrived at the nic, the packet is then transfered to the 
stack. If the stack does not know about the destination IP, the packet 
is dropped by routing, iirc. However, before routing (in PREROUTING) the 
destination is changed to something the stack does know about. So how 
comes it does not work?

M4


