From: Michael Schachtebeck <schachti@rbw.goe.net>
Subject: Re: limit extension
Date: Wed, 20 Jul 2005 17:03:51 +0200
Message-ID: <42DE67D7.5040804@rbw.goe.net>
References: <42DD417F.4090804@rbw.goe.net> <42DE5C90.70603@rbw.goe.net>
	<20050720150118.GB15339@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050720150118.GB15339@zion.homelinux.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Am 07/20/2005 04:45 PM schrieb Sven Schuster:

> AFAIK, when you add, delete, replace a iptables rule, at first the 
> current rules are "downloaded" from kernel, the changes are made in
> user space, then the ruleset is "uploaded" again to the kernel. 
> When uploading, I think that all the internal data structures for
> the matches are deleted and then allocated freshly. That's why you
> see this behaviour in your testing. When your cronjob runs (or you
> run it manually) all the data structures get deleted and newly
> allocated, thus the limit rule matches again.

But on the other hand, the counter correctly shows the number of packets
that matched the rule; iptables -t nat -vnL PREROUTING says:

9 540 REDIRECT tcp -- eth1 * 10.10.10.69 0.0.0.0/0 tcp spts:1024:65535
dpt:80 flags:0x16/0x02 limit: avg 1/day burst 1 redir ports 5000

So it would be very strange if the rules were extracted to user space,
rewritten/modified, "uploaded" to the kernel with the correct counters
for the remaining rules, and then, the rules do not look to this
counters.  ;-)

Why then save and restore the counters, if they are not used by the rules?

Michael.
-- 
PGP Public Key: http://www.num.math.uni-goettingen.de/schachte/key.asc
Key fingerprint: C474 8B85 17C0 0232 E439 0FBF 2451 E452 293C D798

