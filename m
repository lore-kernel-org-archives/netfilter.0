From: "james.Q.L" <shijialeeee@yahoo.ca>
Subject: drop at FWD chain, why ?
Date: Wed, 4 Dec 2002 04:34:13 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021204093413.98006.qmail@web14506.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

i can't figure out why the following rules make the reply traffic drop. can anyone help?

it's internal server on 192.168.0.3:80 being forwarded from my external ip at port 8888.

FWD dropIN=eth0 OUT=eth0 SRC=192.168.0.3 DST=192.168.0.12 LEN=64 TOS=0x00 PREC=0x00 TTL=127
ID=22473 DF PROTO=TCP SPT=80 DPT=1026 WINDOW=17520 RES=0x00 ACK SYN URGP=0 

#grep 192.168.0.12 /proc/net/ip_conntrack # this ip is the internal machine make the request.
tcp      6 59 SYN_RECV src=192.168.0.12 dst=myExternIP sport=1109 dport=8888 src=192.168.0.3
dst=192.168.0.1 sport=80 dport=1109 use=1 

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED \
-j ACCEPT
$IPTABLES -A FORWARD -d 192.168.0.3 --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG --log-prefix "FWD drop"

iptables -t nat -A PREROUTING -p tcp  -d externalIP --dport 8888 \
	-j DNAT --to-destination 192.168.0.3:80
$IPTABLES -t nat -A POSTROUTING -p tcp -s 192.168.0.0/24 -d 192.168.0.3 --dport 80 -j SNAT
--to-source 192.168.0.1

TIA,

=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

