From: "Mark L. Wise" <mark@alpha2.com>
Subject: ipsec and iptables
Date: Tue, 14 Feb 2006 10:30:42 -0500
Message-ID: <010501c6317b$9db3e9f0$b00aa8c0@a2smark>
Reply-To: mark@alpha2.com
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

Marco,

I see your response to Andreas regarding ipsec and tables.

I have a similar problem/question.

I replaced RH9 with FC4 for my firewalls.  Setting up the ipsec tunnel went
fine.  I can send packets between two private networks.  However, when I
enable NAT so that the internal nets can get to the internet, then the ipsec
VPN fails.

Here is the configuration:

192.168.20.0/24(net)-->[192.168.20.2(gw)-->$PUBLICIP1 <firewall # 1>]  ....
internet
.... internet [<firewall # 2>
$PUBLICIP2<--192.168.30.100(gw)<--192.168.30.0/24(net)

Without NAT, all packets can reach every destination internally.  When I add
the following to allow NAT to allow the internal machines access to the
internet, packets are no longer routed to the opposite local net;

iptables -t nat -A POSTROUTING -d ! 192.168.30.0/24 -j SNAT --to-source
$PUBLICIP1

How can I route outgoing packets going to 192.168.30.0/24 (opposite internal
net) differently than packets going to other addresses????

TIA,

Mark

Mark L. Wise, President
Alpha II Service, Inc.
1312 Epworth Ave
Reynoldsburg, Ohio 43068-2116
614 868-5033 (Phone)
614 868-1060 (Fax)




