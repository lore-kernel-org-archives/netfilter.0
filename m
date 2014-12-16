From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Fwd: ipset 6.24 and iptables 1.4.14, errno 22 (EINVAL)
Date: Tue, 16 Dec 2014 16:27:31 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1412161626180.7016@blackhole.kfki.hu>
References: <CAHOuc7PVsLGVjOZSMNQfSmhfcd_tKfoD58mjbrQ89BtJN8M19g@mail.gmail.com> <CAHOuc7MEuNd85gv_L0LCdY7cKd=7Je6-a+rUh_dz7D2haEW9KA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHOuc7MEuNd85gv_L0LCdY7cKd=7Je6-a+rUh_dz7D2haEW9KA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oskar Berggren <oskar.berggren@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, 16 Dec 2014, Oskar Berggren wrote:

> When using iptables and the set match we receive:
> 
> iptables v1.4.14: Problem when communicating with ipset, errno=22.
> 
> We are, quite accidentally, using ipset 6.24 (kernel and userspace),
> with iptables (including its libxt_set userspace module) 1.4.14. Might
> the problem be incompatibilities between these versions, since they
> are quite far apart?
> 
> The ipset command itself works, and we can define the sets in the kernel.

This is quite strange, because that error message is generated when the 
most basic communication fails between the iptables extension and the 
ipset kernel module. 

What is your kernel version and architecture?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
