From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT on stateless firewall ?
Date: Sun, 05 Aug 2007 20:04:37 -0500
Message-ID: <46B673A5.6030303@riverviewtech.net>
References: <46B26400.7050504@andrei.myip.org>	<46B2FB97.3090605@plouf.fr.eu.org>	<46B3729A.8030605@andrei.myip.org>	<46B37DD2.8020606@andrei.myip.org>	<46B37EB5.3060803@rtij.nl>	<46B38856.1020003@andrei.myip.org>	<46B39567.5080004@riverviewtech.net>
	<46B6300A.7020404@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B6300A.7020404@rtij.nl>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 8/5/2007 3:16 PM, Martijn Lievaart wrote:
> I remember using this with host routes. The arp makes the packet arrive,
> routing gets it to it's destination. I'm actually surprised the above
> does not work. Unfortunately I currently have no setup to test this.
> Anyone can explain why it doesn't work?

Please keep in mind that ARP is a method to identify the MAC address of
an IP address in the same subnet, nothing more.

If two hosts in the same subnet want to communicate with each other they
will send the traffic to each others MAC address.  If the sending host
does not know the MAC address of the target host, the sending host will
then send and ARP request to locate the MAC address of the target host.
 Once the sending host knows the MAC address of the target host it will
send the actual traffic directly to the target host.

If two hosts *NOT* in the same subnet want to communicate with each
other they will send the traffic via a (default) gateway.  The gateway
in to the target subnet will then send the traffic to the target's MAC
address.  If the gateway does not know the MAC address of the target
host it will send an ARP request to locate the MAC address.  Once the
gateway knows the MAC address of the target host it will send the actual
traffic directly to the target host.

Consider the following scenario.

+--------+   +-----------------+   +--------+
| Host A +---+ (1) Gateway (2) +---+ Host B |
+--------+   +-----------------+   +--------+

Host A has a static MAC address entry for the Gateway NIC (1).
Gateway has a static MAC address entry for Host A.
Gateway has a static MAC address entry for Host B.
Host B has a static MAC address entry for the Gateway NIC (2).

As long as Host A has a route to Host B by way of Gateway NIC (1) and
Host B has a route to Host A by way of Gateway NIC (2), then hosts A and
B can communicate with each other with out having to use ARP at all.

You stated "... arp makes the packet arrive ...", which I must disagree
with.  The sending host sends the traffic to the target hosts / gateways
NIC.  Arp is used by the sending host to learn the MAC address of the
target host / gateway in the event that the sending host does not
already know it.  Other than converting an IP address to MAC address,
ARP has nothing to do with the communications between two systems.



Grant. . . .

