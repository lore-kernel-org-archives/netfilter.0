From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Fw: Netmeeting NATing IP address
Date: Mon, 9 Sep 2002 11:02:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001401c25811$fb42c2e0$8701a8c0@sundaram>
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


 Hi,

 I want  outside user  initiate the  Netmeeting connection to inside user, I
 NATed public IP address to my user machine, but still  we are not able to
 connect from outside.

 I am attaching me script. can any one help me on this. Is there any other
 way to achive this.

 Thanks
 -SR


 #!/bin/bash
 #set -xv

 EXT="eth0"
 INT="eth1"
 LO="lo"

 GW_IP="192.168.1.10"
 ANY="Any/0"
 SUB_NET="192.168.1.0/24"

 PRIVP="0:1023"

 UNPRI="1024:65535"

 IPT="/sbin/iptables"

 modprobe ip_nat_h323

 echo 1 > /proc/sys/net/ipv4/tcp_syncookies

 for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
         echo 1 > $f
 done

 echo 1 > /proc/sys/net/ipv4/ip_forward


 $IPT -P INPUT DROP
 $IPT -P OUTPUT ACCEPT
 $IPT -P FORWARD DROP

 $IPT -X
 $IPT -F
 $IPT -t nat -F
 $IPT -t nat -X


 $IPT -A INPUT   -i $INT -j ACCEPT
 $IPT -A OUTPUT  -o $INT -j ACCEPT
 $IPT -A FORWARD -i $INT -j ACCEPT
 $IPT -A FORWARD -o $INT -j ACCEPT

 $IPT -A INPUT  -i $LO -j ACCEPT
 $IPT -A OUTPUT -o $LO -j ACCEPT


 $IPT -t nat -A POSTROUTING -o $EXT -j MASQUERADE
 $IPT -A FORWARD -i $EXT -m state --state ESTABLISHED,RELATED -j ACCEPT
 $IPT -A FORWARD -i $EXT -m state --state NEW -j ACCEPT

 : For NetMeeting
 $IPT -A OUTPUT -o $EXT -p udp --sport 1024:65535 --dport 53 -j ACCEPT
 $IPT -A INPUT  -i $EXT -p udp --sport 53 --dport 1024:65535 -j ACCEPT
 $IPT -A OUTPUT -o $EXT -p tcp --sport $UNPRI --dport 53 -j ACCEPT
 $IPT -A INPUT  -i $EXT -p tcp --sport 53 --dport $UNPRI -j ACCEPT

 $IPT -A FORWARD -i $EXT -p tcp --dport 113 --syn -j REJECT

 #NAT to user machine for Netmeeting
 EXT_IP1=215.183.76.135
 INT_IP1=192.168.1.135

 ip addr add $EXT_IP1 dev $EXT

 $IPT -t nat -A PREROUTING -i $EXT -d $EXT_IP1 -j DNAT --to $INT_IP1
 $IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1 -j SNAT --to-source $EXT_IP1

 $IPT -A INPUT -j LOG --log-prefix "input "
 $IPT -A OUTPUT -j LOG --log-prefix "output "
 $IPT -A FORWARD -j LOG --log-prefix "forward "




