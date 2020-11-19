From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] ipset 7.8 released
Date: Thu, 19 Nov 2020 23:07:45 +0100 (CET)
Message-ID: <83oq5412-o0sq-5q31-s7o5-s0q28s12844@vanv.qr>
References: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu> <45rqn0n5-5385-o997-rn9q-os784nqrn9p@vanv.qr> <alpine.DEB.2.23.453.2011192237290.19567@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.23.453.2011192237290.19567@blackhole.kfki.hu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Thursday 2020-11-19 22:46, Jozsef Kadlecsik wrote:

>Hi Jan,
>
>On Thu, 19 Nov 2020, Jan Engelhardt wrote:
>
>> LIBVERSION changed from 14:0:1 (ipset 7.6) to 14:1:2,
>> producing libipset.so.13 (7.6) and now libipset.so.12
>> 
>> That seems incorrect! It should have been
>> - 14:0:1 (no changes)
>> - 15:0:2 (compatible changes)
>> - 15:0:0 (incompatible changes)
>
>Oh, my. It should be 15:0:2 (compatible changes). I dunno how many times I 
>can mix it up, this numbering scheme is simply alien to my brain wiring.

If in doubt, always use :0:0 --- and make a mental note of exactly the 
:0:0 requirement in Make_global.am. :-)

Distros can always rebuild transitively. They have to do that anyway for 
things like /usr/lib64/libbfd-2.35.0.20200915-1.so (with a date, it 
could change daily anyway). But recovering from a backjumping lib...
