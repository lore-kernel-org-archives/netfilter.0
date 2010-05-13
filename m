From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 19:18:01 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>
References: <hshbmv$547$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hshbmv$547$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netfilter@vger.kernel.org

On Thursday 2010-05-13 19:08, Markus Feldmann wrote:

> Hi All,
>
> i am still experiment with iptables and the state extension. Some of my rules
> shall catch packets with the state NEW, but it doesn't catch all packets.
> Sometimes there are packets that have the SYN Flag set which go through my
> rules with the state NEW.
>
> Any idea why?

Where's the ruleset?

> I thought SYN is included in the state NEW, is that wrong?

There are cases where SYN can be INVALID, naturally. Furthermore, CTs 
may be NEW even if the packet is not TCP SYN.

> What is the difference between SYN and NEW?

Kinda like the difference between "new" and "refurbished".
