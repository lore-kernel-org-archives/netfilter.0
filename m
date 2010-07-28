From: <jwexler@mail.usa.com>
Subject: RE: Bidirectionally Route all traffic to an ip to another ip
Date: Wed, 28 Jul 2010 19:46:36 +0900
Message-ID: <021901cb2e42$2a503590$7ef0a0b0$@usa.com>
References: <00bf01cb2ca4$3d6af6f0$b840e4d0$@usa.com> <alpine.LSU.2.01.1007261133020.22382@obet.zrqbmnf.qr> <00d501cb2cb2$c97f6000$5c7e2000$@usa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <00d501cb2cb2$c97f6000$5c7e2000$@usa.com>
Content-Language: ja
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jan Engelhardt' <jengelh@medozas.de>, netfilter@vger.kernel.org

I nearly got it working but still no dice.

iptables -t nat -A OUTPUT -p all -d 192.168.40.3 -j DNAT --to-destination
192.168.40.1
(Note: -A PREROUTING did not work at all but -A OUTPUT got me closer)
iptables -t nat -A POSTROUTING -p all -j MASQUERADE
iptables -t nat -n -L
Chain PREROUTING (policy ACCEPT)
target prot opt source destination 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source      destination 
MASQUERADE all  --  0.0.0.0/0   0.0.0.0/0 

Chain OUTPUT (policy ACCEPT)
target prot opt source     destination 
DNAT   all  --  0.0.0.0/0  192.168.40.3    to:192.168.40.1 

"ping 192.168.40.3 -I eth1" and "ping 192.168.40.3" both work fine.
I can access the router and login to it via http://192.168.40.3/. Therefore
port 80 is working.

route -n
Receipt Site  Gateway       Netmask          Flags  Metric Ref Use #
Interface
192.168.40.1  0.0.0.0       255.255.255.255  UH     0      0   0      eth0
0.0.0.0       192.168.40.1  0.0.0.0          UG     0      0   0      eth0

ip route show
192.168.40.1 dev eth0 proto static scope link 
default via 192.168.40.1 dev eth0 proto static 

ip rule show
0: from all lookup local 
32766: from all lookup main 
32767: from all lookup default 


ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN 
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
inet 127.0.0.1/8 scope host lo
etc....
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state
UNKNOWN qlen 1000
inet 192.168.40.2/32 brd 192.168.40.2 scope global eth0
etc....
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state
UP qlen 1000
inet 192.168.40.3/32 brd 192.168.40.3 scope global eth1
etc....
5: eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state
UP qlen 1000
etc....
(eth2 is currently down)


In Asterisk 1.4.33.1, sip.conf
bindport=5060
bindaddr=0.0.0.0
rt200ne=192.168.3.1
rt200ne=192.168.3.70

register => 3:username:password@192.168.40.1/123456789
will register but
register => 3:username:password@192.168.40.3/123456789
will not register

Any ideas why ping and http to 192.168.40.3 is successfully directed to
192.168.40.1 but the asterisk registration to 192.168.40.3 on port 5060 is
not? Any ideas as to things to try to fix this?

Thanks!!

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of jwexler@mail.usa.com
Sent: Monday, July 26, 2010 8:08 PM
To: netfilter@vger.kernel.org
Subject: RE: Bidirectionally Route all traffic to an ip to another ip

Thanks. It still did not work.

Should I only be doing a ip route add 192.168.50.1/32 via 192.168.40.1
statement or should I also be adding iptables commands?
I am having trouble getting the ip route add 192.168.50.1/32 to use dev eth1
instead of eth0.

When I do:
ip route add dev eth5 192.168.50.1/32 via 192.168.40.1
I get an error: RTNETLINK answers: No such process

Should I also be doing some kind of ip addr add dev eth5? And/or add src
192.168.50.1/32 to the ip route add command somehow?

I have tried many combinations but still have not gotten it to work yet.

Thanks!!
JW

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Jan Engelhardt
Sent: Monday, July 26, 2010 6:35 PM
To: jwexler@mail.usa.com
Cc: netfilter@vger.kernel.org
Subject: Re: Bidirectionally Route all traffic to an ip to another ip

On Monday 2010-07-26 11:23, jwexler@mail.usa.com wrote:

>Greetings,
>
>I need to be able to do the following:
>
>Physical Router located at 192.168.40.1
>
>On Ubuntu 10.04 Lucid machine:
>eth0 with static ip 192.168.40.2
>eth1 with static ip 192.168.40.3
>eth2 with static ip 192.168.40.4
>
>Associate a virtual address to eth1 with an entirely different network
>address such as 192.168.50.1
>Do the same (virtual address) for eth2 -- e.g. 192.168.60.1
>
>In the application:
>register phone number A at 192.168.40.1 (The application will automatically
>use eth0 for this)
>register phone number B at 192.168.50.1
>register phone number C at 192.168.60.1
>
>Somehow forward all traffic (including the register request) sent to
>192.168.50.1 to 192.168.40.1 as if the register had been made directly to
>192.168.40.1. In other words, the app "sends" registration and traffic to
>192.168.50.1 but then Ubuntu forwards it to 192.168.40.1 (but the app does
>not know that).


ip route add 192.168.50.1/32 via 192.168.40.1

etc.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

