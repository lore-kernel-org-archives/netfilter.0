From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 15:20:10 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204161515310.20321@blackhole.kfki.hu>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com> <4F8B90C4.3070600@wildgooses.com> <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu> <4F8BDA57.4090701@wildgooses.com> <alpine.DEB.2.00.1204161126050.20321@blackhole.kfki.hu>
 <4F8C1B23.8040400@wildgooses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F8C1B23.8040400@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed W <lists@wildgooses.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon, 16 Apr 2012, Ed W wrote:

> On 16/04/2012 10:55, Jozsef Kadlecsik wrote:
> > Try the following untested patch:
> 
> Thanks for the idea.  I'm not 100% sure I'm testing correctly, but I rebuilt
> and I see no change...

See the message from Amos in this thread: if uclibc ignores 
AI_NUMERICHOST, then I can't workaround that :-(.
 
Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
