From: Thai DANG <thai.dang@nextenso.com>
Subject: iptables and bnetd (game server) very slow...how to ?
Date: Fri, 31 May 2002 11:09:36 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CF759F0.8010504@nextenso.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi,
I have 2 PC in a LAN connected to an internet gateway (ADSL). My bnetd 
server is on the gateway. All connections are OK but there is a big pb : 
it is very slow. The computers are goods and the connections too. I 
think it is a pb in my iptables rules. I join my script, could tell me 
what is wrong ?

note : if you have the same architecture than me, you can use that 
script but it is slow :o(


#!/bin/sh

iptables -t nat --flush
modprobe iptable_filter
modprobe iptable_nat
modprobe ipt_MASQUERADE
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

# Activate forwarding
echo "1" > /proc/sys/net/ipv4/ip_forward


# variables
GTW_EXT=217.128.99.54
GTW_INT=10.0.0.2

# inside
iptables -A PREROUTING -t nat -d $GTW_EXT -j DNAT --to-destination $GTW_INT

# outgoing
for i in 1 3 4 5
do
iptables -A POSTROUTING -t nat -s 10.0.0.$i --protocol udp 
--destination-port 6112  -j SNAT --to-source $GTW_EXT:888$i
iptables -A POSTROUTING -t nat -s 10.0.0.$i --protocol tcp 
--destination-port 6112 -j SNAT --to-source $GTW_EXT:888$i
done

# incoming
for i in 1 3 4 5
do
iptables -A PREROUTING -t nat -d $GTW_INT --protocol udp 
--destination-port 888$i -j DNAT --to-destination 10.0.0.$i:6112
iptables -A PREROUTING -t nat -d $GTW_INT --protocol tcp 
--destination-port 888$i -j DNAT --to-destination 10.0.0.$i:6112
iptables -A OUTPUT -t nat -d $GTW_INT --protocol udp --destination-port 
888$i -j DNAT --to-destination 10.0.0.$i:6112
iptables -A OUTPUT -t nat -d $GTW_INT --protocol tcp --destination-port 
888$i -j DNAT --to-destination 10.0.0.$i:6112
done


# update bnetd gametrans file
echo "" > /usr/local/etc/gametrans

for i in 1 2 3 4 5
do
echo ": 10.0.0.$i $GTW_EXT:888$i 10.0.0.0/24 " >> /usr/local/etc/gametrans
done


# display LOGS
echo "============================="
cat /usr/local/etc/gametrans

echo "============================="
iptables -L -v -t nat


