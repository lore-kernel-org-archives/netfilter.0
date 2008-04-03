From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 3 Apr 2008 18:14:42 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net>
 <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org>
 <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net>
 <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org>
 <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org>
 <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080403153847.GA17170@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martin f krafft <madduck@madduck.net>
Cc: netfilter@vger.kernel.org

On Thu, 3 Apr 2008, martin f krafft wrote:

> also sprach Nicolas KOWALSKI <niko@petole.dyndns.org> [2008.04.03.1735 +0200]:
> > IN=eth0 OUT= MAC=33:33:00:00:00:02:00:0f:1f:c9:4e:7d:86:dd
> > SRC=fe80:0000:0000:0000:020f:1fff:fec9:4e7d
> > DST=ff02:0000:0000:0000:0000:0000:0000:0002 LEN=56 TC=0
> > HOPLIMIT=255 FLOWLBL=0 PROTO=ICMPv6 TYPE=133 CODE=0
> 
> Exactly. router-solicitation being matched by INVALID.

ICMPv6 non-error types (i.e. above type 128) - the exception of 
echo-request (128) and node information query (139)  - are not tracked 
yet, thus such packets are marked as INVALID.

In order to handle ICMPv6 in the best way I'd suggest to read rfc4890
titled Recommendations for Filtering ICMPv6 Messages in Firewalls, which 
even comes with a sample ip6tables script.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
