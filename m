From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables NEW TABLE request. WAS[Re: Catching un-DNAT'ed packets]
Date: Fri, 26 Jan 2007 12:24:46 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701261223430.22295@yvahk01.tjqt.qr>
References: <1167054030.16171.10.camel@localhost.localdomain>
	<459102EC.50402@plouf.fr.eu.org>
	<1169810473.8286.8.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169810473.8286.8.camel@localhost.localdomain>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?= =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Cc: netfilter@lists.netfilter.org, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>


>http://www.meteor.dp.ua/casper/firewill.pdf
>
>how would I make a "feature request" to ask for, say, "mangle2" table
>that is just after "nat" in POSTROUTING? The only reason for this move
>is the need for ability to catch un-DNAT'ed packets with -j ULOG or
>(better) to -j QUEUE.

And  -t nat -A POSTROUTING -m conntrack ! --ctstate DNAT
as a last rule won't do?


	-`J'
-- 

