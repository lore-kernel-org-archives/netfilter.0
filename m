From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: trying to tweek FW and / or ruleset
Date: Sun, 13 Feb 2005 14:39:31 +0200
Message-ID: <420F4A83.7020504@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: iptables <netfilter@lists.netfilter.org>

Hi all

I have a relatively small LAN.

I have been going through my ruleset (trying to tweak things)

Copied and pasted below are a few things I have been playing with.

If possible, would anyone over look this and see there is anything I may 
have missed.

======================================================================================

echo 1 > /proc/sys/net/ipv4/ip_dynaddr  #This may help if you have a 
dynamic IP address \(e.g. slip, ppp, dhcp\)
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians       #Enable logging 
for malformed Ip Address
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp
echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

=====================================================================================

KInd Regards and thanks in advance

Brent Clark

