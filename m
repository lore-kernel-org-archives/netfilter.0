From: Kerin Millar <kfm@plushkava.net>
Subject: Re: testing if a named set exists?
Date: Sat, 2 Oct 2021 03:57:07 +0100
Message-ID: <20211002035707.bf92730b8f667517ba53dfad@plushkava.net>
References: <CAOLfK3UBEvRg8AQbLibVo9xp6tZjaE7_S1+uDyhhbR7Nj_eYhA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        ifeHqVfNx/uLRWP5dIq2TFHeLfFQMpumm0MpNTkCbbE=; b=UjDgSMy406XU34U5
        VHFbeY6bytT8h5VOXMcl1DnL5vYzXSmnXmJPgJQT11+5gqFBB9S04jylewRS3aDU
        1sc1ekwPM10oCfdQz+W7MKACPvBIHt3xr9Pwo+fb0hMcprO8l0tad2A9OJ+DXhB7
        A0t2cxat9mDq2cibxWrizqbaPIGSgagxEFSGiMO7pJA52Mn2sOOTSGlvJNNryuk2
        Q+nOAwrDOHhQLatJE1gf1PnF5hu8QP3SOrqZVvIKoqUFEjsrWnxPFLbyNGV6AKQL
        i4BVnwXZcLkXfCmxNT4SwPxxITPyj0HOD27B/VXjjogEkj2IN7Um8V2Wst8TMEw4
        oEQLIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ifeHqVfNx/uLRWP5dIq2TFHeLfFQMpumm0MpNTkCb
        bE=; b=f8P/33s+g5YBlqRTlvV+c7ALmbLKW+jkSN26j4+ewgYoFTrdlDGDh6IAS
        AEiqtTbJE46d6voYHu9eBIoten70yacvOT6iejDjdy+OTNnLcMdNjP6UnKc5BPmh
        O91VdTyGQCAtixIwbAyePSmU+ZSUVqcJPhsjcG2fW2h+tZuZkKZ1m27snl0raYFi
        hLnUsRKJ/X31WYlU9PpKjnnlJ4I2BxvuodTu2Zv2n6i7BKldVpxD8pMdEP3FyUKm
        +N4b3S29PQLWAGStqDY8N5LN/WvnYUope8rmeoAHSyfIgozBTAVnRjpheFOluXic
        ds/pLxnx8WL+Y8xRNpibALlKDAn0g==
In-Reply-To: <CAOLfK3UBEvRg8AQbLibVo9xp6tZjaE7_S1+uDyhhbR7Nj_eYhA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Fri, 1 Oct 2021 20:16:17 -0500
Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:

> Hello,
> 
> I'd like to do something like the following:
> 
> if exists $named_set
>     nft add rule ip filter output ip daddr $named_set accept
> else
>     nft add rule ip filter output ip daddr $default_set accept
> 
> Does anyone know if I can accomplish this with nftables?
> 
> Thanks,
> 
> -m

The output of nft isn't particularly amenable to parsing unless it is instructed to produce JSON. The simplest way is to act upon the exit status value of a list set command.

if nft --terse list set ip filter "$named_set" >/dev/null 2>&1; then ...

-- 
Kerin Millar
