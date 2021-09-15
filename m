From: Cristian Constantin <const.crist@googlemail.com>
Subject: Re: base chains with same hook, same priority
Date: Wed, 15 Sep 2021 13:44:47 +0200
Message-ID: <CANCV4NOfOrfqeeNsQU5_Fkgn0k_FXj0paYBt2Gcz78-CJXeU2A@mail.gmail.com>
References: <CANCV4NPRwaBeu5R4q90PeTwSgj7hD7wVhGVDAPX7rR7JHP-hvQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=6xXr+jagwMXCXZceSBvKwXXsozMidYquiOKLbiofUcA=;
        b=PsjJ6yHZ26XSyk9vp1iDqld42C1jLzlrd5bsP1N1173ZW2D5Mqoo9XC8e9ZH8VQRMJ
         1zv6f4zrkibcf4wBZzXbie7v92ciNA80KqtG8FiLhXSqKRU04wW9jwXThFb4SeiOI5kl
         e2LN/4zbeN+BOyne06AfaPQJWPqAwzWMbOlqzRVrn9tWfW3Z/PKAdLWIGSubwgY9tSS5
         WGrIKUgkmnouSQ2BkdhvaK0RJ/QgtUdw2odzA20xMZUd2K4L9pNSCG9IK8FqEq0O7g2z
         o4nf07+pjYHIkKxTClnYrDmY4k5Y38fHUQfFCoZAw7OF43PK0t5MJqqWLHv9aOU6TsU1
         zhcQ==
In-Reply-To: <CANCV4NPRwaBeu5R4q90PeTwSgj7hD7wVhGVDAPX7rR7JHP-hvQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

cristian: one interesting side-effect...

after having two chains with the same hook, priority in the same table
(as above), `iptables` cmd line tool reports the respective table as
incompatible...

# /usr/sbin/iptables -t filter -S --wait
iptables v1.8.5 (nf_tables): table `filter' is incompatible, use 'nft' tool.

# iptables -L
iptables v1.8.5 (nf_tables): table `filter' is incompatible, use 'nft' tool.


On Wed, Sep 15, 2021 at 11:38 AM Cristian Constantin
<const.crist@googlemail.com> wrote:
>
> hi!
>
> quote from the wiki page:
>
> https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains
>
> "[...] It's possible to give two base chains the same priority, but
> there is no guaranteed evaluation order of base chains with identical
> priority that are attached to the same hook location."
> I have tested this on my system and it is actually allowed by `nft`, kernel.
>
> root@firiel:/home/cco# uname -a
> Linux firiel 5.8.0-63-generic #71-Ubuntu SMP Tue Jul 13 15:59:12 UTC
> 2021 x86_64 x86_64 x86_64 GNU/Linux
> root@firiel:/home/cco# lsb_release
> LSB Version: core-11.1.0ubuntu2-noarch:printing-11.1.0ubuntu2-noarch:security-11.1.0ubuntu2-noarch
> root@firiel:/home/cco# nft -v
> nftables v0.9.6 (Capital Idea #2)
> root@firiel:/home/cco# nft -a list table filter
> table ip filter { # handle 3
> chain INPUT { # handle 1
> type filter hook input priority filter; policy accept;
> }
> ...
> chain TEST { # handle 579
> type filter hook input priority filter; policy accept;
> }
>
> could someone please show me a use case for using multiple chains
> having the same hook and the same priority? (i.e. taking into account
> that _most of the time_ rule priority and thus evaluation order is
> important)
>
> and, in a more general sense, why is this configuration allowed (i.e.
> base chains with same hook, same priority)?
>
> thanks,
> cristian
