From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: curious about interface rule
Date: Mon, 20 Oct 2003 19:59:00 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310201956210.2100-100000@localhost.localdomain>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>


  a question i just saw posted on another list -- when you select
an interface in a rule, like "eth0", does that include all of its
aliases like eth0:0, eth0:1, and so on?

  i would have initially thought yes, but if each of these aliases
can have a different IP address associated with it, what happens
when you add a destination IP address selector such as
"-d 10.1.2.3", which is associated to only one of those aliases?

  or am i making any sense?

rday


