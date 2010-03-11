From: Patrick Chemla <patrick.chemla@perfaction.net>
Subject: iptables NATed or not NATed
Date: Thu, 11 Mar 2010 09:04:54 +0200
Message-ID: <4B989616.7000904@perfaction.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I am using iptables NAt to route outgoing packets from my LAN (eth0) to 
specific public IPs on 2 ISPs links (eth1 and eth2), according to the 
internal IP of a local server.

Here is how I NAT the addresses:

/sbin/iptables -t nat -A PREROUTING -p tcp -i $interface -s 
$public_ip/32 -j DNAT --to-destination $server_ip
/sbin/iptables -t nat -A POSTROUTING -s $server_ip/32 -j SNAT -o 
$interface --to-source $public_ip

Here is how I route the packets to the right outgoing interface:

I have 2 routing tables declared. Default route is on eth2.

/sbin/ip rule add from $server_ip table $route_table

It works, but with tcpdump I have recorded packets on outgoing 
interfaces where addresses are NOT NATed, means, packets issued from 
internal servers on eth0, are routed to default route eth2 with there 
internal address 10.0.0.xx.

It is very strange because it is a small percentage of packets, not all 
the packets from a specific server, directed to the same port than 
others who are routed and NATed the right way, at the same time.

Again: a small percentage of packets issued by the same server, to the 
same destination port, maybe not the same public server are routed 
without NATing, while most of the packets from the same computer are 
well routed and NATed.

Of course, the dialog fails because there is no back route to address 
10.0.0.xx

Does someone have any idea?
Thanks for help
Patrick


