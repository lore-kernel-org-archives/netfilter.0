From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd internal cache growing indefinitely in active-active
 setup
Date: Sun, 17 Oct 2021 16:41:21 +0200
Message-ID: <YWw2EbdeAPMXX8iJ@salvia>
References: <CANQxXxoHEb=v8WoFPsr29cNPBYo5NYAOH4UoPNkDUX8DRk_jrg@mail.gmail.com>
 <YUkvvO3HnXVJiV+R@salvia>
 <CANQxXxpDvsyZ-LGd1tYx8xBwM+JJ09NyBBZ=X8PRtiH72G+0Vw@mail.gmail.com>
 <CANQxXxqt48dD2kUSj8YYicKfvSKWtgi-RQX1=OU8p02uyt157A@mail.gmail.com>
 <b686a9f6-7147-63bf-5db8-ae9214b854a5@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="uTNntr35b4hLo58f"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b686a9f6-7147-63bf-5db8-ae9214b854a5@netfilter.org>
List-ID: <netfilter.vger.kernel.org>
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Matt Mercer <matt.mercer@menlosecurity.com>, netfilter@vger.kernel.org


--uTNntr35b4hLo58f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Oct 11, 2021 at 02:27:51PM +0200, Arturo Borrero Gonzalez wrote:
> On 10/4/21 9:07 PM, Matt Mercer wrote:
> > Hi Pablo,
> > 
> > We tested a very silly patch to internal_cache_ct_event_del() that
> > skips the CTD_ORIGIN_INJECT check:
> > 
> 
> Hi Matt,
> 
> wanted to chime in to confirm that I've been experiencing the same issue
> you're describing.
> 
> There were only 2 differences in our setup compared to yours:
> * both internal & external caches were disabled
> * using TCP as transport method
> 
> I had problems debugging the setup, because the firewall was a live system,
> receiving 6Gbps of traffic. Obtaining a clear pattern was difficult.
> I couldn't replicate the problem when replicating the setup on a system with
> more "manageable" traffic. So I only observed the bug when conntrackd was
> under high load (which probably means: under "real world" traffic patterns).
> 
> Eventually lost my time budget to work on this (and interest) and moved on...
> 
> So, just wanted to confirm that this bug exists, thanks for the report!
> We should probably track something on https://bugzilla.netfilter.org/ for
> the time being.

I'm attaching a patch to remove the conntrack ID from the cache, with
this patch, the next new entry would remove an existing stale entry in
the cache. In the assymmetric path setup you are looking into, races
might happen between packet updating conntrack states and the
synchronization messages itself. Moreover, the notrack mode might also
lose events, skipping the conntrack ID check provides a way to remove
stale entries.

--uTNntr35b4hLo58f
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="x.patch"

diff --git a/src/cache-ct.c b/src/cache-ct.c
index fe01e165516c..f56e450e6cf2 100644
--- a/src/cache-ct.c
+++ b/src/cache-ct.c
@@ -90,21 +90,12 @@ cache_ct_hash(const void *data, const struct hashtable *table)
 	return ret;
 }
 
-/* master conntrack of expectations have no ID */
-static inline int
-cache_ct_cmp_id(const struct nf_conntrack *ct1, const struct nf_conntrack *ct2)
-{
-	return nfct_attr_is_set(ct2, ATTR_ID) ?
-	       nfct_get_attr_u32(ct1, ATTR_ID) == nfct_get_attr_u32(ct2, ATTR_ID) : 1;
-}
-
 static int cache_ct_cmp(const void *data1, const void *data2)
 {
 	const struct cache_object *obj = data1;
 	const struct nf_conntrack *ct = data2;
 
-	return nfct_cmp(obj->ptr, ct, NFCT_CMP_ORIG) &&
-	       cache_ct_cmp_id(obj->ptr, ct);
+	return nfct_cmp(obj->ptr, ct, NFCT_CMP_ORIG);
 }
 
 static void *cache_ct_alloc(void)

--uTNntr35b4hLo58f--
