From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: time module (PATCH)
Date: Wed, 14 Mar 2007 17:37:51 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703141736400.1199@yvahk01.tjqt.qr>
References: <20070313101604.6db3dc22.mailinglists@lucassen.org>
	<Pine.LNX.4.61.0703140310560.20730@yvahk01.tjqt.qr>
	<20070314111132.0fe3ad6c.mailinglists@lucassen.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070314111132.0fe3ad6c.mailinglists@lucassen.org>
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
To: netfilter@lists.netfilter.org


On Mar 14 2007 11:11, richard lucassen wrote:
>> >Unable to resolve dependency on linux/netfilter_ipv4/ipt_time.h.
>> >Anyone a hint?
>> You still have to apply ipt_time to the kernel.
>Just for information to the list (vanilla kernel 2.6.20.3). I sent a
>copy to Fabrice.
>
>[..]
>CC [M]  net/ipv4/netfilter/ipt_time.o
>net/ipv4/netfilter/ipt_time.c: In function ___match___:
>net/ipv4/netfilter/ipt_time.c:69: error: ___const struct sk_buff___ has
>no member ___named stamp___
>net/ipv4/netfilter/ipt_time.c: At top level:
>net/ipv4/netfilter/ipt_time.c:128: warning: initialization from
>incompatible pointer type
>net/ipv4/netfilter/ipt_time.c:128: warning: initialization from
>incompatible pointer type
>net/ipv4/netfilter/ipt_time.c:128: warning: initialization from
>incompatible pointer type
>make[4]: *** [net/ipv4/netfilter/ipt_time.o] Error 1
>make[3]: *** [net/ipv4/netfilter] Error 2
>make[2]: *** [net/ipv4] Error 2 
>make[1]: *** [net] Error 2
>make[1]: Leaving directory `/usr/src/linux-2.6.20.3'
>make: *** [debian/stamp-build-kernel] Error 2

Apply this on top (and perhaps forward it).

Signed-off-by: Jan Engelhardt <jengelh@gmx.de>

Index: linux/net/ipv4/netfilter/ipt_time.c
===================================================================
--- linux.orig/net/ipv4/netfilter/ipt_time.c
+++ linux/net/ipv4/netfilter/ipt_time.c
@@ -97,7 +97,6 @@ checkentry(const char *tablename,
             const struct xt_match *match,
 #endif
            void *matchinfo,
-           unsigned int matchsize,
            unsigned int hook_mask)
 {
 	struct ipt_time_info *info = matchinfo;   /* match info for rule */
#<EOF>

I did not actually run into the named stamp thing.

Jan
-- 

