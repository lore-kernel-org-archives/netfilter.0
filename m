From: Paul Jack <aunty@edenrdfarm.com>
Subject: using CLASSIFY target with tbf
Date: Sun, 04 Jul 2010 18:08:08 +0800
Message-ID: <4C305D88.1030100@edenrdfarm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

hi folks

i am routing traffic between an internet connection and an internal 
network. i wish to throttle individual users who have exceeded their quota.

initially i have a htb 1:0 attached to the root of my internal 
interface. when a quota is exceeded my script attaches a htb class 1:n 
with rate = the whole internal bandwidth, 100mbit. then it attaches to 
this a tbf qdisc n+9:0 with rate = shaped rate, 48kbit. the tbf 
automatically creates one class n+9:1. the script also then creates a 
rule in mangle POSTROUTING for that user with -j CLASSIFY --set-class n+9:1

so, for the first shaped user (n=1) i execute:

tc class add dev $internal parent 1:0 classid 1:1 htb rate 100mbit
tc qdisc add dev $internal parent 1:1 handle 10:0 tbf rate 48kbit burst 
10kb limit 10kb
iptables -t mangle -A POSTROUTING -d $machIP -j CLASSIFY --set-class 10:1

which makes:

root
qdisc       class         qdisc         class
htb  ------  htb  ------  tbf  ------  tbf
1:0              1:1          10:0          10:1

tc -s -d qdisc show dev eth1 gives:
qdisc htb 1: root r2q 10 default 0 direct_packets_stat 82635 ver 3.17
 Sent 41949635 bytes 82635 pkt (dropped 0, overlimits 0 requeues 12)
 rate 0bit 0pps backlog 0b 0p requeues 12
qdisc tbf 10: parent 1:1 rate 48000bit burst 10Kb/8 mpu 0b lat 1us
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0

tc -s -d class show dev eth1 gives:
class htb 1:1 root leaf 10: prio 0 quantum 200000 rate 100000Kbit ceil
100000Kbit burst 14087b/8 mpu 0b overhead 0b cburst 14087b/8 mpu 0b overhead
0b level 0
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 lended: 0 borrowed: 0 giants: 0
 tokens: 1101 ctokens: 1101

class tbf 10:1 parent 10:

iptables -t mangle -L POSTROUTING  -n gives:
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
CLASSIFY   all  --  0.0.0.0/0            192.168.20.10       CLASSIFY 
set 10:1

i can see traffic going through the root qdisc alright but nothing's 
getting shaped.
can some wonderful person out there show me where i'm going wrong ?

thank you muchly,
aunty
