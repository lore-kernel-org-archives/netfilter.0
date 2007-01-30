From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables NEW TABLE request. WAS[Re: Catching un-DNAT'ed packets]
Date: Tue, 30 Jan 2007 19:02:32 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701301901470.13737@yvahk01.tjqt.qr>
References: <1167054030.16171.10.camel@localhost.localdomain>
	<459102EC.50402@plouf.fr.eu.org>
	<1169810473.8286.8.camel@localhost.localdomain>
	<1170086305.11285.4.camel@localhost.localdomain>
	<Pine.LNX.4.61.0701301145530.23321@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701301145530.23321@yvahk01.tjqt.qr>
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
Cc: netfilter@lists.netfilter.org


On Jan 30 2007 11:46, Jan Engelhardt wrote:
>>Excuse me for double asking, but is this the place for such a feature
>>request?
>
>At least it's not the wrong place.

For the mailinglist record, the solutions is:

  -t nat -A POSTROUTING -m conntrack --ctstate DNAT --ctorigdst x.x.x.x


Jan
-- 
ft: http://freshmeat.net/p/chaostables/

