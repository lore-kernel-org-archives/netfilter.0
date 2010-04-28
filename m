From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT table bypass for local traffic
Date: Wed, 28 Apr 2010 21:46:56 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004282136590.18231@obet.zrqbmnf.qr>
References: <n2h812495871004281019nb633c037i7dc04336bc47bd59@mail.gmail.com> <h2v7d7f2e8c1004281059l2ad0d411x1e5f17fd6d7e489f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <h2v7d7f2e8c1004281059l2ad0d411x1e5f17fd6d7e489f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Fink <sphink@gmail.com>
Cc: Bill Prochazka <billprozac@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2010-04-28 19:59, Steve Fink wrote:
>
From the iptables manpage, in the description of the nat table: "This
>table is consulted when a packet that creates a new connection is
>encountered."
>
>I don't know what mechanism makes related packets in an established
>connection follow the translation actions set up by the initial
>packets. There's a magic sheep bit in there somewhere.

A ct entry with mappings already exists when a related packet shows up, 
so there is no need to do a relookup in the table.
