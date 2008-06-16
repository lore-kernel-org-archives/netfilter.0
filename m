From: mathieu <mathieu@infolibre.net>
Subject: Troubles with iptables, ip and VPN
Date: Mon, 16 Jun 2008 12:22:52 +0200
Message-ID: <48563EFC.7050105@infolibre.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

     It's my first time on this list, i hope it's the right place for 
posting this kind of question.

My goal is to make a management network for different site. Those site 
are strictly independent and can localy use same IP. I decided to use a 
server to host openvpn and route packet. I decided than every site will 
use a subnet on this virtual network using DNAT to translate with adress 
on local network.


I tried to implement this solution like this :

OpenVPN host server is a debian.

I actually use two tap interfaces.

tap0 : 10.0.254.1 netmask 255.255.255.0
tap1 : 10.0.253.1 netmask 255.255.255.0

I created two entries in /etc/iproute2/rt_tables :
201 test.net1
200 test.net2

I created some iptables rules :

iptables -t mangle -A PREROUTING -d 10.0.254.0/24 -j MARK --set-mark 1
iptables -t nat -A PREROUTING -d 10.0.254.2 -j DNAT --to 172.21.1.69
iptables -t nat -A POSTROUTING -o tap0 -j SNAT --to 10.0.254.1

iptables -t mangle -A PREROUTING -d 10.0.253.0/24 -j MARK --set-mark 2
iptables -t nat -A PREROUTING -d 10.0.253.3 -j DNAT --to 10.1.0.1


And some ip rules :

ip rule del fwmark 1 table test.net1
ip rule add fwmark 1 table test.net1
ip route del default via 10.0.254.4 dev tap0 table test.net1
ip route add default via 10.0.254.4 dev tap0 table test.net1

ip rule del fwmark 2 table test.net2
ip rule add fwmark 2 table test.net2
ip route del default via 10.0.253.2 dev tap1 table test.net2
ip route add default via 10.0.253.2 dev tap1 table test.net2


 From 10.0.253.2 i execute : ping 10.0.254.2
Packet never come back.

 From the routeur point of view (where all this mess run), i get some 
informations
from tap1 :

11:45:35.753988 IP 10.0.253.2 > 10.0.254.2: ICMP echo request, id 53277, 
seq 8, length 64

from tap0 :

11:46:12.759495 IP 10.0.254.1 > 172.21.1.69: ICMP echo request, id 
53277, seq 45, length 64
11:46:12.782288 IP 172.21.1.69 > 10.0.254.1: ICMP echo reply, id 53277, 
seq 45, length 64

And from kernel log something :
martian source 10.0.253.2 from 172.21.1.69, on dev tap0
ll header: 00:ff:ff:88:88:a1:00:ff:f5:cc:7c:74:08:00


I don't really understand why packet coming back from 172.21.1.69 to 
10.0.253.2 (10.0.254.1 before nat) don't go on tap1.

Thanks for readings, regards,

m.e.
