From: John Zavgren <john@zavgren.com>
Subject: linux-2.6.21 iptables and NAT
Date: Thu, 07 Jun 2007 14:42:54 -0700
Message-ID: <20070607144254.857d60f3cb0f91334d2d3f4f7d335ff9.26b3e9b4ca.wbe@email.secureserver.net>
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to build NAT functionality into the 2.6.21 kernel but it
seems to have been stripped out.

The default 2.6.15 kernel that comes with Fedora Core 5 contains the
following parameter setting:
CONFIG_IP_NF_NAT=m

I cannot activate such a "rule" in 2.6.21. The complete list of options
is:
# IP: Netfilter Configuration
#
CONFIG_IP_NF_QUEUE=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_IPRANGE=m
CONFIG_IP_NF_MATCH_TOS=m
CONFIG_IP_NF_MATCH_RECENT=m
CONFIG_IP_NF_MATCH_ECN=m
# CONFIG_IP_NF_MATCH_AH is not set
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_MATCH_OWNER=m
CONFIG_IP_NF_MATCH_ADDRTYPE=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_LOG=m
CONFIG_IP_NF_TARGET_ULOG=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_TOS=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_ARPTABLES=m

Of course... if I try to set up a NAT rule with iptables... it fails:

[root@adrastea linux-2.6.21]# iptables -t nat -L
iptables v1.3.7: can't initialize iptables table `nat': Table does not
exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

because there is no KLM for nat.... nor can I build it.

What's going on here?

RSVP
and
Thanks!


John Zavgren
john@zavgren.com
603-371-0513 (home)
603-801-2094 (mobile)

Vote in the National Cheney Impeachment Poll
http://www.usalone.com/blogvoices.php?Cheney%20Impeachment%3F



