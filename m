From: Fourhundred Thecat <400thecat@gmx.ch>
Subject: Re: ipset: update timeout when IP matches
Date: Thu, 23 Feb 2023 13:50:33 +0100
Message-ID: <455de480-98e8-026d-20ee-a5157f9be8b7@gmx.ch>
References: <f326e979-1506-1685-6858-8a1d9746cb93@gmx.ch>
 <20230223113406.ac79681eb436e15c44b0a6a2@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.ch; s=s31663417;
        t=1677156633; i=400thecat@gmx.ch;
        bh=g97mNQn5pDnx1hoNXK0tCZ7MhSzaWZWGTldlGQQooz0=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=maIA9tkZOmi1bJR05+LJjnFdHaqivvH342Rdo6DeLE6ZMoTVpgn/lSKfoYtWsp2DW
         YR5651/NN2N3WdntrWam5yj1W4EWf5vk17L4AzSk+TbTj3fjLAxYH8pGfv2OIFfGqS
         QyxPbXhYJzSLPnSbdM4vfLTB0p4OrdYZWLbkxIzWkvpkcmLz0s2Xp7WTGHe4SvZTiU
         q5i2J898Fai8MsrPye0GWmRmSMrdXYozYjB4CDcwJGjv2M/I8grep2AWjv/nSPkopI
         jtuobFa0/H0GJqrA2MMG3OO68nKFt8Th3BQulY8oNedLFvM2zN/OoRF4hf/39Q96Zt
         dSIEU0lb/0wWQ==
In-Reply-To: <20230223113406.ac79681eb436e15c44b0a6a2@plushkava.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

 > On 2023-02-23 12:34, Kerin Millar wrote:
> On Thu, 23 Feb 2023 12:04:44 +0100
> Fourhundred Thecat <400thecat@gmx.ch> wrote:
>
> The following option is detailed by iptables-extensions(8).
>
> --exist
>         when adding an entry if it already  exists,  reset  the  timeout
>         value  to the specified one or to the default from the set defi=
=E2=80=90
>         nition

OK, thank you. But now I have this problem:

I want to:

1) reset timeout if IP alredy in PORTSCAN
2) drop the packet

I wrote these 2 rules:

1) -A INPUT -j SET --add-set PORTSCAN src --timeout 3600 --exist
2) -A INPUT -m set --match-set PORTSCAN src -j DROP

but the problem is, rule 1) matches everything, not just IPs already in
PORTSCAN. This basically adds everything to PORTSCAN

How can I combine these two rules into one, so that I only reset IPs
that are already in PORTSCAN ?

I tried this (naively), but get error: unknown option "--exist"

  -A INPUT -m set --match-set PORTSCAN src --exist -j DROP
