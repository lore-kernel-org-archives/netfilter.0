From: Patrick Schaaf <bof@bof.de>
Subject: Re: Rule matching question [iptables code structure]
Date: Sat, 10 May 2003 12:54:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030510105455.GA28426@oknodo.bof.de>
References: <df0d10589.10589df0d@student.mh.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <df0d10589.10589df0d@student.mh.se>
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
To: hewa0000@student.mh.se
Cc: netfilter@lists.netfilter.org

Hello Open Access Networks Project MidSweden University,

for each and every rule executed, iptables checks

	- source IP
	- destination IP
	- source interface
	- destination interface

These four checks are all of the comparator/mask kind, and when a rule
does not specify one of them, then a mask is selected that makes the
check always match. The checks are still made. The two IP matches
need eight byte in the rule (IP/mask), the two interface matches
each need a 32-byte interface/mask storage, a whopping two cachelines
that need to be read for each rule. This is most likely where you will
see the real overhead in accurate timings, once your rules stop to
fit the L1 cache of synthetic microtests.

Apart from those four matchings, checking for IP protocol, and checking
for IP fragmentation bits, is also always executed for each rule. But
that's small stuff. Finally, there is a list of additional match
criteria, which is only filled when there ARE additional criteria.
All matches except the above four, are of this selective type,
inclusing MAC address matches.

In the source, net/ipv4/netfilter/ip_tables.c, you can find the six
fixed checks in the function ip_packet_match(), called by the core
rule/list walking done in ipt_do_table().

best regards
  Patrick

