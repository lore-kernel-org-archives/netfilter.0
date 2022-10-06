From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 15:46:37 +0300
Message-ID: <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
References: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
 <20221006111811.GA3034@breakpoint.cc>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=TSQwygCFcZALa3sAZdIWMA5u8XrCQsY1FzdV6+Hipzw=;
        b=TWbQSJERx43SxvXXXLZtcblxRN+si6cLYqYe6SqWHbTMiZQnE5dauSQaAsZIacaFJt
         oDAZZqXa4CzLTgXcs7LlUv2pJNei4Cbf96Xs0EAcUp2Mak0RLItrYE48sGw/m0iqOG0m
         sADJe8DL7f6gO07MY02WH62M/gXk/3YTdqi63NAjbkIyMJdWo3vlQq1yK5QQJjmgCt8n
         0LVEv33mw2Ce2fCtBTGt0E0ZuuXYF5KonAp5DBz3Ik8ntvJHT07abj4jdLdgqqCI9ezE
         MXj5X1Vosl+NIhBg/Lze8exZsj7zM+o8fMN+QazVtLy/SGtLgBhY1zqf5Iz1nlZ1KyF+
         JXHA==
In-Reply-To: <20221006111811.GA3034@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

Huh
Very strange in kernel 6.0.0 i not found : =
net.netfilter.nf_conntrack_helper


in old kernel 5.19.14 in sysctl -a | grep =
net.netfilter.nf_conntrack_helper=20

net.netfilter.nf_conntrack_helper =3D 1


m.

> On 6 Oct 2022, at 14:18, Florian Westphal <fw@strlen.de> wrote:
>=20
> Martin Zaharinov <micron10@gmail.com> wrote:
>> Hi Team
>>=20
>> I make test image with kernel 6.0.0 and schem is :
>>=20
>> internet <> router NAT <> windows client pptp
>>=20
>> with l2tp all is fine and connections is establesh.
>>=20
>> But when try to make pptp connection  stay on finish phase and not =
connect .
>>=20
>> try to remove module : nf_conntrack_pptp and same not work.
>=20
> Did you rely on
> sysctl net.netfilter.nf_conntrack_helper=3D1, or are you assigning the
> helper via ruleset?

