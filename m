From: Manu <traqueur@club-internet.fr>
Subject: PREROUTING to a non local subnet
Date: Mon, 09 Sep 2013 16:34:26 +0200
Message-ID: <522DDC72.4000402@club-internet.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello

I'm running iptable v1.4.7 on a linux with two NIC.
One has adress 192.168.1.31 (the lan)
The other has a public IP. Let's say 180.180.180.180

On the lan, I have a VPN which join two network : 192.168.1.0 and 
192.168.2.0

I'm trying to forward 5900 port (vnc) to a computer which is on the 
second subnet with adress 192.168.2.100
iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT 
--to-destination 192.168.2.100:5900
iptables -A FORWARD -p tcp -d 192.168.2.100--dport 5900 -j ACCEPT
and it doesn't work

I've tried the same on the local network with adress 192.168.1.99
iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT 
--to-destination 192.168.1.99:5900
iptables -A FORWARD -p tcp -d 192.168.1.99--dport 5900 -j ACCEPT
and it's working like a charm

I've done my test with another computer with public adress 200.200.200.200

I've done a netstat one the two computers
on 192.168.2.100 i've seen he's talking to 180.180.180.180 (<-- my 
server running iptable)
on 192.168.1.99 i've seen he's talking to 200.200.200.200 (<-- the 
computer on internet which i'm running my test from)

thanks for your attention
