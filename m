From: Fernando Martins <martinsfernand@gmail.com>
Subject: Scripting a firewall in front of a SMTP server
Date: Sun, 27 Nov 2005 17:28:52 +0100
Message-ID: <7834b9550511270828o50b7b429o@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I have a  firewall in front of an Exchange serveur. I can't receive
any mail from outside. It seems I have a problem with my script. When
I do a telnet on my server on port 25, from the outside, there is a
connection but this one is closed before I reach the HELO messages.
Moreover, when I try to connect friom the firewall to the SMTP server(
telnet 25)
I have more or less the message:
"
escape caracter is :^]
Connection closed by foreign host
"

My network is :

Internet
|
|
|
Firewall
|
|
SMTP

Internet-Firewall interface: eth0 ip adress xxx.yyy.zzz.ttt
corresponding to the MX

Firewall-SMTP=3D eth1

SMTP: 192.168.0.2


Any idea?
Here is the script:

#!/bin/sh
# script /etc/firewall.sh
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "Activation du forwarding :[OK]\n"
if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]
then
for filtre in /proc/sys/net/ipv4/conf/*/rp_filter
do
echo 1 > $filtre
done
fi

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

modprobe ip_tables
modprobe iptable_filter
modprobe iptable_nat

iptables -F
iptables -X

iptables -N LOG_DROP


iptables -A LOG_DROP -j LOG --log-prefix '[IPTABLES DROP] : '
iptables -A LOG_DROP -j DROP


iptables -N LOG_ACCEPT
iptables -A LOG_ACCEPT -j LOG --log-prefix '[IPTABLES ACCEPT] : '
iptables -A LOG_ACCEPT -j ACCEPT

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED -p tcp
--dport 80 -j ACCEPT

iptables -A INPUT -i eth0 -m state --state ESTABLISHED -p tcp --sport
80 -j ACCEPT

iptables -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED -p tcp
--dport 80 -j ACCEPT

iptables -A INPUT -i eth0 -m state --state ESTABLISHED -p tcp --sport
80 -j ACCEPT

iptables -t nat -A PREROUTING -d xxx.yyy.zzz.ttt -p tcp --dport 80 -j
DNAT --to-destination 192.168.0.2:80

iptables -t nat -A PREROUTING -d xxx.yyy.zzz.ttt -p tcp --dport 25 -j
DNAT --to-destination 192.168.0.2:25

iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -o eth1 -i eth0 -j ACCEPT

iptables -A FORWARD -i eth0 -o eth1 -p tcp --destination-port 80 -m
state --state NEW,ESTABLISHED -j ACCEPT

iptables -A FORWARD -o eth0 -i eth1 -p tcp --source-port 80 -m state
--state NEW,ESTABLISHED -j ACCEPT

iptables -A FORWARD -i eth0 -o eth1 -p tcp --destination-port 25 -m
state --state NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -o eth0 -i eth1 -p tcp --source-port 25 -m state
--state ESTABLISHED -j ACCEPT

iptables -A FORWARD -j LOG_DROP
iptables -A INPUT -j LOG_DROP
iptables -A OUTPUT -j LOG_DROP

