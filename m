From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ipset] Match both on source AND destination
Date: Thu, 11 Apr 2013 17:02:55 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304111701570.32023@blackhole.kfki.hu>
References: <1365691926.25705.48.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1365691926.25705.48.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 11 Apr 2013, Jimmy Thrasibule wrote:

> Is it possible to match both source and destination from the same set.
> 
> I have two networks:
> 
> - 192.168.1.0/24
> - 192.168.2.0/24
> 
> And I'd like to match packets going from one to another (the set can be
> bigger of course).
> 
> Without ipset it would be:
> 
> -A FORWARD -s 192.168.1.0/24 -d 192.168.2.0/24 -j ACCEPT
> 
> However this won't work using ipset:
> 
> -A FORWARD -m set --match-set mynets src,dst -j ACCEPT

Apply two matches:

-A FORWARD -m set --match-set mynets src -m set --match-set mynets dst ...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
