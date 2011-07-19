From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Invalidating certain connections in conntrack due route
 switching
Date: Tue, 19 Jul 2011 12:22:23 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107191221300.22037@frira.zrqbmnf.qr>
References: <1125455134.20110719115744@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1125455134.20110719115744@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gapsf@yandex.ru
Cc: netfilter@vger.kernel.org


On Tuesday 2011-07-19 06:57, gapsf@yandex.ru wrote:
>
>I clear the routing cache with 'ip route flush cache'on router, but maybe is not enough.

I however needed to touch the routing cache.

>My guess is that the slow reestablishment of connections may be associated with router's
>connection tracking too.
>Will the explicit invalidation of connections on router box helps hosts from private network to
>reestablish connections faster during ISPs switching?
>And if so, how invalidation of certain connections in conntrack subsystem can be done from shell?

conntrack -D.
