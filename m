From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Very strange ftp mget problem
Date: Wed, 13 Apr 2011 14:27:25 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104131417360.25539@obet.zrqbmnf.qr>
References: <925A849792280C4E80C5461017A4B8A27D88F4@mail733.InfraSupportEtc.com> <925A849792280C4E80C5461017A4B8A27D88F5@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <925A849792280C4E80C5461017A4B8A27D88F5@mail733.InfraSupportEtc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Greg Scott <GregScott@Infrasupport.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-04-13 14:06, Greg Scott wrote:

>I'm posting here because maybe ip_conntrack_ftp might have a problem.=C2=
=A0 Or it
>could be hardware...
>
>An AS/400 behind the firewall starts up a batch job running a script t=
hat does
>an ftp mget of several dozen or more files from an ftp site.=C2=A0 The=
 mget hangs
>at random times, sometimes almost immediately, other times after copyi=
ng =C2=A0as
>many as a few hundred files.
>[...]
>Both fw1 and fw2 are HP minitowers, about 4 years old by now.=C2=A0 I =
forget the
>exact hardware models. Fw1 is running kernel 2.6.18 and fw2 uses kerne=
l 2.6.25
>or so.

Your posting of "2.6.18" and "2.6.25" and "random times" and "almost
immediately" (but not _totally immediately_ which is important) hints
towards this being old kernels having a problem with all the *ACK
features of TCP. Been there, seen it, and it was resolved by 2.6.25's
timeframe even here.
