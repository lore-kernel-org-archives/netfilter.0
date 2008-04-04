From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Fri, 4 Apr 2008 11:39:06 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0804041128250.20943@blackhole.kfki.hu>
References: <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org>
 <20080402212653.GC11325@piper.oerlikon.madduck.net>
 <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org>
 <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org>
 <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net>
 <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu>
 <20080404062229.GC12613@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080404062229.GC12613@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martin f krafft <madduck@madduck.net>
Cc: netfilter@vger.kernel.org

On Fri, 4 Apr 2008, martin f krafft wrote:

> also sprach Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> [2008.04.03.1814 +0200]:
> > ICMPv6 non-error types (i.e. above type 128) - the exception of 
> > echo-request (128) and node information query (139)  - are not tracked 
> > yet, thus such packets are marked as INVALID.
> 
> Do you have a roadmap for this sort of stuff? Can we expect more
> IPv6 support for netfilter in 2.6.25?

Can't say much because the "missing" informational ICMPv6 messages 
either use multicast addresses or experimental/exotic.

Needless to say most of the problems comes from multicast.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
