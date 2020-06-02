From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Tue, 2 Jun 2020 06:28:31 -0700
Message-ID: <29f39abf-a146-fa5a-6178-574cbfb9c83c@softtalker.com>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
 <20200508160132.GA2278@salvia>
 <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
 <20200601124124.GA12580@salvia>
 <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
 <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, sbrivio@redhat.com

> *From:* Mike Dillinger [mailto:miked@softtalker.com]
> *To:* Pablo Neira Ayuso <pablo@netfilter.org>
> *Cc:* netfilter@vger.kernel.org, sbrivio@redhat.com
> *Date:* Monday, June 1, 2020, 9:07 AM PDT
> *Subject:* nftables: Strange Error When Adding Element to Named Set
>
> Yes, I have found a way to reproduce it.
>
> Add the set:
> nft add set ip filter blacklist4-ip-1m {type ipv4_addr\; flags interval,t=
imeout \; timeout 1m \; gc-interval 1m\;}
>
> We're not concerned about the IP's that are added to the set because ther=
e are no rules covering what to do with the set contents.
>
> I wrote a bash script called nftables-bug-repro:
> #!/bin/bash
> nft list set ip filter blacklist4-ip-1m
> for ((i=3D1;i<=3D10;i++)); do
> =A0=A0=A0 nft add element filter blacklist4-ip-1m {$i.$i.$i.$i}
> =A0=A0=A0 sleep 1
> done
> nft list set ip filter blacklist4-ip-1m

Hi Pablo, Stefan, et al,

I wanted to check and see if anyone was able to reproduce the issue.=A0 If =
not, I'd like to figure out what's unique about my setup so I can resolve t=
he issue on my end.

Thanks!
-MikeD
