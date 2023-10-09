Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B36E95A91
	for <netfilter@archiver.kernel.org>; Mon,  9 Oct 2023 07:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345395AbjJIHbZ (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 9 Oct 2023 03:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234368AbjJIHbY (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 9 Oct 2023 03:31:24 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC3CAB
        for <netfilter@vger.kernel.org>; Mon,  9 Oct 2023 00:31:22 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 91F783200971;
        Mon,  9 Oct 2023 03:31:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 09 Oct 2023 03:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1696836679; x=1696923079; bh=+cXN3g0JtUDxm6ZIhYdHMN+VF
        Bm8oR4brEMYVffHHwI=; b=YEVEgBV722L5zKtsrFnklplwAiMcLeuOy8cpwLjMr
        NbeYo0N/73g5TyyJQeCfwwEeDoxUlpyYvPU5mMZOotTBaM17WlS/m1asSfVC5tgk
        kM3G1iKtgCXWuwkGC2PEqAaeebZ6DlZHp9QR4pxAUzrZp1p7nCjwRbnrfSzGeeoa
        qyKzdLZzS+AVCcRSntybRcW1Rk9+69Se733rN96a0dsbWIq7Fb/zxyUT5yX8pWqb
        M3DR8P8wXHMqXV9NmRhEBSAE8Mel21BUKZKWv05n9nQKQwd7VF75sPHYQ+GeHk1A
        B1EHw6qTjGXp20NaIGbMDax/JpT+Iv3CW9s9XugetccgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1696836679; x=1696923079; bh=+cXN3g0JtUDxm6ZIhYdHMN+VFBm8oR4brEM
        YVffHHwI=; b=fqxmXmGUmbDz7Lf9wl5pLx8TjoZbCgT6LX0A/6zrnmLa7jeg4sE
        5fWZ7trUjlIPIviqV09ljf1QX3Ft6FeiIWPT1HkJrIanynVg8n4F/1OkUra1/e/n
        BW9H/qFnr6fsOsbcLZzrNe4hlENBKMidQkGAv1577AcFQu76jLugr5prxyR9amKz
        H8HqRnXy3k5bSjj7Woa0UDmAtsk31BqPmeYZnEvoQcn/+bkDQLKGEHevMExlO69r
        xEjHsbfOKYnMO/xVn78jfLJ7Wm3Ue/xBVq116Oh8YxchnuIg/uxQA1otFyzWEjZQ
        NVWBXsH3hptCD/zrygVMPjyScsCPMuHbrFA==
X-ME-Sender: <xms:RqwjZQ8QdZ9Vg6RpE8bUlojc6YluIJh4xCr4B-JKxXUhNKlGMQdTBQ>
    <xme:RqwjZYtsDymnhV38_AeMcZfcXR8itatj6PWz70RnGthzCtumS9QNQshB0WvXXLcn0
    j3lICg4kye00ahj>
X-ME-Received: <xmr:RqwjZWBxmuiUBPwP-URGjfoLVUdism37Ws-NozFQjdkwBQAgm9l5BiSprmGfFHRIZ0H2R6mPhcad2RgC2RVH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrhedvgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfgjfhfogggtgfesth
    ejredtjfdtvdenucfhrhhomhepmfgvrhhinhcuofhilhhlrghruceokhhfmhesphhluhhs
    hhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepvdegvedtueehhffhhfevieelff
    ekieeljefhveeggedttdeuhffggeejgfdvjeegnecuffhomhgrihhnpehnfhhtrggslhgv
    shdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:RqwjZQfyAdXE4kTd0eYdCNcPGrlQavDEZ0LjwtuXyAlR6GwNqn72vw>
    <xmx:RqwjZVMb_t09_4t5l78qPjgDp938d-3_uVn06VUWusBduUgpubJ12w>
    <xmx:RqwjZanQKH0dXfiXBV85MalLYvLaXP929ynlOjXeQwapJNNbNXlAbQ>
    <xmx:R6wjZXVagBO-0YCL41LWJKg1Pdw3hDQ70juFuXVF_r2DKVCSx5mQCw>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Oct 2023 03:31:17 -0400 (EDT)
Date:   Mon, 9 Oct 2023 08:31:15 +0100
From:   Kerin Millar <kfm@plushkava.net>
To:     alasdairmuckart@catalyst.net.nz
Cc:     netfilter@vger.kernel.org
Subject: Re: Typo on 'Sets' wiki page
Message-Id: <20231009083115.5e56feda6573524e09412ca9@plushkava.net>
In-Reply-To: <87edi4s9s6.fsf@catalyst.net.nz>
References: <87edi4s9s6.fsf@catalyst.net.nz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Mon, 09 Oct 2023 17:23:03 +1300
Alasdair Muckart <alasdairmuckart@catalyst.net.nz> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
> 
> The wiki page at https://wiki.nftables.org/wiki-nftables/index.php/Sets seems
> to have an error.
> 
> Under the 'nftables.conf syntax' heading it says
> "When working with nftables.conf, you can define sets in a number of ways. You
> can then reference those sets later on using $VARIABLE_NAME notation."
> 
> Shouldn't that be an @, not a $?

It shouldn't be because the examples under that particular heading demonstrate how variables can be used to express the definition of an anonymous set. They are effective at the point that they are incorporated by a rule. All variables require the use of the $ sigil to be referenced, which is somewhat akin to parameter expansion in the shell. The @ sigil is used for matching sets that are formally defined and named by the use of the set keyword.

-- 
Kerin Millar
