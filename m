From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: banning bot ips with ipset
Date: Wed, 26 Nov 2008 09:25:27 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0811260918140.31365@blackhole.kfki.hu>
References: <492C6780.4020909@xprima.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <492C6780.4020909@xprima.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Heron <nigel-ml@xprima.com>
Cc: netfilter@vger.kernel.org

On Tue, 25 Nov 2008, Nigel Heron wrote:

> Is ipset stable enough to be deployed on live environments? iphash seems 
> like the best set type for us, how many ips can the set handle before 
> there's a noticeable slowdown? any feedback would be appreciated.

ipset is stable enough for in production usage. The speed of the iphash 
set is actually constant by nature and independent of the number of actual 
entries (your network card and bus will slow you down and not iphash).
 
> also, if it helps anyone else .. while trying ipset 2.4.5 i had to add:
> #include <stdbool.h>
> to "kernel/ip_set_setlist.c" to get it to compile.

What is your kernel version?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
