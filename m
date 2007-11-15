From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: TEE target
Date: Thu, 15 Nov 2007 12:48:41 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0711151241310.5340@fbirervta.pbzchgretzou.qr>
References: <000401c82770$f90872c0$0b0ffe0a@NS006819>
 <1195124670.17107.10.camel@basti79.freenet-ag.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1195124670.17107.10.camel@basti79.freenet-ag.de>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Classen <sebastian.classen@freenet.ag>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@vger.kernel.org


On Nov 15 2007 12:04, Sebastian Classen wrote:
>
>We are now using the TEE-Target in production environment for a few
>weeks now and it seems to work well.
>
>@Jan: Find attached a patch with some little final bug fixes. Now it
>compiles with current stable 2.6.23.1 kernel. Please add this to your
>SVN.

>diff -pruN xt_TEE.orig/iptables/.TEE-testx xt_TEE/iptables/.TEE-testx
>--- xt_TEE.orig/iptables/.TEE-testx	2007-10-05 13:23:03.000000000 +0200
>+++ xt_TEE/iptables/.TEE-testx	2007-10-05 14:37:10.000000000 +0200
>@@ -1,2 +1,2 @@
> #!/bin/sh
>-[ -f "$KERNEL_DIR/net/netfilter/xt_TEE.h" ] && echo TEE
>+[ -f "$KERNEL_DIR/net/netfilter/xt_TEE.c" ] && echo TEE

Should have been /include/linux/netfilter/xt_TEE.h - changed 
accordingly. The .h file is what the build depends on, not the .c file.

Merged the rest.

>Any change of getting with into pom-ng?
>
POM is practically dead IMO and that which is in my adhoc svn repo
was supposed to go in, if Patrick agrees, that is.
