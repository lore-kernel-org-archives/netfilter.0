From: "Kellogg, Chris" <Chris.Kellogg@dyncorp.com>
Subject: Anyone using DNAT on the OUTPUT chain?
Date: Mon, 10 Jun 2002 08:45:31 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <BC6421B0F2CC4C43897842092E0E00A94C149E@TX1EX1NT.dyncorp.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Hey, everyone.

Sorry to waste bandwidth, I'm getting frustrated by my inability to solve
this simple problem. :P

I am attempting to redirect all http traffic from one subnet destined to
anywhere except a short list of acceptable servers to a webserver that
displays an internet use policy.  I'm stuck on the last command I need to
give.  Since I need to do a great deal of filtering and ACCEPTs on these
packets before they reach this final rule, as shown here (See bottom of msg
for more rules):

iptables -A OUTPUT -s 192.168.0.0/24 -p tcp --dport 80 -t nat -j DNAT
--to-destination 192.168.4.4:80

When I attempt to put this rule in, I get the error message "iptables:
Invalid argument".

According to the manpage, the DNAT target is legitimate when in the nat
table on the PREROUTING and OUTPUT chains.  When I change the -A OUTPUT to
-A PREROUTING, the rule addition is accepted.  I've been known to miss
details, however, so please point out any problems in my reasoning - I'll
not be offended.

If anyone has any ideas on what I could do so this rule would work, I'd be
appreciative;  I'm also open to suggestions on alternate method to do what I
am attempting to do with this DNAT rule.

Cheers,

Chris.

Christopher M. Kellogg, GCFW
Infrastructure Administrator, DynCorp IT 
6500 West Freeway Suite 600, Fort Worth, TX
(817)570-1956 Ofc / (817)737-1638 Fax

# Accept connections to these servers:
iptables -A OUTPUT -s 192.168.0.0/24 -p tcp --dport 80 -d 192.168.1.5 -j
ACCEPT
iptables -A OUTPUT -s 192.168.0.0/24 -p tcp --dport 80 -d 192.168.1.25 -j
ACCEPT
iptables -A OUTPUT -s 192.168.0.0/24 -p tcp --dport 80 -d 192.168.1.116 -j
ACCEPT

# DNAT all other connections to the internet policy page:
iptables -A OUTPUT -s 192.168.0.0/24 -p tcp --dport 80 -t nat -j DNAT
--to-destination 192.168.4.4:80

