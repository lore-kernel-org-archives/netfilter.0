From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: SSH request comes in as DNS?
Date: Mon, 17 Feb 2003 12:24:47 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5055FF.4090808@mega-bucks.co.jp>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I've installed a a very simple set of iptables rules on two machines 
(SERVER1 and SERVER2) on the same network. On one machine the rules work 
as expected, only allowing SSH connections in. On the second machine 
though it doesn't work.

And the strange thing is that it seems that when I try to SSH to the 
machine the request is denied and logged as a DNS (port 53) attempt AND 
the SRC IP is wrong. Instead of being the IP of the machine I am trying 
to connect from it is the IP of the firewall between the two machines 
... But the firewall isn't supposed to do any NAT

My network setup is like this:


LAN ---- FIREWALL---- WAN
  |        (x.241)
  |          |
  |          |----------
  |          |         |
PC(W2K)   SERVER2    SERVER1
(y.103)  (x.244)    (x.245)


Please note I am trying to set rules for SERVER1 and SERVER2 *not* for 
the firewall ... I don't control the firewall =)

Here are my rules, they work fine for SERVER2 but not for SERVER1. (Note 
that the var IP is x.x.x.244 for SERVER1 and x.x.x.245 for SERVER2)

#!/bin/sh

IPT="/usr/local/sbin/iptables"
IP="x.x.x.244"
PC="y.y.y.103"

# Delete any old rules

for i in filter
do
   $IPT -t $i -F
   $IPT -t $i -X
done

$IPT --policy INPUT   DROP
$IPT --policy OUTPUT  ACCEPT
$IPT --policy FORWARD DROP

# Loopback accepts everything

$IPT -A INPUT  -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# Allow previously established connections

$IPT -A INPUT -p TCP -s $PC -i eth0 -d $IP --dport 22 -m state --state 
ESTABLISHED,RELATED -j ACCEPT

# Allow new SSH connections

$IPT -A INPUT -p TCP -s 0/0 -i eth0 -d $IP --dport 22  -j ACCEPT

#log anything that made it his far w/o being caught
$IPT -A INPUT -j LOG --log-level debug --log-prefix "DROP packet:"

When I look into the log file I find this kind of entry at the exact 
time I tried to establish a new SSH connection:

Feb 17 11:50:57 localhost kernel: DROP packet:IN=eth0 OUT= MAC=XX 
SRC=x.x.x.241 DST=x.x.x.244 LEN=151 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF 
PROTO=UDP SPT=53 DPT=32888 LEN=131

The SRC IP is wrong (it's the firewall's IP and not my PC's) *and* the 
SPT is 53 (DNS?) and the DPT is wrong, it should be 22 ....

Just to make sure that my firewall isn't doing any NAT or masquerading I 
   flushed my rules, established a new SSH connection and then did a 
netstat:

Proto Recv-Q Send-Q Local Address     Foreign Address
tcp        0      0 y.y.y.244:22      x.x.x.103:1197    ESTABLISHED


There is definitely something going on that I don't know about ... Can 
anyone suggest ways that I can find the root cause for this problem? I'm 
really new at iptables and debugging network problem so any help is 
appreciated!

Jc


