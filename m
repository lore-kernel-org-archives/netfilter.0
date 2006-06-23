From: Mike <Lists@addictz.org>
Subject: Strange problem with iptables 2.6.11 -- Only allowing packets that
 have TCP flah "PSH" set
Date: Fri, 23 Jun 2006 10:54:19 -0400
Message-ID: <449C009B.4020909@addictz.org>
Reply-To: Lists@addictz.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070600040608060207080006"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------070600040608060207080006
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'm having some very strange problems that I may need some help in
diagnosing, or even solving my problem.

I used firewall builder to build some iptables firewall, I have a fair
amount of iptables knowledge, but, firewall builder helps me build my
rules a little quicker, and a little more cleanly.

My problem is this last set of rules I built for my firewall only seem
to be allowing packets that have the TCP "PSH" flag set on them, or
that's what I've been able to determine by looking at the log of iptables.

Here is a tiny sample of the log file that shows what I'm talking about,
the first is an allowed packet, and the second is a denied packet:

Jun 23 10:07:51 172.20.30.10 kernel: ALLOWED-APP IN=bond0 OUT=
MAC=00:e0:81:34:0b:64:00:04:23:cc:3a:3c:08:00 SRC=172.20.20.10
DST=172.20.30.10 LEN=656 TOS=0x00 PREC=0x00 TTL=63 ID=22381 DF PROTO=TCP
SPT=48282 DPT=10302 WINDOW=16019 RES=0x00 ACK PSH URGP=0

Jun 23 10:07:51 172.20.30.10 kernel: DENIED IN=bond0 OUT=
MAC=00:e0:81:34:0b:64:00:04:23:cc:3a:3c:08:00 SRC=172.20.20.10
DST=172.20.30.10 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=22417 DF PROTO=TCP
SPT=48282 DPT=10302 WINDOW=13829 RES=0x00 ACK URGP=0

Also, attached to this email is the script I used to create the firewall
rules, and the output of iptables-save.  Can someone help me and let me
know what is failing in my firewall?

Thanks

Mike

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (MingW32)

iD8DBQFEnACaj5H2goTKsxsRAk2qAJ0VDdvaZLBoW1L1ZTnRU5tUNiKztwCfb5NG
PrO+DeZbEmmnlKgSbh++iu4=
=+qdv
-----END PGP SIGNATURE-----

--------------070600040608060207080006
Content-Type: text/plain;
 name="iptables.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables.txt"

#!/bin/sh 
#


PATH="/sbin:/usr/sbin:/bin:/usr/bin:${PATH}"
export PATH

LSMOD="/sbin/lsmod"
MODPROBE="/sbin/modprobe"
IPTABLES="/sbin/iptables"
IPTABLES_RESTORE="/sbin/iptables-restore"
IP="/sbin/ip"
LOGGER="/usr/bin/logger"


echo 1 > /proc/sys/net/ipv4/tcp_window_scaling

echo 1 > /proc/sys/net/ipv4/tcp_syncookies

