From: "Mario Antonio" <dino@webjogger.net>
Subject: Re: alias interfaces
Date: Fri, 18 Oct 2002 19:40:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <044c01c276ff$c3d06df0$13c01dd0@shadowfax>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Antony,

Thanks again for your kindness.

I was also doubting about routing problems, but why when I accept all the
traffic in the INPUT chain, everything works find?


Linux 7.3 and iptables v1.2.7a
eth0=10.10.10.239
eth0:0=10.10.13.227
 workstation accessing the server: 10.10.10.19 netmask 255.255.255.0



This is my ifconfig:
eth0      Link encap:Ethernet  HWaddr 00:06:5B:8C:72:5F
          inet addr:10.10.10.239  Bcast:10.10.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:41195 errors:0 dropped:0 overruns:0 frame:0
          TX packets:19820 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:12109228 (11.5 Mb)  TX bytes:3289639 (3.1 Mb)
          Interrupt:16 Base address:0xa000

eth0:0    Link encap:Ethernet  HWaddr 00:06:5B:8C:72:5F
          inet addr:10.10.13.227  Bcast:10.10.13.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          Interrupt:16 Base address:0xa000

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:11 errors:0 dropped:0 overruns:0 frame:0
          TX packets:11 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:812 (812.0 b)  TX bytes:812 (812.0 b)


This is my netstat -nr
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt
Iface
10.10.10.0    0.0.0.0         255.255.255.0   U        40 0          0 eth0
10.10.13.0    0.0.0.0         255.255.255.0   U        40 0          0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U        40 0          0 lo
0.0.0.0         10.10.10.1    0.0.0.0         UG       40 0          0 eth0


My simple rules againg:

#! /bin/sh
 /usr/local/sbin/iptables -F
 /usr/local/sbin/iptables -P INPUT DROP
 #/usr/local/sbin/iptables -A INPUT   -j LOG --log-prefix "IPTABLES-IN "
 /usr/local/sbin/iptables -P FORWARD ACCEPT
 /usr/local/sbin/iptables -P OUTPUT ACCEPT
 /usr/local/sbin/iptables -A INPUT -m state --state RELATED,ESTABLISHED -j
ACCEPT
/usr/local/sbin/iptables -A INPUT -s 10.10.10.19  -d 10.10.10.239 -p tcp -m
tcp --dport 80 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
/usr/local/sbin/iptables -A INPUT -i eth0  -s 10.10.10.19  -d
 10.10.13.227 -p tcp -m tcp --dport 80 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
/usr/local/sbin/iptables -A INPUT   -j LOG --log-prefix "IPTABLES-IN "


Regards

Mario


----------------------------------------------------------------------------
----------------
Log entries do not tell you whether the packet is accepted, dropped,
rejected, or whatever.   They simply record the fact that the packet was
seen
at the position in the ruleset where you have your logging rule.

It is the rule/s which come after that (or the default policy) which
determines what actually happens to the packets.

What netmask do you have on your machines ?

Antony.

---
[This e-mail was scanned for viruses by Webjogger's AntiVirus Protection System]


