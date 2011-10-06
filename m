From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip6tables support for filtering sctp packets with specific
 ports
Date: Thu, 6 Oct 2011 17:42:16 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110061741130.22969@frira.zrqbmnf.qr>
References: <CAG+XuE607ciut+hUOMUvE_5h98fE4xf7J48Oc9ecanGrFKhvoA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG+XuE607ciut+hUOMUvE_5h98fE4xf7J48Oc9ecanGrFKhvoA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Prashant Batra <prashant0100@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2011-10-06 16:44, Prashant Batra wrote:

>Hello,
>
>
>I am trying to achieve sctp(ipv6) packet filtering using ip6tables.
>I have tried to use the following-
>
>ip6tables -I OUTPUT =E2=80=93p sctp --sport 3232:65535 -d 2001:db8:0:2=
42::36
>-s 2001:db8:0:242::37 -j QUEUE
>
>Can someone help me on this?

It helps to look at the error message. And using - (U+002D)=20
rather than =E2=80=93 (U+2013) near "-p".
