From: Tom Yan <tom.ty89@gmail.com>
Subject: Re: [nft] Regarding `tcp flags` (and a potential bug)
Date: Thu, 29 Jul 2021 10:27:57 +0800
Message-ID: <CAGnHSEknUAcg=bk1D43oZNMt=4GOZUcqh5Vt6=FU+ebRKtqcWw@mail.gmail.com>
References: <CAGnHSEkt4xLAO_T9KNw2xGjjvC4y=E0LjX-iAACUktuCy0J7gw@mail.gmail.com>
 <CAGnHSEncHuO2BduzGx1L9eVtAozdGb-XabQyrS7S+CO2swa1dw@mail.gmail.com> <20210727211116.GA13897@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZiFuRn3UE8R4w3uIIXV4HugCKOA0UGhYmzbbJQgIxcg=;
        b=SkDKe3cUZ/eHl9JQ6CSsP5+mQnFnkJIIZVgNo8qhtWvsBFoShGlQCU1MfraDTMeDdO
         njkn1zfU1r3YhYjrp6Q8VkGt2rqYl/GiFov/cWXH+GhDr2Co0+rzix5FUrEQGGTr97nF
         xYEkGlIjvuwZU12mA6nHHvrueeWSnpOWNu6MflKtCtrkqDcMR+EShMyM1jE7DOI5bN96
         jGvUasU2bNYw+mkVLtN8L4lhpapgszkw7MGRaWpbvcDLdwOTwRFQhqU/PI4yNYc/VUhI
         s0xcPhTMrXKkal+rwQQL2gnW4yk6onpwKC9FeYgqQ4FfUu9T7oLSGu5EJcyKJt75pcz4
         N1jw==
In-Reply-To: <20210727211116.GA13897@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Well, same problem as what I mentioned in the last reply from me for
your patch: inconsistent / unexpected meaning of the syntax.

As of the current code (or even according to what you said / implied
"should and would still be right"), `tcp flags syn` checks and checks
only whether the syn bit is on:

# nft --debug=netlink add rule meh tcp_flags 'tcp flags syn'
ip
  [ meta load l4proto => reg 1 ]
  [ cmp eq reg 1 0x00000006 ]
  [ payload load 1b @ transport header + 13 => reg 1 ]
  [ bitwise reg 1 = ( reg 1 & 0x00000002 ) ^ 0x00000000 ]
  [ cmp neq reg 1 0x00000000 ]

which I consider to be a really bad (or even wrong) "shortcut",
because it is so unexpected that it is not the same as this:

# nft --debug=netlink add rule meh tcp_flags 'tcp flags { syn }'
__set%d meh 3
__set%d meh 0
    element 00000002  : 0 [end]
ip
  [ meta load l4proto => reg 1 ]
  [ cmp eq reg 1 0x00000006 ]
  [ payload load 1b @ transport header + 13 => reg 1 ]
  [ lookup reg 1 set __set%d ]

Probably because `{ }` implies a `==`. And as per what you've written
in your other reply to me, apparently a mask implies one as well. So
many things implied. So "neat". But no one (at least not me) knows
what the different syntaxes mean anymore until they --debug=netlink...



On Wed, 28 Jul 2021 at 05:11, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Tue, Jul 27, 2021 at 10:52:39PM +0800, Tom Yan wrote:
> > Just noticed something that is even worse:
> >
> > # nft add rule meh tcp_flags 'tcp flags { fin, rst, ack }'
> > # nft add rule meh tcp_flags 'tcp flags == { fin, rst, ack }'
> > # nft add rule meh tcp_flags 'tcp flags & ( fin | rst | ack ) != 0'
> > # nft add rule meh tcp_flags 'tcp flags & ( fin | rst | ack ) == 0'
> > # nft list table meh
> > table ip meh {
> >     chain tcp_flags {
> >         tcp flags { fin, rst, ack }
> >         tcp flags { fin, rst, ack }
> >         tcp flags fin,rst,ack
> >         tcp flags ! fin,rst,ack
> >     }
> > }
>
> Could you develop the issue you're seeing here?
