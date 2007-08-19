From: Phil Sutter <phil@ctekproducts.com>
Subject: Problem using -p udp
Date: Sun, 19 Aug 2007 15:37:11 -0700
Message-ID: <1187563031.3654.8.camel@dev002.ctekproducts.com>
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

Hi,

I have been using Iptables on linux 2.4.26 for several years. I am
running on an Axis platform (cris architecture). Recently I started
moving my application to 2.6.19 and am using iptables 1.3.7. When I try
to use the sample rules shown below from my old environment, they fail
with an invalid parameter. The parameter causing the issue is the "udp"
associated with the "-p".  If I issue the same rule with a "-p tcp" they
work fine. Could someone explain why  "-p udp"  will not work?

/sbin/iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 80 -j
REDIRECT --to-port 6383

/sbin/iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 90 -j DNAT
--to 192.168.1.122:80


Thank you,

Phil


