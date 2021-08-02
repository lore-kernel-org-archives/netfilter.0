From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Dropping UDP packets to port 53 containing known domain string?
Date: Mon, 2 Aug 2021 09:35:06 +0100
Message-ID: <20210802093506.cb2b495b9b6ce8231a74e9e1@plushkava.net>
References: <6bf250e7-e0ba-43f2-6e35-c858e85db41c@foscore.com>
        <8900c969-32f9-00c1-b78d-bc84b7381034@plushkava.net>
        <72e9e837-5890-e646-79e1-3486e9d7da79@foscore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        u32Zd8duojL62EzHfmm6e2HZZ7Rg/z4UXGIpK9H35Fc=; b=PqvD+eq6bhAqmGJq
        dYWpsdi+iurZOx3vwgeqxzAzbHLTYnQ0jLGDMFTgoZ8KgpU7KkCxrMr5JDW97J+r
        gBks/OOVz0C5rxLFL8VFZRfR5g6ZijIB6fkwoQLIPRC3sKJhGGnDToszci6avhaL
        qQCXWZGA6Vw7zineBKfI5aG/EbHQHhc85nagjncngNVdXtUl/KAFVNUqYM3S2s7r
        pcWrqfep9zB4qs1ZHSrO2D73RF/7q9oSvoaTIk8Cc8m2vHrzLcv2aP40xDlkoNfF
        5NrI+1QCi+9vguFs/YxOyoVp6tMEOQ1IvggpPOI6RdPH1dLlLWGAEBbbQ5+k2dCU
        XGsCGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=u32Zd8duojL62EzHfmm6e2HZZ7Rg/z4UXGIpK9H35
        Fc=; b=pzDagBWuepZCQC1lE3X9QUJ7kn/h27XTg7sQ4wdmfHiVRom9TNJUn/QRb
        9JuNOzSejXtGh+gTNF7kVDFl37+UxsuNTcXoTc7fLd1U6kbjKddNsEFlq8MoOgT4
        z8E4HccPoI/7t3oGbyLyPZOS06iRXzRx+Svy2m5tVHVNvxAFWgV2YY+qWmJ5Jjs4
        Zl58sGmGnAPd4yf4Bzcs0nRxlX19UP4q+PUqvC5iLk4Q3re3ABnAvoUWDYf8ddsK
        2VjThpWSucTRX5YYdbgII/Wz/ZxsjOFok8glJJCkgSr/Y76q8v6BPxcN7vXPnHpH
        For7AWBhatyVGMaUimdpHa9Hmc5lA==
In-Reply-To: <72e9e837-5890-e646-79e1-3486e9d7da79@foscore.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tom <tom@foscore.com>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

On Mon, 2 Aug 2021 01:39:24 -0400
Tom <tom@foscore.com> wrote:

> On 2021-07-27 2:09 a.m., Kerin Millar wrote:
> > Let us begin with `tcpdump -n -s0 -X udp port 53`. Here is the payload=
=20
> > of an offending query, including the encapsulating IPv4 header.
>=20
> > 0x0000:=A0 4528 003a bb51 0000 f211 3319 4bad 43f9=A0 E(.:.Q....3.K.C.
> > 0x0010:=A0 c422 8657 0035 0035 0026 0000 0001 0100=A0 .".W.5.5.&......
> > 0x0020:=A0 0001 0000 0000 0000 0870 697a 7a61 7365=A0 .........pizzase
> > 0x0030:=A0 6f03 636f 6d00 002e 0001=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 o.com....
> Thanks a lot for your very informative reply. Sorry for the delay in=20
> responding. With your help I got it to work. Thanks very much!

For the record, this is the rule that I ended up using:-

udp dport 53 @th,96,32 0x00010000 @th,160,112 0x0870697a7a6173656f03636f6d0=
0 counter drop

The first expression tests that the DNS packet is a query, rather than a re=
sponse, whereas the second expression is rendered proper by including the t=
erminating null byte.

--=20
Kerin Millar
