From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Altering outgoing IP Address without Connection Tracking
Date: Wed, 7 Sep 2011 02:07:00 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109070203240.6539@frira.zrqbmnf.qr>
References: <4E66A5B8.4030700@gmail.com> <CAA2qdGWh6ofrFfee5v+_fxsinM2pi2PWq4C2zrjNqDVxyhTUBA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGWh6ofrFfee5v+_fxsinM2pi2PWq4C2zrjNqDVxyhTUBA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: Chris Burroughs <chris.burroughs@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2011-09-07 01:10, Pandu Poluan wrote:
>On 2011-09-07, Chris Burroughs <chris.burroughs@gmail.com> wrote:
>
>>I'd like to alter the outgoing IP address [...] without incurring
>>the overhead of running conntrack.

>(Sorry for top posting; Gmail java mobile client sucks)

Take another client, then?

>IIRC, You can do stateless NAT using iproute2.

That sounds so terribly obscure that it might as well not be implemented 
in the first place.
Yes, the manpage is clear on that, once read:

|./man/man8/ip.8:Route NAT is no longer supported in Linux 2.6.

More likely successful is xt_RAWDNAT / xt_RAWSNAT instead (including
the pains coming from stateless NAT).
