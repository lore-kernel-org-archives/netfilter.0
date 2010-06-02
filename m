From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Wed, 2 Jun 2010 23:06:04 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006022250400.12072@obet.zrqbmnf.qr>
References: <loom.20100602T012732-376@post.gmane.org> <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com> <alpine.LSU.2.01.1006022103590.32028@obet.zrqbmnf.qr> <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Jeremiah Crockett <jrmhcrcktt@gmail.com>
Cc: Curby <curby@cur.by>, netfilter@vger.kernel.org

On Wednesday 2010-06-02 22:35, Jeremiah Crockett wrote:
>On Wed, Jun 2, 2010 at 1:27 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
>>The five --ctstates {NEW, ESTABLISHED, RELATED, INVALID, UNTRACKED}=20
>>_are mutually exclusive_ to another.
>
>[...] is it possible for a packet not to=20
>match any of these states?

No.

>      An skb will start out zeroed, i.e.
>      ...
>      Since the logic for xt_conntrack ctstate testing is:
>      ...
>      Packets basically start without any associated connection, that
>      is,
>      will be matched by -m conntrack --ctstate INVALID.
>
>      When it's nf_conntrack's turn, it may assign something to
>      skb->nfct,
>      which makes --ctstate NEW match. Or it may not (faulty packet,
>      no
>      association for ICMP, etc.), skb->nfct* is left as is, in other
>      words, it will continue to match --ctstate INVALID.
>
>
>This is perfect, as far as it goes.=C2=A0 It seems to me there is a gr=
eat need
>for someone to continue this,

Well ask more. With a bit of luck enough text will accumulate and=20
I'll get fired up to put it into book form, just as I did with=20
the "Writing Netfilter Modules" PDF.
But it needs assistance from novices , because experienced people see=20
less of a problem that they would consider worth documenting.

>an explanation of the logic, perhaps
>illustrated by code snippets, but not requiring every netfilter user t=
o be
>able to derive it for themself.=C2=A0
