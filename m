From: "linuxmc\@libero\.it" <linuxmc@libero.it>
Subject: Problem with hosts defined with mac address
Date: Tue, 29 Jul 2008 19:37:01 +0200
Message-ID: <K4S3LP$AB6FC28972B3BA60BCF0EBFB7274A446@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi to all,
i'm a problem with an iptables firewall working on OpenSuse 10.3 - Kernel 2.6.22. I have created the firewall using FirewallBuilder 2.0.13.
The problem is this. On my firewall i have these two rules

echo "Rule 9 (global)"
# 
# 
# 
$IPTABLES -N RULE_9
$IPTABLES -A INPUT  -m mac --mac-source 00:1B:38:B1:9A:57 -m state --state NEW  -j RULE_9 
$IPTABLES -A INPUT  -m mac --mac-source 00:0E:A6:C1:4E:18 -m state --state NEW  -j RULE_9 
$IPTABLES -A FORWARD  -m mac --mac-source 00:1B:38:B1:9A:57 -m state --state NEW  -j RULE_9 
$IPTABLES -A FORWARD  -m mac --mac-source 00:0E:A6:C1:4E:18 -m state --state NEW  -j RULE_9 
$IPTABLES -A RULE_9  -j LOG  --log-level info --log-prefix "RULE 9 -- ACCEPT "
$IPTABLES -A RULE_9  -j ACCEPT 

...that allow to go everywhere for the hosts with mac-address
00:1B:38:B1:9A:57 and 00:0E:A6:C1:4E:18....

and this rule (the last rule on the firewall)

# Rule 39 (global)
# 
echo "Rule 39 (global)"
# 
# 
# 
$IPTABLES -N RULE_39
$IPTABLES -A OUTPUT  -j RULE_39 
$IPTABLES -A INPUT  -j RULE_39 
$IPTABLES -A FORWARD  -j RULE_39 
$IPTABLES -A RULE_39  -j LOG  --log-level info --log-prefix "RULE 39 -- DENY "
$IPTABLES -A RULE_39  -j DROP 
#
that block all packet don't match the rule before.

When i try to navigate with these two host i experience very sloow speed and when i have investigated the log file of firewall i have discovered that some time the packets destinated to any web server (http://.... port 80) match the rule 9 (CORRECTLY).... and some time match rule 39 ( :(((( )

All the other hosts /networks defined in the firewall with ip-address instead mac-address works fine with internet.

Some ideas :))) Thank's to all.

Marco




