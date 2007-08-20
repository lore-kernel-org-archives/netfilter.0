From: <phil@ctekproducts.com>
Subject: Re: Re: Problem using -p udp
Date: Mon, 20 Aug 2007 10:20:09 -0400
Message-ID: <20070820142011.HEIH1911.dukecmmtao03.coxmail.com@dukecmmtao03>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: casper@meteor.dp.ua
Cc: netfilter@lists.netfilter.org

The kernel comes with the Axis SDK but is 2.6.19. Through menu config, I define all available net filter options as built in (not modules).

I have tried two versions of ip tables: 1.2.7 which is the version that Axis packages in their SDK and 1.3.7 which I pulled down from netfilter.org. In both cases "-p udp" causes the same error.




> 
> From: ??????????? ?????? <casper@meteor.dp.ua>
> Date: 2007/08/20 Mon AM 03:34:37 EDT
> To: Phil Sutter <phil@ctekproducts.com>
> CC: netfilter@lists.netfilter.org
> Subject: Re: Problem using -p udp
> 
> ? ???, 19/08/2007 ? 15:37 -0700, Phil Sutter ?????:
> > Hi,
> > 
> > I have been using Iptables on linux 2.4.26 for several years. I am
> > running on an Axis platform (cris architecture). Recently I started
> > moving my application to 2.6.19 and am using iptables 1.3.7. When I try
> > to use the sample rules shown below from my old environment, they fail
> > with an invalid parameter. The parameter causing the issue is the "udp"
> > associated with the "-p".  If I issue the same rule with a "-p tcp" they
> > work fine. Could someone explain why  "-p udp"  will not work?
> > 
> > /sbin/iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 80 -j
> > REDIRECT --to-port 6383
> > 
> > /sbin/iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 90 -j DNAT
> > --to 192.168.1.122:80
> 
> I have just tryed your rules on my Debian Etch box with kernel 2.6.18
> and iptables 1.3.6 and they worked out.
> 
> Did you built your kernel and iptables youself? This case you probably
> have forgotten to enable something.
> 
> -- 
> ??????????? ?????? <casper@meteor.dp.ua>
> 
> 



