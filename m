From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: compiling nat_sip and ip_conntrack_h323 and pptp_conntrack_nat
Date: Tue, 18 Oct 2005 12:07:59 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510181159370.7403@filer.marasystems.com>
References: <023f01c5d2ec$6517f1b0$0100a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <023f01c5d2ec$6517f1b0$0100a8c0@newlife>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@lists.netfilter.org

On Mon, 17 Oct 2005, Ming-Ching Tiew wrote:

> CC [M]  net/ipv4/netfilter/ip_conntrack_sip.o
>  CC [M]  net/ipv4/netfilter/ip_nat_sip.o
> net/ipv4/netfilter/ip_nat_sip.c: In function `ip_nat_sip':
> net/ipv4/netfilter/ip_nat_sip.c:97: warning: ISO C90 forbids mixed declarations and code

There is a C99 declaration there...

What compiler are you using?

> net/ipv4/netfilter/ip_conntrack_h323_h225.c: In function `h225_parse_connect_uuie':
> net/ipv4/netfilter/ip_conntrack_h323_h225.c:111: error: too few arguments to function `ip_conntrack_expect_alloc'
> net/ipv4/netfilter/ip_conntrack_h323_h225.c:135: warning: implicit declaration of function `ip_conntrack_expect_free'

Looks like the h323 helper needs to be updated to work with the current 
kernels.

The first should read ip_conntrack_expect_alloc(ct) instead of 
ip_conntrack_expect_alloc().  (ct within the parantesis).

The second line calling ip_conntrack_expect_free probably should just be 
deleted. Does not seem to be needed anymore.

> And I can't apply pptp_conntrack_nat :-
>
> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
> cannot apply (1 rejects out of 7 hunks)

Same as for h323. Patch needs to be updated to work with current kernels.

For pptp can try to select "force" and then apply the failed pieces 
manually usinga text editor (see the created .rej file for details on what 
to change). After that you probably need similar manual massaging to get 
it to compile as for the h323 patch.

Regards
Henrik

