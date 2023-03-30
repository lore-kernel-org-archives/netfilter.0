From: Kiernan George <kbg98@vt.edu>
Subject: Re: Creating a map programmatically using the C library libnftnl
Date: Thu, 30 Mar 2023 11:31:13 -0400
Message-ID: <CAOg40qitJM9LfAy73ezAK7raKqQ0jeJy=4h+hvZ0+ytkXE-9pQ@mail.gmail.com>
References: <CAOg40qh_1Fse-qHwBMZW9mQdbMma9VPMbOkr6d1wpF9YeUYdFg@mail.gmail.com>
 <20230328150941.GB25361@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112; t=1680190284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOZcZpPS0dDwm4Rn8VfqF5Nf2egqV82IHaQS7nnE0hM=;
        b=GsoyKTBP6KGMrE3IjnTT2DWtomL0Y4mIXZ3NrOMhNywR6INcy5/Tn80lMwbT0uhmoK
         PUKl3hod58t83LwmpnHvfOrv8S9sDnPsBPzykcjHU0cuSvUkx5+1+O2Tse+2/MmLEPIP
         /g0oQTC2sPM58frHEoQLfFLFcIWrhnT5bbmprqRGxgKO7US7XTiUvY3monkrxpDqI354
         V4rzkFMaho6gu3RzGnLG0zydVpeNmTp4ioXnBvwTMlZz5/GuzlQYN3qE+5oqMzF6ESH7
         RQ618rhxyJ9bzWUM42org5yeOCIQdJO8RwrZ4AZpBSgFaVNtkIOVVtliofOv4Zo3e8NZ
         Gqhw==
In-Reply-To: <20230328150941.GB25361@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

> Whats missing in examples/nft-map-add.c ?

I'm not sure how to take that example and modify it to create the type
of map I mentioned in my initial request, or how to work in IPV6 for
example. I could also use an example on how to add an element to a map
programmatically. I see there is the nft-set-add, but it does not work
on a map.

Along those lines, is there more fleshed out documentation on libnftnl
and libmnl other than the examples or the wiki? Unfortunately, those
aren't sufficient for my needs.

Thank you for the help!


On Tue, Mar 28, 2023 at 11:09=E2=80=AFAM Florian Westphal <fw@strlen.de> wr=
ote:
>
> Kiernan George <kbg98@vt.edu> wrote:
> > Hello,
> >
> > I'm not sure how to respond to my post from earlier today, so I'm just
> > creating a new one.
> >
> > I do not need help figuring out how to use the nft command line tool.
> > I need to figure out how to use the libnftnl C library to create a map
> > of the following type and insert elements into it:
> >
> > type ipv4_addr . inet_service : ipv4_addr
> >
> > I see an example for creating a set in nft-set-test.c, but I'm not
> > sure how to translate this into creating a map and adding elements to
> > it. Is there documentation somewhere? Could you write an example for
> > this use case?
>
> Whats missing in examples/nft-map-add.c ?
