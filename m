From: Steve Comfort <steve@4Dllc.com>
Subject: Problem with ssh
Date: Wed, 25 Aug 2004 14:26:56 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412C8590.8030900@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hi all,

First off, a feeble attempt at diagramming my setup :

192.168.200.x   eth -> eth  Embedded Linux Wireless  ppp -> ppp Embedded 
Linux Access Point eth0 -> 192.168.1.x

The two Embedded Linux Wireless boxes are actually what I am working on. 
The second one in the list above is configured as a bridge, and doesn't 
currently have any firewalling (because I haven't figured out whether I 
need ebtables or iptables, but that's another story).

The client side wireless box (on the left) has the following rule in it :

$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.200.0/16 -j DROP

Here INET_IFACE = ppp0.

If I have this rule in place, I am unable to ssh from a box on the 
192.168.200.x network to one on the 192.168.1.x network.

As I read the above, packets entering the ppp interface on the wireless 
client, with a source address on the .200 sub-net should be dropped. 
Which seems perfectly reasonable. But what I don't understand is why the 
returning ssh packets (which should be sourced on the .1 subnet) are 
being dropped?

Best regards
Steve Comfort




       


