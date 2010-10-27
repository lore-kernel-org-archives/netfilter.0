From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: netfilter stats, info and resources usage
Date: Wed, 27 Oct 2010 18:32:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010271827050.14500@obet.zrqbmnf.qr>
References: <4CC83A67.1010202@register.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC83A67.1010202@register.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sandro Tosi <sandro.tosi@register.it>
Cc: netfilter@vger.kernel.org, Jesper Dangaard Brouer <hawk@comx.dk>

On Wednesday 2010-10-27 16:42, Sandro Tosi wrote:

> we are using quite a lot iptables and we'd like to gather some
> stats/information to "what's doing" and hopefully also an idea of the resources
> used by it (in particular cpu and ram).
>
> 1. http://forums.cacti.net/about36629.html
> 2. http://forums.cacti.net/about26714.html
> 3. http://people.netfilter.org/hawk/DDoS/2010-04-12__001/list.html
>
> 3 is very interesting, Jesper: how did you generate it? :)

JFYI, There is a lot of conntrack in there besides routing and general 
machine and interface characteristics - not much Xtables to see.

