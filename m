From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: bug in ip6t_LOG?
Date: Wed,  1 Sep 2004 00:16:03 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094015763.41355b135b831@webmail2>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I've just had series of kernel crashes during boot on my Fedora Core 2
installation (kernel 2.6.8-1.521), with two ethernet interface, first is e100
(Intel Pro100 card or like), and other is 8139too (RealTek RTL8139).  They occur
during Ethernet interface initialization (ifup script), however it seems they
are related to ip6t_LOG module.  /etc/sysconfig/ip6tables file that will make
system crash is included bellow.  Note that this happens only during system boot
(first initialization of eth0, which is Intel Pro100).  I can load this
ip6tables file after system has booted just fine (and bring interfaces up and
down).  But if I have it during system boot, it just crashes the system.

Can somebody try this ip6tables setup, and reboot his machine.  I'm wondering if
I'm just triggering something strange, or if there's a bug somewhere in kernel
(probably in ip6t_LOG, or at least that's where kernel oops message pointed)
that affects everybody...

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
#
# Logging
#
-N DROPLOG_IN
-N DROPLOG_OUT
-N DROPLOG_FWD
-A DROPLOG_IN -j LOG --log-prefix "INPUT_IPV6 "
-A DROPLOG_FWD -j LOG --log-prefix "FORWARD_IPV6 "
-A DROPLOG_OUT -j LOG --log-prefix "OUTPUT_IPV6 "
#
# ICMP
#
#-A INPUT -p icmpv6 -j ACCEPT
#-A OUTPUT -p icmpv6 -j ACCEPT
#
# DNS
#
#-A OUTPUT -p udp --sport 1024: --dport 53 -j ACCEPT
#-A INPUT -p udp --sport 53 --dport 1024: -j ACCEPT
#-A OUTPUT -p tcp --sport 1024: --dport 53 -j ACCEPT
#-A INPUT -p tcp --sport 53 --dport 1024: -j ACCEPT
#
# Drop & log the rest
#
-A INPUT -j DROPLOG_IN
-A OUTPUT -j DROPLOG_OUT
-A FORWARD -j DROPLOG_FWD
COMMIT

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7



