From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: load balanced between tunnel VPN and an Normal Link Internet
Date: Sun, 10 Apr 2011 15:55:53 -0300
Message-ID: <BANLkTimW+nay6YkXxWnHtP6GKv6Eopac7w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

disregard my previous menssage because it's was without subject

Hello everyone, I'm new in this maillist and I would like receive help
about my problem......


I have a Firewall ( with fwbuider - Red-Hat 5.6 ) in my branch office
connected to my head office by openvpn. I'm with a problem when flow
data is to destination port 80 from my branch office to my head
office.

in my branch office firewall has 3 device Ethernet:

eth0 - inside network 192.100.100.0/24
eth1 - wan 1 VPN
eth2 - wan 2 only for Internet Traffic

I'm marking all traffic for port 80 go out upon wan 2 - eth2. but,
it's a problem because when an user tries access an service at the
port 80 in my head office it isen't work!

the firewall toward to eth2 insted to VPN the traffic from inside
network to my head office when destinatio is port 80.  I've try solve
this with rule below but it isen't work.occur the same problem.

my head office inside network is 128.2.0.0/16 where I have my web
servers at the port 80.

rules created in firewall branch office

/sbin/iptables -t mangle -A PREROUTING -s 0/0 -d ! 128.2.0.0/16 -p tcp
--dport 80 -j MARK --set-mark 1
ip rule del fwmark 1
ip route flush table internet
ip rule add fwmark 1 table internet prio 20
ip route add default via 200.108.139.1 table internet ( it's eth2 )
ip route flush cache

part from my route main table

128.2.0.0       192.168.200.101 255.255.0.0     UG    0      0        0 tun0
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth3
0.0.0.0         190.128.173.97  0.0.0.0         UG    0      0
0 eth1 > where is my VPN


any Tip ?? I wish that packages from inside networ 192.100.100.0/24 to
128.2.0.0/16 port 80 go out for tun0 insted by eth2
