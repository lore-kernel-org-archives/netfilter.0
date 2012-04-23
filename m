From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: concatenate udp payloads of multiple packet
Date: Mon, 23 Apr 2012 16:38:04 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204231636590.8481@frira.zrqbmnf.qr>
References: <CAGuaRCt0Jmj4_prCZVvXi2oijOTprTqUntphjx_9cQqk-nqhCQ@mail.gmail.com> <471DE477E2B1F549A58F3A14A27180BE01687C@HQ-EX01.bytemobile.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <471DE477E2B1F549A58F3A14A27180BE01687C@HQ-EX01.bytemobile.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Haran <jharan@bytemobile.com>
Cc: Arif Hossain <aftnix@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>


On Thursday 2012-04-19 19:58, Jeff Haran wrote:
>
>I'm not an expert in this interface, but what I've observed is when user space
>reads a packet off of a socket to an NFQUEUE, a subsequent read on that socket
>will block if the first packet is not returned via nfq_set_verdict(), even if
>further packets have been queued from the kernel.

So simply set the verdict to NF_DROP for every input frame and send out
combined frames that are not linked to any prior packet.
So far the theory.
