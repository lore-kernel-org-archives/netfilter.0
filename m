From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: nft named set address types
Date: Tue, 2 Nov 2021 15:56:52 -0500
Message-ID: <CAOLfK3WcLtsA_CB+Hbrj6p4UnvSZYK8tHAuM0sVCimMZwFR4Kw@mail.gmail.com>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
 <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com> <YYGeTgBAZfM76k4h@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4HkMf830X2z9vsDH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/KU/KsQ9mgKPN7HdF/RKR47IG9Gmqn52NIGDx7C4dQ=;
        b=ITeMSK2DeOmKeFczQF89pc5JvWfoIWN/OJy7zTM8/C2Yw1ViOE55F7RGII/xWD4kVl
         8c51r3hzzKGWfKll9v1DJlWcZfsi6P1wgYuJVH6fLS7Dw8inkJHIxkTMrBQSXTtR9zJX
         4/Kr5sJDdMjfJ7Wix1vTrhPVCZ7ecKfbZmJi94BOC3Dornq2D4WGLfUMcemRNUfIuaJ7
         v6eI1PslDs60q5/oMSqtDyYlOLulurCba4Hh8vO3IHazNX1u663aixJz6fIyJw6qaD7n
         gcbXyPBrU01EkNuIPTE/EWLNI5ePd6Mjty2Ebb4Ml22dm9UGYXCioz75e41rLPrzqOJV
         H19w==
In-Reply-To: <YYGeTgBAZfM76k4h@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter <netfilter@vger.kernel.org>

Hey Pablo!

On Tue, Nov 2, 2021 at 3:23 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Tue, Nov 02, 2021 at 02:39:33PM -0500, Matt Zagrabelny wrote:
> > Replying to myself...
> >
> > On Mon, Nov 1, 2021 at 3:46 PM Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> > >
> > > Hello,
> > >
> > > I'd like to use the "inet" address family in a named set. I see nft
> > > supports the following address families [AF] (among others):
> > >
> > >        ip       IPv4 address family.
> > >
> > >        ip6      IPv6 address family.
> > >
> > >        inet     Internet (IPv4/IPv6) address
> > >                 family.
> >
> >
> > I'm not sure nftables even would allow an "inet" to be used in a rule such as:
> >
> > table inet filter {
> >     chain input {
> >         inet saddr { 127.0.0.1, ::1 } tcp dport 22 accept
> >     }
> > }
> >
> > Instead, it seems I must do:
> >
> > table inet filter {
> >     chain input {
>
> there is no chain definition here, this chain sees no traffic.

I've got it defined in a different include file:

table inet filter {
    chain input {
        type filter hook input \
        priority 0;
        policy drop;
    }
    chain forward {
        type filter hook forward \
        priority 0;
        policy drop;
    }
    chain output {
        type filter hook output \
        priority 0;
        policy accept;
    }
}


>
>           type filter hook input priority filter; policy drop;
>
> is missing.
>
> >         ip saddr 127.0.0.1 tcp dport 22 accept
> >         ip6 saddr ::1 tcp dport 22 accept
>
> Better split your ruleset in a tree using verdict maps:
>
> table inet filter {
>     chain input_ip4 {
>         ip saddr 127.0.0.1 accept
>     }
>
>     chain input_ip6 {
>         ip6 saddr ::1 accept
>     }
>
>     chain input {
>         type filter hook input priority filter; policy drop;
>         ct state vmap { established : accept, related : accept, invalid : drop }
>         # implicit match on 'ct state new,untracked'
>         tcp dport 22 meta protocol vmap { ip : jump input_ip4, ip6 : jump input_ip6 }
>     }
> }

That's cool about the verdict maps. I'll have to read up on those.

Though, I still feel like I should be able to say:

chain input {
    inet saddr {127.0.0.1, ::1} accept
}

Anyhow. It seems that is currently an impossibility.

Thanks for the reply and the info about verdict maps.

I appreciate it!

-m
