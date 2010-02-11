From: Yavetskiy Yuriy <yavetskiy@kpi.ua>
Subject: DNAT and 802.1q tagged bridge
Date: Thu, 11 Feb 2010 22:11:05 +0200
Message-ID: <4B746459.9070709@kpi.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a bridge of two physical interfaces: eth1, eth2. Vlan tagged 
packets go through this bridge, but bridge itself doesn't know about 
vlan numbers (there're a lot of vlans,they change frequently, it's 
impossible to set them on a bridge) and bridge has no ip address.
ebtables and conntrack are  both loaded.
DROP and ACCEPT run on this bridge.
Under certain destination ip and port, I need to DNAT packets to 
loopback, I add 10.0.0.1 to loopback, as DNAT often doesn't work on 127/8.
Here's an example rule which somehow does not work:
iptables-t nat-A PREROUTING-m physdev - physdev-in eth1-d 1.1.1.1-j DNAT 
- to-destination 10.0.0.1
iptables-t nat-A POSTROUTING-s 10.0.0.1-j SNAT - to-source 1.1.1.1
Packages come on eth1. Return (after Snat) packets must go through eth0, 
the interface is untagged, the gateway lives behind it.
I make a telnet from the world, in iptables DNaT counter is incremented 
by 1, but telnet does not respond, syn + ack in response does not come, 
and counters of SNAT are zeroed. Telnet passes from bridge machine, the 
problem is exactly in DNAT. This scheme also doesn't work without SNAT.
Maybe the problem is that packets Tagged? But netfilter is not looking 
at the package ethernet headers during DNaT, it looks only on IP packet 
headers, as DNaT, for example, can be done in Gre-tunnel, which is not 
ethernet device. Maybe reason in no ipv4 routes on bridge interface (but 
interface is tagged, I don't know vlan numbers and there are no untagged 
packets running throu bridge so I can't simply add route on bridge device).


-- 
WBR
Yavetskiy Yuriy
ULTI-RIPE

