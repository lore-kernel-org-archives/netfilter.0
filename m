From: "Earl A.Killian" <netfilter@lists.killian.com>
Subject: Re: iptables analyzer
Date: Tue, 28 Oct 2003 06:14:29 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16286.31173.508541.794389@teak.killian.com>
References: <16278.57173.146033.350478@teak.killian.com>
	<20031028105301.92009.qmail@web40206.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031028105301.92009.qmail@web40206.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

Actually I'm planning something static, independent of the traffic
received by the host.

Basically, it would take iptables-save output and make a list of all the
* protocols used (the -p's)
* the src addresses used (the -s's)
* the dst addresses used (the -d's)
* the src ports used (the --sport's)
* the dst ports used (the --dport's)
* the input interfaces used (the -i's)
* the output interfaces used (the -o's)
* the --icmp-types used
then augment each of the above lists with an "other" entry, and then
and then simulate every combination of the above and
* the 4 conntrack states
* the possible ip flags (-f)
* the possible tcp flags
against the rules, and print a table of the final target (ACCEPT or
DROP).

The output would be big, but some intelligent pruning (use of '*' to
merge multiple rows when possible) should make it more manageable.

One use is to simply have paranoid humans review the output.
Another use is to run it on two different iptable rule sets and
compare what's different (e.g. if you reorder rules for efficiency,
this would check that you haven't inadvertently changed the firewall
semantics).

