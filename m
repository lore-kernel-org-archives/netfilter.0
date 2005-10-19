From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: mark value as routing key
Date: Wed, 19 Oct 2005 12:43:00 +0200
Message-ID: <BAY103-F266E4A2B174E5F0151DDFFB2700@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi.

I have a problem with iptables mark target.
I'm using iptables to mark packet in this manner:

iptables -t mangle -I OUTPUT --protocol tcp --dport 80 -j MARK --set-mark 1

This linux box has two different ip addresses on
two different subnet on the same ethernet NIC:

eth0: 1.1.1.254/24
eth0:adslA: 10.10.10.6/29

This is my ip rule sh output:

0: from all lookup local
400: from all fwmark 0x1 lookup adsl
450: from all lookup hdsl
32766: from all lookup main
32767: from all lookup default

Here is ip route sh table adsl:
default via 10.10.10.1 dev eth0 metric 1
and this is ip route sh table hdsl:
default via 1.1.1.1 dev eth0 metric 1

main table doesn't have any default route.

Locally generated packet with destination port 80
are going through the adsl table but the packet
source ip is 1.1.1.254. Why?

Kernel is vanilla 2.6.14-rc4



