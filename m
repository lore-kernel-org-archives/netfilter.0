From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Single Packet Authentication [help needed]
Date: Fri, 28 Mar 2008 05:14:45 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0803280512460.27567@fbirervta.pbzchgretzou.qr>
References: <5078d3df0803272102m63ac2150gb639f9da1a760214@mail.gmail.com> <5078d3df0803272111t13112eedtadb04c994bcae9fa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5078d3df0803272111t13112eedtadb04c994bcae9fa@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Romestant <cromestant@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-03-28 05:11, Charles Romestant wrote:

> Hello to all, i' m writting my undergraduate (computer science)
> thesis, which is basically a small SPA server implemented using
> libpcap and iptables.

I suggest you checkout spa from patch-o-matic before reimplementing
the wheel (happened just too often in the topic of portknocking
and similar).

> Ps: i ve checkd fwknop code but its waaay bigger than what i need to
> do, and i 'd rather understand and do myself than read code that
> already does it.
> ps2 : form C code is opening a pipe to iptables still the best way to
> modify rules?

I guess you are free to do whatever strange idea you have, in userspace.
