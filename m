From: Mattias =?utf-8?Q?R=C3=B6nnblom?= <hofors@lysator.liu.se>
Subject: Multiple nf_bind_pf to the same protocol
Date: Mon, 02 Nov 2009 16:09:32 +0100
Message-ID: <87iqdtnetv.fsf@isengard.friendlyfire.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

with NFQUEUE and the libnetfilter_queue library, is it possible to
bind several applications to same protocol (for example, AF_INET)?

That would be useful if you want to do load balancing on a multicore
system, with a thread/process serving each NFQUEUE queue.

After having a brief look at the NFQUEUE/libnetfilter_queue code, it
looks like there's only single netlink fd for all queues, and the
library does the demultiplexing. Would that mean I have to have a
"front-end" thread distributing different servering threads?

Best regards,
     Mattias
