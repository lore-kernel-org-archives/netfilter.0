From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: ROUTE  woes ?
Date: Wed, 24 Aug 2005 08:18:54 +0200
Message-ID: <6360.32866682417$1124864382@news.gmane.org>
References: <Pine.LNX.4.61.0508240753570.16890@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0508240753570.16890@yvahk01.tjqt.qr>
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
To: 'Jan Engelhardt' <jengelh@linux01.gwdg.de>
Cc: 'Brent Clark' <bclark@eccotours.dyndns.org>, 'iptables' <netfilter@lists.netfilter.org>


> >  It must be used on the POSTROUTING chain of the mangle table.
> 
> Hm this sounds somewhat illogical: to route when "routing has already been
> done" (latin: postrouting).

http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-ROUTE

  Btw: It works.

  Regards,

- Ruben



