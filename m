Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4355EC4332F
	for <netfilter@archiver.kernel.org>; Mon,  6 Nov 2023 15:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjKFPmZ (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 6 Nov 2023 10:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbjKFPmX (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 6 Nov 2023 10:42:23 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C956A184
        for <netfilter@vger.kernel.org>; Mon,  6 Nov 2023 07:42:20 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 6F9815C018F;
        Mon,  6 Nov 2023 10:42:18 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute6.internal (MEProxy); Mon, 06 Nov 2023 10:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=awisse.ca; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1699285338; x=1699371738; bh=lm
        2IhlvYs8zcvONbKTm5NWHs76c00EKrcGJPqBapcI4=; b=YfNsuiaQtcrLye6TNk
        ADdiOHsVjnxwGjIFtKi+zWxv9w3M9xVTMpb5UcER8MVCnziqw22t1D1Qu/Zy+1Up
        0VV4xLjPrHWCty+OpuzWR+rjMWh91NiKKtTSglGxI/44uEmyCzeOS6il9zCnfP1d
        DqYZiLV3qNYVVMoC8rxyeG2TXpxOeW3oVVfmkhAHpyGLYfqnqj23eNspd18PXxIT
        n+78bWDSGieQor8mFGdBIGLcsKaudFJMvP4nn+e21z+j1oUosT+Qf5sIt3E5i7lj
        H1VNCxy/KcC91lZ60OjcEzIVpakaVB7ZcaxHXSmoMcVlbpJK82/V5XtmO0BhkQta
        bNng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1699285338; x=1699371738; bh=lm2IhlvYs8zcv
        ONbKTm5NWHs76c00EKrcGJPqBapcI4=; b=lEX5yzg5qvWpHb2NsksOKo6OBLwha
        k0D4lWmg+JWjOzxUDE9S0lAL0HsP2wylXBMBCc+gnnE10fcOHVNH+6Tf6Dcn+1cE
        ORD1PbOJB1eojRY3KGdpWIRc4PqZqMxss8MXQ/h2kygYVMKAqpyPu+hegGGniaB4
        Pp6eemDc509QKgUSpV4is6G8xrNKeLTM25dWzJUkAAJ8Zn6ufOYVTgftlss0mzW0
        QM4+lcUWfMYGquqZQKEnOkaIlyThKE8Uh/Tl2njioFyLqWQPUAq8xKCdWseIeh6x
        XSz5s0eCB9oGjHh+wViipXyqXlVGrIv7rtGI/Cyd8GW0B/YoAYQJDjjvQ==
X-ME-Sender: <xms:WglJZQ45JSLcJet4Dq90rvXMc6bV9cYwy2PfQT0OJnIZOJUVzMuGBg>
    <xme:WglJZR77-f8C7ahYvpILMiYSEtWklChehCyISceRKMTIRH_Zid8cIZvNmE9yQeS8U
    WL14sL1Xs6IMqTuSh4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddugedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdetuhhrvghlucghihhsshgvfdcuoehnfhesrgifihhs
    shgvrdgtrgeqnecuggftrfgrthhtvghrnhepvdeihefgtddvueelveelhefhgfdufeegue
    ejfeehteeludeikefgheehjeeiuedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepnhhfsegrfihishhsvgdrtggr
X-ME-Proxy: <xmx:WglJZfc3FRA6Hu2dXSX1Q1fbIFagTjn-IEZeMR9__Berx9kPFPs5sw>
    <xmx:WglJZVIq6PceZI8DpNXBlJH5cmq_cf4j3hcTvezqmQY1XJPIQ3kIiA>
    <xmx:WglJZUJ1u3-kNfWWpHzjf1gFLDd-nMErxc6YPqPL3OCsnhyhP4-zyw>
    <xmx:WglJZbkzS5_hLswMlQylZ4hgOQ1MWlj38LeAw5uxw-nDmODrDyUzZg>
Feedback-ID: i096949d4:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2306936A0076; Mon,  6 Nov 2023 10:42:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <5632b8a7-086b-40f1-9c21-b1edab7d12d6@app.fastmail.com>
In-Reply-To: <X2O35_4Q47kM5H3VjpNF-lwnTiykyG7DN7EUFegqHKDH-OW-eHGVhsHOyH1F6hQ35mjsN56xJSJSOTIoFFqz0dHZIsy4CCoHSoqEtanfgn4=@proton.me>
References: <74e3c950-e623-4b46-9186-8fe2230c9f9a@app.fastmail.com>
 <ZUjp9jAAPYgOAIDq@calendula>
 <cf193b51-1794-4405-b6ce-05712ac4b836@app.fastmail.com>
 <X2O35_4Q47kM5H3VjpNF-lwnTiykyG7DN7EUFegqHKDH-OW-eHGVhsHOyH1F6hQ35mjsN56xJSJSOTIoFFqz0dHZIsy4CCoHSoqEtanfgn4=@proton.me>
Date:   Mon, 06 Nov 2023 10:41:34 -0500
From:   "Aurel Wisse" <nf@awisse.ca>
To:     Eric <evil.function@proton.me>
Cc:     netfilter@vger.kernel.org
Subject: Re: nftables expressions and operators
Content-Type: text/plain
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Thank you Eric. Very helpful indeed in order to better understand exported existing rules. 

On Mon, Nov 6, 2023, at 10:28, Eric wrote:
> On Monday, November 6th, 2023 at 06:24, Aurel Wisse <nf@awisse.ca> wrote:
>> Thank you for the quick answer. That explains part of it. Still,
>>
>> `tcp flags & (fin|syn|rst|ack) != syn` becomes
>> `tcp != syn / fin,syn,rst,ack`
>>
>> and both expressions are interpreted as equal after parsing. Can you please point me to any documentation of operator expression syntax/precedence ?
>
> This is not the answer you're looking for, but it may help...
>
> When I was first learning nft expressions I found it most helpful to 
> dump various rules in json format, where it's really easy to see the 
> expressions in the abstract syntax tree, and compare that with both the 
> input and output forms.  Also, you can clearly see the statements after 
> the "match" entries, like "counter", "set", "jump" and so on nicely 
> separated.
>
> (Oh, and in your OP, the "*logical* or/and" should be "*bitwise* 
> or/and", as the "flags" are a bit mask.)
>
> Input - if you don't have this form, then the json is far more 
> enlightening:
>     tcp flags & (fin | syn | rst | ack) == syn   jump syn_flood   
> comment "Rate limit TCP syn packets"
>
> Output (i.e., 'nft list ruleset | grep 'Rate limit TCP')
>     tcp flags syn / fin,syn,rst,ack jump syn_flood comment "Rate limit 
> TCP syn packets"
>
> $ nft -j list chain inet filter input | json_pp
> ...
>       {
>          "rule" : {
>             "chain" : "input",
>             "comment" : "Rate limit TCP syn packets",
>             "expr" : [
>                {
>                   "match" : {
>                      "left" : {
>                         "&" : [
>                            {
>                               "payload" : {
>                                  "field" : "flags",
>                                  "protocol" : "tcp"
>                               }
>                            },
>                            [
>                               "fin",
>                               "syn",
>                               "rst",
>                               "ack"
>                            ]
>                         ]
>                      },
>                      "op" : "==",
>                      "right" : "syn"
>                   }
>                },
>                {
>                   "jump" : {
>                      "target" : "syn_flood"
>                   }
>                }
>             ],
>             "family" : "inet",
>             "handle" : 210,
>             "table" : "filter"
>          }
>       },
> ...
