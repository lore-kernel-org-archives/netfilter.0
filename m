From: Barry Smoke <Barry.Smoke@arklegaudit.gov>
Subject: help with bridged firewall with openvpn
Date: Wed, 28 Dec 2011 08:46:45 -0600
Message-ID: <250999BCC487ED429E1673DCFA26CDCC2A7BDA6E16@postman>
References: <250999BCC487ED429E1673DCFA26CDCC2A7BDA6E15@postman>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <250999BCC487ED429E1673DCFA26CDCC2A7BDA6E15@postman>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


Most of the online docs I've found deal with bridging, and virtualizati=
on. =A0I'm trying to use bridging to link openvpn clients with our inte=
rnal network, without nat(for a voip implementation on yealink phones).
I've created a bridge on centos 5.6, and have openvpn using tap0.=A0 At=
 this point, I'm not sure if I'm having trouble with my bridge config, =
or my iptables script.
Brctl showmacs br0, does show my openvpn client mac, however it is not =
listed as local(not sure if it is supposed to), and through tcpdump on =
br0, I'm seeing my internal lan client that is trying to ping the openv=
pn client get the mac address, however my ping requests never make it t=
o br0.=A0=20

I'm on kernel =A02.6.18-274.12.1.el5, and I modified a firewall script =
we were previously using to work with the br0 interface instead.
What we are seeing, is that vpn clients can ping the openvpn server.=A0=
 I can ping the clients from the openvpn server.=A0 I can't get interna=
l machines to ping an openvpn client, nor can I get an openvpn client p=
inging anything else on the network.

The openvpn config pushes a reserved internal range to the vpn clients(=
10.0.28.x)
I've added tap0, and br0 to the forwarding table.

Here is my current firewall script:

# Set INTERFACE equal to the interface your OUTGOING connection is on.
echo 1 > /proc/sys/net/ipv4/ip_forward
INTERFACE=3Deth1
#Delete user made chains. Flush and zero the tables.
/sbin/iptables -F
/sbin/iptables -X
/sbin/iptables -Z

#Delete `nat' and `mangle' targets.
/sbin/iptables -t nat -F
/sbin/iptables -t mangle -F

#Create a new log and drop (LDROP) convenience target
/sbin/iptables -N LDROP
# --log-level 7 makes it stop logging to the console.
# --log-prefix iptables: makes for easy syslog-ng filtering
/sbin/iptables -A LDROP -j LOG --log-level 4 --log-prefix iptables:
/sbin/iptables -A LDROP -j DROP

#Create a new target (GOOD) to test for good intentions.
/sbin/iptables -N GOOD
#Allow but limit some ICMP (needed for pinging and tracerouting)
/sbin/iptables -A GOOD -p icmp --icmp-type echo-request -m limit --limi=
t 1/s -j ACCEPT
/sbin/iptables -A GOOD -p icmp --icmp-type echo-reply -m limit --limit =
1/s -j ACCEPT
/sbin/iptables -A GOOD -p icmp --icmp-type source-quench -m limit --lim=
it 2/s -j ACCEPT

#Check State (Only allow incoming connections that have a ESTABLISHED o=
r RELATED outgoing connection)
/sbin/iptables -A GOOD -m state --state ESTABLISHED,RELATED -i ${INTERF=
ACE} -j ACCEPT

#Allowing specific protocols in. Add any you use.
#Allow SSH
/sbin/iptables -A GOOD -p tcp --dport 22 -j ACCEPT

#openvpn
/sbin/iptables -A GOOD -p udp -i eth1 -d 170.94.21.4 --dport 1194 -j AC=
CEPT

#Setting default input rule to DROP
/sbin/iptables -P INPUT DROP

#Allow all traffic on the local interfaces (Any interface EXCEPT the in=
terface in $INTERFACE)
#/sbin/iptables -A INPUT -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -i br0 -j ACCEPT
/sbin/iptables -A INPUT -i tap0 -j ACCEPT

#Test for good intentions (Adds the GOOD target to the INPUT chain)
/sbin/iptables -A INPUT -j GOOD

#Otherwise Log and Drop (This gets rid of anything we might have missed=
)
/sbin/iptables -A INPUT -j LDROP


#Setting default forwarding rule to DROP
/sbin/iptables -P FORWARD DROP

#Let non-evil stuff out
#/sbin/iptables -A FORWARD -i eth0=A0 -j ACCEPT
/sbin/iptables -A FORWARD -i br0 -j ACCEPT
/sbin/iptables -A FORWARD -i tap0 -j ACCEPT

/sbin/iptables -A FORWARD -i lo -j ACCEPT
/sbin/iptables -A FORWARD -s 10.0.0.0/16 -j ACCEPT
/sbin/iptables -A FORWARD -d 10.0.0.0/16 -j ACCEPT

#Test for good intentions (Adds the GOOD target to the FORWARD chain)
/sbin/iptables -A FORWARD -j GOOD
#Otherwise Log and Drop
/sbin/iptables -A FORWARD -j LDROP

#Setting default output rule to ACCEPT
/sbin/iptables -P OUTPUT ACCEPT
#Allow all traffic to the lo interface
#/sbin/iptables -A OUTPUT -o lo -j ACCEPT

#allows internal lan clients to use this server as a gateway
/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -d ! 10.0.0.0/16 -o=
 ${INTERFACE} -j MASQUERADE

