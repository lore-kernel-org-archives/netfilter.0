From: David Leangen <dleangen@canada.com>
Subject: Re: Confirm: letting certain packages pass through un-natted
Date: Tue, 27 Sep 2005 11:07:30 +0900
Message-ID: <4338A962.6000104@canada.com>
References: <NEBBKBPLMLNABNADCIPAIEDLBHAB.dleangen@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPAIEDLBHAB.dleangen@canada.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


Ok, I'm obviously doing a horrible job at troubleshooting...

Here's the gist of my iptables rules on my router box 
192.168.1.2/192.168.2.1. I'm trying to figure out why machines on my 
local network can't communicate with 192.168.1.1.

BTW, don't even ask about the entries in the mangle table... I just 
copied them mindlessly. :-(


*mangle
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG 
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j 
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG 
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j 
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG 
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j 
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG 
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j 
DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
COMMIT

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -p tcp --dport 443 -j DNAT --to 192.168.2.2:443
-A POSTROUTING -d 192.168.2.2 -s 192.168.0.0/255.255.0.0 -p tcp --dport 
443 -j S
NAT --to 192.168.1.2
-A PREROUTING -p tcp --dport 8180 -j DNAT --to 192.168.2.10:8180
-A POSTROUTING -d 192.168.2.10 -s 192.168.0.0/255.255.0.0 -p tcp --dport 
8180 -j
  SNAT --to 192.168.1.2
-A PREROUTING -p tcp --dport 8182 -j DNAT --to 192.168.2.2:8182
-A POSTROUTING -d 192.168.2.2 -s 192.168.0.0/255.255.0.0 -p tcp --dport 
8182 -j
SNAT --to 192.168.1.2
-A POSTROUTING -o ppp0 -j MASQUERADE
COMMIT

*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:LOG_ACCEPT - [0:0]
:LOG_DROP - [0:0]
:icmp_packets - [0:0]
# I don't even think this next line is necessary, though, since the 
default policy is "ACCEPT"...
-A FORWARD -s 192.168.0.0/16 -d 192.168.1.1 -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j LOG_ACCEPT
# Open up some other ports (edited out)
-A INPUT -s 127.0.0.1 -j ACCEPT
-A INPUT -p icmp -j icmp_packets
-A INPUT -j LOG_DROP
-A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT] : " 
--log-tcp-options --log
-ip-options
-A LOG_ACCEPT -j ACCEPT
-A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP] : " --log-tcp-options 
--log-ip-
options
-A LOG_DROP -j DROP
-A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A icmp_packets -s 192.168.0.0/255.255.255.0 -p icmp -m icmp --icmp-type 
8 -j AC
CEPT
-A icmp_packets -s 192.168.1.0/255.255.255.0 -p icmp -m icmp --icmp-type 
8 -j AC
CEPT
-A icmp_packets -s 192.168.2.0/255.255.255.0 -p icmp -m icmp --icmp-type 
8 -j AC
CEPT
-A icmp_packets -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
COMMIT

