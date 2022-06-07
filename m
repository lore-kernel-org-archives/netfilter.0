From: Gio <gioflux@gmail.com>
Subject: Re: Validating this is the right conntrack ruleset
Date: Tue, 7 Jun 2022 12:08:48 -0400
Message-ID: <CADhidkr_khLDNYCgAHT1dQosfz-qizKdM1vFXosNhA2YqBD4iw@mail.gmail.com>
References: <CADhidkpx+3=1aZj5OF11JR6y_g16xqV=tyx5Bn=dG_kisJwP2w@mail.gmail.com>
 <20220606163048.de7ca3450ec3048fb9c3e3ba@plushkava.net> <20220606165118.a91d1d2e153fba420ef18f76@plushkava.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H7OMUonEAzIlUS/P9JfYO872ChNGvo+hgW9ccltd+Mk=;
        b=emBlA2hrHtldCvFH0HzM0HB2+d04/QAnA6lX3atmQcr7izN5bcHJfrUf6M0ynL0pol
         PFLnLVrOHa9tuMy1riwDGoKlClbJvk76xzeJvkMDB3JNlMPwtz51P5C/uL8IPe8EeKuV
         WXbSSVmikXVnzWlsutdHoqt3CnLMgfpadIl6ltERXBxsShWO60idLmH2WYsRzR2MRTCM
         S3qjZRIftdqc2I7x8K9uXXPnwwTIt/EM85T6S1qP5KMorGO9dPpmPEVPo1MaZub8kTMk
         WWdyyUBT6HI3y8tqY8FTNN1NlawOcigMDSQ6nDpjXmLhxXj0kFpp7iE/vmRSmczqcjkW
         53Ew==
In-Reply-To: <20220606165118.a91d1d2e153fba420ef18f76@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org

Thank you; I appreciate the help with clarity. The most important
takeaway for me was that there are implicit return packet/replies
rules that don't need to be in the opposite hook (output for input,
etc).

The example was excellent to illustrate this too.

For the sake of completeness; would the 'implicit' return packet rule
be 'ct state established,related ct direction reply' ? Example:

table inet legacy {
    chain root_in {
        type filter hook input priority filter; policy drop;
        ct state established,related accept
        iifname "lo" accept
        meta l4proto ipv6-icmp accept
        tcp dport 80 fib daddr type local ct state new accept
    }
    chain root_out {
        type filter hook output priority filter; policy drop;
        ct state established,related ct direction reply accept
        iifname "lo" accept
    }
}

On Mon, Jun 6, 2022 at 11:51 AM Kerin Millar <kfm@plushkava.net> wrote:
>
> On Mon, 6 Jun 2022 16:30:48 +0100
> Kerin Millar <kfm@plushkava.net> wrote:
>
> >         tcp dport 80 fib daddr type local ctstate new accept
>
> Please excuse the typo. Of course, I meant to write "ct state" there.
>
> --
> Kerin Millar
