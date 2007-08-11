From: "Ammad Shah" <ammads@khi.comsats.net.pk>
Subject: pptp
Date: Sat, 11 Aug 2007 12:59:19 +0500 (PKT)
Message-ID: <33152.202.69.36.149.1186819159.squirrel@khimail.comsats.net.pk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Dear all,

i am using linux as firewall and proxy server, having some problem
regarding Microsoft VPN,
my network users connect Microsoft vpn server. the problem is only one
user is able to connect vpn, while othere can't do this at same time.

if i restart firewall, then any one can connect on First come first
server. but only one.
so i clear all rules, and default policy to ACCEPT, and used this rule

iptables -t nat -A POSTROUTING -i eth1 -s 10.0.0.0/24 -j MASQUERADE
iptables -A FORWARD -s 10.0.0.0/24 -j ACCEPT

i try this on 2.6(rhel 5) and 2.4 (rhel3)

