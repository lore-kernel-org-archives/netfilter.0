From: "Stuart Clark" <elmhurst@spacelink.com.au>
Subject: nat table not working with 'iptables -L nat'
Date: Wed, 23 Apr 2003 09:01:26 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002001c30923$1a65a440$0100a8c0@yogi>
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

Hi

When I try and add a rule to the nat table it seems to work but when I
do 'iptables -L nat' I get the error 

'iptables: Table does not exist (do you need to insmod?)'

All the other tables are there when I do 'iptables -L' but no nat table.

How can I get this working?

I don't want to recompile the kernel

Machine Specifications

Pentium2, 266Mhz
64meg Ram
Redhat 7.3
iptables-1.2.5-3.rpm


Here is my module config

#
# 2.1 Required modules
#

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state
/sbin/modprobe ip_nat_ftp

#
# 2.2 Non-Required modules
#

#/sbin/modprobe ipt_owner
#/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_MASQUERADE
/sbin/modprobe ip_conntrack_ftp
#/sbin/modprobe ip_conntrack_irc
#/sbin/modprobe ip_nat_irc



