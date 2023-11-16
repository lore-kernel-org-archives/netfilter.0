Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C133C197A0
	for <netfilter@archiver.kernel.org>; Thu, 16 Nov 2023 21:14:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjKPVO2 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 16 Nov 2023 16:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjKPVO1 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 16 Nov 2023 16:14:27 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49D3D4D
        for <netfilter@vger.kernel.org>; Thu, 16 Nov 2023 13:14:23 -0800 (PST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
        by mailout.nyi.internal (Postfix) with ESMTP id CAA8A5C0238;
        Thu, 16 Nov 2023 16:14:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 16 Nov 2023 16:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1700169259; x=1700255659; bh=x64WfvMTKYwKljKMvKFpNTK+I
        qTk/Lu/NXukYQBtXY4=; b=LncAlxw23cRlaaXpGUNp8HB8ZFOrcrzPtPV+TN+CS
        5MrYI8XuHMEA8nvfnpam+FszJkKsKECGo014oqbZwbfu7IIpla7ukSq7shAIFjbA
        tzKkbnvQ5RziNOXziFm0bFdTiAnPTCGynCzC9uua3KOU4Yubp7P+TdtvufvJDPEl
        FkksR8UYv9MO42+JI0sUmLPrYVvZVB8I0SJ+Vd0pM/ZI8bqgmQxtmV67DDIa4dzd
        9XPYD/40oKb9rtxvgbfqhzQcD+MCs6C+6YbYx9KX8SOt6ZTM2/uIHM/SPj8lacCv
        WD8FRlHU0/2WvDGgEZuPVRE9zdSgdQ1W69YIyUwT/LltQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1700169259; x=1700255659; bh=x64WfvMTKYwKljKMvKFpNTK+IqTk/Lu/NXu
        kYQBtXY4=; b=nyuo6unS040MPwkzwKioUPdy9xz1FfSl7s3iapVxz+rwl7s5EF5
        yAg7+f+8fxjfT1yzstbl+FlcEcAC5TdSssStntDd64HDhwf7h+efS7QAjVfzH9+J
        mHbmZTp1hCGk/ho/tJYV62QHdDhtXDyiDNQAfDJhs/jZ1HOruqL2XQ58j924/yc1
        b5yQPehguPYGzME0wpH3A1KNjlUecADkxAWzBgn3ylruPFKc5d9aKfhSndAcfqbd
        q+yANzhS6VflfSoKYuWw/eGT/IBatzjKrN9Mdy0lcVaG+1QDDlXDGS4k8r+0zqY6
        lQc6w/chXmlbQP5WoD5BjfoK+uiNWzgVgMQ==
X-ME-Sender: <xms:K4ZWZf-cR8wMGYXmV2ZPEwrWHSgPlCKsYr_nvRmrlItfIB5PG6by8g>
    <xme:K4ZWZbsOlXZcBajBrwittoY23RUkRpUNFuRG3wQzefV0bU3I4WOBqzhUlR29OUkfv
    rPeBVQCx9bBb7WL>
X-ME-Received: <xmr:K4ZWZdCfdx6Fchmk7WmX3vH2l_xvbGC2ERp53LgIZGY3As6xFY4muOMPBvZtS_7dosWl1nVkc-JdIpehiU5_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudefkedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfgjfhfogggtgfesthejredtjfdtvdenucfhrhhomhepmfgv
    rhhinhcuofhilhhlrghruceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepiefhteethfegfeetgfehueegfeefheekudekfeffjeeguedtgeegjedt
    ieehhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:K4ZWZbdXJ2vpUgDU3WY3EVS-xCjDAgMHlwp6Cd8z8z17PWHZEmJ6Og>
    <xmx:K4ZWZUOHhsMS4VzkoMB68SePGjcANXAYwicsbcT6TpFGausUn4zfow>
    <xmx:K4ZWZdlleGow3oE6PGG1DYN6I_AVDXLm5qzxYQ4K5krSy3dnhSYyrQ>
    <xmx:K4ZWZeXmCqsvi32Ob7JBROlkijdAEStoK7iDTNIz16dn2gymOUSgOg>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Nov 2023 16:14:18 -0500 (EST)
Date:   Thu, 16 Nov 2023 21:14:17 +0000
From:   Kerin Millar <kfm@plushkava.net>
To:     Brian Davidson <davidson.brian@gmail.com>
Cc:     netfilter@vger.kernel.org
Subject: Re: meta time/hour questions
Message-Id: <20231116211417.6e4d438986bebed9b8cf3fb8@plushkava.net>
In-Reply-To: <CAOoaxdH25O+QYWkzGQ7uOU5NLqROHu-WfpY4AZtVwb4V80=F=g@mail.gmail.com>
References: <CAOoaxdH25O+QYWkzGQ7uOU5NLqROHu-WfpY4AZtVwb4V80=F=g@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Wed, 15 Nov 2023 13:33:05 -0500
Brian Davidson <davidson.brian@gmail.com> wrote:

> The man page states that meta time and meta hour optionally accept
> seconds, but I get errors on v1.0.6 or v1.0.8. meta time doesn't even
> like the dash date separator.
> 
> # nft -c add rule inet t c meta hour "17:00:01" drop
> Error: syntax error, unexpected colon, expecting end of file or
> newline or semicolon
> add rule inet t c meta hour 17:00:01 drop
>                                  ^

17:00:01 is only accepted if double quoted, implying that the parser otherwise considers it to be something other than a string. This may or may not be a defect.

Note that the double quotes given to your shell accomplished nothing. Instead, compare the following two commands, the first of which is equivalent to the command that you attempted.

# nft -c 'add rule inet t c meta hour 17:00:01 drop'
# nft -c 'add rule inet t c meta hour "17:00:01" drop'

> # nft -c add rule inet t c meta time "2023-12-24 17:00:01" drop
> Error: syntax error, unexpected -, expecting end of file or newline or semicolon
> add rule inet t c meta time 2023-12-24 17:00:01 drop
>                                    ^

Similarly, the timestamp needs to be double quoted at the point that nft encounters it.

# nft -c 'add rule inet t c meta time "2023-12-24 17:00:01" drop'

In this instance, such a requirement is easier to fathom. Presumably, 2023-12-24 and 17:00:01 are otherwise considered as two tokens that are not connected with one another.

In both cases, I would describe the error reporting as being poor.

-- 
Kerin Millar
