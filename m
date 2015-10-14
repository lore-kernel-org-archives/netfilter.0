From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Kernel panic in 4.1.6 in nf_nat_redirect
Date: Wed, 14 Oct 2015 19:58:59 +0200
Message-ID: <20151014175859.GA3415@salvia>
References: <560D9DDD.8000601@seti.kr.ua>
 <20151004190543.GA17688@salvia>
 <56139E45.1000605@seti.kr.ua>
 <5613A136.7010203@seti.kr.ua>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5613A136.7010203@seti.kr.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew <nitr0@seti.kr.ua>
Cc: netfilter@vger.kernel.org

On Tue, Oct 06, 2015 at 01:23:50PM +0300, Andrew wrote:
> Maybe crash happens when packet comes to interface without assigned IP?

Do this resolved the problem for you?

Not telling here this is enough, obviously we shouldn't crash here.

> 06.10.2015 13:11, Andrew wrote:
> >Hi.
> >
> >I recompiled kernel with debug info enabled; here's gdb output:
> >
> >(gdb) list *nf_nat_redirect_ipv4+0x24
> >0x24 is in nf_nat_redirect_ipv4 (/var/testpoint/LEAF/source/i486-unknown-linux-uclibc/linux/linux-4.1/net/netfilter/nf_nat_redirect.c:60).
> >55
> >56            rcu_read_lock();
> >57            indev = __in_dev_get_rcu(skb->dev);
> >58            if (indev != NULL) {
> >59                ifa = indev->ifa_list;
> >60                newdst = ifa->ifa_local;
> >61            }
> >62            rcu_read_unlock();
> >63
> >64            if (!newdst)
> >
> >
> >04.10.2015 22:05, Pablo Neira Ayuso wrote:
> >>Could you please do the following?
> >>
> >>$ gdb net/netfilter/nf_nat_redirect.o
> >>$ list *nf_nat_redirect_ipv4+0x24
> >>
> >>And post the result, thanks.
> >
> >-- 
> >To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
