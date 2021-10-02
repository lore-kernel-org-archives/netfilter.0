From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: testing if a named set exists?
Date: Sat, 2 Oct 2021 06:50:35 -0500
Message-ID: <CAOLfK3VJ28CLb5K-gbKVHO+F+vQh5wywb65wbFnAdsSpq2DQ-Q@mail.gmail.com>
References: <CAOLfK3UBEvRg8AQbLibVo9xp6tZjaE7_S1+uDyhhbR7Nj_eYhA@mail.gmail.com>
 <20211002035707.bf92730b8f667517ba53dfad@plushkava.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4HM5074L5Bz9v8y8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Pq4dveKI/N9mx6fsFCB836ACPwyBujekEELnWqLfmaM=;
        b=SYof4DpRVobRgTS+/gnB1E1H948HYnfZe3zxV58QvDl87PM/A1F3JrOMjC1DIis1+D
         IoyByWlz/X2o+EfrL9O/315rdaxXkbN5SBVbJD7ORJGEX20bowZgYx/1v7p9qhG+dawd
         unxL+ned9gtghpxxWhN8EH2ZDZGdtDU44nG7Q1CNIgtAZSVqacCZG44FgoFZSsLaBR0e
         jUicvMAAgS3/NFNwjsB5r3OPhwACCEun7mnTvp10zHalEcY9BnRe+5/gQi4f/4Q8LcIb
         X4mFE6KTU0KdlGF3jffJD2dfeYxOKGy5CVQNTodZObufuyGywfm5cMZ2XJkBeKCvCemI
         lK5g==
In-Reply-To: <20211002035707.bf92730b8f667517ba53dfad@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hey Kerin (and Duncan),

Thanks for the replies.

On Fri, Oct 1, 2021 at 9:57 PM Kerin Millar <kfm@plushkava.net> wrote:
>
> On Fri, 1 Oct 2021 20:16:17 -0500
> Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
>
> > I'd like to do something like the following:
> >
> > if exists $named_set
> >     nft add rule ip filter output ip daddr $named_set accept
> > else
> >     nft add rule ip filter output ip daddr $default_set accept
> >
> > Does anyone know if I can accomplish this with nftables?
> >
>
> The output of nft isn't particularly amenable to parsing unless it is instructed to produce JSON. The simplest way is to act upon the exit status value of a list set command.
>
> if nft --terse list set ip filter "$named_set" >/dev/null 2>&1; then ...

I should have been more specific...

I'm hoping to do this all in nft without hitting the shell. For
example, from "man bash" we have:

       ${parameter:-word}
              Use Default Values.  If parameter is unset or null, the
expansion of word is  substituted.   Otherwise,
              the value of parameter is substituted.

I was hoping for some sort of similar mechanism in nft. Like:

nft add rule ip filter output ip daddr
${named_set_does_not_exist:-default_named_set} accept

Thanks for the help!

-m
