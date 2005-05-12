From: Fruhwirth Clemens <clemens@endorphin.org>
Subject: Bridging selected MACs
Date: Thu, 12 May 2005 11:01:34 +0200
Message-ID: <1115888494.12824.18.camel@ghanima>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everybody,

I like to ask, if there is way to construct a bridge, but only for two
selected MAC addresses.  This can be achieved by 2 rules,

(Assuming 
MAC0 is on eth0 and 
MAC1 is on eth1)

MAC0 -> (MAC1 or broadcast MAC):      copy ethernet frame to eth1
MAC1 -> (MAC0 or broadcast MAC):      copy ethernet frame to eth0

For this construction, there would be 2 new things needed in netfilter:

1. a --mac-dest rule
2. a simple ethernet frame copy to a designated network device.

These capabilities are not present, and the reason for this -- I presume
-- is the bridge code in net/bridge.  Unfortunately, I have not found a
way to get an operational bridge, as there are no filtering capabilities
in the bridge control interface.  I'm also not sure if I should even aim
for a bridge, because the box is doing NAT between eth0 and eth1.

However, I would be thankful for any insight.

(Please don't ask why I'm trying to construct this strange
configuration. In a nutshell, I have a VOIP box supplied by my ISP that
needs to sit on the external network, and talks to some radius DHCP in
alien languages.  I simply don't want to wire the external network in my
house to separate my DHCP traffic.)
-- 
Fruhwirth Clemens - http://clemens.endorphin.org 
for robots: sp4mtrap@endorphin.org

