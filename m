From: John Sage <jsage@finchhaven.com>
Subject: IP Tables: starting slowly..
Date: Mon, 16 Jun 2003 09:11:37 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030616161137.GA7125@tweedle.finchhaven.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hmm..  iptables itself isn't starting slowly, I'm slowly starting to
implement iptables.

I'm (finally..) migrating from ipchains, and would appreciate some
comment on my overall approach.

Context: dialup, ppp, source NAT/masquerading various boxen behind the
firewall/router, KRUD Linux 2.4-18.5 

1) I'm writing a minimal set of rules to account for every packet within
a specific chain, and not let any fall through to the default policy
-- which at the moment is ACCEPT -- after I'm certain there aren't any
packets dropping through to the policies, the default policies will
become DROP.

Good idea? Bad idea?

Example:

# OUTPUT:
/sbin/iptables -t filter -A OUTPUT \
 -o lo -j ACCEPT
/sbin/iptables -t filter -A OUTPUT \
 -o eth0 -j ACCEPT
/sbin/iptables -t filter -A OUTPUT \
 -o ppp0 -j ACCEPT


2) Is a default DROP rule (a rule that will catch any/everthing)
irrelevant on the FORWARD chain?

3) Can someone point me to a quick lesson on logging? At the moment
I've got the following:

Module                  Size  Used by    Not tainted
ipt_MASQUERADE          2368   1  (autoclean)
ipt_state               1440   4  (autoclean)
iptable_filter          2656   1  (autoclean)
iptable_mangle          3040   0  (autoclean) (unused)
ipt_LOG                 4544   0  (unused)
iptable_nat            20948   1  [ipt_MASQUERADE]
ip_conntrack           21484   2  [ipt_MASQUERADE ipt_state iptable_nat]
ip_tables              14176   8  [ipt_MASQUERADE ipt_state iptable_filter iptable_mangle ipt_LOG iptable_nat]
<snip>

so I think I've got a start, but have no clue as to the rules needed.

TIA..


- John
-- 
"Obviously, we do not want to leave zombies around."

