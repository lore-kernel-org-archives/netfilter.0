From: DOHC F22 <dohcf22@gmail.com>
Subject: Re: Need module help
Date: Fri, 13 Jan 2017 18:27:32 -0600
Message-ID: <CAH-pVi838ZUeqSKZu7JiLDYjX9R2upmfKP8xH8esD9YAhVJ95g@mail.gmail.com>
References: <CAH-pVi-McTaVYJjvsBLbnSVk+wW2biD+0U8byK3exrFHfig1Hg@mail.gmail.com>
 <72f2e366-c823-40a6-17d6-330e803bc52e@plouf.fr.eu.org> <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
 <20170108035307.GH8339@harrier.slackbuilds.org> <3d6b0822-d484-e41e-8141-94dc128b94ba@plouf.fr.eu.org>
 <CAH-pVi810QXjG5p_nhdpdGNcM2RWO7w9AZrE==t0-tzsyLEpLw@mail.gmail.com> <20170112181524.GJ8339@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=tc0qc2KhIgOhbMDBXCE8nBXImD9xnyhdXVNMXc18Vpc=;
        b=SEygyj5n6WtrwvdWDbc5eqceTk5gITGMR9Oe098xmCnfOHE/pP97BPetCzdSadf94I
         0qRUFuDpDaK30IIHoSq2TDXpTctD5e7mi5iLPLs8HmhtfZDlWnzsamO9TWPX/uGSK235
         BeddDQbEMk7YSuxeK25fXF5yv8UH7DP9GoV1E/5OeZAl6k1T7tPaKvkKKtlV61EBILMH
         eHk9AqdBKnNpfc8sAaoj9tzIDNH5M0tcYq158eQ963xuDxrH9r+/MPBOWsu3tj3coKek
         5T9HBMcHnNJVzqcYYStIRMAArRlAjCIKPK/ZjeNlpPljS6tpq51tgjTtNqnyR4A5TPcN
         3c5Q==
In-Reply-To: <20170112181524.GJ8339@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Jan 12, 2017 at 12:15 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:
>
> No.  Well, *maybe* depending on distro, but the Linux kernel is
> distributed by the upstream project (kernel.org) as source code.
>
> Are you saying that those modules are not found on your system?  If
> that's the case you're going to have to recompile your kernel with
> all necessary options enabled.
>
> BTW just about any distro kernel gets this right.  Only custom
> kernels built by inexperienced people have problems like this.
> (This issue is often seen on VPS systems where you don't control
> your own kernel, too.)
>
> I suspect a hefty amount of "XY question" is involved here, in
> addition to a lack of background information.  Perhaps if you share
> the background on what you're trying to accomplish, you can get the
> kind of help you can use.
> --
>   http://rob0.nodns4.us/
>   Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:

Ok, what I'm trying to do is mark certain packets on my Fire TV (it's
running android) so when they get to my router I can filter them
accordingly.  I was told that MARK wouldn't travel with the packet but
ToS would.
