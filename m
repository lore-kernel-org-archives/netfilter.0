From: Alvaro Leiva <alvaroflmiranda@gmail.com>
Subject: Re: extending element timeout
Date: Sun, 5 Apr 2020 16:26:16 -0400
Message-ID: <CALiBZbwtDbmJbeecWDthpoZ82sS+Oa2t6=7N5D=Lhnthy4q2Nw@mail.gmail.com>
References: <CAF90-WiP8pzgXaZB8cE5qkhD6nAtoPrazNLsvkHMBnm4APnpcw@mail.gmail.com>
 <20200405182926.8B32F3651C3@zimbra.mdabbs.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fxr8qb8qd2Iwyr8UMQcZu8ZdzQagctE4DkQ7HxAHdnM=;
        b=UYagugrhGFxy8HSG0xpampf/FpUeRm6Xh8VDgvgElQz74Vzr7lWtkY7iyuXVUnXFGo
         sYVEQTHwedxc9Wla2dQuGC82XcpIcGFQ3PnoC4ivPFHhx3l4kc3H6/i7H5um70APoVa7
         2vOKdc9Uu+1CBxd9PZW7EknCUSG2/gPNA/AunPOmBfYWVzicZ0f/tWbZxIv3ZUvV6iIA
         /97hm+/5eEGo6ts+glNiWiAxEb3mabfDyB9LGFDDkjOn77arKsewS6WeArxPP+FHyznQ
         kR3wlIU3PJKvVadCadXyoBlzhwp/U0qzmTk+8QESbGSunz+NwTQxBYVs1YjpNQSysGTH
         0Oiw==
In-Reply-To: <20200405182926.8B32F3651C3@zimbra.mdabbs.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: mike <mike@mdabbs.org>, Laura Garcia <nevola@gmail.com>

thanks for helping me, would you care to show me a basic example, I
have been reading the wiki and i got a bit confused, i barely know nft
since a day ago, thanks again

On Sun, Apr 5, 2020 at 2:29 PM mike <mike@mdabbs.org> wrote:
>
> R
>
>
>
> Sent from my Sprint Samsung Galaxy S9.
>
>
> -------- Original message --------
> From: Laura Garcia <nevola@gmail.com>
> Date: 4/5/20 12:59 PM (GMT-06:00)
> To: Alvaro Leiva <alvaroflmiranda@gmail.com>
> Cc: Mail List - Netfilter <netfilter@vger.kernel.org>
> Subject: Re: extending element timeout
>
> On Sun, Apr 5, 2020 at 3:21 PM Alvaro Leiva <alvaroflmiranda@gmail.com> wrote:
> >
> > just have a simple question, someone knows if its possible to extend
> > the timeout of an element in a set (with nft)?
> > thanks in advance
>
> Hi, it's only possible updating the element from packet path.
>
> Please refer to the _Element timeouts_ wiki page [0] for further details.
>
> Cheers.
>
> [0] https://wiki.nftables.org/wiki-nftables/index.php/Element_timeouts
