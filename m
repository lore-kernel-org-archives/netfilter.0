From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 00:28:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105220023050.23769@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
 <4DD83174.6070105@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD83174.6070105@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 21 May 2011, Mr Dash Four wrote:

> > > gave up when I reached 16777216! ipset though was still insisting that the
> > > hash size is "full":
> > > 
> > > maxelem 15000 hashsize 4194304
> > >     
> > 
> > As I wrote previously, that is because you reached the limit of the maximal
> > elements in the hash. Increase maxelem, it's a fixed parameter of the hash.
> > The hashsize parameter is an initial value and auto-tuned (incremented) as
> > required.
> >   
> Jozsef, the set I was referring to has just over 11 thousand members, where
> the maxelem value for that set was set at 15 thousand - I thought I have made
> that pretty clear, but I obviously haven't!
> 
> Look at the files I sent you and let me know in which set I have specified
> maxelem value which is less than the number of members I am trying to add? My
> guess is, there are none!

Your first set named 'test_ips' consisting of 11670 ranges can only be 
converted to 15613 networks, i.e. members. Not all ranges can be expressed 
with a single network.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
