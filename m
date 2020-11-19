From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] ipset 7.8 released
Date: Thu, 19 Nov 2020 22:10:03 +0100 (CET)
Message-ID: <45rqn0n5-5385-o997-rn9q-os784nqrn9p@vanv.qr>
References: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Thursday 2020-11-19 21:48, Jozsef Kadlecsik wrote:
>
>I'm happy to announce ipset 7.8 which includes a couple of fixes, 
>compatibility fixes. Small improvements like the new flags of the hash:* 
>types make possible to optimize sets for speed or memory and to restore 
>exactly the same set (from internal structure point of view) as the saved 
>one.

LIBVERSION changed from 14:0:1 (ipset 7.6) to 14:1:2,
producing libipset.so.13 (7.6) and now libipset.so.12

That seems incorrect! It should have been
- 14:0:1 (no changes)
- 15:0:2 (compatible changes)
- 15:0:0 (incompatible changes)
