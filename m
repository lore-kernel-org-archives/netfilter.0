From: <menonrr@adelphia.net>
Subject: some iptable logs
Date: Tue, 5 Oct 2004 19:57:56 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041005235755.KYAS2497.mta9.adelphia.net@mail.adelphia.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello,

I am a new user of iptables. I implemnted logging on my INPUT, OUTPUT, and FORWARD chains. The result is hundreds of messages like these:

Entry 1:

Oct  5 10:12:04 nessusClient kernel: INPUT packets:IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=65 TOS=0x00 PREC=0x00 TTL=64 ID=45019 DF PROTO=TCP SPT=33871 DPT=631 WINDOW=32767 RES=0x00 ACK PSH URGP=0

Entry 2:


Oct  5 10:12:04 nessusClient kernel: OUTPUT packetsIN= OUT=lo SRC=127.0.0.1 DST=127.0.0.1 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=45619 DF PROTO=TCP SPT=631 DPT=33871 WINDOW=32754 RES=0x00 ACK URGP=0 


Entry 3:

Oct  5 10:50:09 nessusClient kernel: INPUT eth1 Ext:IN=eth1
OUT= MAC=ff:ff:ff:ff:ff:ff:00:08:74:ce:1a:21:08:00
SRC=134.126.21.73 DST=255.255.255.255 LEN=68 TOS=0x00
PREC=0x00 TTL=128 ID=13372 PROTO=UDP SPT=1053 DPT=7100 LEN=48


My network is NOT a production network. There is very little activity form it. The firewall/gateway communicates to 192.16.18.0 and 172.16.4.0 through interface eth1.

I have 4 questions:

1. How can I limit logging to all packets on eth0 (external) and eth1(internal) to and from 192.168.18.0, 172.16.4.0, and 192.168.1.10/the gatewat itself?

2. What is a good log level?

3. How can I limit syslog size so that my computer does not crash?

4. How can I log the iptables to a different log file?

------------------------------------------------------
INPUT LOG Rules:

$IPTABLES -A INPUT -j LOG --log-level DEBUG --log-prefix "INPUT packets:"
$IPTABLES -A INPUT -s 192.168.18.0/24 -j LOG --log-prefix "INPUT 192.168.18:"
$IPTABLES -A INPUT -s 172.16.4.0/24 -j LOG --log-prefix "INPUT 172.16.4:"
$IPTABLES -A INPUT -s 192.168.1.10/32 -i ! lo -j LOG --log-prefix "INPUT 192.168.1.10:"
$IPTABLES -A INPUT -d 192.168.18.0/24 -j LOG --log-prefix "INPUT To192.168.18:"
$IPTABLES -A INPUT -d 172.16.4.0/24 -j LOG --log-prefix "INPUT To172.16.4:"
$IPTABLES -A INPUT -d 192.168.1.10/32 -j LOG --log-prefix "INPUT To192.168.1.10:"

#OUTPUT LOGS

$IPTABLES -A OUTPUT -j LOG --log-leve DEBUG --log-prefix "OUTPUT packets:"
$IPTABLES -A OUTPUT -s 192.168.1.10/32 -o ! lo -j LOG --log-prefix "OUTPUT Fr192.168.1.10:"
$IPTABLES -A OUTPUT -s 192.168.18.0/24 -j LOG --log-prefix "OUTPUT Fr192.168.18:"
$IPTABLES -A OUTPUT -s 172.16.4.0/24 -j LOG --log-prefix "OUTPUT Fr172.16.4:"

#FORWARD LOGS
$IPTABLES -A FORWARD -j LOG --log-prefix "FORWARDED packets"

Thank You for your help.
Menon


