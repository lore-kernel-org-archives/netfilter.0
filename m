From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: question about TPROXY, --on-port and the fact it doesn't alter
 the packet header in any way
Date: Fri, 20 Jul 2012 12:36:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207201235070.2965@frira.zrqbmnf.qr>
References: <20120713125911.GC9043@tosh.sltosis.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120713125911.GC9043@tosh.sltosis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SamLT <sam@sltosis.org>
Cc: netfilter@vger.kernel.org

On Friday 2012-07-13 14:59, SamLT wrote:

>I've been playing with TPROXY with squid3, and it's working fine so far,
>but there is one thing (at least!) i do not understand:
>
>if I use it with, e.g., --on-port 3129, for packet matching 'tcp dport
>80', it then ends up in the INPUT chain, but still on tcp dport 80 (*)
>
>squid3 is listening on tcp port 3129, so how does it get there?

tproxy does the socket lookup and assigns it to the skb before the 
normal TCP code would.
