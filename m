From: stephane durieux <durieux42@yahoo.fr>
Subject: speed connection problem
Date: Mon, 26 Jul 2004 16:47:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41051990.9070208@yahoo.fr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everybody,

I am a newbie using netfilter
So I am connected to internet through ppp0 (ADSL)
I have no servers running. But, I have tried to make customs rules for 
each used protocols (smtp, pop3, dns, http, https, imap, ftp active and 
passive) in input and output.
i have also to drop some Xmas packets and spoofing packets ( private 
netwoaks range) .
So i have 40 rules listed (see below)

I have seen a big decrease of my speed connection using the firewall. 
Nevertheless, the computer is an AMD athlon XP 1800+

How can I solve this problem. Is it due to my heavy configuration ?
I am afraid it will be worse if I install DMZ servers (http, ftp, 
postfix, dns)

Have you got any suggestion ?

Thanks a lot.


Here is my (heavy) configuration


#!/bin/bash

case $1 in
        start)


##########################          REMISE A 0 DES CHAINES

iptables -F FORWARD
iptables -F OUTPUT
iptables -F INPUT
iptables -F syn-flood
iptables -X syn-flood


##########################           FLUX ENTRANT

#        ANTI SPOOFING
iptables -t filter -A INPUT -i ppp0 -p tcp -s 224.0.0.0/4 -j DROP
iptables -t filter -A INPUT -i ppp0 -p tcp -s 192.168.0.0/16 -j DROP
iptables -t filter -A INPUT -i ppp0 -p tcp -s 172.16.0.0/12 -j DROP
iptables -t filter -A INPUT -i ppp0 -p tcp -s 10.0.0.0/8 -j DROP
iptables -t filter -A INPUT -i ppp0 -p tcp -s 127.0.0.1/8 -j DROP

iptables -t filter -A INPUT -i ppp0 -p udp -s 224.0.0.0/4 -j DROP
iptables -t filter -A INPUT -i ppp0 -p udp -s 192.168.0.0/16 -j DROP
iptables -t filter -A INPUT -i ppp0 -p udp -s 172.16.0.0/12 -j DROP
iptables -t filter -A INPUT -i ppp0 -p udp -s 10.0.0.0/8 -j DROP
iptables -t filter -A INPUT -i ppp0 -p udp -s 127.0.0.1/8 -j DROP


#        SYN FLOODING
iptables -N syn-flood
iptables -A INPUT -i ppp0 -p tcp -j syn-flood
iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
iptables -A syn-flood -j LOG --log-prefix "SYN FLOOD"
iptables -A syn-flood -j DROP

#        VERIF NOUVELLES CONNECTIONS ENTRANTES =SYN
iptables -t filter -A INPUT -i ppp0 -p tcp ! --syn -m state --state NEW 
-j DROP

#        ANTI Xmas packets
iptables -t filter -A INPUT -i ppp0 -p tcp --tcp-flags ALL ALL -j DROP
iptables -t filter -A INPUT -i ppp0 -p tcp --tcp-flags ALL NONE -j DROP

#         DNS
iptables -t filter -A INPUT  -i ppp0 -p udp --source-port 53 -m state 
--state ESTABLISHED -j ACCEPT

#         HTTP
iptables -t filter -A INPUT  -i ppp0 -p tcp --source-port 80 -m state 
--state ESTABLISHED -j ACCEPT

#         HTTPS
iptables -t filter -A INPUT  -i ppp0 -p tcp --source-port 443 -m state 
--state ESTABLISHED -j ACCEPT

#         ICMP

iptables -t filter -A INPUT -i ppp0 -p icmp --icmp-type echo-reply -j ACCEPT
iptables -t filter -A INPUT -i ppp0 -p icmp --icmp-type 
destination-unreachable -j ACCEPT
iptables -t filter -A INPUT -i ppp0 -p icmp --icmp-type time-exceeded -j 
ACCEPT
iptables -t filter -A INPUT -i ppp0 -p icmp --icmp-type source-quench -j 
ACCEPT

#         FTP
# port commande
iptables -t filter -A INPUT -i ppp0 -p tcp --source-port 21 
--destination-port 1024: -m state --state ESTABLISHED -j ACCEPT
# mode actif : port data
iptables -t filter -A INPUT -i ppp0 -p tcp --source-port 20: 
--destination-port 1024: -m state --state RELATED,ESTABLISHED -j ACCEPT
# mode passif : port data
iptables -t filter -A INPUT -i ppp0 -p tcp --source-port 1024: 
--destination-port 1024: -m state --state ESTABLISHED -j ACCEPT

#          SMTP
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 25 -m state --state NEW,ESTABLISHED  -j ACCEPT

#          POP 3
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 110 -m state --state NEW,ESTABLISHED  -j ACCEPT

#          IMAP
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 143 -m state --state NEW,ESTABLISHED  -j ACCEPT


iptables -t filter -A INPUT  -j DROP





##########################         FLUX SORTANT


#          DNS
iptables -t filter -A  OUTPUT -o ppp0 -p udp --source-port 1024: 
--destination-port 53 -m state --state NEW,ESTABLISHED -j ACCEPT

#          HTTP
iptables -t filter -A  OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 80 -m state --state NEW,ESTABLISHED -j ACCEPT

#          HTTPS
iptables -t filter -A  OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 443 -m state --state NEW,ESTABLISHED -j ACCEPT

#          ICMP

iptables -t filter -A OUTPUT -o ppp0 -p icmp --icmp-type echo-request -j 
ACCEPT

#          FTP
# port commande
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 21 -j ACCEPT
# mode actif : port data
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 20 -m state --state ESTABLISHED -j ACCEPT
# mode passif : port data
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 1024: -m state --state RELATED,ESTABLISHED  -j ACCEPT

#          SMTP
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 25 -m state --state NEW,ESTABLISHED  -j ACCEPT

#          POP 3
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 110 -m state --state NEW,ESTABLISHED  -j ACCEPT

#          IMAP
iptables -t filter -A OUTPUT -o ppp0 -p tcp --source-port 1024: 
--destination-port 143 -m state --state NEW,ESTABLISHED  -j ACCEPT


iptables -t filter -A OUTPUT -j DROP


                ;;



                stop)

iptables -t filter -F INPUT



