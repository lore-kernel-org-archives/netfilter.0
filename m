From: "Marco Nicoloso" <nicolm@gmail.com>
Subject: Cannot go out the firewall
Date: Thu, 26 Oct 2006 13:23:30 +0400
Message-ID: <e8c943190610260223r232897fdi1aa4ed3e6d1a98b8@mail.gmail.com>
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

Hello,

I am trying to set up a firewall via iptables on a Debian Sarge with
kernel 2.6.8.

There are many problems because I have a DNS Server on a Windows
Machine in the internal network. For now I want to keep this
configuration because installing a DNS cache on my Linux server would
be very difficult for me.

Clients and DNS server cannot resolve any name.

Worse, Clients of the internal network cannot connect to any of the
ports specified in the script. I don't know what to do, I read many
many sample self-explained configurations and it seems to me that I
have done everything correctly but, actually, that's not true. I post
my script.

Help me, please.

Thanks in advance
M. Nicoloso

eth0 is the public IP interface
eth1 is the private LAN interface

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
# Accetta connessioni per client P2P
#iptables -A INPUT -i ppp0 -p tcp --dport 4662 -j ACCEPT
#iptables -A INPUT -i ppp0 -p tcp --dport 4668 -j ACCEPT
#iptables -A INPUT -i ppp0 -p udp --dport 18745 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 53 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 3128 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 25 -j ACCEPT
#iptables -A FORWARD -s 192.168.7.33 -j ACCEPT
#iptables -A OUTPUT -o eth0 -d pop.narod.ru -j ACCEPT
#iptables -A OUTPUT -o eth0 -d smtp.narod.ru -j ACCEPT

#Enabling some of the ICMP Packets
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
iptables -A INPUT -p icmp --icmp-type redirect -j ACCEPT
iptables -A INPUT -p icmp --icmp-type router-advertisement -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

#Forward
iptables -A laninet -d 0/0 -j ACCEPT
#iptables -A laninet -p tcp --dport 110 -j ACCEPT
#iptables -A laninet -p tcp --dport 25 -j ACCEPT
#iptables -A laninet -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A laninet -p tcp -j REJECT --reject-with tcp-reset

iptables -A inetlan -p tcp --sport 53 -j ACCEPT
iptables -A inetlan -p udp --sport 53 -j ACCEPT
iptables -A inetlan -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A inetlan -p tcp -j REJECT --reject-with tcp-reset

iptables -t nat -A POSTROUTING -o eth1 -s 192.168.7.0/24 -j SNAT --to
81.xx.xxx.xxx

