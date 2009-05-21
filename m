From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Thu, 21 May 2009 11:11:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905211058160.12567@blackhole.kfki.hu>
References: <4A0DE859.7000209@tigertech.com>  <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu>  <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com>  <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>  <4A1466F6.8070304@tigertech.com>
  <alpine.DEB.2.00.0905202327240.11796@blackhole.kfki.hu> <38db14850905210117u762600abifae41ce448363644@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850905210117u762600abifae41ce448363644@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 21 May 2009, Anatoly Muliarski wrote:

> > Because connlimit/connbytes rely on conntrack, the latter should be
> > "fixed". However I do not see any way to make it resistant against such
> > attacks: if we shrink the window (by which alogrithm?) we may block valid
> > RST segments and thus cause connections to hang instead of termination.
>
> I would like to put in some words.
> Obviously the problem is in conntrack code.
> IMHO, to solve this issue the code should track tcp sequence number
> and check it correctness on receiving RST packet and on the following
> decision about removing the conntrack entry.

The TCP sequence numbers *are* tracked and checked - but with the limit of 
a node being in the middle of the two communicating endpoints. That limit 
is physical and cannot be discarded.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
