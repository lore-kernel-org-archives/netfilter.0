From: SBlaze <dagent.geo@yahoo.com>
Subject: Sorta OT - Basic shell script to see "real time" byte/pkt counter for iptables
Date: Tue, 9 Sep 2003 15:35:39 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030909223539.82306.qmail@web40206.mail.yahoo.com>
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
To: nf <netfilter@lists.netfilter.org>

Ok first off let me say that I am not an experienced coder/scripter

That being said this script I put together does the very basics of what I would
like to see. It sort of emulates a daemon like a approach in which the iptables
-vxnL (doesn't do NAT yet) command is looped in combination with sleep to
achieve a semi real time monitoring.

Like I said I'm not a great scripter and I would love the community to pick up
on this and mayb sort of port the approach to PHP to work via a web page(of
course it would be much  need to be much slower than the console).

At any rate check it out and feel free to make it your own but please observe
the GPL.

http://nixn00b.net/iptstat.sh

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

