From: pradeep <pradeep.malke@dexceldesigns.com>
Subject: Getting "OUT OF ORDER" error
Date: Mon, 28 Aug 2017 19:13:37 +0530
Message-ID: <6605e7ef-c0cc-ed9a-aedd-903c58457eb6@dexceldesigns.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I'm facing out of sequence errors, when I transmit traffic
from source to destination through my netem configured box(router).

I want to emulate delay by filtering traffic based on SRCIP and DESTIP

Below is my setup
+-----+                             +-----+         +-----+
  |        | iface1---------eth0 |        | eth1------------iface2|        |
+-----+ +-----+                               +-----+
  source                netem configured box(router) destination

iface1 ip:  10.0.0.10 gw 10.0.0.1
iface2 ip:  20.0.0.10 gw 20.0.0.1

eth0 : 10.0.0.1
eth2 : 20.0.0.1


Below are the commands i used on eth0 and eth1 to emulate delay

   tc qdisc add dev INFACE root handle 1: htb default 10
   tc class add dev  INFACE parent 1: classid 1:1 htb rate $RATE ceil 
10000mbit
   tc class add dev INFACE parent 1:1 classid 1:11 htb rate $RATE ceil 
10000mbit
   tc qdisc add dev INFACE parent 1:11 handle 11:0 netem delay 10ms 
limit 100000

IFACE: eth0 and eth1

Below command is to filter the traffic
   iptables -t mangle -A POSTROUTING -s 10.0.0.10 -d  20.0.0.10 -j 
CLASSIFY --set-class 1:11


   when i send traffic through iperf3 from source to destination it 
applies the desired delay, but with OUT OF ORDER errors

iperf3 commands:
source
          iperf3 -c 20.0.0.10 -i 1 -u -b 10g (sending traffic)

destination
            iperf3 -s (reciving out of order errors)

Note: I'm using 10g NIC

Let me if im doing anything wrong.

