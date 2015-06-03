From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP sequence checking
Date: Wed, 3 Jun 2015 19:16:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1506031915590.23917@blackhole.kfki.hu>
References: <556EFE9A.2020003@students.fhnw.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <556EFE9A.2020003@students.fhnw.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lukas Hubschmid (s)" <lukas.hubschmid@students.fhnw.ch>
Cc: netfilter@vger.kernel.org

On Wed, 3 Jun 2015, Lukas Hubschmid (s) wrote:

> Does iptables support TCP sequence checking, to check if a TCP packet has a
> valid sequence number (according to previous packets of the same TCP
> connection)?

Yes, have a look at net/netfilter/nf_conntrack_proto_tcp.c in the kernel 
source tree.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
