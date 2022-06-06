From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Validating this is the right conntrack ruleset
Date: Mon, 6 Jun 2022 16:51:18 +0100
Message-ID: <20220606165118.a91d1d2e153fba420ef18f76@plushkava.net>
References: <CADhidkpx+3=1aZj5OF11JR6y_g16xqV=tyx5Bn=dG_kisJwP2w@mail.gmail.com>
        <20220606163048.de7ca3450ec3048fb9c3e3ba@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1654530681; x=
        1654617081; bh=hjJDx0F7tkTY/kx7jnlSEusFsRx3h3l1Ld04dtvC2YU=; b=M
        idhEyMU/7c8PRFDhBkH2dGw0Et9umwmv94YHpMdefcXOXkiK1rp1hTQ1yE2z3Efd
        oA6t/J0iJXF+MTHFlGFD6/D2HswiNH/z75j289cU7t3fU2IvnfRq4U0PwGGmsP6m
        pGxe3aTFP8YF54W+uqQg6yJ4H59S+4SkzKvt7ZrX/mi9Wq9aUaHahslljBGClm+K
        TJntwQvXZruH2BacnrxeAjHyOV38jBzYiOc8ZZEceM2tKrVlj+ogJZ3qfYgW+Efo
        GbN3gERsFYa+rAK1mie3HuGROZdZkCAmKZLVVvHTAAXAYxpcyQ+iwh9qt8G2g62A
        ORK4CCK6IMyt3kAPlJBtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654530681; x=
        1654617081; bh=hjJDx0F7tkTY/kx7jnlSEusFsRx3h3l1Ld04dtvC2YU=; b=N
        7vMbLypUWDq8V0bNaB2mv5PZJrLgIBL3RUwMruCHlUwKL+zdbA0iIm65qzB5on4I
        RgcdBqJcdkiL9t4wQPlhoXI841fq5cOOk1vJ7wLkCrfjK0yS3B3yqP7mbFP9Lik9
        UOxJhSQZKdU4PuTPBwLdaFjkvCTNagpmf6XeE6wRGCLWWNHFiRA2qmgcg/dT6zd/
        xU8N/313Dy5CoapMBjAPRAA7GXk/u9jQSSdYp/M7lNugA1mxB66DT/IWxMR/Zjwy
        NE5dZnGeUEQC46UfrSCl0y/T2Q8TqS6/W1e1iBCqUSC+nTbGXrtBveupsgGNsVfE
        8FHd+2bVYDoTOnnthYdcg==
In-Reply-To: <20220606163048.de7ca3450ec3048fb9c3e3ba@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gio <gioflux@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 6 Jun 2022 16:30:48 +0100
Kerin Millar <kfm@plushkava.net> wrote:

>         tcp dport 80 fib daddr type local ctstate new accept

Please excuse the typo. Of course, I meant to write "ct state" there.

-- 
Kerin Millar
