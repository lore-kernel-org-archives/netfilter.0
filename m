From: Giovanni Cardone <g_cardone@libero.it>
Subject: ip_conntrack_ftp doesn't work
Date: Fri, 14 Jun 2002 19:42:04 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020614194204.A232@rainbow>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On 2.4.18 with 1.2.7(1.2.6a too) ftp conntrack module doesn't work.
I'm trying to understand this using a simple script:

<begin script>
#!/bin/sh

ipt='/usr/local/sbin/iptables'

modprobe ip_tables
modprobe iptable_filter
modprobe ipt_state
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ipt_LOG

$ipt -P INPUT DROP
$ipt -P OUTPUT DROP
$ipt -P FORWARD DROP
$ipt -A INPUT -i lo -j ACCEPT
$ipt -A OUTPUT -o lo -j ACCEPT
$ipt -A OUTPUT -o ppp0 -j ACCEPT
$ipt -A INPUT -p tcp -m state --state RELATED -j ACCEPT 
$ipt -A INPUT -p tcp ! --syn -m state --state NEW -j LOG --log-prefix 
"NEW_NOT_SYN "
$ipt -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
$ipt -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$ipt -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$ipt -A INPUT -j LOG
$ipt -A OUTPUT -j LOG
$ipt -A FORWARD -j LOG
<end script>

The logs shows up some entries like these:

Jun 14 19:10:44 darkstar kernel: IN=ppp0 OUT= MAC= SRC=195.210.93.107
DST=151.26.80.131 LEN=60 TOS=0x08 PREC=0x00 TTL=58 ID=40516 DF PROTO=TCP
SPT=20 DPT=1039 WINDOW=32120 RES=0x00 SYN URGP=0

When I try to contact an ftp server, lsmod says:

darkstar\# lsmod | awk '/ftp/'
ip_conntrack_ftp        3120   0  (unused)
ip_conntrack           13264   1  [ip_conntrack_ftp]

So the syn about the data channel from the server port 20 to me is not RELATED
to the connections in the table. It's normal that lsmod shows up the
conntrack_ftp as unused? I was thinking no ... :)

What do I need to do?


Many Thanks 

