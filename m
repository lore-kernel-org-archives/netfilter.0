From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: msn and yahoo messenger voice chat
Date: Sat, 9 Apr 2005 09:30:29 +0300
Message-ID: <002a01c53ccd$9fd13f60$6e5577d4@winntpro>
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
To: "Netfilter @ lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi all,

Below are the config I tested and results:

1. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j SNAT --to-source
xxx.xxx.85.113-xxx.xxx.85.115
2. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -d
xxx.xxx.85.113 -j MASQUERADE
3. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j MASQUERADE

config 1, everything is working fine except  msn and yahoo messenger voice
chat.
config 2, everything is working fine except  msn and yahoo messenger voice
chat.
config 3, everything is working fine including msn and yahoo messenger voice
chat, the only problem is that this configuration is not fitted to our
setup. Can anybody have an idea on using config 1 and 2 with msn and yahoo
messenger voice chat enable? or do you have any solution enabling similar to
config 1 with all features enable?

Thank you very much,

Wennie



