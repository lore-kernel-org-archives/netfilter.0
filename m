From: Chris <novashadow@gallifreyans.com>
Subject: iptables with limit and xt_recent modules, the efficiency of chains
 and some general questions
Date: Fri, 9 Aug 2013 01:53:42 -0400
Message-ID: <CADQUuw6k7MCkRoZ0HLAKxrXzgDXBY+6p5rANp4DR9r8d2avoMg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello folks,

I am not completely new to iptables, but I have never used it for
anything advanced. I am working to build a starter rule set that
blocks bad packets, provides general limiting to help reduce the the
effect of attacks from many IPs, provides per IP general limits and
limits for accessing specific services. Below is my initial rule set,
but I have not yet added logging. My questions will be based on this
rule set.

I am operating on several assumptions, listed below. I have questions mixed in.

1) Assumption: The iptables module appears to be efficient as common
distributions like CentOS  and Ubuntu have iptables enabled, I realize
that the default policy is Accept for all tables and there are no
rules, but it is still filtering and my experience with a basic set of
rules has not shown a noticeable drop in performance for servers with
moderate traffic.

2) Assumption: The fewer rules a packet has to pass before being
accepted or blocked equates to less load on the system. Yes it's an
obvious assumption, feel free to roll your eyes.

3) Assumption: Not having iptables match the same thing more than once
will result in less load on the system. For example, in the rule set
below, you see that ssh and webmin connections are sent to the
BRUTEFORCEIPCHECK chain. Since I want different per IP limits for ssh
and webmin, I have to match again. I can avoid this by using a
different chain for ssh and webmin.

3a) The questions is when is the overhead double matching more than
the overhead of adding a new chain?

3b) In many logging examples there is only one logging chain. I intend
to have a bit more information about blocked packets like why the
packet was blocked. If I use one chain, I would have to double match
many things. My thought is to use multiple chains, but this would be
about 8 new chains. Will this many chains be a problem?

4) Would it be a good idea to run the bad packet checks, like in the
CHECK_PACKETS chain, on outgoing traffic?

5) I am using the recent module in this set and I have some questions
about it's use.

5a) Are the IP lists stored in RAM? If so, why is there a hit limit of
255? How are hits removed from these lists?

5b) In the ABUSIVEHOSTCHECK chain there is a rule that sets IPs in the
abusivehostcheck IP list. Then there are three rules that match
against this list. Examples I have seen like this would use 3
different IPs lists. Should I move to three lists? If so, why?

5c) In the ABUSIVEHOSTCHECK chain there is a rule that checks against
the blacklist IP list. I thought about moving this rule up to either
the CHECK_PACKETS chain under the admin access rule or the INPUT table
under the admin access rule. I decided not to do this because if there
was a very high volume of traffic I figured this would cause massive
load. Do you have any thoughts on this?

6) Are there other bad packet types and/or DDoS and other attacks I
should block or limit?


*filter
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:CHECK_PACKETS - [0:0]
:ABUSIVEHOSTCHECK - [0:0]
:NETATTACKS_SFP - [0:0]
:NETATTACKS_PSP - [0:0]
:IP_BLACKLIST - [0:0]
:BRUTEFORCEIPCHECK - [0:0]

-A INPUT -m comment -m limit -m conntrack -s 199.250.36.84/32 --limit
15/second --limit-burst 8 -j CHECK_PACKETS --comment "Admin Access"
--ctstate NEW
-A INPUT -m comment -m limit -m conntrack --limit 150/second
--limit-burst 200 -j CHECK_PACKETS --comment "Maximum new connections"
 --ctstate NEW
-A INPUT -m comment -j CHECK_PACKETS --comment "Check everything else
for bad packets."
-A INPUT -p tcp -m comment -m tcp -m limit -m conntrack --dport 22
--limit 3/second --limit-burst 5 -j BRUTEFORCEIPCHECK --comment "SSH
Access"  --ctstate NEW
-A INPUT -p tcp -m comment -m tcp -m limit -m conntrack --dport 10000
--limit 10/sec --limit-burst 6 -j BRUTEFORCEIPCHECK --comment "Webmin
Access"  --ctstate NEW
-A INPUT -p tcp -m comment -m tcp -m limit -m conntrack -s
175.42.124.13/32 --dport 25 --limit 10/sec -j ACCEPT --comment "Accept
mail from device"  --ctstate NEW
-A INPUT -m comment -j DROP --comment "Block everything else"

