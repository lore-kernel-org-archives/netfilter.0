From: Patrick Chemla <patrick.chemla@perfaction.net>
Subject: Multiple IPs to 2 interfaces problem with default route
Date: Wed, 03 Mar 2010 10:36:01 +0200
Message-ID: <4B8E1F71.6060806@perfaction.net>
References: <4B7A7F39.5090808@perfaction.net> <4B7ABBED.1020404@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <4B7ABBED.1020404@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have set up a Fedora 11 NAT server to NAT outgoing traffic to 2 
interfaces to 2 ISPs.

My internal interface is eth0, the 2 external interfaces are eth1 for 
ISP1 and eth2 for ISP2, each one with a pool of IP addresses.

I wrote a script who create for each internal server the corresponding 
NAT fonction :

interface= outgoing interface for the wanted ISP
public_ip= public IP address affected to this server on the ISP network
server_ip= internal server local ip address

/sbin/iptables -t nat -A PREROUTING -p tcp -i $interface -s 
$public_ip/32 -j DNAT --to-destination $server_ip
/sbin/iptables -t nat -A POSTROUTING -s $server_ip/32 -j SNAT -o 
$interface --to-source $public_ip

It works very fine with one interface, but when I try to activate the 
second interface, I think I get a problem with the default route.

When I started the interfaces, eth1 got a public IP and a default 
gateway. This default gateway is the default gateway for all the server. 
eth2 has his own public IP, own gateway.

I tried to remove the default gateway, thinking the route will be 
according to the NAT setup, but no more packet can get out of the server.

But I need to split packets to interfaces eth1 and eth2 according to the 
public IP of the internal server, not according to a default route 
always pointing to eth1.

How can I set up these routes?

Patrick

