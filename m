From: Mattias =?utf-8?Q?R=C3=B6nnblom?= <hofors@lysator.liu.se>
Subject: Re: nat problem: What's so special with traffic from audibank.de?
Date: Thu, 03 Dec 2009 23:22:47 +0100
Message-ID: <87ljhj3dfs.fsf@isengard.friendlyfire.se>
References: <20091203154831.ac38cf77.lars.taeuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091203154831.ac38cf77.lars.taeuber@gmx.net> ("Lars
 =?utf-8?Q?T=C3=A4uber=22's?= message of "Thu\, 3 Dec 2009 15\:48\:31
 +0100")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lars =?utf-8?Q?T=C3=A4uber?= <lars.taeuber@gmx.net>
Cc: netfilter@vger.kernel.org

Lars T=C3=A4uber <lars.taeuber@gmx.net> writes:

> Hi there.
>
> Since some years I have experience with the firewall systems inside l=
inux.
> But now I have a case where I don't know how to debug this.
>
> I exchanged my hand written firewall rules with rules generated from =
fwbuilder 3.0.5. The kernel used is the one from ubuntu 8.04 (2.6.24-25=
-server).
>
> $ iptables -V
> iptables v1.3.8
>
> Maybe it's an already known bug in iptables from this old kernel?
>
> All http(s) traffic works exept the one from audibank.de. The start s=
ide doesn't show up when called from a computer on the natted side of t=
he local network. When called from the computer doing the firewall/nat =
it just works.
>>

/../

> Attached is the tcpdump of the http traffic related to audibank.de
>
> What's wrong? Can someone enlighten me please?
>

I'll do some guessing here. It looks like the first large (MSS-sized)
segment is lost. I've seen this happening in networks where Path MTU
Discovery didn't work (because ICMP Fragmentation Needed was
filtered).

What I would try is to "clamp" the advertised MSS for upstream TCP
segments to something low (like 300 bytes), to see if that solves your
problem. See iptables(8) for details on how to do that.

(Low MSS will increase protocol overhead, so you probably don't want
to clamp MMSes for all outgoing traffic.)

Best regards,
     Mattias
