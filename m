From: "Gerry Weaver" <gerryw@objectivedomain.com>
Subject: RE: iptables bridge filter question
Date: Thu, 18 Mar 2004 14:12:53 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ILECICAFAJIIMPBBLMEAKELJCPAA.gerryw@objectivedomain.com>
References: <ILECICAFAJIIMPBBLMEAAELECPAA.gerryw@objectivedomain.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ILECICAFAJIIMPBBLMEAAELECPAA.gerryw@objectivedomain.com>
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

Firstly, thanks for the suggestions. Please let me explain further. I want
to setup an anti-spoofing rule that will block packets coming in on the
external interface, which have a source address of my internal net. The
problem is that I have a router that sits in the external side of the
bridge. I need to stop spoofed packets while still allowing my router.
Shouldn't the following allow my router by mac address and then drop
everything else that's coming in with a source address of my internal net?

EXTERNAL_IFACE="eth0"
INTERNAL_NET="10.10.10.0/24"
ROUTER_MAC="00:00:00:00:00:00"

iptables -N tcp_packets
iptables -N udp_packets

iptables -A INPUT -p tcp -i $EXTERNAL_IFACE -j tcp_packets
iptables -A INPUT -p udp -i $EXTERNAL_IFACE -j udp_packets


iptables -A tcp_packets -i eth0 -m mac --mac-source $ROUTER_MAC -j ACCEPT
iptables -A tcp_packets -p tcp -j DROP -s $INTERNAL_NET -j DROP


iptables -A udp_packets -i eth0 -m mac --mac-source $ROUTER_MAC -j ACCEPT
iptables -A udp_packets -p udp -j DROP -s $INTERNAL_NET -j DROP

Thanks,
Gerry







[Gerry Weaver]  -----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gerry Weaver
Sent: Thursday, March 18, 2004 2:28 AM
To: netfilter@lists.netfilter.org
Subject: iptables bridge filter question


Hello All,

I have setup a bridging firewall. I want to drop packets on the external
interface, which have source addresses on my internal network. However, the
firewall/bridge sits between my T1 router and the rest of my LAN. Is there a
way to drop the packets mentioned previously, but allow the router? I guess
a rule could be created that uses the routers mac address as a match. I've
been playing around with this, but I'm not getting the result I want. I
could sure use some advice on this.

[ LAN xx.xx.xx.0/24 ]<==>[ bridge/firewall ]<==>[ router xx.xx.xx.254/24 ]


Thanks in advance,
Gerry
---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.576 / Virus Database: 365 - Release Date: 1/30/2004


