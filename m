From: Nikolai Zhubr <n-a-zhubr@yandex.ru>
Subject: Re: netfilter+libvirt=(smth got broken?)
Date: Wed, 20 Mar 2013 17:41:37 +0400
Message-ID: <5149BC91.4090502@yandex.ru>
References: <5149AFD3.2070108@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1363786252;
	bh=FOSah6iwimWzfa/9OsyR4dza8XU69EPqENRlr3A5pPM=;
	h=Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=H/WFNTyymLJSkCMlUfiDiwazBxtXdynzgqay5hyPytNubaCwEUSfl6sWjAYKyOM6h
	 6pDTVfEds8qKAibHr8RjCKzgAX/kaH2HKf+HCcxnskJULOHB5nFyTFaf9PMasQgYRj
	 fVhxdblfcmdgwpOHwQpU/22K0QjsmxO1jRlNN/qY=
In-Reply-To: <5149AFD3.2070108@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: libvirt-users@redhat.com, netfilter@vger.kernel.org

Hello,
20.03.2013 16:47, I wrote:
[...]
> This all looks to me as if "--ctdir" argument somehow magically changed
> its meaning to the opposite, but this just cannot be! I'm out of ideas
> and looking for insights. Any hints appreciated quite a lot.

Some more searching over maillists yielded this (quite astonishing):

net/netfilter/xt_conntrack.c	
diff --git a/net/netfilter/xt_conntrack.c b/net/netfilter/xt_conntrack.c
index 2c0086a..481a86f 100644
--- a/net/netfilter/xt_conntrack.c
+++ b/net/netfilter/xt_conntrack.c
@@ -195,7 +195,7 @@ conntrack_mt(const struct sk_buff *skb, struct 
xt_action_param *par,
  		return info->match_flags & XT_CONNTRACK_STATE;
  	if ((info->match_flags & XT_CONNTRACK_DIRECTION) &&
  	    (CTINFO2DIR(ctinfo) == IP_CT_DIR_ORIGINAL) ^
-	    !!(info->invert_flags & XT_CONNTRACK_DIRECTION))
+	    !(info->invert_flags & XT_CONNTRACK_DIRECTION))
  		return false;

  	if (info->match_flags & XT_CONNTRACK_ORIGSRC)

So apparently, netfilter's behaviour was indeed reversed at some point, 
therefore libvirt stopped working properly.

I'd guess libvirt needs to be adapted then? Is it a known issue or 
should I fill in bugreport at Novell/Red Hat?


Thank you.
Nikolai
>
> Thank you.
> Nikolai
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>

