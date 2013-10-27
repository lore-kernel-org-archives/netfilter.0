From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipsets and network accounting
Date: Sun, 27 Oct 2013 18:48:04 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1310271846550.6494@blackhole.kfki.hu>
References: <526549CA.80508@inspire.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <526549CA.80508@inspire.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anthony Sheetz <sheetzam@inspire.com>
Cc: netfilter@vger.kernel.org

On Mon, 21 Oct 2013, Anthony Sheetz wrote:

> Is there any way to get network accounting information for individual blocks
> made using ipsets? The network accounting information from iptables has
> aggregate information for ipsets, but is there any way to get detailed
> information for each ip address referenced in a set?

Ipset supports per entry packet and byte counters since version 6.19.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
