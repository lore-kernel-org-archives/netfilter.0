From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 23:31:06 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD8158D.4040306@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 21 May 2011, Mr Dash Four wrote:

> > Yes, it was fixed, the last one ("Fix adding ranges to hash types") covers
> > that.
> >   
> I disagree! I am still experiencing the same problems I've had with ipset 6.4,
> despite those being "fixed". When I try to load a set containing about 15k
> elements I get variations on the same type of error below:
> 
> ipset v6.5: Error in line 3556: Element cannot be added to the set: it's
> already added

You used the timeout variant of the hash type, and a mistypeing slipped 
into the patch titled "Fix adding ranges to hash types", which made the 
patch ineffective for the timeout variants :-(. Please try the patch 
below: apply to the source tree of the ipset package, recompile the kernel 
modules, install them, remove from the running kernel and try again.

> The above happens when I try to use restore with the same file (i.e. the file
> contents does *not* change). On top of it all I also started getting this:
> 
> May 21 19:47:49 dmz1 kernel: [ 2103.322341] ipset[2827]: segfault at 0 ip
> 004f6655 sp bf9125f0 error 4 in libmnl.so.0.0.1[4f4000+4000]

I could not get such segfaults at all.

> libmnl is 1.0.1. I have then tried to play a bit with the hashsize value, but
> gave up when I reached 16777216! ipset though was still insisting that the
> hash size is "full":
> 
> maxelem 15000 hashsize 4194304

As I wrote previously, that is because you reached the limit of the 
maximal elements in the hash. Increase maxelem, it's a fixed parameter of 
the hash. The hashsize parameter is an initial value and auto-tuned 
(incremented) as required.

Best regards,
Jozsef

diff --git a/kernel/include/linux/netfilter/ipset/ip_set_ahash.h b/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
index 905e2ac..a099d40 100644
--- a/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
+++ b/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
@@ -835,7 +835,7 @@ type_pf_tadd(struct ip_set *set, void *value, u32 timeout, u32 flags)
 	}
 	ret = type_pf_elem_tadd(n, d, timeout);
 	if (ret != 0) {
-		if (ret == -EEXIST)
+		if (ret == -EAGAIN)
 			type_pf_data_next(h, d);
 		goto out;
 	}

-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
