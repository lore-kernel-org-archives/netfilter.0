From: Jose Julian Buda <jbuda@noticiasargentinas.com>
Subject: DNAT / SNAT and two ISP Links
Date: Mon, 02 Sep 2013 12:16:55 -0300
Message-ID: <5224ABE7.3080202@noticiasargentinas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi, i have 2 ISP links and a linux box with 2 eth

ETH0 =  192.168.2.1   ( to DMZ )
ETH3 =  IP_ISP_1
         IP_ISP_2

ETH3 has configurated with 2 IP.

IP_ISP_1 is the default gw.

When i connect from internet to IP_ISP_1 it work fine with :

iptables -t nat -A PREROUTING -d IP_ISP_1/32 -p tcp -m tcp -m  multiport 
--dports 1090,1091,443,80,25,110,143,21,20 -j DNAT --to-destination 
192.168.2.2

but this fail

iptables -t nat -A PREROUTING -d IP_ISP_2/32 -p tcp -m tcp -m  multiport 
--dports 1090,1091,443,80,25,110,143,21,20 -j DNAT --to-destination 
192.168.2.2


As i know(many tutorials talk about this issue) and i can see via 
tcpdump -e, the default gw take control of the returning packets, and 
it's wrong.

Then i use the "iptables's packet mark" on the mangle table

iptables -A PREROUTING -t mangle -j CONNMARK --restore-mark
iptables -A PREROUTING -t mangle --match mark --mark 2 -j ACCEPT
iptables -A PREROUTING -t mangle -d IP_ISP_2 -j MARK --set-mark 2
iptables -A PREROUTING -t mangle -j CONNMARK --save-mark

and the packet are marked as i can see with

watch -n 1 iptables -L -v -t mangle

then with

ip route add NET_ISP_2/29 dev eth3 table FILTRO
ip route add default via GW_ISP_2 dev eth3 table FILTRO
ip rule add fwmark 2 table FILTRO prio 1000

I setup the right rules for the FILTRO table.

then

ip route flush cache

and nothing get better, the only way that the IP_ISP_2 work is setting 
up GW_ISP_2 as fefault gw.

do i missed something?

What else do i need to make ISP2 work for incoming connections?leaving 
ISP1 as default gw of course.

Is there a problem with eth3 and 2 IP configurated?

This problem came up when the ISP change my IPS public address, both 
two, before this, everithing work fine. I cleaned up the firewall rules 
with the new ips.

I know that is an old well know issue, but i am stuck here

Thank you in advance

Julian















