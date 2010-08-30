From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 15:18:23 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1008301513400.20055@blackhole.kfki.hu>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk>  <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr>  <4C7B8BD2.1060009@abpni.co.uk>  <4C7B91A2.50707@abpni.co.uk>  <1283171041.16291.63.camel@enterprise.ims-firmen.de> 
 <4C7BA51D.8030004@abpni.co.uk>  <alpine.DEB.2.00.1008301438390.20055@blackhole.kfki.hu> <1283172840.16291.91.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1283172840.16291.91.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Jacob <jacob@internet24.de>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

On Mon, 30 Aug 2010, Thomas Jacob wrote:

> On Mon, 2010-08-30 at 14:42 +0200, Jozsef Kadlecsik wrote:
> 
> > Please check out RFC 4890: Recommendations for Filtering ICMPv6 Messages 
> > in Firewalls, which discusses ICMPv6 filtering in details. It even comes 
> > with an example shell script for netfilter/ip6tables in the appendix.
> 
> Are you sure that this is still accurate for current kernels? 
> 
> For instance, I would have assumed that things like
> destination-unreachable or packet-too-big  are handled
> by the stateful inspection code (i.e. are matched by
> --state RELATED, ESTABLISHED) same as for IPv4?

The sample script in the RFC tries to handle both cases: kernel with and 
without IPv6 connection tracking (STATE_ENABLED shell variable).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
