Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB56CDB483
	for <netfilter@archiver.kernel.org>; Tue, 17 Oct 2023 21:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjJQVbp (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 17 Oct 2023 17:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235048AbjJQVbk (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 17 Oct 2023 17:31:40 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FB110F
        for <netfilter@vger.kernel.org>; Tue, 17 Oct 2023 14:31:37 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qsrf5-0003D3-RO; Tue, 17 Oct 2023 23:31:35 +0200
Date:   Tue, 17 Oct 2023 23:31:35 +0200
From:   Florian Westphal <fw@strlen.de>
To:     sun miller <sunminlei@gmail.com>
Cc:     netfilter@vger.kernel.org
Subject: Re: nf_nat_icmp_reply_translation dropped icmp redirect packet
Message-ID: <20231017213135.GC5770@breakpoint.cc>
References: <CAPDoCBaxucyu2R_=UyHdr6L5wGno6qbYBbhnmxJDBH_7pbuFcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDoCBaxucyu2R_=UyHdr6L5wGno6qbYBbhnmxJDBH_7pbuFcg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

sun miller <sunminlei@gmail.com> wrote:
> I've noticed an issue during my testing, and I believe I've identified
> the root cause in the code. However, I'm not sure if it's a bug or a
> deliberate feature.

deliberate.

> Here's the testing process:
> 
> 1. When a request (src: A, dst: B) is sent to the machine (R) for some
> reason. R has ip_forward enabled (echo 1 >
> /proc/sys/net/ipv4/ip_forward).   // A, B, and R are in the same
> subnet.
> 
> 2. When there's no firewall enabled, R sends an ICMP redirect packet to A.
> 
> 3. When the firewall is enabled, R doesn't send an ICMP redirect
> packet to A   // tcpdump -i any icmp -nn shows no packet
> 
> I've traced the code path as follows:
> 
> 1. ip_rcv --> nf_hook_slow (PREROUTING) --> ... -->
> nf_nat_alloc_null_binding --> nf_nat_setup_info // ct->status = 256
> 2. ip_rcv_finish --> ip_forward --> ip_rt_send_redirect --> icmp_send
> --> icmp_push_reply --> ... --> nf_conntrack_attach // nskb ct->status
> = 256
> 3. then,  icmp_push_reply --> ip_push_pending_frames --> ... -->
> iptable_nat_ipv4_local_fn (OUTPUT) --> nf_nat_ipv4_fn -->
> nf_nat_icmp_reply_translation
> 
> Here's the relevant code:
> 
> 
> int nf_nat_icmp_reply_translation(...)
> {
>     // ...
>     inside = (void *)skb->data + hdrlen;
>     if (inside->icmp.type == ICMP_REDIRECT) {
>         // ct->status is 256, but IPS_NAT_DONE_MASK is 384
>         if ((ct->status & IPS_NAT_DONE_MASK) != IPS_NAT_DONE_MASK)
>             return 0;
>     // ...
> }
> 
> unsigned int nf_nat_ipv4_fn(...)
> {
>     // ...
>     switch (ctinfo) {
>     case IP_CT_RELATED:
>     case IP_CT_RELATED_REPLY:
>         if (ip_hdr(skb)->protocol == IPPROTO_ICMP) {
>             if (!nf_nat_icmp_reply_translation(skb, ct, ctinfo, ops->hooknum))
>                 return NF_DROP;   //  <------- DROP
>             else
>                 return NF_ACCEPT;
>         }
>     // ...
> }
> 
> 
> Because PREOUTING and OUTPUT have the same maniptype
> (NF_NAT_MANIP_DST), ct->status can't equal IPS_NAT_DONE_MASK.

Yes.

> I've tested this on multiple kernel versions, including 3.10, 5.15,
> and 6.5, and I can reproduce the issue.
> 
> Currently, I'm unsure if this is a bug or an intentional feature. If
> it's a feature, where can I find reference documentation that explains
> this behavior?

For some reason the comment that explains this got dropped when
code was moved around.  The original comment was:

/* Redirects on non-null nats must be dropped, else they'll
   start talking to each other without our translation, and be
   confused... --RR */

... which is exactly what this does, it drops the redirect
if it can't verify that no nat is in place in either direction.
