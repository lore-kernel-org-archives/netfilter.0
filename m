Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E50CDB465
	for <netfilter@archiver.kernel.org>; Thu, 19 Oct 2023 08:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344971AbjJSIrr (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 19 Oct 2023 04:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjJSIrp (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 19 Oct 2023 04:47:45 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C46312D
        for <netfilter@vger.kernel.org>; Thu, 19 Oct 2023 01:47:42 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qtOgu-0006ct-Gm; Thu, 19 Oct 2023 10:47:40 +0200
Date:   Thu, 19 Oct 2023 10:47:40 +0200
From:   Florian Westphal <fw@strlen.de>
To:     sun miller <sunminlei@gmail.com>
Cc:     Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: nf_nat_icmp_reply_translation dropped icmp redirect packet
Message-ID: <20231019084740.GB12544@breakpoint.cc>
References: <CAPDoCBaxucyu2R_=UyHdr6L5wGno6qbYBbhnmxJDBH_7pbuFcg@mail.gmail.com>
 <20231017213135.GC5770@breakpoint.cc>
 <CAPDoCBYC61XDROuR4q7zX=MggF2nfG76_UxkrX5wVDXMxvoaXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDoCBYC61XDROuR4q7zX=MggF2nfG76_UxkrX5wVDXMxvoaXA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

sun miller <sunminlei@gmail.com> wrote:
> I'm sorry, I forgot to cc netfilter in my previous reply, so I'm
> sending it again. I apologize for my oversight. I hope I didn't
> disturb you.
> 
> > For some reason the comment that explains this got dropped when
> > code was moved around.  The original comment was:
> >
> > /* Redirects on non-null nats must be dropped, else they'll
> >    start talking to each other without our translation, and be
> >    confused... --RR */
> >
> > ... which is exactly what this does, it drops the redirect
> > if it can't verify that no nat is in place in either direction.
> 
> Thank you for your reply and explanation.
> 
> I searched globally for ip_rt_send_redirect and icmp_send(skb,
> ICMP_REDIRECT, ICMP_REDIR_HOST...), and it seems that the related code
> paths do not meet ct->status & IPS_NAT_DONE_MASK == IPS_NAT_DONE_MASK.
>
> Does this mean that icmp_redirect caused by the same subnet request
> packet will be DROPPED when the firewall is enabled? Does this break
> the correct functionality that the kernel should have originally? (Of
> course, this functionality seems to be unimportant from my limited
> work experience.)
> 
> Additionally, if it's convenient for you, would you provide an example
> scenario for the code comment that mentions "they'll start talking to
> each other without our translation, and be confused"?  I am unable to
> think of any related issues.

A -> B, A sends packet to R.  R has a DNAT rule to redirect to C
(or redirect to R).

If we let icmp redirect through, this won't work.
