From: Subba Rao <subba3@cablespeed.com>
Subject: Help with Masquerading
Date: Sun, 05 Jan 2003 10:19:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E184D14.10102@cablespeed.com>
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

Hi

My system is running kernel 2.4.20 with iptables compiled into the 
kernel. The system has 2 interfaces. ETH0 is connected to the Internet 
(via cablemodem) and ETH1 is connected to my home LAN which has only one 
W2K laptop.  

My W2K is configured with the Linux system as the gateway. Both systems 
can ping each other.
However my laptop is not able to go out to the Internet.

I am desperately trying to make my W2K laptop connect to the Internet.

Please let me know how to make this work.

Thank you in advance.

Subba Rao
subba3@cablespeed.com

#!/bin/sh

echo "Starting Firewall....."

INTERNAL_NET="10.0.0.0/24"

INTERNET=`ifconfig eth0 | grep inet | cut -d : -f 2 | cut -d \  -f 1`

# Flush the tables
/usr/sbin/iptables -F INPUT
/usr/sbin/iptables -F OUTPUT
/usr/sbin/iptables -F FORWARD
/usr/sbin/iptables -t nat -F

# Set default policies for packet entering this box

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# Allow some packets in but accept all those on the internal interface
/usr/sbin/iptables -A INPUT -i lo -j ACCEPT
/usr/sbin/iptables -A INPUT -i eth0 -j ACCEPT
/usr/sbin/iptables -A INPUT -i eth1 -j ACCEPT

# Masquerade internal system with the public IP address

iptables -t nat -A POSTROUTING -d $INTERNAL_NET -o $INTERNET -j ACCEPT
iptables -t nat -A POSTROUTING -o $INTERNET -s $INTERNAL_NET -j MASQUERADE

# Block inbound connections

/usr/sbin/iptables -A INPUT -i eth0 -p tcp --syn -j DROP

echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/tcp_syncookies




