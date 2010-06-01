From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Wireless interface dead after enabling CONFIG_NETFILTER
Date: Wed, 2 Jun 2010 00:07:18 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006020006360.29726@obet.zrqbmnf.qr>
References: <F24C979D1AFD4E4292B911441CBA242407FCF2@2putt.int.lantronix.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F24C979D1AFD4E4292B911441CBA242407FCF2@2putt.int.lantronix.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Umar Qureshey <umar.qureshey@lantronix.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-06-01 23:41, Umar Qureshey wrote:

>Hi,
>
>I compiled a stock 2.6.28 kernel, enabling CONFIG_NETFILTER in order to
>get support for ebtables.  After getting it the images on my system, I
>notice that the wireless interface is associating correctly with the AP
>but no TCP/IP traffic is going on the interface.  Soon as I revert back
>to an kernel version where netfilter is disabled, I get my wireless
>working fine without a hitch.

Would that version be 2.6.34?

>The following is a diff between the compile options of a working kernel
>(> # Fri May 28 11:01:46 2010) and a broken one (< # Tue Jun  1 11:44:04
>2010):
>
>4c4
>< # Tue Jun  1 11:44:04 2010
>---
>> # Fri May 28 11:01:46 2010

ugh, please use standard unified diff format. this is unreadable 
otherwise.

