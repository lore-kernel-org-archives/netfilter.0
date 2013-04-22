From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Fwd: ipset and counters
Date: Mon, 22 Apr 2013 19:24:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu> <5175432F.2060304@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5175432F.2060304@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Husnu Demir <hdemir@metu.edu.tr>
Cc: netfilter@vger.kernel.org

On Mon, 22 Apr 2013, Husnu Demir wrote:

> On 22-04-2013 16:57, Jozsef Kadlecsik wrote:
> > On Mon, 22 Apr 2013, Husnu Demir wrote:
> > 
> >> I want to give a try for COUNTERS properties of IPSET. But I
> >> could not manage it;
> >> 
> >> # ipset create COUNTERS bitmap:ip  counters ipset v6.17: Unknown
> >> argument: `counters' Try `ipset help' for more information.
> > 
> > What does "ipset help bitmap:ip" says? I suspect you have multiple
> >  binaries at different paths.
> 
> # ipset help bitmap:ip
> ipset v6.17
> 
> Usage: ipset [options] COMMAND
> 
> 
> ..
> 
> bitmap:ip type specific options:
> 
> create SETNAME bitmap:ip range IP/CIDR|FROM-TO
>                [netmask CIDR] [timeout VALUE] [counters]

So the ipset binary does support counters. Then what is the output of 
"modinfo ip_set_bitmap_ip"? Also, if you had the previous ipset kernel 
modules loaded in, then just installing them won't unload them.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
