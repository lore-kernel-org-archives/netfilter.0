From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 11:56:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105221156020.25858@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD83964.5050105@googlemail.com> <alpine.DEB.2.00.1105220018010.23769@blackhole.kfki.hu> <4DD83FDE.9000901@googlemail.com> <alpine.DEB.2.00.1105220044160.24174@blackhole.kfki.hu>
 <4DD84349.5040407@googlemail.com> <alpine.DEB.2.00.1105220115100.24174@blackhole.kfki.hu> <4DD84BD0.5040904@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD84BD0.5040904@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sun, 22 May 2011, Mr Dash Four wrote:

> > I think you have got NETFILTER_NETLINK_QUEUE, NETFILTER_NETLINK_LOG or 
> > NF_CT_NETLINK selected as module, and in consequence NETFILTER_NETLINK as 
> > module too. And because the ipset kernel modules depend on 
> > NETFILTER_NETLINK, then those can be selected as modules only too.
> I have them all as modules (i.e. "m"), *but* that is the case with 4.5 
> as well - I just checked my 4.5 .config, so there is not difference in 
> that respect.

ipset-4.x did not depend on NETFILTER_NETLINK, while ipset-6.x does.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
