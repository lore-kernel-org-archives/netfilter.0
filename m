From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: [ANNOUNCE] ipset 7.8 released
Date: Thu, 19 Nov 2020 22:46:23 +0100 (CET)
Message-ID: <alpine.DEB.2.23.453.2011192237290.19567@blackhole.kfki.hu>
References: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu> <45rqn0n5-5385-o997-rn9q-os784nqrn9p@vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <45rqn0n5-5385-o997-rn9q-os784nqrn9p@vanv.qr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi Jan,

On Thu, 19 Nov 2020, Jan Engelhardt wrote:

> LIBVERSION changed from 14:0:1 (ipset 7.6) to 14:1:2,
> producing libipset.so.13 (7.6) and now libipset.so.12
> 
> That seems incorrect! It should have been
> - 14:0:1 (no changes)
> - 15:0:2 (compatible changes)
> - 15:0:0 (incompatible changes)

Oh, my. It should be 15:0:2 (compatible changes). I dunno how many times I 
can mix it up, this numbering scheme is simply alien to my brain wiring.

I released 7.9. Thanks for the quick feedback!

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
