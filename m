From: "James Miller" <jimm@simutronics.com>
Subject: IPSec rules
Date: Fri, 28 Mar 2003 09:52:13 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NDBBKABJBJCIJNAELLKEMEALIKAA.jimm@simutronics.com>
Reply-To: <jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hello everyone =)

I have reviewed a few posts about how to setup rules to allow IPSec.  I sure
would appreciate a peer review of my rules for IPSec traffic before putting
them into general use.  Of course, this is not my whole rule set, just the
IPSec aspects.  I'm not doing NAT on the inside (we're lucky enough to have
a few class 'C's to use around here).  And for simplicity I'm trusting
roadwarriors and not limiting the source of IPSec traffic.
eth1 = untrusted side
eth0 = trusted side

INPUT:
$IPTABLES -A INPUT -i eth1 -p 50 -j ACCEPT
$IPTABLES -A INPUT -i eth1 -p 51 -j ACCEPT
$IPTABLES -A INPUT -i eth1 -p UDP --dport 500 -j ACCEPT

FORWARD:
$IPTABLES -A FORWARD -i eth0 -o ipsec+ -j ACCEPT
$IPTABLES -A FORWARD -i ipsec+ -o eth0 -j ACCEPT

OUTPUT:
$IPTABLES -A OUTPUT -p 50 -j ACCEPT
$IPTABLES -A OUTPUT -p 51 -j ACCEPT
$IPTABLES -A INPUT -p udp -m udp --dport 500 -j ACCEPT



Thanks everyone,
--jim



