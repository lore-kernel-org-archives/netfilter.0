From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Numeber of connections
Date: Thu, 3 Nov 2011 20:26:24 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111032025220.25863@frira.zrqbmnf.qr>
References: <CAMTjHrz-d9kXKS3ZbJQGJ-b-Y05eb+g8XYe1x0W94iqPuQhGxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrz-d9kXKS3ZbJQGJ-b-Y05eb+g8XYe1x0W94iqPuQhGxQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Usu=C3=A1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thursday 2011-11-03 17:41, Usu=C3=A1rio do Sistema wrote:

>Hello everyone, I'm using an RHE 5.5 machine for firewall and I would
>like know how many connections are been handled for my firewall
>iptables in an time of day as well as how many connections per second.

`conntrack -L` will show you how many active CTs there. The number of=20
ct/sec can be calculated by monitoring `conntrack -Ee NEW` over a time=20
quantum chosen by you.
