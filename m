From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables NEW or SYN
Date: Fri, 14 May 2010 08:41:38 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005140840150.28602@obet.zrqbmnf.qr>
References: <hshbmv$547$1@dough.gmane.org>  <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>  <hshf0k$ine$1@dough.gmane.org>  <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com>  <hshhcg$rl3$1@dough.gmane.org> <AANLkTilx7Gimy8RwVszEx1ijkR4mx2Q70HKJO72fAhTK@mail.gmail.com>
 <hsi46a$sro$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hsi46a$sro$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netfilter@vger.kernel.org

On Friday 2010-05-14 02:06, Markus Feldmann wrote:

> Thanks for your help,
>
> I changed this at this afternoon today, because otherwise my server is
> not reachable. I changed line 132 and 133 from "state NEW" to the
> iptables argument "--syn".
>
> I have no idea why NEW does not work but --syn.

Just to be wary - some distributions use -i/-o lo -j NOTRACK in the raw 
table, which disables state tracking for loopback.

> Question, is a packet still marked as NEW, after it is redirected from
> 80 to 443 ???

It is marked as NEW,DNAT (-m conntrack; -m state won't help you)
