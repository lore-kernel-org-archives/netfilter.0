From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables latency?
Date: Mon, 8 Aug 2011 14:49:27 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108081449020.3288@frira.zrqbmnf.qr>
References: <CAA2qdGU5DYR-x5ib8Y+yjgxYzE+SaK_rq5x3RZR9S23hW90aUQ@mail.gmail.com> <20110808095145.00ef3e8a@catus> <CAA2qdGUbgb7K=f0DqPE6uRJao=TKV-YY6Ub-47WtGhV8VSPOuw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGUbgb7K=f0DqPE6uRJao=TKV-YY6Ub-47WtGhV8VSPOuw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: Marek Kierdelewicz <marek@piasta.pl>, netfilter@vger.kernel.org


On Monday 2011-08-08 13:49, Pandu Poluan wrote:

>(forgot cc: list first time around)
>
>On Mon, Aug 8, 2011 at 14:51, Marek Kierdelewicz <marek@piasta.pl> wrote:
>> Hi,
>>
>>>Has anyone ever researched the latency of xtables when a Linux box
>>>functions as a firewall?
>>
>> This paper is a nice read:
>> http://www.google.com/url?sa=t&source=web&cd=6&ved=0CE0QFjAF&url=http%3A%2F%2Fcourseware.ee.calpoly.edu%2F3comproject%2FPublished%2520Papers%2Fsecurity.pdf&rct=j&q=iptables%20netfilter%20latency%20paper%20pdf&ei=2pI_Tu-VKITJswbov5Qg&usg=AFQjCNFjUZwGHDhdBhtxwQgqlQbYCMjBFw&cad=rja
>>
>
>Whoa, very nice paper! Thanks for the link; my Google-fu failed to find that
>
>> It's very detailed on the issue of rule overhead (Conclusion 5.1 b).
>> Unfortunately paper is from 2002. Since then most of the code was
>> rewritten. Maybe we, as netfilter community, should lobby some
>> university professor to let his students do a *remake* of this
>> work ;-). Anyone here with ties to education sector?
>>
>
>A 'remake' would be okay, IMO, since both the hardware platform *and*
>the code itself have been evolving.
>
>Maybe with more test cases/scenarios, and a *huge* and/or comples
>iptables rules :-)

http://jengelh.medozas.de/documents/Love_for_blobs.pdf
