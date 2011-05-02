From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Cache Route Iproute2
Date: Mon, 2 May 2011 18:44:56 -0300
Message-ID: <BANLkTinzYqaO0=Q8PM5KBmwE4sFMEgCyPw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello everyone, I'm a problem with cache iproute2. I have two
firewalls ( FwBuillder 4.1.0 ) connected each other by OpenVpn.

I have some web servers in my head office local network which have ip
128.2.0.0/16 ( strange but my head office local network has an range
valid IP ).

In my branch office I have two connections with Internet which one is
dedicated to OpenVpn and other is to users access Inetrnet.

my branch office users need access my web servers in my head office by
OpenVpn...so I've created , in my branch office firewall, an route
table call "internet" to forward data flow by my second Internet
Link.in others words, when flow data is different of 128.2.0.0/16 port
80 it must out by Inetrnet second link and when it is to network
128.2.0.0/16 it must out by vpn link

follow my scripts:

#!/bin/sh

echo -n "unable rp_filter..."
for eee in /proc/sys/net/ipv4/conf/*/rp_filter; do
echo 0 > $eee
done
cat /proc/sys/net/ipv4/conf/*/rp_filter
echo " [OK]"

## tag out by Internet second link
/sbin/iptables -t mangle -A PREROUTING -i eth0 -s 192.100.100.0/24 -d
! 128.2.0.0/16 -p tcp --dport 80 -j MARK --set-mark 1
/sbin/iptables -t mangle -A PREROUTING -i eth0 -s 192.100.100.0/24 -d
! 128.2.0.0/16 -p tcp --dport 443 -j MARK --set-mark 1


ip rule del fwmark 1

ip route flush table internet

ip rule add fwmark 1 table internet prio 20

ip route add default via 200.108.139.1 table internet  >> MY SECOND
INTERNET LINK. ONLY INTERNET ACCESS USERS

ip route flush cache

the problem is sometime my data flow destination 128.2.0.0/16 port 80
it's be forward by gateway 200.108.139.1 ( route table internet )
instead go out by my main route table where is my openvpn routes!!


seems that is occurring routing cache in iproute2 because when I run
the command " ip route flush table internet " all it's work...
the data flow to network 128.2.0.0 port 80 go out by my main route
table where is my openvpn routes.


why it's sometimes occur of the data flow to 128.2.0.0/16 port 80 be
forward by table internet instead be handled by my main route table??

any tip??




thank!!
