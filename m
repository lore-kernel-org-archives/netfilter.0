From: <mamadou.toure@vipnet.ci>
Subject: tc and making QoS
Date: Sat, 01 May 2010 17:32:37 +0000
Message-ID: <81733a94fcba39898284eb926920cd24@196.201.78.10>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi list,

I've some problem with making Qos.

All my pass through a linux box which is in Bridge mode.

I'd to implement a Qos to allocate 25Kbit of bandwith to the http

communication. So I've made these commands:

--------------------------------------------------------------

tc qdisc add dev  eth1  root handle 1: htb default 1 tc  class add dev 

eth1  parent 1: classid  1:1  htb rate 50kbit ceil 50kbit tc qdisc add dev 

eth1  parent  1:1  handle 10:  sfq perturb 10 tc qdisc add dev  eth2  root

handle 1: htb default 1 tc  class add dev  eth2  parent 1: classid  1:1 

htb rate 50kbit ceil 50kbit tc qdisc add dev  eth2  parent  1:1  handle 10:

 sfq perturb 10



tc  class add dev  eth1  parent 1:0 classid  1:1007  htb rate 512kbit ceil

512kbit tc  class add dev  eth2  parent 1:0 classid  1:1007  htb rate

512kbit ceil 512kbit



tc  class add dev  eth1  parent 1:1007 classid  1:8170  htb rate 25kbit

ceil 25kbit tc qdisc add dev  eth1  parent  1:8170  handle 8170:  sfq

perturb 10 tc  class add dev  eth2  parent 1:1007 classid  1:8170  htb rate

25kbit ceil 25kbit tc qdisc add dev  eth2  parent  1:8170  handle 8170: 

sfq perturb 10



tc filter add dev  eth1  protocol ip parent 1:  prio 1 u32   match ip  src 

192.168.2.88/32  match ip protocol  6  0xff match ip dport  80  0xffff

flowid  1:8170

tc filter add dev  eth2  protocol ip parent 1:  prio 1 u32   match ip  dst 

192.168.2.88/32  match ip protocol  6  0xff match ip dport  80  0xffff

flowid  1:8170

--------------------------------------------------------------------

The filter tc filter add dev  eth1.....

Is allway match for all http upstream traffic But the filter tc filter add

dev  eth2...

Is never match for the http downstream. And that make a sense because the

dport of the downstream is not 80.

Can someone help me troubleshoot.

Regards.


