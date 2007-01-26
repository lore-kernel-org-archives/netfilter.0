From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	=?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: iptables NEW TABLE request. WAS[Re: Catching un-DNAT'ed packets]
Date: Fri, 26 Jan 2007 13:21:12 +0200
Message-ID: <1169810473.8286.8.camel@localhost.localdomain>
References: <1167054030.16171.10.camel@localhost.localdomain>
	<459102EC.50402@plouf.fr.eu.org>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <459102EC.50402@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Hi.

After analizing the situation I have come to decide to request NEW TABLE
in iptables.

Considering the scheme at:

http://www.meteor.dp.ua/casper/firewill.pdf

how would I make a "feature request" to ask for, say, "mangle2" table
that is just after "nat" in POSTROUTING? The only reason for this move
is the need for ability to catch un-DNAT'ed packets with -j ULOG or
(better) to -j QUEUE.

В Вто, 26/12/2006 в 12:09 +0100, Pascal Hambourg пишет:
> Hello,
> 
> Pokotilenko Kostik a écrit :
> > 
> > Is it possible to catch un-DNAT'ed packets with iptables' -j ULOG
> > target?
> 
> I'm afraid no.
> 
> > Where does the un-DNAT occurs and is there table/chain that is
> > processed after un-DNAT?
> 
> In 2.4 kernels, when DNAT occurs in the PREROUTING chain, un-DNAT occurs 
> at the same place as (and in place of) the POSTROUTING chain of the 
> 'nat' table, and there is no chain after it. In 2.4 kernels >= 2.4.19, 
> when DNAT occurs in the OUTPUT chain, un-DNAT occurs after the INPUT 
> chain of the 'filter' table, and there is no chain after it either. I 
> suppose it has not changed in 2.6 kernels.
> 
> > The problem I have is that replay packets got catched with real source
> > address, not the one the client has initially connected to. I was
> > catching replay packets in mangle/POSTROUTING.
> 
> The POSTROUTING chain of the 'mangle' table is just before the un-DNAT 
> place.
> 
> 
-- 
Покотиленко Костик <casper@meteor.dp.ua>


