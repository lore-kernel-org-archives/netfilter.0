From: Riccardo Gusso <grick@despammed.com>
Subject: Weird problem with iptables/ipmasq on Debian
Date: Sun, 11 Jan 2004 22:15:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073855752.7272.26.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everybody, 
I am using Debian (unstable version) and packages iptables-1.2.9-2 and
ipmasq-3.5.19 to set up masquerading on my private lan. 
Until last update of the packages everything was working, I haven't
touched anything related to kernel network support or ipmasq rules, 
but now I cannot ping anymore any external address from masqed
computers.
Some info:
server address is 192.168.1.51
client address is 192.168.1.52
they can ping each other
I use the following ipmasq rules:

murena:/usr/src/linux# ipmasq -v
#: Interfaces found:
#:   ppp0       80.104.114.92/255.255.255.255
#:   ppp0       80.104.114.92/255.255.255.255
#:   eth0       192.168.1.51/255.255.255.0
echo "0" > /proc/sys/net/ipv4/ip_forward
/sbin/iptables -P INPUT DROP
/sbin/iptables -P OUTPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -F INPUT
/sbin/iptables -F OUTPUT
/sbin/iptables -F FORWARD
/sbin/iptables -t mangle -P PREROUTING ACCEPT
/sbin/iptables -t mangle -P OUTPUT ACCEPT
/sbin/iptables -t mangle -F PREROUTING
/sbin/iptables -t mangle -F OUTPUT
/sbin/iptables -t nat -P PREROUTING ACCEPT
/sbin/iptables -t nat -P POSTROUTING ACCEPT
/sbin/iptables -t nat -P OUTPUT ACCEPT
/sbin/iptables -t nat -F PREROUTING
/sbin/iptables -t nat -F POSTROUTING
/sbin/iptables -t nat -F OUTPUT
/sbin/iptables -A INPUT -j ACCEPT -i lo
/sbin/iptables -A INPUT -j LOG -i ! lo -s 127.0.0.1/255.0.0.0
/sbin/iptables -A INPUT -j DROP -i ! lo -s 127.0.0.1/255.0.0.0
/sbin/iptables -A INPUT -j ACCEPT -i eth0 -d 255.255.255.255/32
/sbin/iptables -A INPUT -j ACCEPT -i eth0 -s 192.168.1.51/255.255.255.0
/sbin/iptables -A INPUT -j ACCEPT -i eth0 -d 224.0.0.0/4 -p ! 6
/sbin/iptables -A INPUT -j LOG -i ppp0 -s 192.168.1.51/255.255.255.0
/sbin/iptables -A INPUT -j DROP -i ppp0 -s 192.168.1.51/255.255.255.0
/sbin/iptables -A INPUT -j ACCEPT -i ppp0 -d 255.255.255.255/32
/sbin/iptables -A INPUT -j ACCEPT -i ppp0 -d 80.104.114.92/32
/sbin/iptables -t nat -A POSTROUTING -s 192.168.1.51/255.255.255.0 -j
MASQUERADE
/sbin/iptables -A FORWARD -i eth0 -o ppp0 -s 192.168.1.51/255.255.255.0
-j ACCEPT
/sbin/iptables -A OUTPUT -j ACCEPT -o lo
/sbin/iptables -A OUTPUT -j ACCEPT -o eth0 -d 255.255.255.255/32
/sbin/iptables -A OUTPUT -j ACCEPT -o eth0 -d 192.168.1.51/255.255.255.0
/sbin/iptables -A OUTPUT -j ACCEPT -o eth0 -d 224.0.0.0/4 -p ! 6
/sbin/iptables -A FORWARD -j LOG -o ppp0 -d 192.168.1.51/255.255.255.0
/sbin/iptables -A FORWARD -j DROP -o ppp0 -d 192.168.1.51/255.255.255.0
/sbin/iptables -A OUTPUT -j LOG -o ppp0 -d 192.168.1.51/255.255.255.0
/sbin/iptables -A OUTPUT -j DROP -o ppp0 -d 192.168.1.51/255.255.255.0
/sbin/iptables -A OUTPUT -j ACCEPT -o ppp0 -d 255.255.255.255/32
/sbin/iptables -A OUTPUT -j ACCEPT -o ppp0 -s 80.104.114.92/32
echo "1" > /proc/sys/net/ipv4/ip_forward
/sbin/iptables -A INPUT -j LOG -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A INPUT -j DROP -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A OUTPUT -j LOG -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A OUTPUT -j DROP -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A FORWARD -j LOG -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A FORWARD -j DROP -s 0.0.0.0/0 -d 0.0.0.0/0

When I try to ping an external address (152.2.210.81 in this case) from
the client
in /var/log/syslog I see (repeated):

Jan 11 01:30:12 localhost kernel: IN=ppp0 OUT=eth0 SRC=152.2.210.81
DST=192.168.1.52 LEN=84 TOS=0x00 PREC=0x00 TTL=45 ID=24394 PROTO=ICMP
TYPE=0 CODE=0 ID=4326
SEQ=14

Any help will be appreciated.
Ciao,
       Riccardo



