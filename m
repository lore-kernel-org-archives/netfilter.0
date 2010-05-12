From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptable how many rule can manage iptable
Date: Wed, 12 May 2010 21:23:06 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005122116400.19854@obet.zrqbmnf.qr>
References: <l2vf1cc03e01005121009j3ce0e30cj56ac615688a58916@mail.gmail.com>  <alpine.LSU.2.01.1005121925440.14663@obet.zrqbmnf.qr> <m2sf1cc03e01005121105vc2bdb9fexd277eae9c4085061@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m2sf1cc03e01005121105vc2bdb9fexd277eae9c4085061@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-05-12 20:05, Mamadou Tour=C3=A9 wrote:

>Hi thank you for your reply.
>how could i evaluate the quantity of memories.
>for example of 1 000 000 rules what quantity should i have a least.

If you use `iptables -vvS`, you see:

libiptc vlibxtables.so.4. 5332 bytes.

Which is the size of the current table. Multiply that by NR_CPUS=20
(from /proc/config) to get what it's taking up (we're on to reducing=20
that).
