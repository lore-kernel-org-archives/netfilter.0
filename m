From: Gary Thomas <gary@chez-thomas.org>
Subject: Troubles with NAT/MASQUERADE
Date: 22 Dec 2003 12:03:47 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072119826.25353.25.camel@hermes>
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
To: 'Netfilter Mailinglist' <netfilter@lists.netfilter.org>

I'm trying to upgrade from an ipchains (working!) firewall+nat
setup to one using iptables.  However, I get stuck when I
try to enable masquerading.

[root@hermes userspace]# ./iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables: Invalid argument

I think the modules I need are loaded:
[root@hermes linux-2.4.20]# lsmod
Module                  Size  Used by    Not tainted
ipt_MASQUERADE          2200   0  (autoclean)
ipt_mark                 984   0  (autoclean)
iptable_mangle          2776   1  (autoclean)
iptable_nat            22008   1  (autoclean) [ipt_MASQUERADE]
ipt_state               1080  92  (autoclean)
ipt_REJECT              4024   4  (autoclean)
ipt_limit               1560   6  (autoclean)
ipt_LOG                 4184   6  (autoclean)
ip_conntrack_ftp        5520   0  (unused)
ip_conntrack_irc        4368   0  (unused)
ip_conntrack           28296   4  [ipt_MASQUERADE iptable_nat ipt_state ip_conntrack_ftp ip_conntrack_irc]
iptable_filter          2412   1  (autoclean)
ip_tables              15096  11  [ipt_MASQUERADE ipt_mark iptable_mangle iptable_nat ipt_state ipt_REJECT ipt_limit ipt_LOG iptable_filter]
  <snip>

Any ideas?

-- 
Gary Thomas <gary@chez-thomas.org>


