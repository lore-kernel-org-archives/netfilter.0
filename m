From: Joerg Willmann <joe@clnt.de>
Subject: alignment problem with ebt_among on ppc
Date: Wed, 8 Feb 2012 10:27:35 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1202081027060.13222@brian.int.clnt.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm currently faced with an alignment problem of ebt_among with ppc
architecture.
Trying to add a rule using the among extension leads to the following
syslog entry:

ebtables: among: wrong size: 2104 against expected 2100, rounded to 2100

I tried to analyze the problem and I observed that there have been several
problems regarding EBT_ALIGN in the past with x86_64 and sparc
architecure. But I didn't find anything about ppc.

What I've seen is that ebt_among extension of ebtables uses
__alignof__(_xt_align) while the corresponding kernel module uses
__alignof__(ebt_replace) to determin the alignment in EBT_ALIGN().

These are the results of these values on different platforms:

                                 x86     x86_64  ppc
__alignof__(_xt_align)          4       8       8
__alignof__(ebt_replace)        4       8       4

So I assume here we can see why ebtales fails to add rules which use the
among extension.

I'm using kernel 2.6.33 and ebtables 2.0.10-4

Is this a known issue or are there any suggestions how to circumvent this
problem?
Thankyou very much.

Best regards
Joerg
