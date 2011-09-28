From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [PATCH] ip_tables.h: Add the const qualifier.
Date: Wed, 28 Sep 2011 14:16:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109281413350.32661@frira.zrqbmnf.qr>
References: <1317195151-5278-1-git-send-email-corone.il.han@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1317195151-5278-1-git-send-email-corone.il.han@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Il Han <corone.il.han@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rusty Russell <rusty@rustcorp.com.au>, James Morris <jmorris@namei.org>, Harald Welte <laforge@gnumonks.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

On Wednesday 2011-09-28 09:32, Il Han wrote:

>We need to add the const qualifier before the struct specifier,
>because its value will not be changed.
>Then, the following warning would be removed.
>
>net/ipv4/netfilter/ip_tables.c:183: warning: passing argument 1 of 
>'ipt_get_target' discards qualifiers from pointer target type

gcc-4.6.1_20110801 does not output any such warning - which also 
seems to be correct, since line 183 reads:

	return ipt_get_target((struct ipt_entry *)e);

So in ipt_get_target_c, we already do away with the const qualifier 
before calling ipt_get_target.
