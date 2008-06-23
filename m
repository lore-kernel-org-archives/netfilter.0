From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Warning: never matched protocol: ah. use extension match
 instead.
Date: Mon, 23 Jun 2008 17:14:14 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806231706250.26570@fbirervta.pbzchgretzou.qr>
References: <1214229359.9717.34.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1214229359.9717.34.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org


On Monday 2008-06-23 15:55, Thomas Jacob wrote:

>Could someone clarify what exactly the warning message in the subject
>(from ip6tables) is supposed to tell me?
>
>It looks like that ip6tables -p ah (or -p in general) would match
>packets that contain an ah header as the last extension header whereas
>-m ah matches packets that contain an ah header at any position, but
>I'm not sure.
>
>The core of the question is this: how does one pass unspecified
>ipsec traffic in ip6tables (the way you could do with -p ah + -p esp in
>iptables)?

AH is never the last header in IPv6 (TCP/etc. follows), hence the warning.
But ESP can be the last one.
(And -p esp won't throw a warning.)
