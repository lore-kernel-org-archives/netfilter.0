From: "Guillermo Javier Nardoni" <gjnardoni@yahoo.com.ar>
Subject: iptables script and ports to access intranet from internet..
Date: Wed, 15 Dec 2004 05:15:02 -0300
Message-ID: <006601c4e27e$2d75fb80$0400a8c0@beta03>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter users list <netfilter@lists.netfilter.org>

Hello i have a script wich allows me to route and make NAt over my =
intranet, but i'm trying to acces from internet (outside the =
business-room) but i can't access.

port 80 is the problem.,
when i try to access port 21 (ftp) it access right.

could you help0 me please?

i send it to the userlist to see what's the problem.

thanks a lot.
Guillermo from Argentina.


RC.NAT

#! /bin/bash

IF_INET=3D"ppp0"

IF_LAN=3D"eth1"

IF_LAN_NET=3D"192.168.0.0/255"

IF_WLAN=3D"ppp0"



# (SMB) (NFS) (X11)

#BAD_TCP=3D"135:139 1433 2049 5999:6063"

BAD_TCP=3D""

#BAD_UDP=3D"135:139 1433 2049 5999:6063"

BAD_UDP=3D""



case "$1" in

start)

echo "Cleaning up..."

echo 0 > /proc/sys/net/ipv4/ip_forward

iptables -F

iptables -t nat -F

iptables -t mangle -F

echo -n "Determinating IP-Address of Internet Interface... "

