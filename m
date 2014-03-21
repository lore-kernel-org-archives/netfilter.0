From: Bob Miller <bob@computerisms.ca>
Subject: forwarding between subnets
Date: Fri, 21 Mar 2014 15:43:14 -0700
Message-ID: <1395441794.23816.495.camel@worklian>
Reply-To: bob@computerisms.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a firewall with 3 network ports;  one for internet an connection
and two for segregated subnets that share the internet connection.  

I want to allow one computer on one subnetA to reach another computer on
the other subnetB.  It is not reaching its destination.  When problems
like this arise, I turn to the nf-packet-flow diagram and set up logging
rules to make sure the packets are going where I think they are.

I have an existing rule in nat/PREROUTING to do SNAT on all packets from
subnetA --to the internet-facing IP, so I write a rule before that to
ACCEPT packets from source IP in subnetA to dest IP in subnetB.  I write
two LOG rules to match packets with the dest and place one immediately
before and immediately after my ACCEPT rule.  The packet is logged
before but not after the ACCEPT rule.  I believe this to mean the packet
is accepted at nat/PREROUTING and should move to the next step in the
diagram.

On the diagram, the next thing is a routing decision, then the packet
should show up in mangle/INPUT or mangle/FORWARD.  I again write a log
rule to match the dest IP for each of mangle/INPUT and mangle/FORWARD.
They are the only rules on those chains, but the packet is not logged on
either chain.

Examining the diagram, the packet is either being dropped down into the
link layer or the routing decision is doing something else with the
packet.   I understand that the link layer requires ebtables and that is
not installed on this firewall, so the problem must be the routing
decision.

If I check the routing table, I have 4 routes, one to each of the
respective subnets for each port, and a default via the internet port.
These routes are apparently working as expected in that packets are
finding their way to the internet and back.

It seems either my troubleshooting process is broken, or something
unexpected (to me) is happening in that routing process.  Can anyone
drop me a clue?
-- 
Computerisms
Bob Miller      
867-334-7117 / 867-633-3760
http://computerisms.ca



