From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: was there a syntax rule change regarding the use of '!'
Date: Wed, 29 Aug 2012 20:49:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208292047110.16929@frira.zrqbmnf.qr>
References: <503E3E68.9040703@elvar.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <503E3E68.9040703@elvar.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elvar <elvar@elvar.org>
Cc: netfilter@vger.kernel.org


On Wednesday 2012-08-29 18:08, Elvar wrote:
>
> I just deployed by first Ubuntu 12.04 install and I was seeing errors in my
> typical iptables script. I found that I had to change the order of where I
> placed my '!' in the rule. For example...
>
> OLD -> iptables -A FORWARD -i eth1 -s ! 192.168.42.0/24 -j DROP
> NEW -> iptables -A FORWARD -i eth1 ! -s 192.168.42.0/24 -j DROP
>
> I don't see anything about this in the changelog so I was just wondering if
> anyone else has seen this as well.

A long time ago in a galaxy far, far away....


commit 0f16c725aadaac7e670d632ecbaea3661ff00827 (v1.4.3~46^2~3)
Author: Jan Engelhardt <jengelh@medozas.de>
Date:   Fri Jan 30 04:55:38 2009 +0100

    libxtables: prefix/order - move check_inverse to xtables.c

    This also adds a warning that intrapositional negation support
    is deprecated.

    Signed-off-by: Jan Engelhardt <jengelh@medozas.de>
