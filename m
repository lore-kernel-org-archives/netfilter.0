From: Laura Garcia <nevola@gmail.com>
Subject: Re: Named sets with timeout
Date: Wed, 30 Oct 2019 09:06:39 +0100
Message-ID: <CAF90-WjSW=BxO7sEfr1C4qMD-XTYdGZe2HXBb+bDNbqnpHRShw@mail.gmail.com>
References: <cd3973f01a86ebc50a7fae9da40f29ce@mailtower.de>
 <87wocowgab.fsf@goll.lan> <CAF90-WiguQF4PfU=8jGBSeC+PrbizWj8hXNAUQUkzOpsoLcYjA@mail.gmail.com>
 <878sp3nihy.fsf@goll.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MhxAN0qJykbwrZwokBsl+Q3hWYUiqjf6PHIzB/gq5X8=;
        b=Dgac4+8k/8jJG9vMI9+QfrKhYzGIP3oc0ZyuG3J63xa1qdhfms2TlDVjE0FjzOCbj+
         buZ9fT8tqcM8SVkQ07lJRZgnWCaIlmX09nL/PlSb1iWp+1KANQcDvGeDEToIQYrDs2lh
         h42lZWuSOHhNuBf4USzn+d++AUoa91Pozmob23CU4ix0IQu2AVoYc/RtBKWLXmk5dqMF
         IZ/Q50Z4h5DJ3zv89eSxrttMc3vPxW1hLF3MtrZQWw7go90auQNPG+tVk0f5cFGZCenP
         L1R8XvgvPZlj89aOCUxTswA0o9Wpb8SkToziaakOHfPoaShH6delMkRJ74GRoOiwS5n5
         ro+A==
In-Reply-To: <878sp3nihy.fsf@goll.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Trent W. Buck" <trentbuck@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Wed, Oct 30, 2019 at 2:14 AM Trent W. Buck <trentbuck@gmail.com> wrote:
>
> Laura Garcia <nevola@gmail.com> writes:
>
> > On Tue, Oct 29, 2019 at 8:00 AM Trent W. Buck <trentbuck@gmail.com> wrote:
> >> I think you are right, but see [...]
> >> https://git.netfilter.org/nftables/commit/?id=24f33c7
> >> ...which sounds like there is a new (as-yet-undocumented?) keyword for
> >> changing (as opposed to initializing) the timeout of a set element.
> >
> > No new or undocumented keyword, [...]
> > "update" is what you're looking for. [....]
> > [2] https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_packet_path
>
> Thanks!
>
> I apologize for my wrong & misleading answer. :-{
>

No problem :)
