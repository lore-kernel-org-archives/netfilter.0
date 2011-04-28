From: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Subject: Best practice: Check --syn in PREROUTING with DNAT
Date: Thu, 28 Apr 2011 16:18:41 +0200
Message-ID: <9F69795E29C890408AC2DAF646C89BB3799D4F7DC3@MAILBOX.arc.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello List,

Is there a significant benefit when checking correct TCP flags in PREROUTING, e.g. with

Iptables -t nat -A PREROUTING --destination a.b.c.d -p tcp -m tcp --dport 80 --syn -j DNAT --to-destination w.x.y.z

Before accepting in INPUT rulebase:

... -m state --state ESTABLISHED -j ACCEPT
... --destination w.x.y.z -p tcp -m tcp --dport 80 --syn -j ACCEPT
... drop/reject with logging

I do not find any difference except that the log message of the drop/reject is different, given the following assumptions about connection tracking hold true (could someone please confirm that):

* With normal tcp connections (one syn and a lot of data packets), the DNAT rule is only traversed once, so the overhead is miniscule, the syn is checked again when accepting first packet, afterwards only ESTABLISHED rule will do all the work. So both DNAT rules should be OK.

* With aberrant packets (e.g. ACK scan)
** if --syn is checked in DNAT, no NAT will occur, so log will contain DROP to original IP/port.
** if --syn is not checked in DNAT, log will report DROP on natted IP, kernel would need additional time to perform NATing, which should be small compared to the time needed go through a list of average 30 DNAT rules. Since the packet cannot belong to a normal tcp connection, the connection cannot be tracked, so no kernel memory/port reservations are added, no resource starvation/increasing list search time, ... using such ACKs should occur.
In both cases, attacker should not be able to extract any further information about drop or even reject, since changes in runtime are minimal and drop/reject will  contain the original destination IP of the firewall, not the natted IP.

* With delayed packets to an already closed connection, logging will contain the natted target address, which might make iptables logs better readable, but no other benefit.


Am I on the right track?

Thanks,
Roman Fiedler
