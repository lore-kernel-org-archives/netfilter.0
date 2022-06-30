From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Creating a map with libnftnl
Date: Thu, 30 Jun 2022 16:06:28 +0100
Message-ID: <20220630160628.f7bd5dd1f234d834be19aed6@plushkava.net>
References: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
        <20220630160303.ed722cd8c3a70facdf133f14@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1656601591; x=
        1656687991; bh=7B0yVAJz13s/7HLIP01YxxNNJ18aWl13HovjyAhg/RE=; b=F
        RlJdn5YVQUiZmyp5cACypyO3Kx4YT9Y9b7yUURtCvR2TzTBJL48dznGA4J/CuZJl
        vQYhG3ey61JtoSz1njSXWSr2tYS1mzvRDoP/8fAILXi1zgJEu5g9UtiBrwwH138f
        NvJ+7StGybxfj0PidDt9i6XmgA7IoTKpkiWhyMCqVmwmYLh5UWv5BNLtOZXu77Eg
        7G8xFwyov9QgVolD7lXYcwu37ZFv4n9Ebehc582dy+s1s0oBSvYFc0NIQ+wPgEC/
        6GxSCSvdJhrvXM+Sx84MscbswXJFq6yRN3e7KrcSqFb/SWv8yfpP2faeDJyMisiP
        ddMgzTOB9PV5v1qrVks9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656601591; x=
        1656687991; bh=7B0yVAJz13s/7HLIP01YxxNNJ18aWl13HovjyAhg/RE=; b=w
        BW1DsVx65CWhO8OxlHE8mTc+ilcUfxrTMiCIfj1QDpnM8hk65CGPetaWefW7l+Q0
        9ZMP0D13vWCa5k0+E16SVxg5xiFhz6uRlxRu9tjrUpchLVFL7dY3FrSLSXm4gSQy
        pb9Ql9NlsJ6hD2GwHtdFYTiQhLTs4rYU1Eiy0r3OZ8uUSGaoGeZ5sTlZogEcJgdz
        tcYp3tD9P34yFSs8tvMn4DoaGsF00HHCrioj0u8Na6rAs426e5pAEy//AzzLua88
        Tysc4yCd/LmpJA0w7KxnoXeE3k4WJj9CYvZoSDbjNCvh1Z1hLUFrkj3uJOBqsvFR
        K/pawVQASLNw31yu8v20w==
In-Reply-To: <20220630160303.ed722cd8c3a70facdf133f14@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kerin Millar <kfm@plushkava.net>
Cc: Kiernan George <kbg98@vt.edu>, netfilter@vger.kernel.org

On Thu, 30 Jun 2022 16:03:03 +0100
Kerin Millar <kfm@plushkava.net> wrote:

<snip>

> Please specify:
> 
> - a listing of the presently defined map
> - the command that was issued, verbatim
> - the shell in use, if applicable

Never mind that last part. I missed that it was about libnftl, sorry.

-- 
Kerin Millar
