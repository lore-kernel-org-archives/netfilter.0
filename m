From: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Subject: DNAT Not working
Date: Mon, 12 Jul 2004 11:12:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <04fe01c46822$af0ae4c0$1a07a8c0@civic2k>
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

Hi all !

I a have a fw box running RH 7.3.

Here's part of my nat table :

-A PREROUTING  -p tcp -m tcp -s 172.16.190.0/255.255.255.0 --dport 80 -j
REDIRECT --to-ports 8080
-A POSTROUTING -p tcp -m tcp -s 172.16.190.0/255.255.255.0 ! --dport 80 -o
eth0 -j SNAT --to-source 1.1.1.1
-A POSTROUTING -p udp -m udp -s 172.16.190.0/255.255.255.0 -o eth0 -j
SNAT --to-source 1.1.1.1
-A POSTROUTING -p icmp -m icmp -s 172.16.190.0/255.255.255.0 -o eth0 -j
SNAT --to-source 1.1.1.1

-A PREROUTING -p tcp -m tcp -i eth0 -d 1.1.2.1 --dport 80 -j
DNAT --to-destination 172.16.190.5
-A PREROUTING -p tcp -m tcp -i eth0 -d 1.1.2.1 --dport 9287 -j
DNAT --to-destination 172.16.190.5
-A PREROUTING -i eth0 -d 1.1.2.2 -j DNAT --to-destination 172.16.190.7
-A PREROUTING -p tcp -m tcp -i eth0 -d 1.1.2.3 --dport 5003 -j
DNAT --to-destination 172.16.190.143


Part of my filer table :

-A FORWARD -i eth0 -o eth2 -p tcp -m tcp -d 172.16.190.5 --dport 80 -j
ACCEPT
-A FORWARD -i eth0 -o eth2 -p tcp -m tcp -d 172.16.190.5 --dport 9287 -j
ACCEPT
-A FORWARD -i eth0 -o eth2 -d 172.16.190.7 -j ACCEPT
-A FORWARD -i eth0 -o eth2 -p tcp -m tcp -d 172.16.190.143 --dport 5003 -j
ACCEPT

There are other things in it, and my last FORWARD line is a LOG one.

1.1.1.1 (fake ip) is the ext. ip of the box (eth0)
1.1.2.x are ips routed by the box.
172.16.190.x are internal ips (eth1)


DNAT to 172.16.190.5, port 80 works fine.
DNAT to 172.16.190.143, port 5003 is not.

In /proc/net/ip_conntrack, I see :

tcp      6 118 SYN_SENT src=x.x.x.x dst=x.x.x.x sport=49502 dport=5003
[UNREPLIED] src=172.16.190.143 dst=x.x.x.x sport=5003 dport=49502 use=1

With iptables -nvL, I see packet counter rising for the 2 rules concerning
port 5003

On the 172.16.190.143 box, wich is a mac os x box, with netstat -an | grep
5003, I see :

tcp4       0      0  172.16.190.143.5003    x.x.x.x.62382          SYN_RCVD
tcp4       0      0  172.16.190.143.5003    172.16.190.153.49342
ESTABLISHED
tcp4       0      0  127.0.0.1.5003         127.0.0.1.49184
ESTABLISHED
tcp4       0      0  127.0.0.1.49184        127.0.0.1.5003
ESTABLISHED
tcp4       0      0  *.5003                 *.*                    LISTEN

I see nothing being logued.

I tried removing port selection as in :

-A PREROUTING -i eth0 -d 1.1.2.3 -j DNAT --to-destination 172.16.190.143
-A FORWARD -i eth0 -o eth2 -d 172.16.190.143 -j ACCEPT

Still the same thing.

What am I missing ?


