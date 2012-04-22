From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: MTU question
Date: Sun, 22 Apr 2012 16:32:57 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204221632220.14663@frira.zrqbmnf.qr>
References: <op.wc2nftsax1lyi3@debiandesk2.net> <4F919D2B.70206@hp.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F919D2B.70206@hp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rick Jones <rick.jones2@hp.com>
Cc: Lloyd Standish <lloyd@crnatural.net>, netfilter@vger.kernel.org


On Friday 2012-04-20 19:30, Rick Jones wrote:
>
> I suspect the answer is some variation on:
>
> c) Since the two systems are in the same broadcast domain, with no intervening
> router to perform PathMTU discovery, the PC will send IP datagrams up to 1500
> bytes, which likely as not will be dropped by the "router" as being too large
> before it even gets to IP on the router.
>
> I would expect that only if your "router" has a 1500 byte MTU on the interface
> facing the PC, and a 1492 byte MTU on the interface facing the "internet" would
> you see the PathMTU discovery activity which would cause the PC to adjust the
> effective MTU it was using to match 1492. Only if the IPv4 DF (Don't Fragment)
> bit is clear should the "router" split the packets.

Nope, if DF is set, no splitting is allowed and the appropriate
ICMP message is generated.

And exactly that is how PMTU is discovered.
