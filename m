From: Colin <cheming@nsw.bigpond.net.au>
Subject: UDP packet forwarding
Date: Fri, 20 Dec 2002 17:32:02 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.1.20021220172335.01d43550@144.135.24.13>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I am running Linux Kernel 2.4.20 and iptables 1.2.7a, with a Linux server 
doing primarly SNAT work for masquerading. I don't seem to be able to 
forward UDP packets with iptables. I am able to forward TCP packets through 
the firewall, such as identd requests, like so:

iptables -t nat -A PREROUTING -j DNAT -p tcp --destination-port 113 
--to-destination xxx.xxx.xxx.xxx

What I'm doing here is forwarding a packet from an external system to a 
machine on an internal network, so that it can answer an identd request. 
The above works fine for that. However, it doesn't seem to work for UDP 
packets. Even when I forward all data from the source IP address to an 
internal host (as opposed to limiting it by --destination-port), the UDP 
data refuses to be forwarded, and my linux machine sends out ICMP port 
unreachable errors to the external machine. No data is sent across the 
local ethernet at all.

Is there any reason for this? Anything I'm doing wrong or can change to 
correct it? Any help would be greatly appreciated.


