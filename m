Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8599C0018A
	for <netfilter@archiver.kernel.org>; Mon,  6 Nov 2023 13:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbjKFNLf (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 6 Nov 2023 08:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbjKFNLe (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 6 Nov 2023 08:11:34 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9668191
        for <netfilter@vger.kernel.org>; Mon,  6 Nov 2023 05:11:31 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 0E15A5C0117
        for <netfilter@vger.kernel.org>; Mon,  6 Nov 2023 08:11:31 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute6.internal (MEProxy); Mon, 06 Nov 2023 08:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=awisse.ca; h=cc
        :content-type:content-type:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1699276291; x=1699362691; bh=nzyYNWsdMIFY8PPUGfOxS8BDO
        i3IMvqCh+0AmSTSU6o=; b=bU3BOpAZc2G3lAsmqxaupSWxb55hWXz9ApynpH0+D
        mRZGUYki9d1ABakAx2Vv+GoZKOPaoj5OOPd7S0oI4FLWLCi0DRHImnkSkZ77N8VU
        6dGEiRC3vXBqP13Gj99lARNchrlz4COmmn8kSxM/Bo5CvSU1zmyoJzNju2pHkx8w
        mLOTzDdlkk7IsWG0JrXisT11VklAXSI27zON5O4bFYEMrBefCbr5lCX4Jw25WQnv
        1W2yKRSQ8U0xEJyR5+FVNdZ3GjRFNgsow3QLgsSc9JihcYaKR+xRfkLO6X1Z4HVN
        3PXFYHwkSLHXUAxKtXHadCQ9heNR6ztdYpYYU8R+SelsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1699276291; x=1699362691; bh=nzyYNWsdMIFY8PPUGfOxS8BDOi3IMvqCh+0
        AmSTSU6o=; b=QHr8OKf4jlM3hlhqBqRm6cXByXHC4TTI2TTZ6DM+m1KGxAQTWd9
        bDtbAU5gQ7Vpvn3FKPnZytIVKHha83wOjFn4e0+vSYKnvLNhdUN1B2633WiTrh9W
        SM3vaKQjAyLpsN3MePlUO3hg/2qLKs9XgkleSbwZEvw23XF89HR+SjjiXL/p0chJ
        Hfr92rJYLOHKR/PMFHpCvjsC1CDbaiBFgGqlOVNMH9lhJuPnj1+RfFMpmkk2hSFr
        +FVtYCHpIHIELb+s1gy4ahM65DlOKwa64LOjcnZm3WwQ/E/9e1SeK+2Co0rFuLIb
        e5sf/oCbUvRISy+L6uCNOYZ0QipvNjMt3Jw==
X-ME-Sender: <xms:AuZIZQVqQbmimf2BePULUfexGx4kGHUbmEc6GmqMBC-cqu13YHBVHw>
    <xme:AuZIZUm-rADUZshvZs1q4J91iISXPPgSbaaVL6CnhlPaq_nfphkdL036Y8Y6MuB2H
    DJXga_0TVj23AZu3pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddugedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedftehurhgvlhcuhghishhsvgdfuceonhhfsegrfihishhsvgdr
    tggrqeenucggtffrrghtthgvrhhnpeevudeiiefggeeuleekteffvdefkeeivddtleevue
    dugfelkefhkeehtdefteelteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehnfhesrgifihhsshgvrdgtrg
X-ME-Proxy: <xmx:AuZIZUbzLi1e78g8TjiXLONDq8Vav_R6vl9YTehFeJc85cvH3RfaFg>
    <xmx:AuZIZfXk-aiSl4OPcEosCFzXp1eU-iS1agf6mtnVdQ5tMl10of1fXA>
    <xmx:AuZIZaleOjoVdj9tlMKpbRu8PjXvLX57LB96Q6qy5kcxIgfFIPa8bw>
    <xmx:A-ZIZWwwUXxVWmUbc6lSq_5OawWXAh4Xljk4kjwR7Oq8NyLqYwZt7A>
Feedback-ID: i096949d4:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C6BCC36A0076; Mon,  6 Nov 2023 08:11:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <74e3c950-e623-4b46-9186-8fe2230c9f9a@app.fastmail.com>
Date:   Mon, 06 Nov 2023 08:11:09 -0500
From:   "Aurel Wisse" <nf@awisse.ca>
To:     netfilter@vger.kernel.org
Subject: nftables expressions and operators
Content-Type: text/plain
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

I am starting to learn nftables (only superficial previous experience with iptables) and I can't find certain syntax rules for expressions and operators in the wiki or the man page.

I am learning by listing the rulesets of certain predefined firewalls (fw4/OpenWRT, UFW) and I notice that certain listed rules contain operators which I can guess (hopefully correctly) from context and the original syntax in the imported file, but I would like to be sure in order not to make mistakes while building my own firewall.

Examples:

tcp flags & (fin|syn|rst|ack) != syn jump syn_flood

becomes

tcp flags syn / fin,syn,rst,ack jump syn_flood 

So, from context, commas without spaces around them are equivalent to logical or with precedence over "/", and "/" is somehow "!=" ?? . Where did the & (logical AND?) operator go?

This is just one example. I would like to learn the full operator syntax rules in nftables. Any ideas where I should look ? Do I have to dig into the source code ?

Thanks

Aurel

nftables v1.0.2 (Lester Gooch)
Pop-OS (6.5.6-76060506-generic)
