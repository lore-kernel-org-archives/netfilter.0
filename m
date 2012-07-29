From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: installation issue when cross cpmpiling xtable addons for power
 pc
Date: Sun, 29 Jul 2012 18:28:50 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207291828370.2056@frira.zrqbmnf.qr>
References: <CAE1WnGfp46qMmfB5v9yYOU4OGNwJYmQY4p9W2A2iQJJC7tHh2g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGfp46qMmfB5v9yYOU4OGNwJYmQY4p9W2A2iQJJC7tHh2g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Tuesday 2012-07-24 17:31, rahul shrivastava wrote:

>Hi,
>i am using linux fedora system (kernel version 2.6.35.6) with i686
>archetecture, have to cross compile xtables addons for powerpc platform
>
>1) iptable devel files are needed for compilation of xtables, so i should
>have iptable devel files compiled for powerpc or x86. in this case i used
>powerpc compiled files
>2)  ./configure target=powerpc
>3) make
>4) on doing make i get following error /usr/bin/ld: cannot find -lxtables
>collect2: ld returned 1 exit status
>make[3]: *** [libxt_CHAOS.so] Error 1
>
>5) is there something wrong with this procedure, if yes please tell me
>correct procedure to cross compile xtables addons  for powerpc

You do not have the libraries in the standard search paths.
