From: "HareRam" <hareram@sol.net.in>
Subject: IPTABLES NewBie
Date: Thu, 12 Sep 2002 17:01:20 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <052701c25a4f$eb00a740$7cfcc5cb@humanpc>
References: <5.1.0.14.2.20020912090056.012e6d48@linda> <200209121022.g8CAMTv09831@vulcan.rissington.net>
Reply-To: "HareRam" <hareram@sol.net.in>
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
To: netfilter@lists.samba.org

Hi all

iam using Redhat 7.2 with Iptable 1.2.4 upgraded
and patched with p-o-m
now my application is allow only register mac Address and rest all drop
i am having home based network
ever customer have give specific address, since they have regiter only one
PC for Browsing
he should get only for that PC,, they are using Winproxy and consuming lot
of bandwidth

can i have small example how do i enable only register MAC to allow all
Services
rest all should deny directly

right now iam using like this script
iam forwarding all the 80 port traffic to squid cache server


m=modprobe
$m ip_conntrack_ftp
$m ip_conntrack_irc
$m ip_conntrack
$m ip_nat_ftp
$m ip_nat_irc
$m ip_queue
$m iptable_filter
$m iptable_mangle
$m iptable_nat
$m ip_tables
$m ipt_limit
$m ipt_LOG
$m ipt_mac
$m ipt_mark
$m ipt_MARK
$m ipt_MASQUERADE
$m ipt_MIRROR
$m ipt_multiport
$m ipt_owner
$m ipt_REDIRECT
$m ipt_REJECT
$m ipt_state
$m ipt_tcpmss
$m ipt_TCPMSS
$m ipt_tos
$m ipt_TOS
$m ipt_unclean
/sbin/iptables -F
/sbin/iptables -F -t nat
/sbin/iptables -t nat -A PREROUTING -s 192.168.20.0/24 -p tcp --dport 80 -j
REDIRECT --to-port 3129
/sbin/iptables -t nat -A PREROUTING -s 192.168.3.0/24 -p tcp --dport 80 -j
REDIRECT --to-port 3129
/sbin/iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o eth0 -j
MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -o eth0 -j MASQUERADE


suggest me how do i have sample to add, to deny un authorised MAC address

thanks in advance
hare