$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# 
# Rule 0 (bond0)
# 
echo "Rule 0 (bond0)"
# 
# 
# 
$IPTABLES -N bond0_In_RULE_0
$IPTABLES -A INPUT  -i bond0  -s 172.20.30.10  -j bond0_In_RULE_0 
$IPTABLES -A FORWARD  -i bond0  -s 172.20.30.10  -j bond0_In_RULE_0 
$IPTABLES -A bond0_In_RULE_0   -j LOG  --log-level info
$IPTABLES -A bond0_In_RULE_0   -j DROP 
# 
# Rule 0 (lo)
# 
echo "Rule 0 (lo)"
# 
# 
# 
$IPTABLES -A INPUT  -i lo  -m state --state NEW  -j ACCEPT 
$IPTABLES -A OUTPUT  -o lo  -m state --state NEW  -j ACCEPT 
# 
# Rule 0 (global)
# 
echo "Rule 0 (global)"
# 
# 
# 
$IPTABLES -A INPUT  -s 172.20.30.10  -m state --state NEW  -j ACCEPT 
$IPTABLES -A OUTPUT  -s 172.20.30.10  -m state --state NEW  -j ACCEPT 
# 
# Rule 1 (global)
# 
echo "Rule 1 (global)"
# 
# ALLOW ICMP
# 
$IPTABLES -N Cid449C0468.0
$IPTABLES -A INPUT  -d 172.20.30.10  -m state --state NEW  -j Cid449C0468.0 
$IPTABLES -N Cid449C0468.1
$IPTABLES -A Cid449C0468.0 -p icmp  -m icmp  --icmp-type 11/0   -j Cid449C0468.1 
$IPTABLES -A Cid449C0468.0 -p icmp  -m icmp  --icmp-type 11/1   -j Cid449C0468.1 
$IPTABLES -A Cid449C0468.0 -p icmp  -m icmp  --icmp-type 0/0   -j Cid449C0468.1 
$IPTABLES -A Cid449C0468.0 -p icmp  -m icmp  --icmp-type 3  -j Cid449C0468.1 
$IPTABLES -A Cid449C0468.0 -p icmp  -m icmp  --icmp-type 8/0   -j Cid449C0468.1 
$IPTABLES -A Cid449C0468.1  -s 10.0.0.0/8  -j ACCEPT 
$IPTABLES -A Cid449C0468.1  -s 172.20.0.0/16  -j ACCEPT 
$IPTABLES -A Cid449C0468.1  -s 172.21.0.0/20  -j ACCEPT 
$IPTABLES -A Cid449C0468.1  -s 172.21.16.0/20  -j ACCEPT 
$IPTABLES -A Cid449C0468.1  -s 172.21.32.0/20  -j ACCEPT 
$IPTABLES -A Cid449C0468.1  -s 172.21.48.0/20  -j ACCEPT 
$IPTABLES -A Cid449C0468.1  -s 172.21.64.0/20  -j ACCEPT 
$IPTABLES -A Cid449C0468.1  -s 172.21.80.0/20  -j ACCEPT 
# 
# Rule 2 (global)
# 
echo "Rule 2 (global)"
# 
# ALLOW SSH
# 
$IPTABLES -N Cid449BFEAA.0
$IPTABLES -A INPUT -p tcp -m tcp  -d 172.20.30.10  --dport 22  -m state --state NEW  -j Cid449BFEAA.0 
$IPTABLES -N RULE_2
$IPTABLES -A Cid449BFEAA.0  -s 10.0.0.0/8  -j RULE_2 
$IPTABLES -A Cid449BFEAA.0  -s 172.20.0.0/16  -j RULE_2 
$IPTABLES -A Cid449BFEAA.0  -s 172.21.0.0/20  -j RULE_2 
$IPTABLES -A Cid449BFEAA.0  -s 172.21.16.0/20  -j RULE_2 
$IPTABLES -A Cid449BFEAA.0  -s 172.21.32.0/20  -j RULE_2 
$IPTABLES -A Cid449BFEAA.0  -s 172.21.48.0/20  -j RULE_2 
$IPTABLES -A Cid449BFEAA.0  -s 172.21.64.0/20  -j RULE_2 
$IPTABLES -A Cid449BFEAA.0  -s 172.21.80.0/20  -j RULE_2 
$IPTABLES -A RULE_2  -j LOG  --log-level info --log-prefix "ALLOWED-SSH "
$IPTABLES -A RULE_2  -j ACCEPT 
# 
# Rule 3 (global)
# 
echo "Rule 3 (global)"
# 
# ALLOW HTTP
# 
$IPTABLES -N Cid449BFEA0.0
$IPTABLES -A INPUT  -d 172.20.30.10  -m state --state NEW  -j Cid449BFEA0.0 
$IPTABLES -N Cid449BFEA0.1
$IPTABLES -A Cid449BFEA0.0 -p tcp -m tcp  -m multiport  --dports 80,443  -j Cid449BFEA0.1 
$IPTABLES -N RULE_3
$IPTABLES -A Cid449BFEA0.1  -s 10.0.0.0/8  -j RULE_3 
$IPTABLES -A Cid449BFEA0.1  -s 172.20.0.0/16  -j RULE_3 
$IPTABLES -A Cid449BFEA0.1  -s 172.21.0.0/20  -j RULE_3 
$IPTABLES -A Cid449BFEA0.1  -s 172.21.16.0/20  -j RULE_3 
$IPTABLES -A Cid449BFEA0.1  -s 172.21.32.0/20  -j RULE_3 
$IPTABLES -A Cid449BFEA0.1  -s 172.21.48.0/20  -j RULE_3 
$IPTABLES -A Cid449BFEA0.1  -s 172.21.64.0/20  -j RULE_3 
$IPTABLES -A Cid449BFEA0.1  -s 172.21.80.0/20  -j RULE_3 
$IPTABLES -A RULE_3  -j LOG  --log-level info --log-prefix "ALLOWED-WEB "
$IPTABLES -A RULE_3  -j ACCEPT 
# 
# Rule 4 (global)
# 
echo "Rule 4 (global)"
# 
# ALLOW SMB Traffic
# 
$IPTABLES -N Cid449BFE96.0
$IPTABLES -A INPUT  -s 172.20.10.0/24  -d 172.20.30.10  -m state --state NEW  -j Cid449BFE96.0 
$IPTABLES -N RULE_4
$IPTABLES -A Cid449BFE96.0 -p tcp -m tcp  -m multiport  --dports 445,139  -j RULE_4 
$IPTABLES -A Cid449BFE96.0 -p udp -m udp  -m multiport  --dports 138,137,139  -j RULE_4 
$IPTABLES -A RULE_4  -j LOG  --log-level info --log-prefix "ALLOWED-SMB "
$IPTABLES -A RULE_4  -j ACCEPT 
# 
# Rule 5 (global)
# 
echo "Rule 5 (global)"
# 
# ALLOW Application Port
# 
$IPTABLES -N Cid449BFE78.0
$IPTABLES -A INPUT -p tcp -m tcp  -d 172.20.30.10  --dport 10000:10505  -m state --state NEW  -j Cid449BFE78.0 
$IPTABLES -N RULE_5
$IPTABLES -A Cid449BFE78.0  -s 172.20.0.0/16  -j RULE_5 
$IPTABLES -A Cid449BFE78.0  -s 172.21.0.0/20  -j RULE_5 
$IPTABLES -A Cid449BFE78.0  -s 172.21.16.0/20  -j RULE_5 
$IPTABLES -A Cid449BFE78.0  -s 172.21.32.0/20  -j RULE_5 
$IPTABLES -A Cid449BFE78.0  -s 172.21.48.0/20  -j RULE_5 
$IPTABLES -A Cid449BFE78.0  -s 172.21.64.0/20  -j RULE_5 
$IPTABLES -A Cid449BFE78.0  -s 172.21.80.0/20  -j RULE_5 
$IPTABLES -A RULE_5  -j LOG  --log-level info --log-prefix "ALLOWED-APP "
$IPTABLES -A RULE_5  -j ACCEPT 
# 
# Rule 6 (global)
# 
echo "Rule 6 (global)"
# 
# DENY EVERYTHING ELSE
# 
$IPTABLES -N RULE_6
$IPTABLES -A OUTPUT  -d 172.20.30.10  -j RULE_6 
$IPTABLES -A INPUT  -d 172.20.30.10  -j RULE_6 
$IPTABLES -A RULE_6  -j LOG  --log-level info --log-prefix "DENIED "
$IPTABLES -A RULE_6  -j DROP 
#
#
echo 1 > /proc/sys/net/ipv4/ip_forward

