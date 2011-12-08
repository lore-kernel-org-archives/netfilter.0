From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: nfqueue vs. tproxy
Date: Thu, 8 Dec 2011 03:21:59 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112080319460.7443@frira.zrqbmnf.qr>
References: <201112080025.pB80PGIe091691@medusa.blackops.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201112080025.pB80PGIe091691@medusa.blackops.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: msk@cloudmark.com
Cc: netfilter@vger.kernel.org

On Thursday 2011-12-08 01:25, msk@cloudmark.com wrote:

>I've been reading up on tproxy and nfqueue.  Just to confirm my understanding
>of the two:
>
>Could one write a layer of code that uses the nfq_*() functions to basically
>implement what tproxy can do by simply adjusting the destination information
>and checksum, and then returning NF_REPEAT verdicts for each?

That would be really cumbersome, because with nf_queue, you end up 
just having the bare packet. With tproxy, you get the full benefits of 
a socket and TCP handling.
