From: =?koi8-u?b?4czFy9PBzsTS?= <sss123next@list.ru>
Subject: How to send pat of traffic through local gateway
Date: Fri, 5 Jun 2009 22:57:53 +0300
Message-ID: <200906052257.53938.sss123next@list.ru>
References: <4A28ED08.3090104@gulfsat.mg> <1244201352.4724.17.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1244201352.4724.17.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

i trying to change gateway for jabber s2s traffic, but have problems with it, my 
provider make forwarding for 5269 port to\from my machine, and incomming traffic 
come to me right, i asking about how i can use this local gateway on eth0 
interface instead of my default gateway on ppp0 interface.

this what i have tryed:

iptables -t mangle -A PREROUTING -p tcp --dport 5269 -j CONNMARK --restore-
mark
iptables -t mangle -A PREROUTING -p tcp --dport 5269 -j MARK --set-mark 1      
iptables -t mangle -A OUTPUT -p tcp --dport 5269 -j MARK --set-mark 1          
iptables -t mangle -A POSTROUTING -p tcp --dport 5269 -j CONNMARK --save-mark  

and for routing:

ip rule add from all fwmark 1 table viks_gw
ip route add default via 172.18.0.1 dev eth0 table viks_gw

after this, test it with tcptraceroute

tcptraceroute -i eth0 -s 172.18.13.13(my local ip which is necessary to be 
172.18.13.13) jabber.ru 5269

this works.

but traffic from ejabberd generated with interface ppp0 and its own ip, not my 
local ip, can i somehow modify this packets (like SNAT), ot i need to do 
something with ip route ?

thx in advance.
