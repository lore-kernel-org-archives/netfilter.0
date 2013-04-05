From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: netfilter ipset c library
Date: Fri, 5 Apr 2013 08:48:29 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304050845360.25394@blackhole.kfki.hu>
References: <92C204D2E11A6949B84DB21D4194129316F6FDA0@PRN-MBX02-3.TheFacebook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <92C204D2E11A6949B84DB21D4194129316F6FDA0@PRN-MBX02-3.TheFacebook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rod Salazar <rodrigos@fb.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 4 Apr 2013, Rod Salazar wrote:

> Is there anyway to modify ipset sets programmatically? I'm looking for a
> way to add and remove ports to an ipset through my userspace app. Is the
> only solution for me to modify the ipset command line tool so I can use it
> within my app or call system("ipset ..") ? Even modifying iptables rules
> themselves would suffice if there were a way, any ideas?

The ipset tool is built on top of the libipset library. So I'd suggest to 
use the library directly.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
