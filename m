From: "Brent Clark" <bclark@eccotours.biz>
Subject: RE: speed connection problem
Date: Mon, 26 Jul 2004 15:06:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HAEOIFPIBBBLGLHOMLLIGEJKCFAA.bclark@eccotours.biz>
References: <41051990.9070208@yahoo.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0004_01C47322.21D201F0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41051990.9070208@yahoo.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: stephane durieux <durieux42@yahoo.fr>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0004_01C47322.21D201F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

Im also new to iptables and I think you are confusing the input and output
rules with the forward rule (I very much made that mistake). In your FW
rulset you are declaring that you have a imap, ftp, dns, etc literally
running on your box.
You need to use the forward rule to handle this for you.
I too have a adsl connection, and I dont have any performance loss and the
box I run iptables on is an
old pentium 100.

I have attached my current ruleset for your viewing. Please remember that im
also new to iptables soo it might not be
all that secure.

Kind Regards
Brent Clark

P.s. You may want to look at the default policy of DROP on all the chains


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of stephane
durieux
Sent: Monday, July 26, 2004 4:48 PM
To: netfilter@lists.netfilter.org
Subject: speed connection problem


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




------=_NextPart_000_0004_01C47322.21D201F0
Content-Type: application/octet-stream;
	name="IP_FW_RULES"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="IP_FW_RULES"

#/bin/sh=0A=
=0A=
IPT=3D/sbin/iptables=0A=
=0A=
# Rules for gateway=0A=
=0A=
#Clear \ Flush all the rules from the different chains and tables=0A=
=0A=
$IPT --flush=0A=
$IPT --flush INPUT		#Flush the INPUT chain=0A=
$IPT --flush OUTPUT		#Flush the OUTPUT chain=0A=
$IPT --flush FORWARD		#Flush the FORWARD chain=0A=
$IPT -t nat --flush		#Flush the nat table=0A=
$IPT -t mangle --flush	#Flush the mangle table=0A=
$IPT --delete-chain		#Delete any pre-existing chains =0A=
$IPT -t nat --delete-chain	#Delete any pre-existing chains from nat table=0A=
$IPT -t mangle --delete-chain	#Delete any pre-existing chains from the =
mangle table=0A=
=0A=
#Setting the default Policies for the chains=0A=
$IPT --policy INPUT DROP	#Setting the default policy for INPUT chain=0A=
$IPT --policy FORWARD DROP	#Setting the default plicy for FORWARD chain=0A=
$IPT --policy OUTPUT DROP	#Setting the default policy for the OUTPUT =
chain=0A=
=0A=
#Create new chain=0A=
$IPT -N LOG_DROP		#Create new chain=0A=
$IPT -N LOG_ACCEPT		#Create new chain=0A=
=0A=
#Accepting traffic for and to internal interface=0A=
$IPT -A INPUT -i lo -j ACCEPT		#Allowing unlimited loopback traffic=0A=
$IPT -A OUTPUT -o lo -j ACCEPT	#Allowing unlimited loopback traffic=0A=
=0A=
###########################################################=0A=
#Stealth Scans and TCP state flags=0A=
#=0A=
# All of the bits are cleared=0A=
#/sbin/iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP=0A=
=0A=
# SYN and FIN are both set=0A=
#/sbin/iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP=0A=
=0A=
# SYN and RST are both set=0A=
#/sbin/iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP=0A=
=0A=
# FIN and RST are both set=0A=
#/sbin/iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP=0A=
=0A=
# FIN is the only bit set, without the expected accompanying ACK=0A=
#/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP=0A=
=0A=
# PSH is the only bit set, without the expected accompanying ACK=0A=
#/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP=0A=
=0A=
# URG is the only bit set, without the expected accompanying ACK=0A=
#/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP=0A=
=0A=
###########################################################=0A=
# Using Connection State to By-Pass checking=0A=
# Creating the rules=0A=
=0A=
$IPT -t nat -A POSTROUTING -o eth0 -s 192.168.111.0/24 -j MASQUERADE=0A=
=0A=
$IPT -t filter -A FORWARD -m state --state INVALID -j LOG --log-prefix =
"INVALID forward: "=0A=
$IPT -t filter -A FORWARD -m state --state INVALID -j DROP=0A=
$IPT -t filter -A FORWARD -i eth0 -o eth1 -m state --state =
ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -t filter -A FORWARD -i eth1 -o eth0 -m state --state =
NEW,ESTABLISHED,RELATED -j ACCEPT=0A=
=0A=
$IPT -t filter -A INPUT -m state --state INVALID -j LOG --log-prefix =
"INVALID input: "=0A=
$IPT -t filter -A INPUT -m state --state INVALID -j DROP=0A=
$IPT -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -t filter -A INPUT -i eth1 -p tcp --dport 22 -m state --state =
NEW,ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -t filter -A INPUT -i eth1 -p udp --dport 53 -m state --state =
NEW,ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -t filter -A INPUT -i eth1 -p tcp --dport 53 -m state --state =
NEW,ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -t filter -A INPUT -i eth1 -p tcp --dport 80 -m state --state =
NEW,ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -t filter -A INPUT -p tcp --dport 113 -m state --state =
NEW,ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -t filter -A INPUT -j LOG --log-prefix "[INPUT  DROP]: " =
--log-tcp-options --log-ip-options=0A=
$IPT -t filter -A INPUT -j DROP=0A=
=0A=
$IPT -t filter -A OUTPUT -m state --state INVALID -j LOG --log-prefix =
"INVALID output: "=0A=
$IPT -t filter -A OUTPUT -m state --state INVALID -j DROP=0A=
$IPT -t filter -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -t filter -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j =
ACCEPT=0A=
#$IPT -t filter -A OUTPUT -o eth0 -j ACCEPT=0A=
$IPT -t filter -A OUTPUT -j LOG --log-prefix "[OUTPUT DROP]: " =
--log-tcp-options --log-ip-options=0A=
$IPT -t filter -A OUTPUT -j DROP=0A=
=0A=
=0A=
#############################################################=0A=
# Allowing me to ping from here and dealing in ICMP packets=0A=
$IPT -t filter -A INPUT -p icmp --icmp-type source-quench -j ACCEPT=0A=
$IPT -t filter -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT=0A=
$IPT -t filter -A INPUT -p icmp --icmp-type destination-unreachable -j =
ACCEPT=0A=
$IPT -t filter -A INPUT -i eth0 -p icmp --icmp-type time-exceeded -j =
ACCEPT=0A=
$IPT -t filter -A INPUT -i eth0 -p icmp --icmp-type ! echo-request -j LOG=0A=
=0A=
############################################################=0A=
# Create some logging=0A=
#$IPT -t filter -A INPUT -j LOG_DROP=0A=
#$IPT -t filter -A OUTPUT -j LOG_DROP=0A=
#$IPT -t filter -A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP]: " =
--log-tcp-options --log-ip-options=0A=
#$IPT -t filter -A LOG_DROP -j DROP=0A=
#$IPT -t filter -A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT]: " =
--log-tcp-options --log-ip-options=0A=
#$IPT -t filter -A LOG_ACCEPT -j ACCEPT=0A=
=0A=
echo 1 > /proc/sys/net/ipv4/ip_dynaddr			#=0A=
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians	#Enable logging for =
malformed Ip Address=0A=
echo 1 > /proc/sys/net/ipv4/ip_forward=0A=
echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp=0A=
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter=0A=
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts=0A=
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route=0A=
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects=0A=

------=_NextPart_000_0004_01C47322.21D201F0--


