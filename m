From: bmcdowell@coxhealthplans.com
Subject: Range of IP's with Exclusions
Date: Wed, 12 Nov 2003 17:31:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <63340-2200311312223113559@coxhealthplans.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Google is not my friend today...

I'd like to do NAT for all but certain IP's on certain ports.  As it
stands now, my rules work but outside of my test environment they
could get quite hard to read.  I'd like to know if it is possible to
ammend a catch-all rule with exclusions to the IP match it uses.

For example this rule almost works:

iptables -t NAT -A PREROUTING -d 10.22.1.0/24 -j DNAT --to 10.22.2.2

Except, of course that it also DNAT's the router's response (as it
matches - being from 10.22.1.1).  The alternative that I've found
that does work is:

iptables -t NAT -A PREROUTING -d 10.22.1.3 -j DNAT --to 10.22.2.2
iptables -t NAT -A PREROUTING -d 10.22.1.4 -j DNAT --to 10.22.2.2
iptables -t NAT -A PREROUTING -d 10.22.1.5 -j DNAT --to 10.22.2.2
iptables -t NAT -A PREROUTING -d 10.22.1.6 -j DNAT --to 10.22.2.2
(etc.)

...but that is a bit of a pain.

I keep trying to type in something like:

iptables -t NAT -A PREROUTING -d 10.22.1.0/24,! 10.22.1.1 -j DNAT
--to 10.22.2.2

...but iptables complains.

Please help, this is shaping up to make for a really ugly ruleset...



