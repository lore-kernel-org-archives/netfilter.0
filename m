From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset Match equal function
Date: Thu, 25 Feb 2016 11:43:53 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1602251123320.26943@blackhole.kfki.hu>
References: <CAKJ7aR4efzGpDWwV+CKabbd9VaVLvOaMx43FFYQSWW5G_YQLFQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:user-agent:references
	:message-id:in-reply-to:from:from:date:date:received:received
	:received; s=20151130; t=1456396993; x=1458211394; bh=6sN8PW+R+H
	ZVTsoqhaHFm4dEbBXKj+VFactKybanOr8=; b=XI5oZnzU2dCu7oHr5dFJ+cYTRK
	A8moCrZSMUIv0mZblnpmYS2t92VdSTRAxpdTocE/7dgGx4GPBIvBANaLViu51xe5
	eH3xaSSkHphjChnP8VNs2ahQpxnxTIYFvd+lN/7kKBlPwaHuxOH5LTNsHUOZlpho
	ZhRUEN1chSlozye6o=
In-Reply-To: <CAKJ7aR4efzGpDWwV+CKabbd9VaVLvOaMx43FFYQSWW5G_YQLFQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gadre Nayan <gadrenayan@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 25 Feb 2016, Gadre Nayan wrote:

> So in my quest for understanding IPSETs I have traced the registration 
> to ADT functions from the Userland Netlink.
> 
> How are the Common functions registered, How are they called. They must 
> be called from the IPTABLES code, since I add my rule with a -set 
> --match-set option attaching my Ipset.
> 
> So where is IPSET common functions getting attached to IPTABLES ?
> 
>  49 /* Common functions */
>  50
>  51 static inline bool
>  52 hash_ip4_data_equal(const struct hash_ip4_elem *e1,
>  53                     const struct hash_ip4_elem *e2,
>  54                     u32 *multi)
>  55 {
>  56         return e1->ip == e2->ip;
>  57 }
>  58

From iptables, ipset is used via the set match and SET target. The 
corresponding kernel module (net/netfilter/xt_set.c) calls the ipset 
kernel API functions: ip_set_test(), ip_set_add(), ip_set_del().
The set belongs to a given set type and thus the functions call the set 
type variant specific kadt function (the types which support both IPv4 
and IPv6 has got two variants of kadt and low level functions).

The functions you refer above are called deep down from the type variant 
kadt function. Visually tracing the calls is the easiest in the case of 
the set:list type, just check list_set_kadt() in ip_set_list_set.c. In all 
other cases the common parts are collected in ip_set_bitmap_gen.h and 
ip_set_hash_gen.h. When those files are included, the real function names 
are built up by the HTYPE, MTYPE macros, that's a little bit tricky to 
follow: start with the bitmap types where just MTYPE is used.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
