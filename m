From: "Jason" <jason@oregonemt.net>
Subject: limiting samba access with IPTABLES
Date: Fri, 9 Dec 2005 08:43:18 -0800
Message-ID: <002401c5fcdf$abf6ec40$2e01a8c0@jasonspc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello:

I run a samba server that I need to have accessible only to my local network 
and eventually my cousins network about 200 miles away.  I created a 
netfilter firewall using IPTABLES that blocks samba to everyone by default. 
I then created some rules to open up the samba port to the specific ip 
addresses.  I must be doing something incorrectly because I can't get this 
to work.  Can someone take a look at my firewall rules to see what I am 
doing wrong.  I have put the rules in question in Bold font.  I have 
islolated this to the netfilter firewall as samba will work for everyone 
when the firewall is off.  Please any help you can provide me would be 
appreciated

Thank you

Jason



Here is my network details:

192.168.1.41 is my linux server which samba services are running on
I have a Wireless DSL modem/router that has IP address of 71.111.151.20, I 
have port forwarded samba port 445 over to the linux server [192.168.1.41]
192.168.1.42 belongs to my brother jonathans computer who is connected via a 
wireless
192.168.1.44 belongs to my other brother jordans computer who is also 
connected via wireless
192.168.1.46 is my computer connected via wireless



Here is my current firewall configuration:

# import this saved configuration into your iptables configuration with the 
following command:
# iptables-restore < firewall.config

*nat
:PREROUTING ACCEPT [127173:7033011]
:POSTROUTING ACCEPT [31583:2332178]
:OUTPUT ACCEPT [32021:2375633]
COMMIT

*mangle
:PREROUTING ACCEPT [444:43563]
:INPUT ACCEPT [444:43563] :FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [402:144198]
:POSTROUTING ACCEPT [402:144198]
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG 
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
COMMIT

*filter
:INPUT DROP [1:242]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
:icmp_packets - [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 43 -j ACCEPT
-A INPUT -p udp -m udp --dport 53 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A INPUT -p udp -m udp --dport 123 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 783 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 901 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 3128 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 8000 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 8001 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 12000 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 15000 -j ACCEPT
-A INPUT -s 127.0.0.1 -j ACCEPT
-A INPUT -s 192.168.1.42 -i eth0 -d 192.168.1.41 -p TCP --dport 445 -j 
ACCEPT
-A INPUT -s 192.168.1.44 -i eth0 -d 192.168.1.41 -p TCP --dport 445 -j 
ACCEPT
-A INPUT -s 192.168.1.46 -i eth0 -d 192.168.1.41 -p TCP --dport 445 -j 
ACCEPT
-A INPUT -p icmp -j icmp_packets
-A INPUT -j LOG --log-prefix "IPTABLES-IN Default Drop: " --log-level 7


-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 23 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 43 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 123 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 143 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 783 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 901 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 3306 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 3128 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 8000 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 8001 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 10000 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 12000 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 15000 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 2210 -j ACCEPT
-A OUTPUT -d 127.0.0.1 -j ACCEPT
-A OUTPUT -p icmp -j icmp_packets
-A OUTPUT -j LOG --log-prefix "IPTABLES-OUT Default Drop: " --log-level 7


-A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A icmp_packets -s 127.0.0.1 -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 8 -j DROP
-A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
COMMIT


