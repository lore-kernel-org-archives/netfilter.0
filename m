From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables to redir subdomain to certain ports
Date: Sat, 13 Jan 2007 17:11:08 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701131710290.19940@yvahk01.tjqt.qr>
References: <6acf2da00701130734r62945d54k9f6759dc95431e72@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6acf2da00701130734r62945d54k9f6759dc95431e72@mail.gmail.com>
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
To: Andras Izsof <dfandrew@gmail.com>
Cc: netfilter@lists.netfilter.org

>
> So if a request comes in for www.domain.com, then I need that to be
> redirected to port 80(apache), that's OK, but when dl.domain.com pops
> in, then port 81(thttpd) would be the target. Can this be done with
> iptables and if so how?

Only if www.domain.com has a distinct ip address from dl.domain.com. If 
that does not hold true, use Apache's mod_rewrite magic, because then 
you are actually working on l7 rather than l3.


	-`J'
-- 

