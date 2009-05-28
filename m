From: "Barry A Rich" <barich@trisectrix.com>
Subject: Port Forwarding
Date: Thu, 28 May 2009 15:50:12 -0400
Message-ID: <002201c9dfcd$83cd7660$8b686320$@com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Our basic configuration load balances connections across two uplink modems.
The IP addressing looks like this:

                    |-------------| 192.168.4.1         192.168.4.2
        192.160.0.1 |        eth1 |-------------------------------- Modem 1
LAN ----------------| eth0        |
                    |        eth2 |-------------------------------- Modem 2
                    |-------------| 192.168.5.1         192.168.5.2


The basic setup for the load balancing is as follows:

iptables -A INPUT -i eth0 -s 192.168.0.0/24 -d 0.0.0.0/0 -j ACCEPT

iptables -A INPUT -i eth1 -s 192.168.4.0/24 -d 0.0.0.0/0 -j ACCEPT

iptables -A INPUT -i eth2 -s 192.168.5.0/24 -d 0.0.0.0/0 -j ACCEPT

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -o eth0 -s 192.168.4.1 -d 192.168.0.0/24 -j ACCEPT

iptables -A OUTPUT -o eth0 -s 192.168.5.1 -d 192.168.0.0/24 -j ACCEPT

iptables -A OUTPUT -o eth1 -s 192.168.4.1 -d 0.0.0.0/0 -j ACCEPT

iptables -A OUTPUT -o eth2 -s 192.168.5.1 -d 0.0.0.0/0 -j ACCEPT

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 192.168.4.1

iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 192.168.5.1

ip route add 192.168.4.2 dev eth1 table uplink1

ip route add default via 192.168.4.1 table uplink1

ip route add 192.168.5.2 dev eth1 table uplink2

ip route add default via 192.168.5.1 table uplink2

ip route add 192.168.4.2 dev eth1

ip route add 192.168.5.2 dev eth2

ip rule add from 192.168.4.1 table uplink1

ip rule add from 192.168.5.1 table uplink2

ip route add default scope global nexthop dev eth1 weight 1 nexthop dev eth2
weight 1

This is all working. Connections are balanced across the uplinks. It turns
out the modems have a TCP control port (5000). The port number cannot be
changed on the modems. I want LAN hosts to be able to connect to both modem
control ports. The port number can be changed on the host software, so I
assigned different ports on the LAN (5000 and 5001) and tried to redirect
the ports as follows:

iptables -t nat -A PREROUTING -p tcp -d 192.168.0.1 --dport 5000 -j DNAT
--to 192.168.4.2:5000

iptables -t nat -A PREROUTING -p tcp -d 192.168.0.1 --dport 5001 -j DNAT
--to 192.168.5.2:5000

It does not work and I'm not sure what's wrong. What is the correct way to
do this?

Thanks.


