From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCE] libnetfilter_conntrack 0.9.0 release
Date: Wed, 8 Sep 2010 20:17:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009082016280.22870@obet.zrqbmnf.qr>
References: <4C875A2A.6030206@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4C875A2A.6030206@netfilter.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>, lwn@lwn.net

On Wednesday 2010-09-08 11:40, Pablo Neira Ayuso wrote:

>Hi!
>
>The Netfilter project presents libnetfilter_conntrack-0.9.0
>
>libnetfilter_conntrack is a userspace library providing a programming
>interface (API) to the in-kernel connection tracking state table. This
>library requires a linux kernel >= 2.6.18.
>
>This release includes two fixes and the infrastructure to generate API
>documentation in doxygen format. ChangeLog is also attached for more
>details.
>
>Pablo Neira Ayuso (5):                                                          
>      ct: fix regression with helpers for Linux kernel >= 2.6.34
>      build: add libtool m4 support
>      src: convert documentation from kerneldoc to doxygen format

Did you not like the doxygen filter that allows to use kdoc in the .c 
files?
