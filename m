From: "Tobias Krummen" <tobias.krummen@t-online.de>
Subject: How to SNAT in PREROUTING table for local machine
Date: Thu, 19 Jun 2008 14:06:59 +0200
Message-ID: <004a01c8d204$fb1022e0$1402a8c0@nemesisk7>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hello,

due to a project, I wonder if it's possible to use netfilter and iptables to 
alter the source ip-address of incoming packets.

In this particular case, a machine is running a service, which is listening 
on two interfaces, one ethernet interface on the local network, and an 
interface for vpn. The local network is a /24 net, the vpn has addresses 
from a class a /8 network. But the service is only able to accept 
connections from a /24 subnet.
First idea was to manipulate the source ip-address of the incoming packets, 
like SNAT does. So the other way round, with NAT the original ip-addresses 
could be restored, when the service is answering.

This manipulation has to be done within the PREROUTING table, as the packet 
still needs to get delivered to the local machine. But it seems that SNAT is 
only available in the POSTROUTING table. With DNAT it is possible to route 
the packets from the /8 subnet to the ip-address of the machine in the /24 
subnet, but the packets do still have their source addresses from the /8 
network, and the service is refusing to answer.
$IPTABLES -t nat -A PREROUTING -i $VPNIF -s $VPNNET -d $VPNIP -j 
DNAT --to-destination $LAN1IP

It does'nt matter, if with this kind of NAT it would only be possible to get 
only 253 hosts connected and not all hosts within the /8 subnet.

Second idea was using the mangle-table to manipulate the ip-address. Even 
though it would need up to 253 x 2 rules, one set for mapping the 
source-addresses of the incoming packets, and one set for remapping the 
destination-addresses of the outgoing packets. But the mangle-table provides 
only targets for manipulating classification, connection marking, packet 
marking, DSCP, ECN, TOS, TTL... but no ip-address related targets?

So, is there a way to change the source ip-address of incoming packets with 
the given possibilities of netfilter, or are there other tools to get this 
done?

A rule like the following is unfortunatly not possible:
$IPTABLES -t nat -A PREROUTING -i $VPNIF -s $VPNNET -d $VPNIP -j 
SNAT --to-source $LAN2IP_1-$LAN2IP_253
$LAN2 would be a different /24 subnet, so it wouldn't interfere with the 
attached local network.

--
Greetings,
Tobias Krummen 

