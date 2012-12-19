From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset net:hash and nomatch option
Date: Wed, 19 Dec 2012 22:08:44 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1212192202000.23162@blackhole.kfki.hu>
References: <50D1F9AF.4080701@airpost.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50D1F9AF.4080701@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Born Without <blackhole@airpost.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 19 Dec 2012, Born Without wrote:

> adding entries to a hash:net type of set using the 'nomatch' option gives me
> this error (using the example from the man page):
> 
> # $IPSET create foo hash:net
> # $IPSET add foo 192.168.0/30 nomatch
> ipset v6.16.1: Unknown argument: `nomatch'
> Try `ipset help' for more information.
> 
> kernel: 3.2.35 (vanilla)

The feature appeared in 3.7 in the vanilla tree.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
