From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [RFC][PATCH] net: Allow xt_owner in any user namespace
Date: Mon, 26 May 2014 10:28:24 +0200 (CEST)
Message-ID: <alpine.LSU.2.11.1405261025560.26860@nerf08.vanv.qr>
References: <537B7FF6.9050103@elastichosts.com> <877g5eg7wy.fsf@x220.int.ebiederm.org> <537D706D.4010303@1h.com> <87vbsus3wb.fsf_-_@x220.int.ebiederm.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87vbsus3wb.fsf_-_@x220.int.ebiederm.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Marian Marinov <mm@1h.com>, Alin Dobre <alin.dobre@elastichosts.com>, containers@lists.linux-foundation.org, Netfilter user mailing list <netfilter@vger.kernel.org>, Jan Engelhardt <jengelh@medozas.de>


On Sunday 2014-05-25 09:39, Eric W. Biederman wrote:
>
>Making this work is a little tricky as it really isn't kosher to
>change the xt_owner_match_info in a check function.

It is ok if you set aside members for kernel internal use, though
that is going to require a new match revision. That may be justified
since it would alleviate repeated calls to make_kuid for each packet.

>@@ -48,9 +75,10 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
> 		return ((info->match ^ info->invert) &
> 		       (XT_OWNER_UID | XT_OWNER_GID)) == 0;
> 
>+	net = sock_net(skb->sk);
> 	if (info->match & XT_OWNER_UID) {
>-		kuid_t uid_min = make_kuid(&init_user_ns, info->uid_min);
>-		kuid_t uid_max = make_kuid(&init_user_ns, info->uid_max);
>+		kuid_t uid_min = make_kuid(net->user_ns, info->uid_min);
>+		kuid_t uid_max = make_kuid(net->user_ns, info->uid_max);
> 		if ((uid_gte(filp->f_cred->fsuid, uid_min) &&
> 		     uid_lte(filp->f_cred->fsuid, uid_max)) ^
> 		    !(info->invert & XT_OWNER_UID))
