From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: Problem in using TC Traffic Control
Date: Wed, 5 Nov 2008 07:53:09 -0800
Message-ID: <20081105075309.2209b3aa@extreme>
References: <000601c93f3f$f544b4e0$4a8610ac@icsasif>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000601c93f3f$f544b4e0$4a8610ac@icsasif>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Karim Asif Sattar <karimas@kfupm.edu.sa>
Cc: netfilter@vger.kernel.org

On Wed, 05 Nov 2008 15:13:46 +0300
Karim Asif Sattar <karimas@kfupm.edu.sa> wrote:

> Hi
> I am new to "tc" Traffic Control but not new to Linux. I am using Fedora 9
> with 2.6.23 kernel with new iproute2 package and preinstalled "tc" in the
> fedora. I am using the following rules for the "tc". 
> 
> 
> I am using the Linux Box as a router which is forwarding packets already
> mark with required parameters such as ToS marking, so I think I shouldn't
> have to use the iptables mangling features.
> 
> The linux is accepting the kernel but the problem is that when I do "tc
> filter show" or "tc class show" it is not showing any thing.
> 
> The packets I am forwarding is not affected by these rules.
> 
> I am using HTB, is there any issue in using this.
> 
> 
> tc qdisc add dev eth1 root handle 1: htb default 20
> 
> tc class add dev eth1 parent 1: classid 1:1 htb rate 100mbit ceil 100mbit
> 
> tc class add dev eth1 parent 1:1 classid 1:10 htb rate 1mbit ceil 100mbit
> tc class add dev eth1 parent 1:1 classid 1:20 htb rate 99mbit ceil 100mbit
> 
> tc filter add dev eth1 protocol ip parent 1:0 prio 1 u32 match ip tos 46
> 0xff flowid 1:10
> 
> Can any one guide me what I am doing wrong
> 
> Regards
> Karim Asif
> 

Class and filter show both require device name:

# tc qdisc add dev eth1 root handle 1: htb default 20
# tc class add dev eth1 parent 1: classid 1:1 htb rate 100mbit ceil 100mbit
# tc class add dev eth1 parent 1:1 classid 1:10 htb rate 1mbit ceil 100mbit
# tc class add dev eth1 parent 1:1 classid 1:20 htb rate 99mbit ceil 99mbit
# tc filter add dev eth1 protocol ip parent 1:0 prio 1 u32 match ip tos 46 0xff flowid 1:10
# tc qdisc ls
qdisc htb 1: dev eth1 root r2q 10 default 20 direct_packets_stat 1
qdisc pfifo_fast 0: dev eth2 root bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
qdisc pfifo_fast 0: dev eth3 root bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
qdisc pfifo_fast 0: dev qtap0 root bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
# tc class show dev eth1
class htb 1:10 parent 1:1 prio 0 rate 1000Kbit ceil 100000Kbit burst 1600b cburst 1600b 
class htb 1:1 root rate 100000Kbit ceil 100000Kbit burst 1600b cburst 1600b 
class htb 1:20 parent 1:1 prio 0 rate 99000Kbit ceil 99000Kbit burst 1584b cburst 1584b 
# tc filter show dev eth1
filter parent 1: protocol ip pref 1 u32 
filter parent 1: protocol ip pref 1 u32 fh 800: ht divisor 1 
filter parent 1: protocol ip pref 1 u32 fh 800::800 order 2048 key ht 800 bkt 0 flowid 1:10 
  match 002e0000/00ff0000 at 0
# uname -r
2.6.28-rc3
