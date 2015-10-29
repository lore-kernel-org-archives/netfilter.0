From: Johannes Ernst <johannes.ernst@gmail.com>
Subject: kernel modules: was Re: Masquerading with selectively open ports -- nftables
Date: Thu, 29 Oct 2015 16:48:52 -0700
Message-ID: <F2A0EC37-BBAD-4B1F-9771-1461054F208B@gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com> <20151028231533.GA2371@salvia> <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com> <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:mime-version:subject:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=dmsF8KRkb41fbMVChRIjg1cCxHJC8bhTPEHBOReLiXA=;
        b=bKWecn6gTeVTjDspltC7MNqbAPx9gYH/AsD7FffVOU3k3H0LN4Wb3AWxUg24WQHwxI
         IVEIAqBHgSMzjxn4IRQ11/1alNEmmiyVA8Md8MkuiMJJhs2W9yGTJZ2arBnWuPhcgDQx
         sI+GmqN5Kct2hor0hQICbwt/4y6MN2xNuTxm0FnL1WmvOfaaoQCQsyi57e6OpM7bQekO
         lVLSwKHpUbkoGToadZ8amUpL0n4p3kL/r97KzTL/1GlvVttFSgsXjB2XXvJ2MUIq1Nq9
         poo/u9xdqp/YGfbKG9kmbkbLGcU59Fju1ffAgHEt55Uzz8C41E2kjX6TSc2lCQTPI1/G
         hzUg==
In-Reply-To: <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 29 October 2015 at 05:51, Johannes Ernst <johannes.ernst@gmail.com> =
wrote:
>>>>> nft add rule nat postrouting masquerade
>>>> <cmdline>:1:1-35: Error: Could not process rule: No such file or d=
irectory
>>>> add rule nat postrouting masquerade
>>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>=20
>>>> 1. This is copied straight from the wiki [1]. What am I doing wron=
g?

I fixed it. Apparently kernel module nft_masq_ipv4 (and some dependenci=
es) hadn=E2=80=99t been loaded. (I don=E2=80=99t know why.)

Q: What do I have to do about kernel module loading? Is that automatic,=
 or do I need to do something manually? (e.g. with /etc/modules-load.d/=
) This [1] seems to imply I have to do it manually.

Thanks,




Johannes.

[1] https://home.regit.org/netfilter-en/nftables-quick-howto/



