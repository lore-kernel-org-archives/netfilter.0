From: Andrew Baumann <andrewb@cse.unsw.edu.au>
Subject: masquerading before ipsec (2.6)
Date: Wed, 9 Jun 2004 16:53:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406091653.57763.andrewb@cse.unsw.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I have a gateway box with a VPN tunnel to a secure network. This box is also 
connected to a local LAN with private IPs. I would like the gateway to 
masquerade traffic from the local LAN destined for the secure network across 
the VPN tunnel.

The way the VPN setup seems to work in 2.6 is that there is only one external 
interface (ppp0 in this case), but that interface has two IPs, one on the 
internet and one on the secure network (which is tunneled). The routes and 
VPN on the gateway box work correctly, and I've done a basic masquerading 
setup:
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
however, the machines on the LAN can only access the internet, not the VPN 
tunnel. Watching the log, packets destined for the secure network get sent 
out on the external interface with the internet IP. I tried adding a rule to 
use SNAT to force them to the secure IP, but this doesn't work (I guess 
whatever changes the IP encrypts the packet).

Observing test packets from the gateway traverse the chains, I see that 
traffic destined for the secure network always has the source IP address of 
the tunnel, and traffic destined for the internet always has the internet 
source IP.

Somewhere there must be a routing decision that says to encrypt traffic 
destined for the secure network, and use the different source IP, but it 
seems that this happens before the packet hits iptables. I think I need a way 
to take a masqueraded packet from the POSTROUTING chain and feed it into the 
VPN.

Can anyone tell me if what I'm trying to do is even possible? And if so what 
I'm doing wrong?

thanks in advance,
Andrew

