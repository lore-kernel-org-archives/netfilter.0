From: Laura Garcia <nevola@gmail.com>
Subject: Re: [ANNOUNCE] nftlb 0.6 release
Date: Wed, 1 Apr 2020 10:42:59 +0200
Message-ID: <CAF90-WhdQ_GL8QYsQcNzLhQQAfrfd42t9oOSNW4E9D4YSS1DWA@mail.gmail.com>
References: <CAF90-WgSo3SbBR4zsXH99380r5rSpZRGrpbKbh3oSRa9Qr8C6w@mail.gmail.com>
 <87ftdnu82e.fsf@goll.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jXR2E2G3mZit3j+uzZvnM1yUospYVHdXzs9QT/f76BY=;
        b=KCFQS6qB8cChh1dQalOfDS098YWvbIWh/RiIFJ0vE/uMNAmzWFC0p01wmzz0mQXEu5
         LpOIx6v2fTDPQId3IbPXMEyVD9B7SqZDQG7L3BTogYuZl4MXiBq2x3s/TkJsiPD0rO8M
         XyYmrncKptrhQqwmV7xLE1CBZ05r2VHI9MLsfIWHmjpfotK/YU6NxEDXxdP+dHY4Y81X
         aJ4OIdkFiJgDe76SVozfK3k1r61XcEKNxbH2HkzGHFrq1l1EFDglCxokzjEDpZiAdm5q
         I8h4/HYzT5mmKgnx14IxBKS2vz6gEzcbyzEAfKyhRautkBaYuXXszWV+zYnsROPmtaAx
         x+mA==
In-Reply-To: <87ftdnu82e.fsf@goll.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Trent W. Buck" <trentbuck@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>, Netfilter Development Mailing list <netfilter-devel@vger.kernel.org>

On Wed, Apr 1, 2020 at 6:50 AM Trent W. Buck <trentbuck@gmail.com> wrote:
>
> Laura Garcia <nevola@gmail.com> writes:
>
> > nftlb stands for nftables load balancer, a user-space tool
> > that builds a complete load balancer and traffic distributor
> > using the nft infrastructure.
> >
> > nftlb is a nftables rules manager that creates virtual services
> > for load balancing at layer 2, layer 3 and layer 4, minimizing
> > the number of rules and using structures to match efficiently the
> > packets. It comes with an easy JSON API service to control,
> > to monitor and automate the configuration.
> > [...]
> > https://github.com/zevenet/nftlb
>
> This is really cool, thanks!
>

Appreciated!

> A couple of dumb comments (I hope that's OK):
>
> | Note 2: Before executing nftlb, ensure you have empty nft rules by
> | executing "nft flush ruleset"
>
> Does this mean nftlb needs exclusive control over the entire nft
> ruleset?  It's not immediately obvious to me if it can peacefully
> coexist with e.g. sshguard's nft rules, or even a simple handwritten
> "tcp dport { ssh, https } accept; drop" input filter.
>
> If it's best practice to flush ruleset when nftlb starts,
> why not make that an argument?  i.e. nftlb --[no-]flush-ruleset-on-start
>

That point should be extended in the documentation, for sure:

nftlb daemon has exclusivity to the tables named with "nftlb": ip
nftlb, ip6 nftlb, netdev nftlb...

Only in that scope, nftlb will manage automatically the rules so the
admin shouldn't modify them manually (unless you know what you're
doing :). In regards to the flushing behavior, nftlb already checks if
the tables exist and then flush them if required, so the "flush
ruleset" is no longer needed. For more info, see this issue [0].

Said that, you're indeed able to integrate nftlb with your firewall or
clustering rules, creating your own table and playing with chain
priorities. Please refer to the developers guide to know the
priorities for every stage of nftlb [1].

So, if you want to place a firewall rule before a nat-based virtual
service, you've to use a priority less than -150 in prerouting. I'll
extend the documentation in that matter.

>
> | nftlb uses a quite new technology that requires:
> | nf-next: [...]
> | nftables: [...]
>
> Does it need bleeding-edge git versions, or are latest stable releases OK?
> You could add something reassuring like:
>
>     nftlb 0.6 definitely works with mainline linux 5.6 and nft 0.9.1.
>

At the beginning of the project it was needed, but not today. With
stable releases should work pretty fine. I'll update it.

>
> Finally, I think README.md should link to the nft docs for curious
> people like me, e.g.:
>
>     # How does it work?
>
>     The main "active ingredient" is numgen, see here for handwritten examples:
>
>     https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
>     https://www.netfilter.org/projects/nftables/manpage.html
>
> ...although AFAICT the "man nft" doesn't yet mention numgen AT ALL :-(
>

In regards to the manual, probably my fault :)

Well, numgen is one of them but not the only one. Hash expressions are
also helping in all of this. I'll update it for sure in the README.

Thank you for your comments!

[0] https://github.com/zevenet/nftlb/issues/14
[1] https://www.zevenet.com/knowledge-base/nftlb/nftlb-developers-guide/
