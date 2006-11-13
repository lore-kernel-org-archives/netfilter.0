From: "Marco Nicoloso" <nicolm@gmail.com>
Subject: Cannot go out the firewall from internal network (NAT)
Date: Mon, 13 Nov 2006 18:15:48 +0300
Message-ID: <e8c943190611130715g6d88ccabu4d87bc6ecf3826d9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi there,

I have already written before,  but still my firewall doesn''t work at
all (or, from another point of view, works too much!!!!). That is, I
resolved a big problem (my kernel did not load modules for nat and now
it does), but still there is another.

I want machines in my internal network resolve by themselves IP
addresses and can connect to some server (like SMTP and PPP belonging
to the ISP who is serving my company).

Both of my desires are not realised for now.

I post my configuration files and the output of command iptables.

Will you help me, please?

Thanks in advance.

Marco Nicoloso.

Configuration script
#!/bin/bash

## RESET DELLE REGOLE ##
iptables -F
iptables -t mangle -F
iptables -t nat -F
iptables -X
iptables -t mangle -X
iptables -t nat -X


## TABELLA FILTER ##

# Definizione criterio generale
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

#Creazione nuove catene

#Definizione catena int->ext
iptables -N laninet
#Definizione catena ext->int
iptables -N inetlan

#Forward delle catene
iptables -A FORWARD -i eth1 -o eth0 -j laninet
iptables -A FORWARD -i eth0 -o eth1 -j inetlan

# Frammenti e pacchetti non validi
iptables -A INPUT -f -j DROP
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A OUTPUT -f -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP

# Traffico di loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#Traffico rete interna
iptables -A INPUT -i eth1 -j ACCEPT
iptables -A OUTPUT -o eth1 -j ACCEPT

## TABELLA FILTER - INGRESSO ##
# Accetta pacchetti di connessioni esistenti
iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

#Drop di tutti pacchetti non facenti parte delle catene
iptables -A laninet -s ! 192.168.7.0/24 -j DROP
iptables -A inetlan -s 192.168.7.0/24 -j DROP


# Accettiamo il traffico in ingresso nelle porte del client
iptables -A INPUT -i eth0 -p udp --sport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 53 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 3128 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 25 -j ACCEPT

#Enabling some of the ICMP Packets
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
iptables -A INPUT -p icmp --icmp-type redirect -j ACCEPT
iptables -A INPUT -p icmp --icmp-type router-advertisement -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

#Forward from the internal network
iptables -A laninet -d 0/0 -j ACCEPT

#Forward from the internet
iptables -A inetlan -p tcp --sport 53 -j ACCEPT
iptables -A inetlan -p udp --sport 53 -j ACCEPT
iptables -A inetlan -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A inetlan -p tcp -j REJECT --reject-with tcp-reset

#Setting up NAT
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.7.0/24 -j SNAT --to
81.22.222.236

Output of common instances of iptables.

#iptables -vnL

Chain INPUT (policy DROP 32 packets, 3605 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  -f  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
16791  729K ACCEPT     all  --  eth1   *       0.0.0.0/0            0.0.0.0/0
33506   46M ACCEPT     all  --  eth0   *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           udp spt:53
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp spt:53
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:3128
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:80
    1    48 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:22
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:25
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:25
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 3
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 4
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 11
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 12
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 5
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 9
    2   122 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 8
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
  341 22672 laninet    all  --  eth1   eth0    0.0.0.0/0            0.0.0.0/0
    0     0 inetlan    all  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  -f  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID
    0     0 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0
31529   46M ACCEPT     all  --  *      eth1    0.0.0.0/0            0.0.0.0/0
22566 1409K ACCEPT     all  --  *      eth0    0.0.0.0/0
0.0.0.0/0           state NEW,RELATED,ESTABLISHED

Chain inetlan (1 references)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  --  *      *       192.168.7.0/24       0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp spt:53
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0           udp spt:53
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 REJECT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           reject-with tcp-reset

Chain laninet (1 references)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  --  *      *      !192.168.7.0/24       0.0.0.0/0
  341 22672 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0

#iptables -vnL -t nat

Chain PREROUTING (policy ACCEPT 263K packets, 22M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 195K packets, 11M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 SNAT       all  --  *      eth1    192.168.7.0/24
0.0.0.0/0           to:81.22.222.236

Chain OUTPUT (policy ACCEPT 186K packets, 11M bytes)
 pkts bytes target     prot opt in     out     source               destination

#iptables -vnL -t mangle

Chain PREROUTING (policy ACCEPT 4253K packets, 2003M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain INPUT (policy ACCEPT 4157K packets, 1996M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 25604 packets, 1239K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 4708K packets, 2448M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 4733K packets, 2449M bytes)
 pkts bytes target     prot opt in     out     source               destination

