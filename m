From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: How can I test my tc script?
Date: Wed, 02 Feb 2011 22:17:46 -0400
Message-ID: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello.

I recently wrote a script that adds a new rule for an ip address each
time a new user is added to our network. I've noticed my tc rules work
ok but, when there are over 20 users connected simultaneously our
internet speed tends to slow down.

Our network has about 120 users in total not all of these get connected
at the same time. I've tried to assign each user 512 burting up to 768
for download speed and 128 bursting up to 256 for upload. I do the
bursting to compensate 20% loss. Users have been complaining about the
slow internet lately but, don't know where is my bottleneck causing the
problem. We have 15Mb of total download bandwidth for the entire
network, don't know if thats enough but, can't get more than that yet.

I would like to know how can I run some sort of benchmark test on a
network that would simulate 10,20,50,100 users connected to see if my gw
is handling the traffic well.

Here's a snip of what the script looks like:

#upload
$tc qdisc del dev eth0 root
$tc qdisc add dev eth0 root handle 1: htb r2q 1

$tc class add dev eth0 parent 1:0  classid 1:1 htb rate 2700kbit ceil
3105kbit

# this is generated for each user:
$iptables -t mangle -A PREROUTING -s 172.16.100.11 -j MARK --set-mark
1000
$iptables -t mangle -A PREROUTING -s 172.16.100.11 -j RETURN
$tc class   add dev eth0 parent 1:10    classid 1:1000 htb rate 156kbit
ceil 256kbit prio 3
$tc filter  add dev eth0 parent 1:0     protocol ip prio 3 handle 1000
fw classid 1:1000
$tc qdisc   add dev eth0 parent 1:1000  handle 500: sfq perturb 2

################ 
Now Download interface

$tc qdisc del dev eth1 root
$tc qdisc add dev eth1 root handle 2: htb r2q 1

$tc class add dev eth1 parent 2:0  classid 2:1 htb rate 15500kbit ceil
15525kbit

#for each user
$iptables -t mangle -A POSTROUTING -d 172.16.100.11 -j MARK --set-mark
1009
$iptables -t mangle -A POSTROUTING -d 172.16.100.11 -j RETURN
$tc class   add dev eth1 parent 2:17    classid 2:1009 htb rate 739kbit
ceil 850kbit prio 3
$tc filter  add dev eth1 parent 2:0     protocol ip prio 3 handle 1009
fw classid 2:1009
$tc qdisc   add dev eth1 parent 2:1009  handle 507: sfq perturb 2


Are these rules ok?

Thanks in advanced for your help and time.

