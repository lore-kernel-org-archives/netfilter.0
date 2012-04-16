From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 15:21:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204161520140.20321@blackhole.kfki.hu>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com> <4F8B90C4.3070600@wildgooses.com> <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu> <4F8BDA57.4090701@wildgooses.com> <alpine.DEB.2.00.1204161126050.20321@blackhole.kfki.hu>
 <4F8C19EB.4070803@treenet.co.nz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F8C19EB.4070803@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: Ed W <lists@wildgooses.com>, netfilter <netfilter@vger.kernel.org>

On Tue, 17 Apr 2012, Amos Jeffries wrote:

> On 16/04/2012 9:55 p.m., Jozsef Kadlecsik wrote:
> > On Mon, 16 Apr 2012, Ed W wrote:
> > 
> > > On 16/04/2012 09:08, Jozsef Kadlecsik wrote:
> > > > Hostname and IP address are both supported as input and resolved
> > > > internally by getaddrinfo. That can generate DNS lookups, depeding on
> > > > the
> > > > resolver library. What kind of system do you use, with which
> > > > resolver/libc version?
> > > Thanks so much for replying!
> > > 
> > > This is a uclibc 0.9.33.1 system, x86. Resolver chain is /etc/hosts, then
> > > dns.
> > > Local dnsmasq is installed.
> > That comes from the implementation of "getaddrinfo" in uclibc then. ipset
> > itself does not force reverse DNS lookups.
> 
> FWIW, I have recently been dealing with user complains with other software
> when built with uclibc. The uclibc implementation has been caught ignoring
> AI_NUMERICHOST and performing full remote resolution when passed numeric IPs
> for conversion.

That'd bad, because then DNS lookup is always performed - and cannot be 
switched off. Hopefully they'll fix the issue in uclibc. Thanks the info.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
