From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset-5.1 released
Date: Wed, 22 Dec 2010 14:07:17 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1012221406130.3482@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1012221115130.3482@blackhole.kfki.hu> <4D11F567.3020401@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4D11F567.3020401@googlemail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Wed, 22 Dec 2010, Mr Dash Four wrote:

> 
> > kernel part:
> >  - Kernel version compatibility: support bumped starting from 2.6.34
> >    (Supporting older kernel releases would mean too much burden for me,
> >    sorry.)
> >   
> Does that mean the previous 5.0 (kernel?) patches need to be applied or is
> this version removing that requirement? Are the prerequisites the same (i.e.
> mnl-1.0 etc) as in 5.0?

The requirements are the same: kernel patch has to be applied, libmnl 
required. 

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
