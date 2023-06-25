From: Kerin Millar <kfm@plushkava.net>
Subject: Re: wiki documentation error
Date: Sun, 25 Jun 2023 22:04:27 +0100
Message-ID: <20230625220427.2d024d2c37d2b5a266f9ceb6@plushkava.net>
References: <ZJfigQmqgt3X5pnW@deegan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1687727069; x=1687813469; bh=vMNYD5qRu5MXcdsSilIoaaDUx
        9/tCyW0lv4BfUINLfc=; b=v7MnVnv1QKXW0qrXAn7zH+B4LyZAPMrWu4DtrCKQH
        5RcfsC84H8Q2RNqaLGV0cZfXOSs3yLUF+Jyq14xY5PhHllqknAu407Rp6/9x+jGo
        Eq7YQN/5H5LLwNkTYSEMo6OhLOs3eyx01ea3oJGYtmZQmgr7mFVyAlwpItUgOpBG
        hUlqJjuxny8IVfiy6/fkvRcSfjl4NanhPJfJ1Tl9dDGHZ1QajRd4s1aAN+MXpSw5
        fekJ4pQShyyrRnumBGjPsK6kJV1wNuaP8YiMf0Zi0YSvoJNJrXnzex53NntRN1at
        ntexvsupxXfNy8m1OqzkZFSTrDca7/coVEW66qaB2sZhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1687727069; x=1687813469; bh=vMNYD5qRu5MXcdsSilIoaaDUx9/tCyW0lv4
        BfUINLfc=; b=V3/bpOxfvA9NSKj77B5l9PfHdo1TMF+zVl3OB8FAu9pIhStyoun
        /T+XU2JGid8oI5d6wdBqvXQ1qN1cS1ZYG7r1jHitARRxB0r4vKPg7waLtdJXE5Uq
        GlG09LOlIEAkoCRo3NXDD1MxxE7BdOkKhlM/bQYdmQ0+t2FCdhAJXkyINOnsnG6a
        bLhRjgZc349zHuU8sZZ4mkmPocqntwndGX0jJLVss/vJCZL4C/k93Ohxu6yEmHMA
        fjSO18ajBhGHTpiMrTG6Hl3rM868+k7N5VTPZ3NwkIpAdqNiCZlefgvGrIEux5Bk
        JXjkq46uAo5rbIwrB1+rgaL+saKsWiLsx9g==
In-Reply-To: <ZJfigQmqgt3X5pnW@deegan.id.au>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Deegan <michael@deegan.id.au>
Cc: netfilter@vger.kernel.org

On Sun, 25 Jun 2023 14:45:21 +0800
Michael Deegan <michael@deegan.id.au> wrote:

> Hello,
> 
> (please CC me on replies, I'm not subscribed)
> 
> It looks like I'm the first to attempt cutting and pasting the ruleset from
> https://wiki.nftables.org/wiki-nftables/index.php?title=Simple_ruleset_for_a_home_router,
> as it...doesn't work. :P
> 
> The main problem is this line:
> 
>    ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 : accept, tcp . 53 : accept, udp . 67 : accept}
> 

The syntax of the ruleset is valid. Please ensure that you have not inadvertently introduced a linefeed character anywhere within a given set element (immediately before or after a comma is fine). Also, please convey the error message that you are encountering.

-- 
Kerin Millar
