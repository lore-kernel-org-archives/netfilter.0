From: Magnus Schmidt <netfilter_20071105.nsp@27b-6.de>
Subject: Packet gets SNAT without reaching POSTROUTING
Date: Mon, 5 Nov 2007 00:24:21 +0100
Message-ID: <200711050024.21381.netfilter_20071105.nsp@27b-6.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi there,

 I'm working now on a problem for several hours, but somehow I cannot find any 
clue. I hope someone has some ideas.

I have a "normal" firewall-Setup: internal private address-space <-> fw with 
snat to b.b.b.b <-> external network. An internal application uses an 
ipsec-tunnel to an external system. This setup works without problems. 

Because of routing-reasons this ipsec-tunnel should now be nated to an already 
bound, secondary, virtual external address of the firewall (b.b.b.b). After 
changing the snat-rules for IKE and ESP the IKE-exchange works, an SA is 
established but all ESP-packets are still nated to the old primary address 
(a.a.a.a). 

After some debugging I found that packets reach mangle POSTROUTING (which has 
no rules, default policy accept), but I never see it reach the nat 
POSTROUTING chain. However a tcpdump shows that these packets actually get 
nated, but to the wrong, old primary ip (a.a.a.a). Furthermore normal UDP,TCP 
and ICMP packets are nated to the correct address (b.b.b.b), only ESP does 
not work.

Is there any other place, where snat can happen ? Kernel is 2.6.18-5-686 with 
a debian install, nothing special. No fancy netfilter-modules loaded (see 
below).

This is the logline I get from the mangle-chain in POSTROUTING (see below), 
after that the packet is somehow lost, no further logging in the nat-chain 
POSTROUTING:
Nov  4 23:48:24 fw kernel: *** postrouting_mangle_start IN= OUT=eth0 
SRC=10.0.3.250 DST=a.b.c.d LEN=112 TOS=0x00 PREC=0x00 TTL=63 ID=30807 
PROTO=ESP SPI=0x6a9fd7da

However the tcpump shows:
23:50:00.499933 IP a.a.a.a > a.b.c.d: ESP(spi=0x6a9fd7da,seq=0x138c), length 
92

I am aware that there are still hundreds of other rules active in FORWARD or 
INPUT (for filter). However the mangle-filter and the nat-filter are exactly 
as shown below. How can a packet traverse mangle-POSTROUTING, but not reach 
nat-POSTROUTING ?

Any ideas welcome,
Magnus



fw:~# iptables -t nat -L -n -v
Chain PREROUTING (policy ACCEPT 961K packets, 71M bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain POSTROUTING (policy ACCEPT 718K packets, 44M bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 LOG        esp  --  *      *       0.0.0.0/0            0.0.0.0/0           
LOG flags 0 level 4 prefix `*** postrouting_nat_start '
---- Above rule is never triggered
   61  3700 SNAT       0    --  *      eth0    10.0.0.0/24          0.0.0.0/0           
to:a.a.al.a
    1   348 SNAT       0    --  *      eth0    10.0.3.250           0.0.0.0/0           
to:b.b.b.b
---- Above works for all protocols except ESP packets

Chain OUTPUT (policy ACCEPT 698K packets, 42M bytes)
 pkts bytes target     prot opt in     out     source               
destination



fw:~# iptables -t mangle -L -n -v
Chain PREROUTING (policy ACCEPT 66M packets, 28G bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain INPUT (policy ACCEPT 26M packets, 11G bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain FORWARD (policy ACCEPT 40M packets, 17G bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain OUTPUT (policy ACCEPT 31M packets, 25G bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain POSTROUTING (policy ACCEPT 71M packets, 41G bytes)
 pkts bytes target     prot opt in     out     source               
destination
 1347  175K LOG        esp  --  *      *       0.0.0.0/0            0.0.0.0/0           
LOG flags 0 level 4 prefix `*** postrouting_mangle_start '
---- This rule is triggered



fw:~# lsmod | grep ip
iptable_mangle          2880  1
ipt_LOG                 6112  6
ipt_REJECT              5248  1
ipt_ttl                 1984  1
iptable_nat             7044  1
ip_nat                 16876  1 iptable_nat
iptable_filter          3104  1
ip_tables              13028  3 iptable_mangle,iptable_nat,iptable_filter
x_tables               13316  8 
ipt_LOG,ipt_REJECT,ipt_ttl,xt_limit,xt_state,xt_tcpudp,iptable_nat,ip_tables
ipv6                  226272  32
ip_conntrack_ftp        7760  0
ip_conntrack           49088  4 xt_state,iptable_nat,ip_nat,ip_conntrack_ftp
nfnetlink               6680  2 ip_nat,ip_conntrack



fw:~# uname -a
Linux fw 2.6.18-5-686 #1 SMP Wed Oct 3 00:12:50 UTC 2007 i686 GNU/Linux



fw:~# cat /etc/debian_version
4.0


