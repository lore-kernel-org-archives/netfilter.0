From: Matthew Strait <quadong@users.sourceforge.net>
Subject: Re: [L7-filter-developers] Re: I found what I was looking for
 l7-filter.sf.net.
Date: Tue, 17 Feb 2004 13:44:23 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.60.0402171156160.3450@dsl093-017-216.msp1.dsl.speakeasy.net>
References: <20040209224943.27665.qmail@web11906.mail.yahoo.com>
 <20040215155502.GN15567@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040215155502.GN15567@sunbeam.de.gnumonks.org>
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
To: "lists.netfilter.org netfilter" <netfilter@lists.netfilter.org>, l7-filter-developers@lists.sourceforge.net

> - I can't see any locking in your code, and I don't think it's SMP safe

A question on this.  I've just read through Rusty's Unreliable Guide To
Locking:

http://www.kernel.org/pub/linux/kernel/people/rusty/kernel-locking/

I mostly understand, but I'm not quite sure what kind of code the match()
function is.  I think it's a softirq, which means (by the "Softirq A vs.
Softirq A" entry in the table in 5.1) that the appropriate spinlock to use
is spin_lock(), right?  But the only type of spin lock currently used in
net/ipv4/netfilter/*.c currently is spin_lock_bh(), so I'm not at all sure
what to do.

-matthew

