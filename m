From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset causing a kernel crash
Date: Mon, 9 Sep 2013 18:23:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1309091822020.21828@blackhole.kfki.hu>
References: <522D8008.4080609@univ-nantes.fr> <alpine.DEB.2.00.1309091219320.19930@blackhole.kfki.hu> <522DC7E4.4090302@univ-nantes.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <522DC7E4.4090302@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Juet <yoann.juet@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

On Mon, 9 Sep 2013, Yoann Juet wrote:

> On 09/09/13 12:51, Jozsef Kadlecsik wrote:
> > On Mon, 9 Sep 2013, Yoann Juet wrote:
> > 
> > > We've experienced a recent kernel crash on a captive portal server running
> > > debian/wheezy with a standard kernel 3.2.0-4. The crash seems to be
> > > related to
> > > ipset that we're using to check bitmaps {ip,mac}. It has not been seen
> > > before
> > > on this production server.
> > 
> > A cleanup part is missing for the bitmap:ip,mac type with timeout in the
> > 3.2 kernel tree:
> > 
> > diff --git a/net/netfilter/ipset/ip_set_bitmap_ipmac.c
> > b/net/netfilter/ipset/ip_set_bitmap_ipmac.c
> > index 56096f5..725e431 100644
> > --- a/net/netfilter/ipset/ip_set_bitmap_ipmac.c
> > +++ b/net/netfilter/ipset/ip_set_bitmap_ipmac.c
> > @@ -333,7 +333,11 @@ bitmap_ipmac_tlist(const struct ip_set *set,
> >   nla_put_failure:
> >   	nla_nest_cancel(skb, nested);
> >   	ipset_nest_end(skb, atd);
> > -	return -EMSGSIZE;
> > +	if (unlikely(id == first)) {
> > +		cb->args[2] = 0;
> > +		return -EMSGSIZE;
> > +	}
> > +	return 0;
> >   }
> > 
> >   static int
> > 
> > However, the missing part caused incomplete listing only. This case seems
> > to be different. So does the patch above help?
> 
> I'll make a try. I keep you in touch if the crash re-appears.

Re-checking again, you need the next patch:

diff --git a/kernel/net/netfilter/ipset/ip_set_core.c b/kernel/net/netfilter/ipset/ip_set_core.c
index b5d380c..c3eabfd 100644
--- a/kernel/net/netfilter/ipset/ip_set_core.c
+++ b/kernel/net/netfilter/ipset/ip_set_core.c
@@ -1148,6 +1148,7 @@ release_refcount:
 	if (ret || !cb->args[2]) {
 		pr_debug("release set %s\n", ip_set_list[index]->name);
 		ip_set_put_byindex(index);
+		cb->args[2] = 0;
 	}
 out:
 	if (nlh) {

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