IF_INET_IP=3D"`ifconfig $IF_INET | grep 'inet addr' | awk '{print $2}' | =
sed -e 's/.*://'`"

echo $IF_INET_IP

echo "Creating IPTABLES rules:"

echo " Masquerading..."

iptables -t nat -A POSTROUTING -o $IF_INET -j MASQUERADE

echo " Protecting well-known ports..."

# for i in $BAD_TCP; do

# iptables -A INPUT -p tcp --dport $i -j DROP

# iptables -A INPUT -p tcp --sport $i -j DROP

# iptables -A OUTPUT -p tcp --dport $i -j DROP

# iptables -A OUTPUT -p tcp --sport $i -j DROP

# iptables -A FORWARD -p tcp --dport $i -j DROP

# iptables -A FORWARD -p tcp --sport $i -j DROP

# done

# for i in $BAD_UDP; do

# iptables -A INPUT -p udp --dport $i -j DROP

# iptables -A INPUT -p udp --sport $i -j DROP

# iptables -A OUTPUT -p udp --dport $i -j DROP

# iptables -A OUTPUT -p udp --sport $i -j DROP

# iptables -A FORWARD -p udp --dport $i -j DROP

# iptables -A FORWARD -p udp --sport $i -j DROP

# done



iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port =
3128

iptables -t nat -A POSTROUTING -p TCP -s 0/0 --dport 21 -j MASQUERADE=20

iptables -t nat -A POSTROUTING -p TCP -d 0/0 --dport 20 -j MASQUERADE=20

iptables -t nat -A POSTROUTING -p TCP --dport 25 -j MASQUERADE=20

iptables -t nat -A POSTROUTING -p TCP --dport 110 -j MASQUERADE

iptables -t nat -A POSTROUTING -p TCP --dport 22 -j MASQUERADE=20

iptables -t nat -A POSTROUTING -p TCP --dport 23 -j MASQUERADE=20



echo " Rules for ICMP..."

# 0: echo reply

# 3: destination unreachable

# 4: source quench

# 5: redirect

# 8: echo request

# 9: router advertisement

# 10: router solicitation

# 11: time exceeded

# 12: parameter-problem

# 13: timestamp request

# 14: timestamp reply

# 15: information request

# 16: information reply

# 17: address mask request

# 18: address mask reply

iptables -A INPUT -p icmp --icmp-type 0 -j ACCEPT

iptables -A INPUT -p icmp --icmp-type 3 -j ACCEPT

iptables -A INPUT -p icmp --icmp-type 4 -j ACCEPT

iptables -A INPUT -p icmp --icmp-type 11 -j ACCEPT

iptables -A INPUT -p icmp --icmp-type 12 -j ACCEPT

iptables -A INPUT -p icmp --icmp-type 14 -j ACCEPT

iptables -A INPUT -p icmp --icmp-type 16 -j ACCEPT

iptables -A INPUT -p icmp --icmp-type 18 -j ACCEPT

iptables -A INPUT -p icmp -j LOG -m limit --log-prefix "FILTER =
ICMP-BAD-TYPE-IN:"

iptables -A INPUT -p icmp -j DROP

iptables -A OUTPUT -p icmp --icmp-type 4 -j ACCEPT

iptables -A OUTPUT -p icmp --icmp-type 8 -j ACCEPT

iptables -A OUTPUT -p icmp --icmp-type 12 -j ACCEPT

iptables -A OUTPUT -p icmp --icmp-type 13 -j ACCEPT

iptables -A OUTPUT -p icmp --icmp-type 15 -j ACCEPT

iptables -A OUTPUT -p icmp --icmp-type 17 -j ACCEPT

iptables -A OUTPUT -p icmp -j LOG -m limit --log-prefix "FILTER =
ICMP-BAD-TYPE-OUT:"

iptables -A OUTPUT -p icmp -j DROP

iptables -A FORWARD -p icmp -j ACCEPT

echo " Stateful inspection..."

iptables -A INPUT -m state --state ESTABLISHED,RELATED -i $IF_INET -j =
ACCEPT

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -i $IF_INET -j =
ACCEPT

echo " Rules for Loopback Interface..."

iptables -A INPUT -i lo -j ACCEPT

iptables -A OUTPUT -o lo -j ACCEPT


echo " Rules for local LAN..."

iptables -A INPUT -i $IF_LAN -j ACCEPT

iptables -A FORWARD -i $IF_LAN -j ACCEPT

echo " Rules for local WLAN..."

iptables -A INPUT -p tcp --dport 53 -i $IF_WLAN -j ACCEPT

iptables -A INPUT -p udp --dport 53 -i $IF_WLAN -j ACCEPT

iptables -A INPUT -p tcp --dport 67 -i $IF_WLAN -j ACCEPT

iptables -A INPUT -p udp --dport 67 -i $IF_WLAN -j ACCEPT

#iptables -A INPUT -p tcp --dport 80 -i $IF_WLAN -j AACEPT

iptables -A INPUT -p tcp --destination-port 8080 -i ppp0 -j ACCEPT

iptables -A INPUT -i ppp0 -j ACCEPT


iptables -A FORWARD -p tcp --dport 22 -i $IF_WLAN -j ACCEPT

iptables -A FORWARD -p tcp --dport 80 -i $IF_WLAN -j ACCEPT

iptables -A FORWARD -d ! $IF_LAN_NET -i $IF_WLAN -j ACCEPT

echo " Local public services (all interfaces):"

echo " SSH..."

iptables -A INPUT -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -p tcp --dport 21 -j ACCEPT

iptables -A INPUT -p tcp --dport 23 -j ACCEPT

iptables -A INPUT -p tcp --dport 80 -j ACCEPT


#echo " Forwarding:"

#echo " SSH..."

#iptables -A FORWARD -p tcp -d 192.168.0.100 --dport 22 -j ACCEPT

#iptables -t nat -A PREROUTING -i $IF_INET -p tcp -d $IF_INET_IP --dport =
2222 -j DNAT --to 192.168.0.100:22

echo " Logging & Dropping..."

iptables -A INPUT -p tcp -j LOG -m limit --log-prefix "FILTER =
TCP-BAD-IN:"

iptables -A INPUT -p tcp -j DROP

iptables -A INPUT -p udp -j LOG -m limit --log-prefix "FILTER =
UDP-BAD-IN:"

iptables -A INPUT -p udp -j DROP

iptables -A INPUT -j LOG -m limit --log-prefix "FILTER UNKNOWN-BAD-IN:"

iptables -A INPUT -j DROP

iptables -A FORWARD -p tcp -j LOG -m limit --log-prefix "FILTER =
TCP-BAD-FWD:"

iptables -A FORWARD -p tcp -j DROP

iptables -A FORWARD -p udp -j LOG -m limit --log-prefix "FILTER =
UDP-BAD-FWD:"

iptables -A FORWARD -p udp -j DROP

iptables -A FORWARD -j LOG -m limit --log-prefix "FILTER =
UNKNOWN-BAD-FWD:"

iptables -A FORWARD -j DROP

iptables -P INPUT ACCEPT

echo "Setting up spoofing protection..."

for i in /proc/sys/net/ipv4/conf/*/rp_filter; do

echo 1 > $i

done


# disable source routed packets

echo "Disabling source routed packets..."

for i in /proc/sys/net/ipv4/conf/*/accept_source_route; do

echo 0 > $i

done

echo "Setting default policy..."

#iptables -P INPUT DROP

#iptables -P INPUT ACCEPT

#iptables -P FORWARD ACCEPT

iptables -P OUTPUT ACCEPT

iptables -P FORWARD DROP

echo "Starting up routing..."

echo 1 > /proc/sys/net/ipv4/ip_forward

;;

stop)

echo "Shutting down routing..."

echo 0 > /proc/sys/net/ipv4/ip_forward

iptables -P INPUT ACCEPT

iptables -P OUTPUT ACCEPT

iptables -F

iptables -t nat -F

iptables -t mangle -F

;;

*)

echo "Usage: ./filter {start|stop}"

exit 1

;;

esac

exit 0






