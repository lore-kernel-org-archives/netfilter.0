From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 17:16:48 +0300
Message-ID: <FF11BA5A-6D5C-4078-8050-8E70107C6A03@gmail.com>
References: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
 <20221006111811.GA3034@breakpoint.cc>
 <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
 <20221006134340.GA31481@breakpoint.cc>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=siHFTyZ2T6NDzGGqdGCiadSHdBb67ju2rDdUolohprk=;
        b=OeoBEH+8yY9uy4Ea6XuDgON/McDZQxYP74nJZ3EsTQg/dmOjfdbxk1P60Sou1tRd0F
         pPF5GLC0X1i3Ry1pZiPp7S/KX4g8oFK6bJWfxE9WOepIPssKoFBkvr6EefLXRJjiSjwl
         v7gcFSDqRI0g8hJbh5pbsg31/qGBe4vyi3poAE4KOPqgfY2mznz5jalB8gZqcB96mq5D
         n8CExFMsFLxjzzz5+wZi0oPP0lvonFTpFURUlnvZ/iBFwMtBbJ6LSCpoK7/yt3HypelH
         z5Nq2axGA1vXFDpOiMpstCRMJp0xO3NWRkdxT2PgyA53GPSkkSvsaSDbWC/FiSfdV8ea
         q6HA==
In-Reply-To: <20221006134340.GA31481@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

Hi Florian

Yes after add this rull with small modifycation work perfect.


Thanks for this !


Martin

> On 6 Oct 2022, at 16:43, Florian Westphal <fw@strlen.de> wrote:
>=20
> Martin Zaharinov <micron10@gmail.com> wrote:
>> Huh
>> Very strange in kernel 6.0.0 i not found : =
net.netfilter.nf_conntrack_helper
>>=20
>>=20
>> in old kernel 5.19.14 in sysctl -a | grep =
net.netfilter.nf_conntrack_helper=20
>>=20
>> net.netfilter.nf_conntrack_helper =3D 1
>=20
> Yes, so this is expected -- 6.0.0 should behave like 5.19.14 with
> net.netfilter.nf_conntrack_helper=3D0.
>=20
> You need something like:
>=20
> table inet foo {
>        ct helper pptp {
>                type "pptp" protocol tcp
>                l3proto ip
>        }
>=20
>        chain prerouting {
>                type filter hook prerouting priority filter; policy =
accept;
>                tcp dport 1723 ct helper set "pptp"
>        }
> }
>=20
> ... so that the helper will start processing traffic on the pptp =
control port.
> You might want to refine the rule a big, e.g.
> 'iifname ppp*' or similar, to restrict/limit the helper to those =
clients that need
> it.

