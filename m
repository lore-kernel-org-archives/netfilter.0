From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Fwd: ipset 6.24 and iptables 1.4.14, errno 22 (EINVAL)
Date: Tue, 16 Dec 2014 17:11:22 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1412161709230.7016@blackhole.kfki.hu>
References: <CAHOuc7PVsLGVjOZSMNQfSmhfcd_tKfoD58mjbrQ89BtJN8M19g@mail.gmail.com> <CAHOuc7MEuNd85gv_L0LCdY7cKd=7Je6-a+rUh_dz7D2haEW9KA@mail.gmail.com> <alpine.DEB.2.10.1412161626180.7016@blackhole.kfki.hu>
 <CAHOuc7NJtFbCZNtU9MJWSBvTipcFMt8Ms_yVCFetdJxrX+4bdQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHOuc7NJtFbCZNtU9MJWSBvTipcFMt8Ms_yVCFetdJxrX+4bdQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oskar Berggren <oskar.berggren@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, 16 Dec 2014, Oskar Berggren wrote:

> It's Debian 7, but with kernel from backports. uname:
> 3.16.0-0.bpo.4-amd64   3.16.7-ckt2-1~bpo70+1
> 
> The iptables 1.4.14 is from Debian, but we've rebuild it to increase
> the maximum set name length to 256. But we also build ipset kernel and
> userspace tools with this change. These patches have worked with ipset
> 6.11, iptables 1.4.13 on Debian 6, but perhaps they might be the
> problem if the versions themselves should be compatible.

Then the IPSET_MAXNAMELEN macro was not updated in both the ipset and 
iptables source tree - I suspect in the latter, see 
include/linux/netfilter/ipset/ipset.h

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
