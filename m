From: g38@rdsbv.ro
Subject: (no subject)
Date: Sat, 08 Jun 2002 12:31:58 +00300 (EEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023528718.3d01cf0e162e2@mail.rdsbv.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; q="1.0"
To: netfilter@lists.samba.org

This being my first firewall, I would like those of you who are more experienced and have the time to take a look and point the mistakes I did (and perhaps some improvements would be appreciated)

The box is intended to act as a www and mail server and to masquerade an internal network with private ip's

The rules I'm not sure of are commented (and I have some questions for the masquerade, but I'll RTFM on this one - still I must ask if I did the masq rules correctly in the firewall below)

thanks a lot,
petre


#!/bin/sh

IPEXT="193.xxx.xxx.xxx"
IPT="/usr/sbin/iptables"


echo "Cleaning ..."
for i in filter nat mangle
do
$IPT -t $i -F
$IPT -t $i -X
done

echo "Initial rules ..."
$IPT -P INPUT ACCEPT
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD DROP

#loopback
$IPT -A INPUT -i lo -p all -j ACCEPT
$IPT -A OUTPUT -o lo -p all -j ACCEPT

echo -e "\nMASQUERADING ...\n"
echo "Masquerading 192.168.20.0/24"
# set up masquerading for everything not destined to the localnets
$IPT -t nat -A POSTROUTING -s  192.168.20.0/24 -o eth1 -j MASQUERADE
$IPT -t nat -A POSTROUTING -d  192.168.20.0/24 -o eth1 -j MASQUERADE

$IPT -A FORWARD -s 192.168.20.0/24 -j ACCEPT
$IPT -A FORWARD -d 192.168.20.0/24 -j ACCEPT


#echo "FWD: Allow all connections OUT and only existing and related ones IN"
#$IPT -A FORWARD -i eth0 -s 192.168.20.0/24 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
#$IPT -A FORWARD -i eth1 -o eth0 -d 192.168.20.0/24 -j ACCEPT
#$IPT -A FORWARD -i eth0 -s 192.168.10.5 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
#$IPT -A FORWARD -i eth1 -o eth0 -d 192.168.10.5 -j ACCEPT
$IPT -A FORWARD -j LOG
$IPT -A FORWARD -j DROP

echo -e "- Enabling SNAT (MASQUERADE) funtionality on eth0"
$IPT -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo -e "\nDone.\n"

###

echo "no snmpd access from the exterior"
$IPT -A INPUT -p udp -s 0/0 --dport 161 -j DROP

#cut all which appears to be loopback talking to eth's
$IPT -A INPUT -p all -s localhost  -i eth+ -j DROP

#cut all syn's except those for incoming http & ssh & smtp & pop3
#$IPT -A INPUT -i eth0 -p tcp --syn --destination-port 80 -j ACCEPT
#$IPT -A INPUT -i eth0 -p tcp --syn --destination-port 22 -j ACCEPT
#$IPT -A INPUT -i eth0 -p tcp --syn --destination-port 25 -j ACCEPT
#$IPT -A INPUT -i eth0 -p tcp --syn --destination-port 110 -j ACCEPT
#$IPT -A INPUT -p tcp --tcp-flags ALL SYN -j DROP

echo "Syn flood protection..."
$IPT -N DoS
$IPT -A INPUT -j DoS
$IPT -A DoS -p icmp --icmp-type echo-request \
        -m limit --limit 10/s -j RETURN
$IPT -A DoS -p icmp --icmp-type echo-request \
        -m limit -j LOG --log-level warn \
                --log-prefix "DoS (PING)" \
                --log-tcp-options \
                --log-ip-options
$IPT -A DoS -p icmp --icmp-type echo-request -j REJECT

#cut access from private addresses to eth1
$IPT -A INPUT -i eth0 -s 10.0.0.0/8 -j DROP
$IPT -A INPUT -i eth0 -s 172.16.0.0/12 -j DROP
$IPT -A INPUT -i eth0 -s 192.168.0.0/16 -j DROP

echo "cut ssh except from trusted hosts"
echo "allow from"
echo "          - 1"
$IPT -A INPUT -i eth0 -p tcp -s 193.xxx.xxx.x -d $IPEXT --dport 22 -j ACCEPT
echo "          - 1"
$IPT -A INPUT -i eth0 -p tcp -s 193.xxx.xxx.xxx -d $IPEXT --dport 22 -j ACCEPT
echo "          - 3"
$IPT -A INPUT -i eth0 -p tcp -s 193.xxx.xxx.xxx -d $IPEXT --dport 22 -j ACCEPT
echo "          - 4"
$IPT -A INPUT -i eth0 -p tcp -s 193.xxx.xxx.xx -d $IPEXT --dport 22 -j ACCEPT
echo "cut all"
$IPT -A INPUT -i eth0 -p tcp --dport 22 -j DROP












