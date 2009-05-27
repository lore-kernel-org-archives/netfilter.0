From: Fabio Marcone <fabio.marcone@duet.it>
Subject: tc filters info
Date: Wed, 27 May 2009 11:24:08 +0200
Message-ID: <4A1D06B8.8020500@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi *,
I'm testing a HTB+PRIO setup, this is the script:

tc qdisc del dev eth0 root
tc qdisc add dev eth0 root handle 1: htb
tc class add dev eth0 parent 1:0 classid 1:1 htb rate 300Kbit ceil 
300Kbit burst 6k cburst 64k quantum 1600
tc class add dev eth0 parent 1:0 classid 1:2 htb rate 100Kbit ceil 
100Kbit burst 6k cburst 64k quantum 1600
tc qdisc add dev eth0 parent 1:1 handle 10: prio bands 3
tc filter add dev eth0 parent 1:0 prio 0 protocol ip handle 1 fw flowid 1:1
tc filter add dev eth0 parent 1:0 prio 2 protocol ip handle 2 fw flowid 1:2
tc filter add dev eth0 parent 1:0 prio 1 protocol ip handle 3 fw flowid 1:1
tc filter add dev eth0 parent 10:0 prio 0 protocol ip handle 1 fw flowid 
10:1
tc filter add dev eth0 parent 10:0 prio 0 protocol ip handle 2 fw flowid 
10:2
tc filter add dev eth0 parent 10:0 prio 1 protocol ip handle 3 fw flowid 
10:3


I don't understand this strange (for me) behaviour: I have 6 filter 
rules, if I remove rules related to class 1:x, prio qdisc doesn't 
receive packets and all packets are sent using htb qdisc.

Why? I don't understand why I have to add rules about 1:x class to send 
packets via prio qdisc. Tc filter rules about 10:x aren't enough?

Thanks in advance,
Fabio



