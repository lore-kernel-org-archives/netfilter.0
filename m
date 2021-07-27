From: Tom Yan <tom.ty89@gmail.com>
Subject: Re: [nft] Regarding `tcp flags` (and a potential bug)
Date: Tue, 27 Jul 2021 22:52:39 +0800
Message-ID: <CAGnHSEncHuO2BduzGx1L9eVtAozdGb-XabQyrS7S+CO2swa1dw@mail.gmail.com>
References: <CAGnHSEkt4xLAO_T9KNw2xGjjvC4y=E0LjX-iAACUktuCy0J7gw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=bqgjWx1Khk9QvAsm2yAY1e/t4WthR/WGDWEo5wxT6Mg=;
        b=hKtnlGBa5MettR0jyAoTJctx+DWjODE6NXsvBsJ6bqG3/i/qJImdr1A6g0v8K3bs4u
         SbSBLKSw+/LjZnaMg/Y6n0RLlDbQsCHG6XAKfDDUMy9R7OHmneL7l1vDv4Z/80Fk/Idt
         cXzIyNCLzqFNB5SQP9xQnjJjoJPr/RpStIibCKK7QF4hv3uBfQsZMjRpK22MP3rlzo2o
         GpvvPh7dt3nAgVKcKoxtG5f5CIL30n2e+GkTiOPkUcdePpJYusXqN1mN53rzDKm66eWH
         1VATVWRiVha/G6WXGMi8WoaxuuRhQtMzdoCd7P44BwYZendhk2fs33aStg/mgA+KrD1y
         xLCw==
In-Reply-To: <CAGnHSEkt4xLAO_T9KNw2xGjjvC4y=E0LjX-iAACUktuCy0J7gw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Just noticed something that is even worse:

# nft add rule meh tcp_flags 'tcp flags { fin, rst, ack }'
# nft add rule meh tcp_flags 'tcp flags == { fin, rst, ack }'
# nft add rule meh tcp_flags 'tcp flags & ( fin | rst | ack ) != 0'
# nft add rule meh tcp_flags 'tcp flags & ( fin | rst | ack ) == 0'
# nft list table meh
table ip meh {
    chain tcp_flags {
        tcp flags { fin, rst, ack }
        tcp flags { fin, rst, ack }
        tcp flags fin,rst,ack
        tcp flags ! fin,rst,ack
    }
}

On Tue, 27 Jul 2021 at 19:18, Tom Yan <tom.ty89@gmail.com> wrote:
>
> Hi all,
>
> I'm a bit uncertain how `tcp flags` works exactly. I once thought `tcp
> flags syn` checks whether "syn and only syn is set", but after tests,
> it looks more like it checks only whether "syn is set" (and it appears
> that the right expression for the former is `tcp flags == syn`):
>
> # nft add rule meh tcp_flags 'tcp flags syn'
> # nft add rule meh tcp_flags 'tcp flags ! syn'
> # nft add rule meh tcp_flags 'tcp flags == syn'
> # nft add rule meh tcp_flags 'tcp flags != syn'
> # nft list table meh
> table ip meh {
>     chain tcp_flags {
>         tcp flags syn
>         tcp flags ! syn
>         tcp flags == syn
>         tcp flags != syn
>     }
> }
>
> Then I test the above respectively with a flag mask:
>
> # nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) syn'
> # nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) ! syn'
> # nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) == syn'
> # nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) != syn'
> # nft list table meh
> table ip meh {
>     chain tcp_flags {
>         tcp flags & (fin | syn | rst | ack) syn
>         tcp flags & (fin | syn | rst | ack) ! syn
>         tcp flags syn / fin,syn,rst,ack
>         tcp flags syn / fin,syn,rst,ack
>     }
> }
>
> I don't suppose the mask in the first two rules would matter. And with
> `tcp flags syn / fin,syn,rst,ack`, I assume it would be false when
> "syn is cleared and/or any/all of fin/rst/ack is/are set"?
>
> Also, as you can see, for the last two rules, `nft` interpreted them
> as an identical rule, which I assume to be a bug. These does NOT seem
> to workaround it either:
>
> # nft flush chain meh tcp_flags
> # nft add rule meh tcp_flags 'tcp flags == syn / fin,syn,rst,ack'
> # nft add rule meh tcp_flags 'tcp flags != syn / fin,syn,rst,ack'
> # nft list table meh
> table ip meh {
>     chain tcp_flags {
>         tcp flags syn / fin,syn,rst,ack
>         tcp flags syn / fin,syn,rst,ack
>     }
> }
>
> I'm not sure if `! --syn` in iptables (legacy) is affected by this as
> well. Anyway, I'm doing the following for now as a workaround:
>
> # nft flush chain meh tcp_flags
> # nft add rule meh tcp_flags 'tcp flags ! syn reject with tcp reset'
> # nft add rule meh tcp_flags 'tcp flags { fin, rst, ack } reject with tcp reset'
> # nft list table meh
> table ip meh {
>     chain tcp_flags {
>         tcp flags ! syn reject with tcp reset
>         # syn: 1, other bits: not checked
>         tcp flags { fin, rst, ack } reject with tcp reset
>         # syn: 1, fin: 0, rst: 0, ack: 0, other bits: not checked
>         ct state != invalid accept
>     }
> }
>
> Are the comments in above correct? Are any of the assumptions in this
> email incorrect?
>
> As a side question, is it even possible that any packet will be
> considered `invalid` with (syn: 1, fin: 0, rst: 0, ack: 0)?
>
> Thanks in advance!
>
> Regards,
> Tom
