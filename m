From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Tue, 2 Jun 2020 16:25:36 +0200
Message-ID: <20200602162536.55948b65@redhat.com>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
        <20200508160132.GA2278@salvia>
        <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
        <20200601124124.GA12580@salvia>
        <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
        <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com>
        <29f39abf-a146-fa5a-6178-574cbfb9c83c@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591107944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VjDXaP5v/5xIb+GRGY5+oHzMFvbEOBsiTUGG9RYthQc=;
        b=YgXycgosxC3uFVi0qy0JcIw9lCZ9iaOlwLKcJKb7NDQL5EzzDyrtJXdyvxoefBO32j8zw6
        XmIIC0RzC7DyaE7iUxGhcuGdo+W4AAWDWyQXNBbbv8fWtHs+lOpa/XJGDkuhTL9RCwmzB7
        QwiRiH03hCCWRHgezUrHFipLI1MkRHI=
In-Reply-To: <29f39abf-a146-fa5a-6178-574cbfb9c83c@softtalker.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mike Dillinger <miked@softtalker.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Hi Mik,

On Tue, 2 Jun 2020 06:28:31 -0700
Mike Dillinger <miked@softtalker.com> wrote:

> > *From:* Mike Dillinger [mailto:miked@softtalker.com]
> > *To:* Pablo Neira Ayuso <pablo@netfilter.org>
> > *Cc:* netfilter@vger.kernel.org, sbrivio@redhat.com
> > *Date:* Monday, June 1, 2020, 9:07 AM PDT
> > *Subject:* nftables: Strange Error When Adding Element to Named Set
> >
> > Yes, I have found a way to reproduce it.
> >
> > Add the set:
> > nft add set ip filter blacklist4-ip-1m {type ipv4_addr\; flags
> > interval,timeout \; timeout 1m \; gc-interval 1m\;}
> >
> > We're not concerned about the IP's that are added to the set
> > because there are no rules covering what to do with the set
> > contents.
> >
> > I wrote a bash script called nftables-bug-repro:
> > #!/bin/bash
> > nft list set ip filter blacklist4-ip-1m
> > for ((i=3D1;i<=3D10;i++)); do
> > =C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0 nft add element filter blacklist4-=
ip-1m {$i.$i.$i.$i}
> > =C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0 sleep 1
> > done
> > nft list set ip filter blacklist4-ip-1m =20
>=20
> Hi Pablo, Stefan, et al,
>=20
> I wanted to check and see if anyone was able to reproduce the issue.=C3=82
>  If not, I'd like to figure out what's unique about my setup so I can
> resolve the issue on my end.

I haven't tried yet. I plan to check later today, I'll let you know. I
don't think there's anything unique about your setup.

--=20
Stefano

