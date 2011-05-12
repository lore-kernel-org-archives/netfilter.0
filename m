From: =?ISO-8859-2?Q?Pavel_Trefn=FD?= <pavel.trefny@sporknet.cz>
Subject: malfunction xt_CLASSIFY
Date: Thu, 12 May 2011 08:43:36 +0200
Message-ID: <4DCB8198.6060607@sporknet.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have 3302 rules xt_CLASSIFY, 1651 rules for the way toward internet
(eth0) and 1651 for the way from internet to customer (eth1).

The rules send traffic directly to htb classes.

An example of rule:

tc qdisc add dev eth0 root handle 1 htb default 5000 r2q 6
tc qdisc add dev eth1 root handle 2 htb default 5000 r2q 6

tc class add dev eth0 parent 1: classid 1:3 htb rate 280Mbit
tc class add dev eth1 parent 2: classid 2:3 htb rate 280Mbit
tc class add dev eth0 parent 1:3 classid 1:5000 htb rate 72Kbit burst
5Kb prio 0
tc class add dev eth1 parent 2:3 classid 2:5000 htb rate 72Kbit burst
5Kb prio 0

tc class add dev eth0 parent 1:3 classid 1:4000 htb rate 72Kbit ceil
768Kbit burst 3Kb prio 5
tc class add dev eth1 parent 2:3 classid 2:4000 htb rate 72Kbit ceil
768Kbit burst 3Kb prio 5

iptables -A POSTROUTING -t mangle -p all -d 77.48.12.5/32 -s 0.0.0.0/0
-o eth1 -j CLASSIFY --set-class 2:4000
iptables -A POSTROUTING -t mangle -p all -s 77.48.12.5/32 -d 0.0.0.0/0
-o eth0 -j CLASSIFY --set-class 1:4000

Everything works, only in random times it happenes that data get through
CLASSIFY (They are visible in counter) but they dont arrive do defined
class, they arrive do default class htb 5000 instead.

/cgw:~# iptables -L POSTROUTING -nvx  -t mangle | tail -2 && tc -s -d
class show dev eth0 | grep -A2 :4000 && tc -s -d class show dev eth1 |
grep -A2 :4000
  559773 588881196 CLASSIFY   all  --  *      eth1    0.0.0.0/0        
77.48.12.5          CLASSIFY set 2:4000
  *559773* 588881196 CLASSIFY   all  --  *      eth0   
77.48.12.5           0.0.0.0/0        CLASSIFY set 1:4000
class htb 1:4000 parent 1:3 leaf 4000: prio 5 quantum 1500 rate 72000bit
ceil 768000bit burst 3Kb/8 mpu 0b overhead 0b cburst 1599b/8 mpu 0b
overhead 0b level 0
 Sent 593818498 bytes *557053* pkt (dropped 0, overlimits 0 requeues 0)
 rate 1168bit 0pps backlog 0b 0p requeues 0
class htb 2:4000 parent 2:3 leaf 4000: prio 5 quantum 1500 rate 72000bit
ceil 768000bit burst 3Kb/8 mpu 0b overhead 0b cburst 1599b/8 mpu 0b
overhead 0b level 0
 Sent 596718018 bytes 559773 pkt (dropped 0, overlimits 0 requeues 0)
 rate 1168bit 0pps backlog 0b 0p requeues 0
/
SW:
vanila kernel 2.6.37.6
iptables v1.4.10

How can I get rid of this problem?
Thank you for your help.
Yours sincerely


                     Pavel Trefny
