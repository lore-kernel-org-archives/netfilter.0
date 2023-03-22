From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
Subject: Re: rate-limit ssh for both IPv4 and IPv6
Date: Wed, 22 Mar 2023 15:27:24 -0400
Message-ID: <77af66b9-38bd-4f5b-b0b1-f0c063a171e5@app.fastmail.com>
References: <783937f-4c3b-4520-eb7f-3334ffcdfa0@ndsu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
        :content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1679513265; x=1679599665; bh=zh
        qzFCmtoR5uL3EaHKYtMqDpx+GiMAogbhzaOQgMCvk=; b=WW59XZZArYnt7BcQFv
        ifzCnGQ8DONUPqIAI8PQnqga8vdvG2LYhny8a3z1VGOeTOQtC222tLVbNQXbu6mL
        C+WuLYVA+eouPTOnxyBrB2FI3Cbn+/Xz+aihujFx0Oc8nkW6GXOK9wTel4GAFvvI
        V0qmYMb9j6g8qGNPW49miv/EtUc5lNWcYjZsVuBnYpAU5jrKlkmGq7fDMc1S33lt
        egjo9Ajyruxk3eQFkcPlud5joizEa8eveB5Nsyv8yWKFXumW56ZuLa9wrjZknNak
        y15oLoUMz9t8x2gWifzven21SwPKllMm6wFTNplczzPC8vvJs+4WZlflk5602v1a
        Yn2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679513265; x=1679599665; bh=zhqzFCmtoR5uL
        3EaHKYtMqDpx+GiMAogbhzaOQgMCvk=; b=lHJni4pdi/uYa+C12MccmgkGCXgG7
        d5KdMX4x/MdE/OqRusu9IawZlhTRKSxQiUhSGFLW/Xkgx96XyPMEaTlYl4cf+W/y
        SfG3iuUVctN+TeIeIoVKOqMlUdntiGIs8H2FCRMvpU1oKALm1LClcftvSCie+H3j
        6To0/wmDh5FShbbAe/KsAC+uo9gmpnKnaAzyjFBtaReacLYDYSbLF837fP1U+Ls5
        Ws2KZLvGR2bCZC5xDocF31i6/y0DilZlpr7FF/BTNKZ86TIGnZg4JDKVOwICLHPO
        /Jik7u0BVU7txZ6nBD3gynacDsrnkta1a96St1w+08Nx0qDv0e5gmJ3Ug==
In-Reply-To: <783937f-4c3b-4520-eb7f-3334ffcdfa0@ndsu.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, Mar 22, 2023, at 14:28, Tim Mooney wrote:
> With my current experience level with nft, it's not clear to me how to
> adjust a single rule that handles only IPv4 with a set to do what I need
> for both IPv4 and IPv6 connections to ssh.

Do you need to use a single rule? Since the rate-limiting is per-source-address, there's no need to have them mixed together. Two rules, one each for IPv4 and IPv6, with their own sets, should work fine.
