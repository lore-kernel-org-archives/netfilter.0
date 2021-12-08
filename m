From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Matching metainformation cgroup fails on input, works on output.
Date: Wed, 8 Dec 2021 09:51:03 -0500
Message-ID: <CANf9dFPwOmwCMKCrQgz8s5A5X+cxF2T9saCh2johU8j9XFB97A@mail.gmail.com>
References: <874k7j31no.fsf@laptop.lockywolf.net> <CANf9dFMcpnqO-at25EKfxad7fX=yT9s0A7EDBgac1doL3fGxpg@mail.gmail.com>
 <8735n32nax.fsf@laptop.lockywolf.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RYiUA7oV2NjSvTGeX4TvlE9TKKPi1atcA/vjlycMXjA=;
        b=COfmCHpxbAyPn/mG+1SpYQ2KaponkkKSF/ZXa9yhdoAS7yCIvd/bFcVwS/QYueD82h
         HbZ/c+04LXk8vGSoMdyZdHPFnyoskTyS+0//m1JCCUF2G6I984/j7BwaUPSp0n3xxqr5
         Azk+BS5lsu2i9B9tTF0E/AR+Drxp0SYt5S4prf5biBgbblXWdIoARcLcxGKxkcT7eaZc
         uCuu10HBN0aHyDOM++36n7455vxqiXQIQ9wHNN3G09ljz5m3sFZvsl32K+NlShSt9M1S
         GSfwMoKIp8YVy4nj4mv/D5cJdrYokQAzb0TSwDhIJuM+Unx4FoIwFaXE5mC9loaf+90S
         RN7A==
In-Reply-To: <8735n32nax.fsf@laptop.lockywolf.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Nikishkin <lockywolf@gmail.com>
Cc: netfilter@vger.kernel.org

I tried the same setup as you, and indeed I get the same result (i.e.
no counter increase on INPUT). nftrace also shows that the packet
doesn't match the INPUT rule.

This is just a stab in the dark, but isn't it possible that the INPUT
rule doesn't match because nftables has no way to filter random
INCOMING packets on cgroups? I mean, how would nftables know which
cgroup any incoming packet would be associated with?

-Martin

On Wed, Dec 8, 2021 at 9:22 AM Vladimir Nikishkin <lockywolf@gmail.com> wrote:
>
> I have just tested it (again) by flushing the old ruleset and using the
> following ruleset:
>
> ```
> table ip filter {
>         counter test-icmp-output {
>                 packets 3 bytes 252
>         }
>
>         counter test-icmp-input {
>                 packets 0 bytes 0
>         }
>
>         chain INPUT {
>                 type filter hook input priority filter; policy accept;
>                 meta cgroup != 4096 ip saddr 8.8.8.8 ip protocol icmp counter name "test-icmp-input"
>         }
>
>         chain OUTPUT {
>                 type filter hook output priority filter; policy accept;
>                 meta cgroup != 4096 ip daddr 8.8.8.8 ip protocol icmp counter name "test-icmp-output"
>         }
> }
> ```
>
> As previously, the cgroup 0x001000 does not exist. The three outbound
> packets are the three ping packets, and they were successfully replied
> to.
>
> Martin Gignac <martin.gignac@gmail.com> writes:
>
> > What is the complete output of 'nft list ruleset'?
> >
> > Is it possible you have an earlier INPUT rule that matches and allows
> > packets that match connection-tracking "established" state, such as:
> >
> >         chain INPUT {
> >                 type filter hook input priority filter; policy drop;
> >                 ct state established,related counter packets 391638047
> > bytes 93651768866 accept
> >                 ct state invalid drop
> >                 [...]
> >
> > -Martin
> >
> >
> > On Wed, Dec 8, 2021 at 4:39 AM Vladimir Nikishkin <lockywolf@gmail.com> wrote:
> >>
> >> Hello, everyone.
> >>
> >> I have a weird problem!
> >>
> >> This is my nft code:
> >>
> >> ```
> >> nft add counter filter test-icmp-output
> >> nft add counter filter test-icmp-input
> >> nft add rule filter OUTPUT meta cgroup != 0x001000 ip daddr 8.8.8.8 ip protocol icmp counter name test-icmp-output
> >> nft add rule filter INPUT  meta cgroup != 0x001000 ip saddr 8.8.8.8 ip protocol icmp counter name test-icmp-input
> >> ```
> >>
> >> Pinging 8.8.8.8 works. The packets are visible on tcpdump too.
> >> The cgroup id 0x001000 does not exist, so every packet should match.
> >>
> >> Still, the output counter counts the expected number of packets, the
> >> second stays 0.
> >>
> >> What am I doing wrong?
> >>
> >> --
> >> Your sincerely,
> >> Vladimir Nikishkin (MiEr, lockywolf)
> >> (Laptop)
>
>
> --
> Your sincerely,
> Vladimir Nikishkin (MiEr, lockywolf)
> (Laptop)
