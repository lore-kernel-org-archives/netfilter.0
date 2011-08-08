From: Pandu Poluan <pandu@poluan.info>
Subject: Re: xtables latency?
Date: Mon, 8 Aug 2011 18:49:49 +0700
Message-ID: <CAA2qdGUbgb7K=f0DqPE6uRJao=TKV-YY6Ub-47WtGhV8VSPOuw@mail.gmail.com>
References: <CAA2qdGU5DYR-x5ib8Y+yjgxYzE+SaK_rq5x3RZR9S23hW90aUQ@mail.gmail.com>
	<20110808095145.00ef3e8a@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110808095145.00ef3e8a@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

(forgot cc: list first time around)

On Mon, Aug 8, 2011 at 14:51, Marek Kierdelewicz <marek@piasta.pl> wrot=
e:
> Hi,
>
>>Has anyone ever researched the latency of xtables when a Linux box
>>functions as a firewall?
>
> This paper is a nice read:
> http://www.google.com/url?sa=3Dt&source=3Dweb&cd=3D6&ved=3D0CE0QFjAF&=
url=3Dhttp%3A%2F%2Fcourseware.ee.calpoly.edu%2F3comproject%2FPublished%=
2520Papers%2Fsecurity.pdf&rct=3Dj&q=3Diptables%20netfilter%20latency%20=
paper%20pdf&ei=3D2pI_Tu-VKITJswbov5Qg&usg=3DAFQjCNFjUZwGHDhdBhtxwQgqlQb=
YCMjBFw&cad=3Drja
>

Whoa, very nice paper! Thanks for the link; my Google-fu failed to find=
 that

> It's very detailed on the issue of rule overhead (Conclusion 5.1 b).
> Unfortunately paper is from 2002. Since then most of the code was
> rewritten. Maybe we, as netfilter community, should lobby some
> university professor to let his students do a *remake* of this
> work ;-). Anyone here with ties to education sector?
>

A 'remake' would be okay, IMO, since both the hardware platform *and*
the code itself have been evolving.

Maybe with more test cases/scenarios, and a *huge* and/or comples
iptables rules :-)

Rgds,
--=20
Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
