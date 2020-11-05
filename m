From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 16:45:31 -0500
Message-ID: <CANf9dFPDXiO3kYa-=UzknyjCcu4Y5tEkZZnQP9GhD9VG=OcFBw@mail.gmail.com>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net> <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc> <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
 <20201105170754.GB25824@breakpoint.cc> <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
 <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com> <20201105210146.GA10732@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=icF40xuEL7geB90ZpipGFFqUu194cEJ8MmGO9WQLlvE=;
        b=OT51YqdLYd/p2Poke9riBvkU4Qdohfe4mYypK7zDfCHzSNChlXC1O7P+nNecA4EQ/c
         Ux6kczembdTPjuPbJIymVOm1umEMu7g8whUM7Rw8A1IH45me3F0aB/E68mSOS+8dkM98
         mJOGjEe0hr6Glup1F//g93HK6cPeBkMfyXtEVXvFqWWSnkB2yU4yRmt+EQM4UqK5Qvmu
         Ot4qXzhgi/7pkuTZ0opvqhoLkXYYAOE9G/dSBH7/58R84yNZ4CMS5Km4pNuAzT09cNp5
         lGFcGeIegMkF9ZQZP5evecFFIScLcWCF2sk5ud/P4efA4yGggUNG8uzzKsjxALJkbuss
         GDOg==
In-Reply-To: <20201105210146.GA10732@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Hi Pablo,

> You can dynamically add/delete devices to/from flowtables since Linux
> kernel 5.8

Are you referring to this patch ?:
https://www.spinics.net/lists/netfilter-devel/msg67310.html

I tried with Fedora 33 (5.8.17-300.fc33.x86_64) and this file:

    [root@localhost ~]# cat /etc/nftables/firewall.nft
    flush ruleset

    table inet x {
        flowtable f {
                hook ingress priority 0;
    }
            chain y {
                    type filter hook forward priority 0; policy accept;
                    ip protocol tcp flow offload @f
                    counter packets 0 bytes 0
            }
    }

and indeed it does load without error, although I had to compile the
latest version of nft (v0.9.7) as v0.9.3 (which comes with Fedora 33)
was giving me this error:

    [root@localhost ~]# nft -f /etc/nftables/firewall.nft
    /etc/nftables/firewall.nft:4:12-12: Error: Unbound flowtable not
allowed (must specify devices)
        flowtable f {
                ^
Once I added my br0 interface wih 'ip link add br0 type bridge' I was
able to run 'nft add flowtable inet x f { devices = { br0 } \; }'
without error.

However, if I run 'nft -f /etc/nftables/firewall.nft' again and then
'nft list ruleset', br0 is gone. Does this mean that it is no longer
bound to a flow table?

The way I have been handling rule changes so far is to modify a single
'/etc/nftables/firewall.nft' file every time I need to modify rules
and then run 'nft -f /etc/nftables/firewall.nft' to reload and apply
those changes (I don't tend to run single nft commands to update
things here and there -- I prefer to modify a single file as the
source of truth and then reload the ruleset completely). Running
something like 'nft add flowtable inet x f { devices = { br0 } \; }'
once upon boot up when a logical interface comes up is fine, but does
my workflow require that I then run 'nft add flowtable inet x f {
devices = { br0 } \; }' after every time I run 'nft -f
/etc/nftables/firewall.nft'?

Is my workflow wrong? It is based on my experience with pf/pf.conf
from OpenBSD/FreeBSD where all changes to rules are made in one file
which is then reloaded atomically. Has my familiarity with OpenBSD
steered me wrong with regards to nftables?

Thanks,
-Martin
