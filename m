From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 15:57:23 +0300
Message-ID: <BDFD3407-955E-4FB4-B124-229978690BFF@gmail.com>
References: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
 <20221006111811.GA3034@breakpoint.cc>
 <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=aR41UreoGmAHZ0eE6k6l03yztretTneo/I2xHbqnPhc=;
        b=DPiHf5C2cmdRHmCOmEh3ZWXHovpEhMgCszZKLveTHT/CWdH6no564UqxKWrazoEsqX
         NEvNxgl+P1wdxmc34EoQcb+/7E8Qkcc62MQwnvh1gOGsgHwZF5YH6aGoivwp+DvhQyF2
         VP9jhykBdU5VNn/sGlA5LsepoSRxLNBCwUviMkNFoWoTYm/n7UwqYum33psMxfy1oLrU
         hx0Pr4QAUNYjvMnUQIz/7VsCAIDtJuX/P84L2djB3W8Rxktjm0BzPT5/NJt8vjfKo9b2
         Vsr34vEz5JiU4GtRp5WOsTPbWO616AbAXuH2zP2jls/bzq5rp5FPJamNX/23undzBEoW
         a0XA==
In-Reply-To: <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

Hm.. in kernel 6.0-rc7=20

Pablo Neira Ayuso (2):
      netfilter: nfnetlink_osf: fix possible bogus match in =
nf_osf_find()
      netfilter: conntrack: remove nf_conntrack_helper documentation


https://lwn.net/Articles/909391/




@Pablo Abeni

Same with flowtable and without very slow connect vpn.

now i back to old kernel 5.19.14 to make test and yes all is fine click =
on connect button and connection established for less that 5 sec



m.

> On 6 Oct 2022, at 15:46, Martin Zaharinov <micron10@gmail.com> wrote:
>=20
> Huh
> Very strange in kernel 6.0.0 i not found : =
net.netfilter.nf_conntrack_helper
>=20
>=20
> in old kernel 5.19.14 in sysctl -a | grep =
net.netfilter.nf_conntrack_helper=20
>=20
> net.netfilter.nf_conntrack_helper =3D 1
>=20
>=20
> m.
>=20
>> On 6 Oct 2022, at 14:18, Florian Westphal <fw@strlen.de> wrote:
>>=20
>> Martin Zaharinov <micron10@gmail.com> wrote:
>>> Hi Team
>>>=20
>>> I make test image with kernel 6.0.0 and schem is :
>>>=20
>>> internet <> router NAT <> windows client pptp
>>>=20
>>> with l2tp all is fine and connections is establesh.
>>>=20
>>> But when try to make pptp connection  stay on finish phase and not =
connect .
>>>=20
>>> try to remove module : nf_conntrack_pptp and same not work.
>>=20
>> Did you rely on
>> sysctl net.netfilter.nf_conntrack_helper=3D1, or are you assigning =
the
>> helper via ruleset?
>=20

