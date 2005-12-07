From: BERTRAND =?iso-8859-1?Q?Jo=EBl?= <mt@systella.fr>
Subject: Re: U60 and masquerading
Date: Wed, 7 Dec 2005 21:21:31 +0100
Message-ID: <20051207202131.GA18486@rayleigh.systella.fr>
References: <20051207175426.GA16442@rayleigh.systella.fr>
	<1133986439.43974287562fb@zitmail.uni-paderborn.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1133986439.43974287562fb@zitmail.uni-paderborn.de>
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
Content-Transfer-Encoding: 7bit
To: stefanb@zitmail.uni-paderborn.de
Cc: netfilter@lists.netfilter.org

On Wed, Dec 07, 2005 at 09:13:59PM +0100, stefanb@zitmail.uni-paderborn.de wrote:
> Hello,
> this looks much like the same problem I have on my U10 with kernels 2.6.9 and
> up. Supposedly masqueraded connections show up as unreplied in
> /proc/net/ip_conntrack, and /proc/net/ip_conntrack_expect is empty.
> 
> Things are working fine for me using kernel 2.6.8.1. I haven't tested 2.4.x.
> There is no /proc/net/ip_conntrack_expect in 2.6.8.1, so I suspect this change
> introduced a bug.
> 
> Unfortunately, I do not know how to get it working except by using an older kernel.

	Hello,

	I'm not sure that is the same trouble because I use the 2.6.14.2 kernel on
	a U1E workstation and netfilter works fine (with very hard iptable
	configuration ;-) )

	Regards,

	JKB

