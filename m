From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables NEW TABLE request. WAS[Re: Catching un-DNAT'ed packets]
Date: Fri, 26 Jan 2007 17:12:31 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701261707190.22295@yvahk01.tjqt.qr>
References: <1167054030.16171.10.camel@localhost.localdomain> 
	<459102EC.50402@plouf.fr.eu.org>
	<1169810473.8286.8.camel@localhost.localdomain>
	<Pine.LNX.4.61.0701261223430.22295@yvahk01.tjqt.qr>
	<1169814795.5004.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169814795.5004.11.camel@localhost.localdomain>
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
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?= =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Cc: netfilter@lists.netfilter.org, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>


>В Птн, 26/01/2007 в 12:24 +0100, Jan Engelhardt пишет:
>> >http://www.meteor.dp.ua/casper/firewill.pdf
>> >
>> >how would I make a "feature request" to ask for, say, "mangle2" table
>> >that is just after "nat" in POSTROUTING? The only reason for this move
>> >is the need for ability to catch un-DNAT'ed packets with -j ULOG or
>> >(better) to -j QUEUE.
>> 
>> And  -t nat -A POSTROUTING -m conntrack ! --ctstate DNAT
>> as a last rule won't do?
>
>This will (probably) catch packets that hasn't been DNAT'ed.
>BUT, the thing I need it to catch replay packets that has already passed
>"un-DNAT" procedure.

Ah, now I get what you mean with un-DNAT. (Unwrapping I'd say ;-)
Too bad, I don't see a way. But as an intermediate workaround, you could
copy ULOG/QUEUE to a new module, say, MYULOG/MYQUEUE and modify it so as to
display the original address pair (which should easily be possible with kernel
code).


	-`J'
-- 

