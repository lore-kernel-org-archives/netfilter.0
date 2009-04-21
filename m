From: "Pablo Pita Leira" <pablo.pita@pitagoral.com>
Subject: how to connect from outside to several identical networks
Date: Tue, 21 Apr 2009 10:08:47 +0200
Message-ID: <op.usp8wx2p7q4g76@nllt0003.terma.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: netfilter@vger.kernel.org


The systems that we are integrating and testing have their own
private networks. The IPs of both A1, A2 and A3 systems are in network
172.16.X.X. Those 3 networks are equal but independent of each other, that  
is,
they do not need to be connected to each other, so there is no problem
for the testers or for the integration work that they have the same ip
addresses. Those systems are in enclosed areas, without much space
inside. It is nice to be able to access them from the office network.
The IPs for this one are in the 10.99.64.X range.

So the basic cuestion I am posing is how to make them accessible,
without changing anything in A1, A2 and A3.

We have a PC with opensuse 11.0 installed and have initially configured
its firewall software to make just one such network available.

I checked the mailing list archives and documentation of iptables to check
for rules for doing the appropriate SNAT - DNAT based on the ethernet card
handling the traffic, but well, it is not easy at all and seems just  
beyond my
understanding. I thought I found a solution when I saw a posting about
chain RAWNAT in the xtables-addons package. I downloaded the binaries and
the source, and well, I did not find any RAWNAT capabilities there
(version 1.14). That chain would have allowed SNAT before all other tables
get involved, and similarly, I would have done DNAT once the packet got  
routed
to the appropriate interface card.

I wonder if someone can put some light into all this.

-- 
Pablo Pita Leira
