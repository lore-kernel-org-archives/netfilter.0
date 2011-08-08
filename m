From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: xtables latency?
Date: Mon, 8 Aug 2011 09:51:45 +0200
Message-ID: <20110808095145.00ef3e8a@catus>
References: <CAA2qdGU5DYR-x5ib8Y+yjgxYzE+SaK_rq5x3RZR9S23hW90aUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGU5DYR-x5ib8Y+yjgxYzE+SaK_rq5x3RZR9S23hW90aUQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org

Hi,

>Has anyone ever researched the latency of xtables when a Linux box
>functions as a firewall?

This paper is a nice read:
http://www.google.com/url?sa=t&source=web&cd=6&ved=0CE0QFjAF&url=http%3A%2F%2Fcourseware.ee.calpoly.edu%2F3comproject%2FPublished%2520Papers%2Fsecurity.pdf&rct=j&q=iptables%20netfilter%20latency%20paper%20pdf&ei=2pI_Tu-VKITJswbov5Qg&usg=AFQjCNFjUZwGHDhdBhtxwQgqlQbYCMjBFw&cad=rja

It's very detailed on the issue of rule overhead (Conclusion 5.1 b).
Unfortunately paper is from 2002. Since then most of the code was
rewritten. Maybe we, as netfilter community, should lobby some
university professor to let his students do a *remake* of this
work ;-). Anyone here with ties to education sector?

Best regards,
Marek Kierdelewicz
