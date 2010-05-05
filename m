From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: what is atomicity of iptables packet processing?
Date: Wed, 5 May 2010 18:58:25 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005051843340.2592@obet.zrqbmnf.qr>
References: <h2u2d6a9f6f1005050856pc4d54582z7ccb7f79cb71991c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <h2u2d6a9f6f1005050856pc4d54582z7ccb7f79cb71991c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Bogstad <bogstad@pobox.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>


On Wednesday 2010-05-05 17:56, Bill Bogstad wrote:
>
>However, I'm concerned about the atomicity of packet processing by
>xtables.  Since incoming packets may not be synchronized with outgoing
>packets, there is the possibility that the INPUT chain rules might be
>modifying the connection marking at the same time that the OUTPUT
>chain rules are using the mark to modify the packet.

Indeed.

>Even worse, I'm
>considering building up the connection mark in the INPUT chain one bit
>at a time and the correct mark won't be in place until after all rules
>in the INPUT chain (or subchains) are completed.
>
>So my questions are:
>
>Does iptables/xtables fully process one packet at a time or can
>multiple packets be in various tables/chains at the same time?

In reality: It processes one packet at a time per CPU. (does
multiqueue change that?)

It's perhaps safer to assume that any number of packets might be in
flight on any CPU, even if that does not match what Linux might
currently be doing. (A bit like 'const' in C. It does not protect,
but it gives a good guarantee :-)

>If the answer is multiple packets, can someone suggest a way for these
>packets/connections to make processing single threaded AND
>run to completion?

When the connection exchange itself is synchronized, read: TCP
connection establishment, you can set the ctmark on the SYN packet
and be sure that it's all done before there will be the SYN-ACK -
because the initial SYN is only passed to tcp.c after leaving
Xtables.

For connection-less protocols and changing the mark within
established connections, it's pretty dim.

>On a related note, how atomic is single rule processing?

Pretty non-atomic. Updating (read-write-cycle) the ctmark is not
atomic either.

>If in a single rule, I use CONNMARK to mark a connection can I
>assume that no other CONNMARK can modify the mark at the same time.
>(--set-xmark involves two operations: zeroing based on mask and XOR
>based on value which may be a race condition.)

The lowest atomicity level is what the CPU offers, i.e. on
contemporary CPUs that would mean that the READ of the ctmark from
memory is atomic, and that the WRITE is. You get some 32-bit value in
the end, but at least you can be sure it is not 16 bits from before
and 16 bits from the other thread.

>If there are any other issues involving connection marks/parallel
>processing/race conditions etc., I would like to here about them as
>well.

I guess that, if really need be, one could add an on-demand locking
mechanism (including the penalties) by means of a parameter.
