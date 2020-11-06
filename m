From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Fri, 6 Nov 2020 10:24:35 -0500
Message-ID: <CANf9dFPU8e8OC5aJci-0D+awcyNpKL+tCkCZi+0TUZjQ1=p9xg@mail.gmail.com>
References: <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net> <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc> <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
 <20201105170754.GB25824@breakpoint.cc> <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
 <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com>
 <20201105210146.GA10732@salvia> <CANf9dFPDXiO3kYa-=UzknyjCcu4Y5tEkZZnQP9GhD9VG=OcFBw@mail.gmail.com>
 <20201106105833.GA13845@salvia> <CANf9dFNjO+912xTqgheHRB2wqbstMXNv2+VFV6L+QxyyTLVUgA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JOds+pWaPwC/cZEGlnSaG3xlm1HUnxJPU1wdkiUhlvo=;
        b=dllfmqFgejU7QSejrqwcWpaLlbAa2npKzeERwQpNYGnWxSyq/RtChfah1WgzRYFh9K
         4FfmZu8oxMGwIuj/4IiAt0lK+t1bywnzGX/HuIoyGu3jOMBv6iOVyzBo34v9HiBywBed
         OLr5wn4+QmCoKS4h8Pn9xdHroJIEVkg/xhcBOk847AzL3ruRr84NIhaI4qufFNI7/O0t
         J9lvHe9tfkcjRyPZ60vSKp1JjiIQL8Hv5o/A6cBAdKZqx5WUm+Ef6MskjKJDWbyiTdhF
         KAF104zkatfoaI7merr1HoEJSU/Py95aFrhq93A/MYFu+1k68eTjzyaOJDLFA+sjs6/d
         tPPw==
In-Reply-To: <CANf9dFNjO+912xTqgheHRB2wqbstMXNv2+VFV6L+QxyyTLVUgA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

I think I just answered my previous question:

> Does prepending the "more destructive" 'flush ruleset' statement at
> the very beginning of the 'firewall.nft' file still honor the
> "atomicity" guarantee of running 'nft -f' again this file, or is this
> guarantee only honored when prepending 'flush table' statements? In
> other words, is there a minute period after running 'flush ruleset' in
> my file where the node is unprotected?

According to https://wiki.nftables.org/wiki-nftables/index.php/Operations_at_ruleset_level:

    BACKUP/RESTORE

    You can combine these two commands above to backup your ruleset:

    % echo "nft flush ruleset" > backup.nft
    % nft list ruleset >> backup.nft

    And load it atomically:

    % nft -f backup.nft

I interpret this to mean that my original method of doing things is as
atomic as using 'flush table <tablename>', even if it is more
destructive. I guess going forward I will have to make sure to prepend
'flush table' statements for every individual table I refer to in my
'firewall.nft' file.

Thanks,
-Martin
