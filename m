From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: netfilter: ipset: fix linking with CONFIG_IPV6=n
Date: Wed, 2 Feb 2011 20:52:28 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102022049230.29563@blackhole.kfki.hu>
References: <4D49188B.2030002@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D49188B.2030002@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hi Patrick,

On Wed, 2 Feb 2011, Patrick McHardy wrote:

> Add some #ifdefs to unconditionally return false in
> ip_set_get_ip6_port() when CONFIG_IPV6=n and convert
> to ipv6_skip_exthdr() to avoid pulling in the ip6_tables
> module when loading ipset.

You left out checking fragmented packets. Is it intentional?
 
> A slightly more code-saving alternative would be to add
> a dummy inline function or ifdef the callsites. Please
> let me know which way you prefer.

A dummy inline looks nicer to me, because that way the IPv6 and non-IPv6 
cases were clearly separated.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
