From: "Robert Becskei" <brobiwbe@stcable.co.yu>
Subject: how to do this without 2 NATting , please help me :)
Date: Fri, 4 Feb 2005 10:37:38 +0100
Message-ID: <001101c50a9d$2a224780$1701a8c0@info2000256>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello all,

I've got a lan like this

subnet 192.168.0.x-------| 192.168.0.250 -|

subnet 192.168.1.x-------| 192.168.1.250 - (NAT1) - 192.168.10.2 ---  
192.168.10.1 Firewall - (NAT2) - xxx.xxx.xxx.xxx

subnet 192.168.2.x-------| 192.168.2.250 -|

My problem is that I want to do the first thing without NAT , ip forwarding 
is enabled and there is something I cannot understand... if I remove the nat 
lines from the proxy/nat server see config1 bellow I'm not able to ping 
192.168.10.1
but I can ping 192.168.2.200 or 192.168.0.15 and I'm in subnet 192.168.1.x , 
why is this ? why won't 192.168.10.1 respond back to me ? and why does 
192.168.2.200 and 192.168.0.15 ? (actualy I can ping every computer in any 
subnet without that nat line, but cannot ping that 192.168.10.1, only if nat 
is used.

---config1----

The proxy/nat server (NAT1) iptables rule is :

#!/bin/sh
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.168.10.1:88 
***
iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to 
192.168.10.1:88 ***
iptables -t nat -A PREROUTING -p tcp -d 192.168.10.2 --dport 5900 -j 
DNAT --to 192.168.2.10:5900
iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.255.0 -j 
SNAT --to-source 192.168.10.2 **
iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 -j 
SNAT --to-source 192.168.10.2 **
iptables -t nat -A POSTROUTING -s 192.168.2.0/255.255.255.0 -j 
SNAT --to-source 192.168.10.2 **

----config1----

------------------------------------------------------------------------------------------------------------------------------------------
*** the first two lines are there so that noone can escape my proxy , I 
don't use transparent proxy anyomre cause many awesome features of squid 
didn't work with transparent proxy

**if I remove these lines I'm not able to ping 192.168.10.1 why ? but I can 
still ping everything in 192.168.0.x 192.168.1.x 192.168.2.x.
-------------------------------------------------------------------------------------------------------------------------------------------

what I would like to do is is put a arbitrator beetween my proxy 
server(NAT1) and firewall(NAT2) but currently it will not do much since the 
ip that the arbitrator would see would be 192.168.10.2 ethOUT of NAT1

my firewall iptables rule :
---------------------------------------------------
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j 
ACCEPT
iptables -A FORWARD -i eth1 -s yyy.yyy.yyy.yyy -d 192.168.10.2 -p 
tcp --dport 5900 -j ACCEPT
iptables -A INPUT -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -i eth0 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -s 192.168.10.1 -j ACCEPT
iptables -A OUTPUT -s xxx.xxx.xxx.xxx -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -d xxx.xxx.xxx.xxx --dport 5900 -j 
DNAT --to 192.168.10.2:5900
iptables -t nat -A POSTROUTING -s 192.168.10.2 -j SNAT --to-source 
xxx.xxx.xxx.xxx
---------------------------------------------------------------

Is there a solution with which I could do only 1 NAT and that only at the 
firewall ?

Sincerely
Robert B 


