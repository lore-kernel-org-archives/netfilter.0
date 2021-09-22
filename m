From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: nft 0.9.8 - error in mnl.c - with addition hw interfaces
Date: Wed, 22 Sep 2021 15:05:07 +0200
Message-ID: <trinity-121e512c-85eb-48f5-a66c-7ab871d96604-1632315906972@3c-app-gmx-bs53>
References: <trinity-470c22f9-5190-479b-9f59-3088360d78f3-1632307777449@3c-app-gmx-bs53>
 <YUsiCXbyAnuvyFCn@egarver.remote.csb>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632315907;
        bh=KhzGeEX/oxsqT1cETnfsQN/e/0ITsP3N19WHRRGuNVo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Ok/jQg+5Dg1rGFPkLlfmQ2RELBPEMevjf7rP4yzSAJPsqN3Cz/SDhyqNK5EvhwHN4
         WMfxALFRbHmvlgWxB/G0tEoWKYfy+puJWgDVtZdCokKKxMjE+XOZMGdoDbIttl2PVU
         a9ShUxFnpMizyr0RYNG846rt9xORZES3c55P+NeU=
In-Reply-To: <YUsiCXbyAnuvyFCn@egarver.remote.csb>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Garver <eric@garver.life>
Cc: netfilter@vger.kernel.org

Hi, thanks for pointing to it,

problem was that i run this testing-kernel via tftp and so i missed the mo=
dules, sorry for disturbing

regards Frank


> Gesendet: Mittwoch, 22. September 2021 um 14:31 Uhr
> >
> > root@bpi-r2:~# nft list ruleset
> > mnl.c:45: Unable to initialize Netlink socket: Protocol not supported
>
> Check your kernel config for
>
>   CONFIG_NETFILTER_NETLINK=3Dm
>
>
