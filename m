From: Karim Asif Sattar <karimas@kfupm.edu.sa>
Subject: Problem in using TC Traffic Control
Date: Wed, 05 Nov 2008 15:13:46 +0300
Message-ID: <000601c93f3f$f544b4e0$4a8610ac@icsasif>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi
I am new to "tc" Traffic Control but not new to Linux. I am using Fedora 9
with 2.6.23 kernel with new iproute2 package and preinstalled "tc" in the
fedora. I am using the following rules for the "tc". 


I am using the Linux Box as a router which is forwarding packets already
mark with required parameters such as ToS marking, so I think I shouldn't
have to use the iptables mangling features.

The linux is accepting the kernel but the problem is that when I do "tc
filter show" or "tc class show" it is not showing any thing.

The packets I am forwarding is not affected by these rules.

I am using HTB, is there any issue in using this.


tc qdisc add dev eth1 root handle 1: htb default 20

tc class add dev eth1 parent 1: classid 1:1 htb rate 100mbit ceil 100mbit

tc class add dev eth1 parent 1:1 classid 1:10 htb rate 1mbit ceil 100mbit
tc class add dev eth1 parent 1:1 classid 1:20 htb rate 99mbit ceil 100mbit

tc filter add dev eth1 protocol ip parent 1:0 prio 1 u32 match ip tos 46
0xff flowid 1:10

Can any one guide me what I am doing wrong

Regards
Karim Asif


