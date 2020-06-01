From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Mon, 1 Jun 2020 07:58:49 -0700
Message-ID: <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
 <20200508160132.GA2278@salvia>
 <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
 <20200601124124.GA12580@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200601124124.GA12580@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, sbrivio@redhat.com

> *From:* Pablo Neira Ayuso [mailto:pablo@netfilter.org]
> *To:* Mike Dillinger <miked@softtalker.com>
> *Cc:* netfilter@vger.kernel.org, sbrivio@redhat.com
> *Date:* Monday, June 1, 2020, 5:41 AM PDT
> *Subject:* nftables: Strange Error When Adding Element to Named Set
> Do you have a simple reproducer? That would help us.
>
> This is a set with the interval flag set on, correct?

Hi Pablo,

Yes, that is correct (interval flag is used/enabled).=A0 Here is my set def=
inition:
 =A0=A0=A0 set blacklist4-ip-12h {
 =A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
 =A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
 =A0=A0=A0=A0=A0=A0=A0 timeout 12h
 =A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
 =A0=A0=A0 }

As for a reproducer, it is simple but it takes about 12 hours of uptime for=
 the issue to surface.=A0 My script parses syslog for questionable IP activ=
ity and puts IP's into this set if they meet certain criteria, and on avera=
ge I'd say one or two per hour get added to the set.=A0 Let me do some expe=
riments and get back to you. I will roll the kernel forward to the problema=
tic version and report back later or tomorrow.=A0 In the meantime, please l=
et me know if you have any suggestions on how to accelerate the issue.

Hmmm... actually now that I think about this some more, the set expires ent=
ries at the 12 hour interval.=A0 Could this possibly be related to the firs=
t few IP expiration(s)?=A0 I will go with that theory and try to reproduce =
with a set timeout of 1m or 5m, and report back.

Thanks!
-MikeD