--------------070600040608060207080006
Content-Type: text/plain;
 name="iptables-save.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables-save.txt"

# Generated by iptables-save v1.2.11 on Fri Jun 23 10:32:48 2006
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [2:220]
:Cid449BFE78.0 - [0:0]
:Cid449BFE96.0 - [0:0]
:Cid449BFEA0.0 - [0:0]
:Cid449BFEA0.1 - [0:0]
:Cid449BFEAA.0 - [0:0]
:Cid449C0468.0 - [0:0]
:Cid449C0468.1 - [0:0]
:RULE_2 - [0:0]
:RULE_3 - [0:0]
:RULE_4 - [0:0]
:RULE_5 - [0:0]
:RULE_6 - [0:0]
:bond0_In_RULE_0 - [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A INPUT -s 172.20.30.10 -i bond0 -j bond0_In_RULE_0 
-A INPUT -i lo -m state --state NEW -j ACCEPT 
-A INPUT -s 172.20.30.10 -m state --state NEW -j ACCEPT 
-A INPUT -d 172.20.30.10 -m state --state NEW -j Cid449C0468.0 
-A INPUT -d 172.20.30.10 -p tcp -m tcp --dport 22 -m state --state NEW -j Cid449BFEAA.0 
-A INPUT -d 172.20.30.10 -m state --state NEW -j Cid449BFEA0.0 
-A INPUT -s 172.20.10.0/255.255.255.0 -d 172.20.30.10 -m state --state NEW -j Cid449BFE96.0 
-A INPUT -d 172.20.30.10 -p tcp -m tcp --dport 10000:10505 -m state --state NEW -j Cid449BFE78.0 
-A INPUT -d 172.20.30.10 -j RULE_6 
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A FORWARD -s 172.20.30.10 -i bond0 -j bond0_In_RULE_0 
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A OUTPUT -o lo -m state --state NEW -j ACCEPT 
-A OUTPUT -s 172.20.30.10 -m state --state NEW -j ACCEPT 
-A OUTPUT -d 172.20.30.10 -j RULE_6 
-A Cid449BFE78.0 -s 172.20.0.0/255.255.0.0 -j RULE_5 
-A Cid449BFE78.0 -s 172.21.0.0/255.255.240.0 -j RULE_5 
-A Cid449BFE78.0 -s 172.21.16.0/255.255.240.0 -j RULE_5 
-A Cid449BFE78.0 -s 172.21.32.0/255.255.240.0 -j RULE_5 
-A Cid449BFE78.0 -s 172.21.48.0/255.255.240.0 -j RULE_5 
-A Cid449BFE78.0 -s 172.21.64.0/255.255.240.0 -j RULE_5 
-A Cid449BFE78.0 -s 172.21.80.0/255.255.240.0 -j RULE_5 
-A Cid449BFE96.0 -p tcp -m tcp -m multiport --dports 445,139 -j RULE_4 
-A Cid449BFE96.0 -p udp -m udp -m multiport --dports 138,137,139 -j RULE_4 
-A Cid449BFEA0.0 -p tcp -m tcp -m multiport --dports 80,443 -j Cid449BFEA0.1 
-A Cid449BFEA0.1 -s 10.0.0.0/255.0.0.0 -j RULE_3 
-A Cid449BFEA0.1 -s 172.20.0.0/255.255.0.0 -j RULE_3 
-A Cid449BFEA0.1 -s 172.21.0.0/255.255.240.0 -j RULE_3 
-A Cid449BFEA0.1 -s 172.21.16.0/255.255.240.0 -j RULE_3 
-A Cid449BFEA0.1 -s 172.21.32.0/255.255.240.0 -j RULE_3 
-A Cid449BFEA0.1 -s 172.21.48.0/255.255.240.0 -j RULE_3 
-A Cid449BFEA0.1 -s 172.21.64.0/255.255.240.0 -j RULE_3 
-A Cid449BFEA0.1 -s 172.21.80.0/255.255.240.0 -j RULE_3 
-A Cid449BFEAA.0 -s 10.0.0.0/255.0.0.0 -j RULE_2 
-A Cid449BFEAA.0 -s 172.20.0.0/255.255.0.0 -j RULE_2 
-A Cid449BFEAA.0 -s 172.21.0.0/255.255.240.0 -j RULE_2 
-A Cid449BFEAA.0 -s 172.21.16.0/255.255.240.0 -j RULE_2 
-A Cid449BFEAA.0 -s 172.21.32.0/255.255.240.0 -j RULE_2 
-A Cid449BFEAA.0 -s 172.21.48.0/255.255.240.0 -j RULE_2 
-A Cid449BFEAA.0 -s 172.21.64.0/255.255.240.0 -j RULE_2 
-A Cid449BFEAA.0 -s 172.21.80.0/255.255.240.0 -j RULE_2 
-A Cid449C0468.0 -p icmp -m icmp --icmp-type 11/0 -j Cid449C0468.1 
-A Cid449C0468.0 -p icmp -m icmp --icmp-type 11/1 -j Cid449C0468.1 
-A Cid449C0468.0 -p icmp -m icmp --icmp-type 0/0 -j Cid449C0468.1 
-A Cid449C0468.0 -p icmp -m icmp --icmp-type 3 -j Cid449C0468.1 
-A Cid449C0468.0 -p icmp -m icmp --icmp-type 8/0 -j Cid449C0468.1 
-A Cid449C0468.1 -s 10.0.0.0/255.0.0.0 -j ACCEPT 
-A Cid449C0468.1 -s 172.20.0.0/255.255.0.0 -j ACCEPT 
-A Cid449C0468.1 -s 172.21.0.0/255.255.240.0 -j ACCEPT 
-A Cid449C0468.1 -s 172.21.16.0/255.255.240.0 -j ACCEPT 
-A Cid449C0468.1 -s 172.21.32.0/255.255.240.0 -j ACCEPT 
-A Cid449C0468.1 -s 172.21.48.0/255.255.240.0 -j ACCEPT 
-A Cid449C0468.1 -s 172.21.64.0/255.255.240.0 -j ACCEPT 
-A Cid449C0468.1 -s 172.21.80.0/255.255.240.0 -j ACCEPT 
-A RULE_2 -j LOG --log-prefix "ALLOWED-SSH " --log-level 6 
-A RULE_2 -j ACCEPT 
-A RULE_3 -j LOG --log-prefix "ALLOWED-WEB " --log-level 6 
-A RULE_3 -j ACCEPT 
-A RULE_4 -j LOG --log-prefix "ALLOWED-SMB " --log-level 6 
-A RULE_4 -j ACCEPT 
-A RULE_5 -j LOG --log-prefix "ALLOWED-APP " --log-level 6 
-A RULE_5 -j ACCEPT 
-A RULE_6 -j LOG --log-prefix "DENIED " --log-level 6 
-A RULE_6 -j DROP 
-A bond0_In_RULE_0 -j LOG --log-level 6 
-A bond0_In_RULE_0 -j DROP 
COMMIT
# Completed on Fri Jun 23 10:32:48 2006

--------------070600040608060207080006--