-A CHECK_PACKETS -m comment -f -j DROP --comment "Drop fragmented packets!"
-A CHECK_PACKETS -m comment -m conntrack -j DROP --comment "Drop
connections with an invalid connection state. This should block port
scanner ACK, FIN and RST scans among other invalid packets."
--ctstate INVALID
-A CHECK_PACKETS -p tcp -m comment -m tcp --tcp-flags
FIN,SYN,RST,PSH,ACK,URG NONE -j DROP --comment "Drop malformed NULL
packets"
-A CHECK_PACKETS -p tcp -m comment -m tcp --tcp-flags
FIN,SYN,RST,PSH,ACK,URG FIN,SYN,RST,PSH,ACK,URG -j DROP --comment
"Drop malformed XMAS packets"
-A CHECK_PACKETS -p tcp -m comment -m tcp --tcp-flags FIN,SYN FIN,SYN
-j DROP --comment "Drop packets with both SYN and FIN tcp flags set."
-A CHECK_PACKETS -p tcp -m comment -m tcp --tcp-flags SYN,RST SYN,RST
-j DROP --comment "Drop packets with both SYN and RST tcp flags set."
-A CHECK_PACKETS -m comment -s 199.250.36.84/32 -j ACCEPT --comment
"Admin Access"
-A CHECK_PACKETS -m comment -m conntrack -j ACCEPT --comment "Accept
connections with connection states RELATED,ESTABLISHED."  --ctstate
RELATED,ESTABLISHED
-A CHECK_PACKETS -m comment -j ABUSIVEHOSTCHECK --comment "Check
everything else for abusive behavior."
-A CHECK_PACKETS -m comment -j RETURN --comment "Return to the INPUT table."

-A ABUSIVEHOSTCHECK -p tcp -m comment -m tcp --tcp-flags
FIN,SYN,RST,ACK SYN -j NETATTACKS_SFP --comment "SYN Flood Filter"
-A ABUSIVEHOSTCHECK -p tcp -m comment -m tcp --tcp-flags
FIN,SYN,RST,PSH,ACK,URG RST -j NETATTACKS_PSP --comment "Port Scanner
Filter"
-A ABUSIVEHOSTCHECK -m comment -m recent -j IP_BLACKLIST --comment
"Block the IP for specified time if the IP is in the list named
blacklist with the specified number of hits and update the IP in the
list to extend the IP block."  --rcheck --seconds 120 --hitcount 3
--name blacklist --rsource
-A ABUSIVEHOSTCHECK -m comment -m recent --comment "Build the IP list
named abusivehostcheck."  --set --name abusivehostcheck --rsource
-A ABUSIVEHOSTCHECK -m comment -m recent -j IP_BLACKLIST --comment
"Send to blacklist chain for the specified time if the IP is in the
list named abusivehostcheck with the specified number of hits and
update the IP in the list to extend the IP block."  --update --seconds
20 --hitcount 40 --name abusivehostcheck --rsource
-A ABUSIVEHOSTCHECK -m comment -m recent -j IP_BLACKLIST --comment
"Send to blacklist chain for the specified time if the IP is in the
list named abusivehostcheck with the specified number of hits and
update the IP in the list to extend the IP block."  --update --seconds
90 --hitcount 120 --name abusivehostcheck --rsource
-A ABUSIVEHOSTCHECK -m comment -m recent -j IP_BLACKLIST --comment
"Send to blacklist chain for the specified time if the IP is in the
list named abusivehostcheck with the specified number of hits and
update the IP in the list to extend the IP block."  --update --seconds
240 --hitcount 255 --name abusivehostcheck --rsource
-A ABUSIVEHOSTCHECK -m comment -j RETURN --comment "Return to the
CHECK_PACKETS chain."

-A NETATTACKS_SFP -m comment -m limit --limit 50/sec --limit-burst 20
-j RETURN --comment "SYN Flood Protection"
-A NETATTACKS_SFP -j DROP

-A NETATTACKS_PSP -m comment -m limit --limit 8/sec --limit-burst 3 -j
RETURN --comment "Port Scanner Protection"
-A NETATTACKS_PSP -j DROP

-A IP_BLACKLIST -m comment -m recent --comment "Build the IP list
named blacklist."  --set --name blacklist --rsource
-A IP_BLACKLIST -j DROP

-A BRUTEFORCEIPCHECK -p tcp -m comment -m tcp -m recent --dport 22 -j
DROP --comment "SSH brute force protection"  --rcheck --seconds 60
--hitcount 5 --name bfips --rsource
-A BRUTEFORCEIPCHECK -p tcp -m comment -m tcp -m recent --dport 10000
-j DROP --comment "Webmin brute force protection"  --rcheck --seconds
60 --hitcount 5 --name bfips --rsource
-A BRUTEFORCEIPCHECK -m comment -j ACCEPT --comment "Accept connection
attempts that have survived the scrutiny above."

-A FORWARD -m comment -j DROP --comment "Drop everything else"


-
Thanks,

Chris
