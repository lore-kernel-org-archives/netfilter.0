From: "Jeff" <jnewman67@gmx.com>
Subject: RE: netfilter 10,000' overview
Date: Sat, 2 Oct 2021 22:01:53 -0400
Message-ID: <015801d7b7fa$a434a6e0$ec9df4a0$@gmx.com>
References: <010901d7b70a$86c8edf0$945ac9d0$@gmx.com>   <20211003004937.acbbc610fc32536fcdd9f736@plushkava.net> <015701d7b7f5$2d07dec0$87179c40$@gmx.com> <20211003023615.10f438fe018df4608587aef5@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633226515;
        bh=lLobq2PvxSe5PajUkDu9fExBFnu0XEFvqka3DyD+JSQ=;
        h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date;
        b=MIisktBaboQti5ZiqAw29vAUzDmrkCz1ulkmDzDKoifXbgWz+8Fl56DYsthxAUVfu
         AtBdXuc2x6i9iX1HfOlYvPMIjS3LAOJrsOWTznA7qWNuCoQTfWawE2p3aU6gLiN8EQ
         ebvdfyBSqX9iHFOe9o1o3/YuOeZwPyRdviuHb9gg=
In-Reply-To: <20211003023615.10f438fe018df4608587aef5@plushkava.net>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Kerin Millar' <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org

Thank you.

I actually found a set instructions online for converting iptables rules t=
o
nft rules using iptables-restore-translate.  It had me save the current
iptables config, translate it, flush the ruleset, then import the new
commands into nft, but it threw errors on the security filter commands, an=
d
failed to bring in my specific INPUT rules, so I just flushed the ruleset,
restored my iptables config, and then disabled iptables :)

I did compare the iptables save file and the nft translation, and the nft
rules read a little like Cisco- or MikroTik-style configuration commands.

I'll figure out nft and start using that.

Again, very appreciative of your time.

Jeff

=2D----Original Message-----
From: Kerin Millar <kfm@plushkava.net>
Sent: Saturday, October 2, 2021 9:36 PM
To: Jeff <jnewman67@gmx.com>
Cc: netfilter@vger.kernel.org
Subject: Re: netfilter 10,000' overview

(re-copying the list into CC ...)

On Sat, 2 Oct 2021 21:22:46 -0400
"Jeff" <jnewman67@gmx.com> wrote:

[...]

> Looking at the Redhat article you linked to, it appears that Fedora
> implements nftables under iptables, which I assume affect the
> nf_tables ruleset.  However, it mentions the inclusion of xtables
> utilities, but it appears those are just used to convert xtable-like
> rules compatible with nf_tables.  So it appears nf_tables  is the
underlying ruleset.

Since Fedora 32, apparently.

https://fedoraproject.org/wiki/Changes/iptables-nft-default

On such a system, you may find it interesting to compare the output of
"iptables-save" and "nft list ruleset".

>
> I'll do some learning on how to make rules in nftables, and get some
> of my scripts converted over, and see how I get along.

See, also, "iptables-translate" and "iptables-restore-translate". While no=
t
perfect, they are definitely useful.

>
> If I got anything wrong in this response, I'd appreciate knowing.
> Otherwise, I really do appreciate your time, and I'll leave you to
> what must be much more important things :)
>
> Jeff

=2D-
Kerin Millar

