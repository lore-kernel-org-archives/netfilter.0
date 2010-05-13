From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: chain/table traversal for loopback packets
Date: Thu, 13 May 2010 21:53:52 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005132153060.31136@obet.zrqbmnf.qr>
References: <AANLkTikgvzyLOesxU5RNb3MmEPPMsnotOj-oZcWGlkuT@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikgvzyLOesxU5RNb3MmEPPMsnotOj-oZcWGlkuT@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Curby <curby@cur.by>
Cc: netfilter@vger.kernel.org

On Thursday 2010-05-13 20:19, Curby wrote:

>Hello, I'm trying to understand
>http://www.frozentux.net/iptables-tutorial/images/tables_traverse.jpg
>
>Would a packet created locally and sent over the loopback interface
>traverse the POSTROUTING and PREROUTING hooks as implied by the
>diagram, or does the last Routing Decision notice that it's bound for
>the local host and send it straight to the beginning of the INPUT
>hook?  Thanks!

No shortcuts.
BTW, follow http://jengelh.medozas.de/images/nf-packet-flow.png
