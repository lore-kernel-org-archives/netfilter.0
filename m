From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	=?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: iptables NEW TABLE request. WAS[Re: Catching un-DNAT'ed packets]
Date: Wed, 31 Jan 2007 15:01:22 +0200
Message-ID: <1170248482.4466.12.camel@localhost.localdomain>
References: <1167054030.16171.10.camel@localhost.localdomain>
	<459102EC.50402@plouf.fr.eu.org>
	<1169810473.8286.8.camel@localhost.localdomain>
	<1170086305.11285.4.camel@localhost.localdomain>
	<Pine.LNX.4.61.0701301145530.23321@yvahk01.tjqt.qr>
	<Pine.LNX.4.61.0701301901470.13737@yvahk01.tjqt.qr>
	<1170234888.4464.9.camel@localhost.localdomain>
	<45C07FC3.7060001@plouf.fr.eu.org>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C07FC3.7060001@plouf.fr.eu.org>
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

В Срд, 31/01/2007 в 12:38 +0100, Pascal Hambourg пишет:
> Hello
> 
> Pokotilenko Kostik a écrit :
> >>
> >>  -t nat -A POSTROUTING -m conntrack --ctstate DNAT --ctorigdst x.x.x.x
> > 
> > Just to make sure. This rule will match the packets with canntrack state
> > "DNAT" and whose original (before DNAT) destination address was x.x.x.x,
> > right?
> 
> This is my understanding. However I would recommend not to put such a 
> rule in the nat table because chains in the nat table do not see reply 
> packets.
> 
> > If I add -j ULOG to this rule what would be logged packet source address
> > for replay packet (Server->Client)? Original, that client was initially
> > connected to, or real, that was set during DNAT? 
> 
> The rule would log the current packet source address as usual, so it 
> won't show the original destination address unless you had put it in the 
> --log-prefix option.
> 
> > By the way does -m conntrack --ctstate DNAT --ctorigdst x.x.x.x match
> > request or replay packets or packets belonging to connection which was
> > originally made to x.x.x.x?
> 
>  From my understanding, the latter. "Original" and "reply" usually refer 
> to connection tracking, not individual packets. However I am not sure 
> whether it would match the first packet creating the connection, can 
> anyone confirm ?

Can someone confirm this? If there is a way to do what I want then there
is no need for new table in iptables.

-- 
Покотиленко Костик <casper@meteor.dp.ua>


