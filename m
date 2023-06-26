From: Kerin Millar <kfm@plushkava.net>
Subject: Re: wiki documentation error (derp, false alarm...)
Date: Mon, 26 Jun 2023 02:08:27 +0100
Message-ID: <20230626020827.f47c365baa90a799cca72a4e@plushkava.net>
References: <ZJfigQmqgt3X5pnW@deegan.id.au>
        <20230625220427.2d024d2c37d2b5a266f9ceb6@plushkava.net>
        <om-be6P8E-nyvhRJhp7MDC0HyKHBqwlh1Ln3q4CJCTnJSXPdwyfOlF9LjVEq42Dl6jNSX7Otwlu329rv1cudQcWn4AOUWXTF2RjMkRf9eto=@proton.me>
        <ZJjg9hFCfLe07dDc@deegan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1687741709; x=1687828109; bh=aI/jchCIYGdAbKbBer40A610l
        IvDDpj6tFQfTdIxSLQ=; b=mnrDpLCTz79GUOvm0WlTUdvvwhEADBI2yROeka5o/
        NnZd27rCRPd251rZj+EUdDc9kzrQ4Qg6GhER6sgdvMCwDMRJ04U2Xm+Pm6DMOfez
        9z6aM2gLlUa3mBarUT83mhT6gsehu5g3zfYWVJKmuuqtQX0bo01J4ovIqWl9ENQH
        RJqD1NnNG+ScjABNlNRwPCrJpPQJnji8a4QAe3S2QN0U8nTrF+yOqBTxeNfvZHjk
        L+rYOApNVduAT4PuKVuIHnkoiwY01k+Y/1/H/uH44/kYW4z+nRbD7i9gGPDVYiKc
        wAIxlmnglsB//pCkXo36wNlP6RLjLiL0eDxiL0i2lK36g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1687741709; x=1687828109; bh=aI/jchCIYGdAbKbBer40A610lIvDDpj6tFQ
        fTdIxSLQ=; b=OUR+YFa7rZhQIPrW865yRlzUL5MVkhOrW7z1gt2kbukKFwtGrKF
        l2MHnIrZ9r4/axlwctODHpHGhTXvRse/cuWxIwLaEEu+i5yq5WZqhmGqVE6qTxLW
        iGwqDm9j0+/21LG/DxGD4n8UQixLIF+0RUB6s/oSM9GtEIxD+QNTLvh8xJ18LxZJ
        XlYdPe0q0rsdJxelMQvqlCtlHW/ix+0OCvFKLuRgj5kWKtPnxrElNiyqrFNyYLrr
        SpytwQGeKuT2snbSU+CpCztqBpEEBCcY4Xm4p4DnNWvTofJPr+D1UkrC9zKkB+/a
        fi2dxlLhBy9I4bR6X7WfiPnHMm15s6mnKIA==
In-Reply-To: <ZJjg9hFCfLe07dDc@deegan.id.au>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Michael Deegan <michael@deegan.id.au>
Cc: Eric <evil.function@proton.me>, netfilter@vger.kernel.org

On Mon, 26 Jun 2023 08:51:02 +0800
Michael Deegan <michael@deegan.id.au> wrote:

> > To decipher the parts of the match expression, this might help (scan fo=
r "transport header").
> >=20
> > https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_heade=
rs
>=20
> Ta, I'll (re)read this in the hope of getting better understanding of the
> grammar, which I'll need to do if I'm to work out why changing my table f=
rom
> "ip" to "inet" at the top of my ruleset breaks everything even though the
> ruleset loads fine. =F0=9F=98=85

Note that "ip protocol" constitutes an IPv4 header expression. It can be re=
placed with "meta l4proto", in which case the rule(s) will apply for both I=
Pv4 and IPv6.

--=20
Kerin Millar
