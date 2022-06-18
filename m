From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Support for String Match Blocking in NFTables
Date: Sat, 18 Jun 2022 01:54:10 +0100
Message-ID: <20220618015410.38f7c7c2850e0257653685f2@plushkava.net>
References: <CANKwiJVSW3RjhHDnziGjWenApAcvdSAqBTi7MfHqyiyHd4_F=A@mail.gmail.com>
        <20220616202014.e7ebc6df8f8f0f1fdce27e12@plushkava.net>
        <CANKwiJX5_67uPPqdwoH3-gbY11Dmj29Hjse+8m3-bsJD0hHVEg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1655513653; x=
        1655600053; bh=kDeuEh9mT2bkz2OEUiK5Qzri5NQ1w2BxyASIAJfxyw0=; b=J
        MS8gmhY5QXj4iQolvMkAI0FMYu1NvXMOeZr7l2l631ZButtM0Uah5rLF8Op/Qir+
        IBzvO4t+1+hw6FtaupfD8lBaFCDVqfXPJ93dZchzhimGA8emcPIEs+KLGJSle7va
        bWnwfUvyrhbm4TH8n9J9TnpqmDWWHv0SVGsMTg6xOTE4Vpl/riyvYdY9y4ZeiNG0
        VroGAydSFZNBqrUrP9ZwIntzgemNeMbfnfbBJHRoxVcI+cQnOHxP2Z6dMDkCd6Tl
        T7oxGOMDFBlHvMytcH+/2RuLWmFnn1H0RPgHh72IPypzib3rNPuGE8WPhS3vCH1t
        eZcJYy5/o7QcU7gFkj67w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655513653; x=
        1655600053; bh=kDeuEh9mT2bkz2OEUiK5Qzri5NQ1w2BxyASIAJfxyw0=; b=N
        yOyv3s/4L+i9Vt8xkJXrGnSy5MPRgCXIeT0HO9/PykWjXJXVK0P4EQG+Yf+JXnyk
        royXg2YIWD7uw7er/dxUcv+ICuBkzPznLwPdO4Pn/N5woYZtOAK4NnlOziXVyNQ2
        d100+v90uze5ertUogTjCzWo25hUuBJBoW22k5ky5n7NAPty2Z0hQbsw1jHxuKhI
        XBgZ8xtJD5SH+11/nbhqF+b8FmR7Ov52xmT0BzYpMkwhlAyXqvFc6XBRQ1QjoEDS
        t1XGNeMN0WI55bAjNf58uLNk9RX5MwTkD7fXC7Kg16I2Uge6AoYKYSiha3RKIfJm
        JK0kYw0Fn/ATTu2shtwJA==
In-Reply-To: <CANKwiJX5_67uPPqdwoH3-gbY11Dmj29Hjse+8m3-bsJD0hHVEg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gmail Support <testingforadept@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 17 Jun 2022 17:14:53 +0100
Gmail Support <testingforadept@gmail.com> wrote:

> Okay thank you, is there any plans to support this extension in the future?

I do not know. This is the last public post that I'm aware of in which the technical possibilities were being discussed.

https://marc.info/?l=netfilter-devel&m=150530745129704&w=2

If defining a fixed offset isn't an option for you, using a filtering syslog service/forwarder could be another course of action to consider.

-- 
Kerin Millar
