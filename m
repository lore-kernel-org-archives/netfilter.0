From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset-6.8 released
Date: Tue, 19 Jul 2011 12:11:23 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1107191206310.27723@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1107111120380.32664@blackhole.kfki.hu> <4E216528.6020506@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4E216528.6020506@googlemail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sat, 16 Jul 2011, Mr Dash Four wrote:

> >  - Make possible to hash some part of the data element only.
> >   
> Is this in regards to the problem I highlighted a while ago with
> range-matching or is this something different?

No, it's different: the patch simply makes possible to instruct the hash 
function how large part of the data blob to use at hashing, measured in 
sizeof(u32) units.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
