From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ipset] adding a fqdn and get all A or AAAA registers in the
 set
Date: Wed, 10 Oct 2012 20:06:30 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1210102004160.10737@blackhole.kfki.hu>
References: <CAPfcJasWf=w1U=wK=ErOH+w6veOgUdjTFbp1JiqjXVYE=7Ay0w@mail.gmail.com> <CAPfcJatY3XEfyE8YmBwMZQQkQ5gkVdnxdaSsm0cj1d9u3_Bz5A@mail.gmail.com> <5075896E.8030305@ngtech.co.il> <CAPfcJasHXPKs8Qo9wrg0qcyiNaRkf+3_VoMFZ-EraadwjpM=Nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPfcJasHXPKs8Qo9wrg0qcyiNaRkf+3_VoMFZ-EraadwjpM=Nw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero <aborrero@cica.es>
Cc: Eliezer Croitoru <eliezer@ngtech.co.il>, netfilter@vger.kernel.org

On Wed, 10 Oct 2012, Arturo Borrero wrote:

> > you can use some script to do the resolving and then add the results to the
> > set one by one.
> >
> > how ipset behave is the same as iptables.
> 
> It seems that iptables is able to handle multiple resolutions:

Yes, but ipset != iptables.
 
> > Yes, that's right. If hostname is supplied as input, just the first
> > resolved IP address is used. Look at into lib/parse.c
> 
> I see it now. Reading man page getaddrinfo(3), it is implemented as
> some kind of linked list, specially for cases where there are multiple
> resolutions.
> 
> So, the function get_addrinfo in lib/parse.c needs to do something
> more inside that for loop. (By now, I don't know what means the code
> inside the loop if found==0, so I can't write a patch)

That's not possible: you can't call a session loop over the IP addresses 
from lib/parse.c in the current framework. (That's why it's not already 
done.)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
