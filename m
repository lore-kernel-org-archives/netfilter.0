From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: netfilter: ipset: fix linking with CONFIG_IPV6=n
Date: Thu, 3 Feb 2011 10:29:51 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102031029150.30902@blackhole.kfki.hu>
References: <4D49188B.2030002@trash.net> <alpine.DEB.2.00.1102022049230.29563@blackhole.kfki.hu> <4D49DF65.1030708@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D49DF65.1030708@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Wed, 2 Feb 2011, Patrick McHardy wrote:

> Am 02.02.2011 20:52, schrieb Jozsef Kadlecsik:
> > Hi Patrick,
> > 
> > On Wed, 2 Feb 2011, Patrick McHardy wrote:
> > 
> >> Add some #ifdefs to unconditionally return false in
> >> ip_set_get_ip6_port() when CONFIG_IPV6=n and convert
> >> to ipv6_skip_exthdr() to avoid pulling in the ip6_tables
> >> module when loading ipset.
> > 
> > You left out checking fragmented packets. Is it intentional?
> 
> Yes, ipv6_skip_exthdr() returns an error for non-first fragments.
> For the first fragment skb_header_pointer() checks that enough
> data for the port numbers is present.
> 
> >> A slightly more code-saving alternative would be to add
> >> a dummy inline function or ifdef the callsites. Please
> >> let me know which way you prefer.
> > 
> > A dummy inline looks nicer to me, because that way the IPv6 and non-IPv6 
> > cases were clearly separated.
> 
> OK, I'm going to commit this patch.

I committed it in my tree too. Thanks!

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
