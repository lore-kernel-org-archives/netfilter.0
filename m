From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 21:45:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105212144450.23396@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD8158D.4040306@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 21 May 2011, Mr Dash Four wrote:

> > Yes, it was fixed, the last one ("Fix adding ranges to hash types") covers
> > that.
> >   
> I disagree! I am still experiencing the same problems I've had with ipset 6.4,
> despite those being "fixed". When I try to load a set containing about 15k
> elements I get variations on the same type of error below:
> 
> ipset v6.5: Error in line 3556: Element cannot be added to the set: it's
> already added

Send me the input you used so that I could reproduce it.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
