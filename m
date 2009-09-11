From: Diogo Sperb Schneider <diogo@kildare.ind.br>
Subject: Routing HTTP Through Another Link
Date: Fri, 11 Sep 2009 11:30:40 -0300
Message-ID: <3b71447d0909110730k71e340e2uec06d35c842fd73d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Greetings!

I gave up on that old web-based firewall and now I'm running plain
CentOS 4.8 with 3 ethernet adapters:

eth0 = LAN
eth1 = WAN
eth2 = ADSL

So I tried the following:

ip route add default via 189.30.16.65 dev eth1 table WAN # < 1 in
/etc/iproute2/rt_tables
ip route add default via 192.168.2.1 dev eth2 table ADSL # < 2 in
/etc/iproute2/rt_tables
ip rule add from all fwmark 1 table WAN
ip rule add from all fwmark 2 table ADSL
iptables -t mangle -I PREROUTING -i eth0 -p tcp --dport 80 -j MARK
--set-mark 2 # Tried with -I and -A with same effect

(Got those from the Linux Advanced Routing mini HOWTO)

Still, when I browse IP detection websites I get my WAN IP address.

Just for the record; My other relevant netfilter rules are:

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source
189.30.16.66 # <- my adapter's IP address
iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to-source
192.168.2.254 # <- my adapter's IP address
iptables -A FORWARD -i eth0 -p tcp --dport 80 -j ACCEPT # HTTP

Many thanks for reading!

Diogo
