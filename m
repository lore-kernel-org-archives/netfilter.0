Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F202CDB474
	for <netfilter@archiver.kernel.org>; Tue, 17 Oct 2023 17:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343844AbjJQRJt (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 17 Oct 2023 13:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343894AbjJQRJm (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 17 Oct 2023 13:09:42 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8648B0
        for <netfilter@vger.kernel.org>; Tue, 17 Oct 2023 10:09:40 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d9ac31cb051so6371023276.3
        for <netfilter@vger.kernel.org>; Tue, 17 Oct 2023 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697562580; x=1698167380; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f24KFp13fZJthtdATYbp+XjJHvkXFSWMDqJnFZ42SN4=;
        b=abRpXzEii2RaGH731YcTVdvuFvHhumqG4xBeoGdYyaZMyJW74zekN8VLtUxlr9pRnQ
         p3qoQsP7O223coLQb2dY/tz3nO2qoWcJJVskP3qlFAXg0VkgN3ulpFAbSkaO35SEoF9D
         JqgIaV7YybNTWWB1ZqaBEcla7HZxt5ow+79polP3KlUVCL7uDndIxBV8/k/NuPKTjs7b
         fndunCXFoc5FX/Rz51Zfey7n+i64HhoGdRAKwgmsBK2EAsQd8xOXarISXIlXQPtp/PXl
         O/WRmBhU5m+q95b1Cy8QlveSH0Xr+EhISwsQ1QclaFINq6+z65nrUgPClZEvKCy1/Yja
         TGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697562580; x=1698167380;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f24KFp13fZJthtdATYbp+XjJHvkXFSWMDqJnFZ42SN4=;
        b=nv0bolzFVM74lOoWR9vySs5kbmVMbe9wiwnoqimNa8BQoG9DLLx2j6vJf+DN/KhrJX
         ACthSXwZSp6YuuIp8GgZB1fLf+MwCwTQGPrILUCq4ghbfMNQxwWB2QL2LlQC/SuakUpA
         xgtyMw9CnCt8yUQ0qEcGfdoAi8PA/rEManIHstTYKgXIB5xY+/uaAuz8zxvB5hgK9lK+
         +g/JgVWExBOrGcw35+IOyy3XLUZjCzNG+2vHxp2pofMtcgLunXJKYJv/15RR4BTMEx4Z
         GdStTNc24Hz63x4GRIajZiiyUbGwwygoNi45fBIy4uA6jQ90Pei8NC8a4GUXA0tvpHTa
         AS8g==
X-Gm-Message-State: AOJu0Yz3/lE5e6bV3f8o3aoao7QFASYzJ6gKsy9Bhc53+zXNoPBGONhh
        UCZatiAukduGbdvd+tEKz3Jr+jEvLjacrUpRr+f0dNxD9JVE3w==
X-Google-Smtp-Source: AGHT+IEL0aC2MZw7WG20c99TXQC8efSdzbptwwruC8oP3DPW9Xa5rMqM25nVE6pWKv8GOPAdBhgnl824b88Uy2HKXBo=
X-Received: by 2002:a25:df09:0:b0:d9a:c56f:a46e with SMTP id
 w9-20020a25df09000000b00d9ac56fa46emr2925744ybg.56.1697562579816; Tue, 17 Oct
 2023 10:09:39 -0700 (PDT)
MIME-Version: 1.0
From:   sun miller <sunminlei@gmail.com>
Date:   Wed, 18 Oct 2023 01:09:28 +0800
Message-ID: <CAPDoCBaxucyu2R_=UyHdr6L5wGno6qbYBbhnmxJDBH_7pbuFcg@mail.gmail.com>
Subject: nf_nat_icmp_reply_translation dropped icmp redirect packet
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hello,

I've noticed an issue during my testing, and I believe I've identified
the root cause in the code. However, I'm not sure if it's a bug or a
deliberate feature.

Here's the testing process:

1. When a request (src: A, dst: B) is sent to the machine (R) for some
reason. R has ip_forward enabled (echo 1 >
/proc/sys/net/ipv4/ip_forward).   // A, B, and R are in the same
subnet.

2. When there's no firewall enabled, R sends an ICMP redirect packet to A.

3. When the firewall is enabled, R doesn't send an ICMP redirect
packet to A   // tcpdump -i any icmp -nn shows no packet

I've traced the code path as follows:

1. ip_rcv --> nf_hook_slow (PREROUTING) --> ... -->
nf_nat_alloc_null_binding --> nf_nat_setup_info // ct->status = 256
2. ip_rcv_finish --> ip_forward --> ip_rt_send_redirect --> icmp_send
--> icmp_push_reply --> ... --> nf_conntrack_attach // nskb ct->status
= 256
3. then,  icmp_push_reply --> ip_push_pending_frames --> ... -->
iptable_nat_ipv4_local_fn (OUTPUT) --> nf_nat_ipv4_fn -->
nf_nat_icmp_reply_translation

Here's the relevant code:


int nf_nat_icmp_reply_translation(...)
{
    // ...
    inside = (void *)skb->data + hdrlen;
    if (inside->icmp.type == ICMP_REDIRECT) {
        // ct->status is 256, but IPS_NAT_DONE_MASK is 384
        if ((ct->status & IPS_NAT_DONE_MASK) != IPS_NAT_DONE_MASK)
            return 0;
    // ...
}

unsigned int nf_nat_ipv4_fn(...)
{
    // ...
    switch (ctinfo) {
    case IP_CT_RELATED:
    case IP_CT_RELATED_REPLY:
        if (ip_hdr(skb)->protocol == IPPROTO_ICMP) {
            if (!nf_nat_icmp_reply_translation(skb, ct, ctinfo, ops->hooknum))
                return NF_DROP;   //  <------- DROP
            else
                return NF_ACCEPT;
        }
    // ...
}


Because PREOUTING and OUTPUT have the same maniptype
(NF_NAT_MANIP_DST), ct->status can't equal IPS_NAT_DONE_MASK.

I've tested this on multiple kernel versions, including 3.10, 5.15,
and 6.5, and I can reproduce the issue.

Currently, I'm unsure if this is a bug or an intentional feature. If
it's a feature, where can I find reference documentation that explains
this behavior?
