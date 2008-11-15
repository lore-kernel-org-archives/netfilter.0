From: bsilva <bsilva@sonic.net>
Subject: Alternate routing table and source IP address question.
Date: Fri, 14 Nov 2008 18:06:55 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0811141747390.12742@bolt.sonic.net>
References: <1226578553.8310.40.camel@localhost.localdomain>
 <491C5FCE.9060001@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <491C5FCE.9060001@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


At my job, we use iptables commands to mark packets to use alternate
routing tables.  Basically, we're using this to have two default gateways,
some traffic types go out interface A to one gateway, other types of
traffic go out interface B to a second gateway.

The issue is that by the time the packet gets to the routing table, the
source IP address has already been set and we get the packets exiting
interface B, but with the source IP address of interface A.

The only way we've found to correct this is to have the application that
generates the traffic bind to the particular source IP address of the
interface that it's eventually going to use.

Is there a better way to do it?

Interface "A": 123.123.111.2
Interface "B": 123.123.123.2
NTP server: 123.123.222.10

Example:
# Sets mark on NTP packets.
iptables -A OUTPUT -t mangle -p udp  --dport 123 -j MARK --set-mark 1
#Add rule to have marked packets use route table 1
ip rule add fwmark 1 table 1 priority 2000
#Build route table 1
ip route add 123.123.123.0/24 dev bond2 src 123.123.123.2 table 1
ip route add default via 123.123.123.1 src 123.123.123.2 table 1

Using this example, NTP packets will exit interface B, but will have the
source IP address of interface A.

I see this nice box on Jan Engelhardt's Packet Flow graph labeled "reroute
check", but I don't see a way to invoke it.  I was hoping that adding a
"src 123.123.123.2" parameter to the route statement would invoke reroute,
but that doesn't seem to happen.  Or is the "reroute check" only used in
NAT cases?

(http://jengelh.medozas.de/images/nf-packet-flow.png)

Thanks,
Brad


