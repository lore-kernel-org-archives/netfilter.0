From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: out of vmalloc space
Date: Wed, 7 Jul 2010 19:13:55 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007071911440.31991@obet.zrqbmnf.qr>
References: <AANLkTik2BuVthgabtSh838mUwe9AE_Q1HUuoPFRnit4G@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik2BuVthgabtSh838mUwe9AE_Q1HUuoPFRnit4G@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-07-06 11:27, Oguz Yilmaz wrote:

>Hi all,
>
>Symptom of my problem was:
>
>System can not ping to 127.0.0.1
>I try to add an basic iptables rules
>iptables -I OUTPUT -j ACCEPT
>and command returned with an error including a long number.(like the
>error message when you want to add DNAT to an unsupoorted chain)

Long number - was a known bug. Please update to at least 1.4.3.



>In the dmesg log:
>
>allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
>printk: 2 messages suppressed.

Do you happen to have too many rules?
(Though rules are cheap, like 20MB for 100000)
