From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: IPv4 Evil Bit
Date: Wed, 7 Jun 2023 10:38:23 -0400
Message-ID: <CAPJdpdCeuST=ac0K5oQQq=THOPZqnXESQivLqMK0yDRfq3ZeoA@mail.gmail.com>
References: <20230607131743.309d5aff@parrot>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686148715; x=1688740715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhJnX1SZnyt4Pae0j4C3/WHUghxguGZ1w8V/L1GLBLU=;
        b=BubFBhHMoCdX2PiI9d+8jONTxc/yMW4dDmYBBj3hXhTPu3y5yOIKovsYzh6QtP7bfr
         8twG/osL56CtS+vXPd+ue2W4kh6PYYRxPtaEdE60RKM7bTq46vJwbnKUUku6hCttNdNM
         2YQ7EwClTbwftkNlfis9JZAofcSOkmeNSivQTzLYWQc/0fn6d5lpKbPh8FfwqoHdO+hG
         IyZM0So1LmVs54hNpEvfIXK7cFRTAu0bpb5sZSyVhUAcndg7xbYSr3L67CDosyuKOWxi
         Y8kUxG+uHwIDah4RlzqrBVq9Hu13mFB4psLFk32/SrI4CPND1kQnKpAYu3Y3NmeaC1xB
         pfGg==
In-Reply-To: <20230607131743.309d5aff@parrot>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWFyZWsgS8O8dGhl?= <m-k-mailling-list@mk16.de>
Cc: netfilter@vger.kernel.org

Answering the first question i think you may be looking for sets
https://wiki.nftables.org/wiki-nftables/index.php/Sets

As for the second one RFC3514 implementing that is a bad idea for a
number of reasons which is why as far as I know nothing implements it,
it's too easy for a bad actor to take advantage of. In fact it was
actually an april fools joke RFC. There are a lot of those and some
people confuse them as being legitimate but they are not. if you see
an RFC with a publish date of April 1st any year don't take it
seriously.
AGAIN I CAN NOT STRESS THIS POINT ENOUGH THAT RFC (RFC3514 ) WAS
WRITTEN AS AN APRIL FOOLS JOKE!!!!!.

On Wed, Jun 7, 2023 at 8:12=E2=80=AFAM Marek K=C3=BCthe <m-k-mailling-list@=
mk16.de> wrote:
>
> Hello,
>
> I hope I am in the right place. I have two questions about nftables:
>
> 1) Is it possible to perform OR operations in nftables? For example
> `ip6 saddr ::/128 OR ip saddr 127.0.0.1/8 accept;` As far as I
> understand it, everything else is concatenated with AND.
>
> 2) I want to see how many IPv4 packets I can get with the Evil Bit
> (RFC3514). Since there seems to be no native function for this in
> nftables, I seem to have to use raw payload expression. So I have
> set up the following:
>
> @th,6,1 & 0x80 =3D 0x80 \
>     log prefix "[nftables] Evil bit: " counter reject;
>
> However, `Error: syntax error, unexpected '=3D'` appears. What is the
> reason for this? How can I formulate this expression correctly?
>
> I would really appreciate your answers!
>
> Greetings
> Marek K=C3=BCthe
>
> --
> Marek K=C3=BCthe
> m.k@mk16.de
> er/ihm he/him
