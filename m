From: henry <info@intellitree.com>
Subject: Performance isues related to a large number of iptables rules
Date: Thu, 13 Jan 2005 17:45:34 -0500
Message-ID: <41E6FA0E.2060707@intellitree.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am curious what is the maximum number of iptable rules that can be 
installed in a config before performance starts to be a problem. I have 
looked into the possibility of using firewall rules to block "bad" 
networks, but I have been told by most people that I have asked that 
this is bad idea.

Here are my thoughts. If a packet matches the 3rd rule, does it matter 
if there are 100,000 rules below it? 1,000,000 rules below it? If it 
doesn't, then does the number of allowable rules really have to do with 
how intelligently the rules are written, and more specifically, in what 
order?

For ban lists, if for example we wanted to allow everyone access to port 
80, except a list of bad networks, we would obviously have to put a rule 
to allow all connections on port 80 bellow our reject rules, otherwise 
iptbales would never get to the ban rules. So lets say that we have 
50,000 rules, 99% of them being reject rules, with a rule to allow port 
80 to all hosts at the bottom, and a rule to allow RELATED,ESTABLISHED 
packets at the top. When a host connects to us on port 80, iptables will 
have to go though all 50,000 rules (assuming this host doesn't match one 
of the reject rules) until it gets to the last one and decides to allow 
the packet. But then, subsequent packets will have a state of 
ESTABLISHED, and so they will match the first rule. In this case, only 
the first packet of most sessions will the firewall have to do a lot of 
work. Does this make any sense?

It seems to me, that for a reasonably powerful box, processing a large 
number of rules on what would become a small total percentage of packets 
shouldn't be a problem. Does anyone know what the real numbers are, and 
what numbers are feasible and what numbers aren't?

