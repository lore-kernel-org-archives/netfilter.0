From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: DNAT, SNAT, port ranges and protocols
Date: Mon, 28 Oct 2002 06:33:56 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210280629240.7396-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>


  from the iptables man page, for both SNAT and DNAT targets,
we have the (similar) excerpts:

  --to-{source|destination}  ipaddr[-ipaddr][:port-port]

	which can specify a single new {source|destination} address,
	an inclusive range of IP addresses, and optionally, a 
	port range (which is only valid if the rule also specified
	-p tcp or -p udp)

so, what part of that requires the protocol specifier?  having
a range of IP addresses?  or just having a port range?  or both?
it's somewhat ambiguously worded.

rday


