From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Query: iptables Conflict Policy Avoidance/Reduction
Date: Wed, 03 Jun 2009 19:48:06 +0100
Message-ID: <4A26C566.6050105@tssg.org>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Dear all,

Configuring a larger firewall policy is error prone. Rules can be redundant to 
others, rules can be shadowed by proceeding rules whereby they are never activated 
and so forth.

How do conflicts arise when the iptable rules use the NIC interface option.

Simple Redundancy example:

Internet ---> (eth1)Firewall ---> Web Server
Intranet ---> (eth0)

Firewall with two interfaces eth1 (Internet facing) and eth0 (Intranet LAN 
facing), eth+ is the wildcard for both.

Rule 1: iptables -A FORWARD -i eth+ -s 0/0 -d 192.168.1.2 --dport 80 -j ACCEPT
Rule 2: iptables -A FORWARD -i eth+ -s 192.168.1.0/24 -d 192.168.1.2 --dport 80 -j 
ACCEPT

In the above scenario, Rule 2 is REDUNDANT to Rule 1 in that, the source IP of 
Rule 2 is covered by the source IP of Rule 1.

However, aren't these generic style rules not considered *best practice* given 
that the above rules when applied to all interfaces could allow IP Spoofing of 
reserved IP address range 192.168.1.0/24

So in order to avoid spoofing, one has to create the following two rules and apply 
them to specific interfaces.
iptables -A FORWARD -i eth1 -s 0/0 -d 192.168.1.2 --dport 80 -j ACCEPT
iptables -A FORWARD -i eth0 -s 192.168.1.0/24 -d 192.168.1.2 --dport 80 -j ACCEPT


Simple Shadowed example:

Internet ---> (eth1)Firewall ---> Web Server
Partner ---> (eth1) Firewall ---> VPN Server

Default Policy: iptables -P FORWARD DROP
Rule 1: iptables -A FORWARD -i eth1 -s 0/0 -d webIP --dport 80 -j ACCEPT
Rule 2: iptables -A FORWARD -i eth1 -s 0/0 -d vpnIP --dport 22 -j DROP
Rule 3: iptables -A FORWARD -i eth1 -s partnerIP -d vpnIP --dport 22 -j ACCEPT

Rule 2 blocks the intended partners access via Rule 3. A simple swap of rule 2 and 
rule 3 prevents this. But why bother with Rule 2 in the first place, given the 
default policy is DROP and so there is no way for anyone else other than the 
partners to get access (Rule 3). Looking at various example policies on the web, I 
find that there are explicitly defined DROP rules in conjunction with ACCEPT rules 
like rules 2 and 3 above. Its as if, one does not trust the default policy.

I am just wondering, if all rules are applied to specific Interfaces, specific 
destination IP address, specific destination ports  and some trust in the default 
policy would a lot of the possible policy conflicts be ruled out?

If anyone could provide me with some scenarios/examples to the contrary that would 
be great.

It would even be better if I could get a hold of some real firewall policies 
(anonymised internal IP ranges of course).

I have done some formal modelling on detecting conflicts with more complex 
scenarios then above on an already defined policy.

But lately its dawning on me that formal synthesis or creation of rules *may* 
completely rule out such conflicts. Of course the assumption is that you begin 
with an empty rule-less policy.

For example (trivial scenario):
Using formal logic to generate iptables syntax based on the fact that its best 
practice to allow both public and lan ip addresses access to the public web server.

Inface  SrcIP   SrcPort  DstIP  DstPort Target
eth1    anyIP   >1024    webIP    80    Accept
eth0    lanIP   >1024    webIP    80    Accept

Where the above is much better than:
SrcIP   SrcPort  DstIP  DstPort Target
anyIP   >1024    webIP    80    Accept

And where the above is much better than:
SrcIP   SrcPort  DstIP  DstPort Target
anyIP   >1024    dmz    80    Accept

It appears to me at least, that creating rules to be more specific than generic, 
while it increases the number rules, is probably a better solution more likely to 
be free of conflicts.

Again all feedback is welcome. Perhaps reality is not as black and white!

regards,
Will.
