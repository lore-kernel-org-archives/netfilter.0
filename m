From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: RFC 4890 (icmpv6 firewall recommendations) and ip6tables (was:
 ip6tables icmp conntracking on 2.6.18 vs 2.6.24)
Date: Fri, 4 Apr 2008 11:12:34 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0804041039280.20943@blackhole.kfki.hu>
References: <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org>
 <20080402212653.GC11325@piper.oerlikon.madduck.net>
 <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org>
 <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org>
 <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net>
 <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu>
 <20080404073230.GA22259@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080404073230.GA22259@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martin f krafft <madduck@madduck.net>
Cc: netfilter@vger.kernel.org

On Fri, 4 Apr 2008, martin f krafft wrote:

> also sprach Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> [2008.04.03.1814 +0200]:
> > In order to handle ICMPv6 in the best way I'd suggest to read
> > rfc4890 titled Recommendations for Filtering ICMPv6 Messages in
> > Firewalls, which even comes with a sample ip6tables script.
> 
> I read over that document and I am a bit dazzled at the complexity
> of the resulting ip6tables ruleset after running the script. 
[...]

The RFC is well worth to read because it shows the complexity of ICMPv6 
and the related filtering problems:

- As ARP is replaced by ICMPv6 in IPv6, dropping ICMPv6 blindly means no 
  IPv6 at all.
- IPv6 inherently rely on multicast, but multicast is *not* 
  supported by netfilter connection tracking at all and that must be
  taken into account in the filtering rules.

> I hope you concur, however, that its appendix B is useless.

It's a sample script, as far as I know from the time when IPv6 connection 
tracking in netfilter was experimental and people mostly ran IPv6 
without conntrack.

Let me put this way: a new sample script which is cleaned up and takes the 
current kernel features into account would be highly useful for the 
netfilter user community. Everyone entering the realm of IPv6 faces the 
same filtering problems and a lot of headache, hair-pulling could be saved 
by providing proper recipes.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
