From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: [ANNOUNCE] nftlb 0.6 release
Date: Wed, 01 Apr 2020 15:46:33 +1100
Message-ID: <87ftdnu82e.fsf@goll.lan>
References: <CAF90-WgSo3SbBR4zsXH99380r5rSpZRGrpbKbh3oSRa9Qr8C6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org

Laura Garcia <nevola@gmail.com> writes:

> nftlb stands for nftables load balancer, a user-space tool
> that builds a complete load balancer and traffic distributor
> using the nft infrastructure.
>
> nftlb is a nftables rules manager that creates virtual services
> for load balancing at layer 2, layer 3 and layer 4, minimizing
> the number of rules and using structures to match efficiently the
> packets. It comes with an easy JSON API service to control,
> to monitor and automate the configuration.
> [...]
> https://github.com/zevenet/nftlb

This is really cool, thanks!

A couple of dumb comments (I hope that's OK):

| Note 2: Before executing nftlb, ensure you have empty nft rules by
| executing "nft flush ruleset"

Does this mean nftlb needs exclusive control over the entire nft
ruleset?  It's not immediately obvious to me if it can peacefully
coexist with e.g. sshguard's nft rules, or even a simple handwritten
"tcp dport { ssh, https } accept; drop" input filter.

If it's best practice to flush ruleset when nftlb starts,
why not make that an argument?  i.e. nftlb --[no-]flush-ruleset-on-start


| nftlb uses a quite new technology that requires:
| nf-next: [...]
| nftables: [...]

Does it need bleeding-edge git versions, or are latest stable releases OK?
You could add something reassuring like:

    nftlb 0.6 definitely works with mainline linux 5.6 and nft 0.9.1.


Finally, I think README.md should link to the nft docs for curious
people like me, e.g.:

    # How does it work?

    The main "active ingredient" is numgen, see here for handwritten examples:

    https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
    https://www.netfilter.org/projects/nftables/manpage.html

...although AFAICT the "man nft" doesn't yet mention numgen AT ALL :-(

