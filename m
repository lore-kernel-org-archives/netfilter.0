From: "Navneet" <navneetkc@gmail.com>
Subject: Linux as router (Gateway Server)
Date: Wed, 19 Jan 2005 20:07:07 +0530
Message-ID: <00a601c4fe34$5e74bd80$eaab9385@gagan>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,

 I have a question,

"I only have a single network connection, but I would like all my computers
to have Internet access.
How is this possible?'

1.What i have?

My network configuration is as follows:-

          eth1
  (172.21.0.133/28)
               |
             |
    AGNI {RedHat 9[Squid Proxy,Gateway ,firewall & FTP] }
             |
             |
             |
     (192.168.0.0/16)
           eth0
              |
---- SWITCH----------
              |
              |
              |
          LAN


where:-
eth0-Intel Corp. 82557/8/9 [Ethernet Pro 100]
eth1-Broadcom Corporation NetXtreme BCM5702 Gigabit Ethernet

2.What i have done:-

a)Enabled IP forwarding

echo 1 > /proc/sys/net/ipv4/ip_forward
& added above line in /etc/rc.d/rc.local

b)Firewall rules as follows:-

# vi testWall

1 *filter
 2 :INPUT DROP [0:0]
 3 :FORWARD DROP [0:0]
 4 :OUTPUT DROP [0:0]
 5
 6 # allow local loopback connections
 7 -A INPUT -i lo -j ACCEPT
 #allow echo-requests (pinging)
 8 -A INPUT -s 192.168.0.0/16 -d 0/0  -p icmp --icmp-type echo-request -j
ACCEPT
 9 # drop INVALID connections
10 -A INPUT   -m state --state INVALID -j DROP
11 -A OUTPUT  -m state --state INVALID -j DROP
12 -A FORWARD -m state --state INVALID -j DROP
13
14 # allow all established and related
15 -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
16 -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
17 -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
18
19 # allow connections to my ISP's DNS servers
20 -A OUTPUT  -d 2.3.4.10 -m state --state NEW -p udp --dport 53 -o eth0 -j
ACCEPT
21 -A OUTPUT  -d 2.3.4.11 -m state --state NEW -p udp --dport 53 -o eth0 -j
ACCEPT
22 -A FORWARD -d 2.3.4.10 -m state --state NEW -p udp --dport 53 -i eth0 -o
eth0 -j ACCEPT
23 -A FORWARD -d 2.3.4.11 -m state --state NEW -p udp --dport 53 -i eth0 -o
eth0 -j ACCEPT
24
25 # allow outgoing connections to web servers
26 -A OUTPUT  -d 0/0 -m state --state NEW -p tcp -m multiport --dport
http,https -o eth0 -j ACCEPT
27 -A FORWARD -d 0/0 -m state --state NEW -p tcp -m multiport --dport
http,https -o eth0 \
 -i eth0 -j ACCEPT
28
29 # allow outgoing mail connections to my ISP's SMTP and POP3 server only
30 -A OUTPUT  -d mail.my-isp.com -m state --state NEW -p tcp -m
multiport --dport smtp,pop3 \
 -o eth0 -j ACCEPT
31 -A FORWARD -d mail.my-isp.com -m state --state NEW -p tcp -m
multiport --dport smtp,pop3 \
 -o eth0 -j ACCEPT
32
33 # log all other attempted out going connections
34 -A OUTPUT -o eth0 -j LOG
35 -A FORWARD -j LOG
36 # default is to DROP out-going connections
37
38 COMMIT
39
40 *nat
41
42 # set up IP forwarding and nat
43 -A POSTROUTING -o eth0 -j SNAT --to 172.21.0.133
44
45 COMMIT

PS: Copied from http://linuxgazette.net/103/odonovan.html

#iptables-restore </root/testWall

#iptables-save

3.What i got:-

a)users can able to browse internet via squid proxy (192.168.0.1:3128)
i.e http/https

b)But can't able to access mails (POP3/SMTP)  from our ISP mailserver.

can't able to go beyond my RedHat (AGNI) server, while i do traceroute of my
ISP's mailserver.

What i am doing wrong? please suggest



Thanks & regards,

Navneet Choudhary





