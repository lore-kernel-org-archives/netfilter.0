From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Query: On the ordering of stateful rules over stateless rules best
 practice
Date: Fri, 05 Jun 2009 23:33:57 +0100
Message-ID: <4A299D55.3080000@tssg.org>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi all,

I am just wondering is there a best practice when it comes to ordering your stateful rules?

Presumably you want to place stateful traffic filtering before your stateless traffic.

Rule 1: allow VPN access by stateful filtering
iptables -A INPUT -p tcp -s 0/0 -d vpnIP --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
Rule 2: allow VPN access by statelessfiltering
iptables -A INPUT -p tcp -s 0/0 -d vpnIP --dport 22 -j ACCEPT
Rule 3: a crazy rule!
iptables -A INPUT -p tcp -s 0/0 -d 0/0 -j ACCEPT

 From the above 3 rules it is obvious that there is a requirement that stateful rules come 
before stateless rules to ensure they are matched and that stateless rules are only matched 
in the event of stateful fallover (crash).

But I guess there are times when you want stateless rules first, particularly stateless DROP 
rules. For example, port scanning (tcp flag matches) and spoofed reserved ip addresses.

Is there any particular guides/documentation that outline best practices when ordering 
statefull and stateless rules?

My guess is there isn't and abstract best practice compliance guides like PCI DSS, 
NIST-800-41 etc provide no insight as to how administrates maintain their own low-level best 
practice rule orderings.

What are your experiences in ordering rule-sets? Is it more drive by instinct rather than 
hard and fast rules.

regards,
Will.
