From: "" <kfm@plushkava.net>
Subject: Re: nftables: Allow NAT Access with Timeout
Date: Thu, 23 Jan 2020 01:17:14 +0000
Message-ID: <2b67148e-84df-9bba-f3fc-0184d7e67df4@plushkava.net>
References: <d44f6c86-27bf-aff5-4251-b1cbf06de174@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=a
        28wQlH9to51csiTYkQBwTvgO74n38K4hGpevwc08TU=; b=N+PvjPEkeF7bQBLIS
        Z9ROAInAPyIlVT1gD5BI0wTXoxpadpG8p5JuTy7/0Ym+Xh99Nxdb2uoGsirgCfkc
        2fKVXoedHfsFtIhzAFARjGTKD7SMs/4yaqp3tCBSq2fr97oAKDvvdTIiBnOpWlmx
        kpMrbD4/lFY0XUkP2/plnBE2KsxssOmnkFfWsBzqfBFNU20xW9D/BRGByyPExS3y
        vhXuCqPBD8cMBVMOPUj0PT8sHUT8iAmpvuS9oFGOQNvGsNHg3/mdU2Jpb1ck6aVf
        o0IcQeNaNVN2NEryFCFrsHEtaQNzbAyAm6opuISgNaCJpVGth450G4HYt3ZIKgpM
        NWbzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=a28wQlH9to51csiTYkQBwTvgO74n38K4hGpevwc08
        TU=; b=LMAI2hBJY4UcaJs/lcN0TnlAM4KahC05Zwx568fewKc0se+q6XOMFKAcI
        77xdLG28P+Z4IMw88gzque0zsPkWwz06ecXL7Jn3aBf8e89ldD3bzjPEnSGGF47Y
        XsqmtYM3wjbhRwtiiljvy5HauCtaO7IjOyErdb7H0qz9BZzyuj1g8CebrraHnWZq
        6nadx7Euns9fidVUBbk3j6MvxdRXhkjByxToxTm9RVxFuoiSS7pLPFCRadV9tSiZ
        nQ97Ah33mmvJJ1PLh8Vd7PWkqIENCXRTYIIW0Wg9ZiUtgYfS0qJMfHPJO3MGb52O
        anwg2MR7gJOuh6bPVQkHHFcz/guIQ==
In-Reply-To: <d44f6c86-27bf-aff5-4251-b1cbf06de174@softtalker.com>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

On 23/01/2020 00:01, Mike Dillinger wrote:
> I am running nftables 0.9.3 on Debian 10.=A0 Behind the Linux router, I=20
> have multiple clients, mostly Windows.=A0 Some of them would like to run =

> an application such as Torrent but I'd like to limit the time that can=20
> happen.=A0 Ideally, I'd like use use a set within the nat table and have =

> the access automatically expire after 4 hours.=A0 I have hit a brick wall=
=20
> and I don't see a straightforward way to do this since each nat entry=20
> needs a destination IP, inbound port, and destination port, yet set's=20
> only have a single one of those entries.=A0 I was leaning toward using a =

> set because that's the only entry type that has automatic timeouts as=20
> far as I can tell.

Concatenations allow for set elements to be of a composite data type.

type ipv4_addr . inet_service . inet_service

--=20
Kerin Millar
