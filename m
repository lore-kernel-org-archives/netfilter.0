Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0571EC4332F
	for <netfilter@archiver.kernel.org>; Mon,  6 Nov 2023 14:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbjKFOY4 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 6 Nov 2023 09:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjKFOYy (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 6 Nov 2023 09:24:54 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1970FD47
        for <netfilter@vger.kernel.org>; Mon,  6 Nov 2023 06:24:49 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 3AD9F5C00C9
        for <netfilter@vger.kernel.org>; Mon,  6 Nov 2023 09:24:48 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute6.internal (MEProxy); Mon, 06 Nov 2023 09:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=awisse.ca; h=cc
        :content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1699280688; x=1699367088; bh=VA
        pOY6hx1btAgGO+ZowgxWM9VsPcw0S1SSdlj87BBmo=; b=PA2iiQjhIBjPDKe+25
        VgTz6SFB6IoiJFBxSiyXbEnZJOe2z1xZOqA+s6Um374EjnYm2G6XgvX5ptx3W2Iw
        F0CTsdsExUDmOgbtThbxm4Oc1ZVLZGnidhE/67Xc/8P3mZZtlZChdVWKD3PHm1gF
        JTHVS/4WjMIPgdK54vsDsGkABOLGY2WMzMKOo6zy7KO/L5n9ECK7g3dRoakyBQRN
        nI2TIa00EPdlMmBSRWTcICD1/kOL9APJl8U1UiC35gw1Gfna9Q2cI38ukl8yAoIy
        g1Jo9vO5iCHCBiDac9K7H8d7Z3jf9qs34g9fHUKHt2Q4iS/sjxZYfbk6zUnJGC6/
        SsOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1699280688; x=1699367088; bh=VApOY6hx1btAg
        GO+ZowgxWM9VsPcw0S1SSdlj87BBmo=; b=Gc5gdSvCKZeqiKC7/5XTSYf9dc1/U
        txWoG3jBlKy0pRBLBOq3gL50kybPSfjEDM4T7o/9yarKkSmovqSPZK/GqGuSvmiw
        B7uFKDKYwTcf8kpuVr6VwAXJczCXXHlaLVTjlznekDUDXkhgUpg2pF3ZznQKslkS
        NbdgX5+VDq10N3LN+w4S8X/rXmjRskSfeTZraZWvyf7SRKtZL+QuRjIXKuBF2WY1
        hqb3Y2oKCoLXjkw2UM6LwoPGqe6mk46XcV47ZQrQjcqA+V3Rs1Za2/7/7YiV+lWl
        G+8IdYavDn+AewQr3Vdw1DqZNPDGS+srGPdkjWb/w95RCuq2bb5fdvNjg==
X-ME-Sender: <xms:MPdIZT2OFXPRePRW24TnY_HQ0IDsxblcVJKMO7mfMoSc3xlocU4I5g>
    <xme:MPdIZSF6KqwCSFqAGprMUdTEOq5aB92bhu30Tb3eBrkzNuSwCuJm7wxZsS5uZZCOd
    2zqapO9oD1UzLqwEgI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddugedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehurhgvlhcuhghishhsvgdfuceonhhfsegrfihishhs
    vgdrtggrqeenucggtffrrghtthgvrhhnpeeffeeifeeuuefgteffffelkeetleeiheegue
    evkeekgfetveekffffgeeigeeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnfhesrgifihhsshgvrdgtrg
X-ME-Proxy: <xmx:MPdIZT7-m6N95rc3gndMYvq5DqE_I5wQRNIK7ctPfNPyy-U78mxDNQ>
    <xmx:MPdIZY1g4jm_9QB1OplZRSyJ_XZtSeOcyWl955Z4EPlOFW8LI9mvtA>
    <xmx:MPdIZWGOYYz5oI_kzQqiavPxNUcbebEyM1nV0tlPzUUMakhFL0rVbg>
    <xmx:MPdIZaSjQDfHLzwOstODSxKRVMoimXdzygxnCaEmZ5zE9aIyDtlvNg>
Feedback-ID: i096949d4:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E22E536A0076; Mon,  6 Nov 2023 09:24:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <cf193b51-1794-4405-b6ce-05712ac4b836@app.fastmail.com>
In-Reply-To: <ZUjp9jAAPYgOAIDq@calendula>
References: <74e3c950-e623-4b46-9186-8fe2230c9f9a@app.fastmail.com>
 <ZUjp9jAAPYgOAIDq@calendula>
Date:   Mon, 06 Nov 2023 09:24:27 -0500
From:   "Aurel Wisse" <nf@awisse.ca>
To:     netfilter@vger.kernel.org
Subject: Re: nftables expressions and operators
Content-Type: text/plain
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Thank you for the quick answer. That explains part of it. Still,

`tcp flags & (fin|syn|rst|ack) != syn` becomes
`tcp != syn / fin,syn,rst,ack`

and both expressions are interpreted as equal after parsing. Can you please point me to any documentation of operator expression syntax/precedence ?

On Mon, Nov 6, 2023, at 08:28, Pablo Neira Ayuso wrote:
> On Mon, Nov 06, 2023 at 08:11:09AM -0500, Aurel Wisse wrote:
> > Hi,
> > 
> > I am starting to learn nftables (only superficial previous experience with iptables) and I can't find certain syntax rules for expressions and operators in the wiki or the man page.
> > 
> > I am learning by listing the rulesets of certain predefined firewalls (fw4/OpenWRT, UFW) and I notice that certain listed rules contain operators which I can guess (hopefully correctly) from context and the original syntax in the imported file, but I would like to be sure in order not to make mistakes while building my own firewall.
> > 
> > Examples:
> > 
> > tcp flags & (fin|syn|rst|ack) != syn jump syn_flood
> > 
> > becomes
> > 
> > tcp flags syn / fin,syn,rst,ack jump syn_flood 
> 
> That is a bug in nftables v1.0.2, here with recent version it shows:
> 
> tcp flags != syn / fin,syn,rst,ack
> 
> > So, from context, commas without spaces around them are equivalent to logical or with precedence over "/", and "/" is somehow "!=" ?? . Where did the & (logical AND?) operator go?
> > 
> > This is just one example. I would like to learn the full operator syntax rules in nftables. Any ideas where I should look ? Do I have to dig into the source code ?
> > 
> > Thanks
> > 
> > Aurel
> > 
> > nftables v1.0.2 (Lester Gooch)
> > Pop-OS (6.5.6-76060506-generic)
> 
