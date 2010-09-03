From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Need for a specific source address selection rule ? (not
 neccessarily netfilter)
Date: Fri, 3 Sep 2010 22:52:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009032251360.5738@obet.zrqbmnf.qr>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com> <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr> <4C7A6D11.8090306@httrack.com> <4C7A8040.7040002@plouf.fr.eu.org>
 <4C81321F.4010106@httrack.com> <alpine.LNX.2.01.1009031942001.31358@obet.zrqbmnf.qr> <4C813FC3.3050008@httrack.com> <alpine.LNX.2.01.1009032230210.3766@obet.zrqbmnf.qr> <4C815DF0.10402@httrack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C815DF0.10402@httrack.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Xavier Roche <roche*lkml@httrack.com>
Cc: netfilter@vger.kernel.org

On Friday 2010-09-03 22:43, Xavier Roche wrote:

> Jan Engelhardt a =C3=A9crit :
>> Of course it is for routing. That is why it is in the *drumroll*
>> routing table!
>
> Sure. But my point was related to the main topic of this thread: the =
damn
> source address is NOT at all concerned. Obvious or not, routing won't=
 help.

So, either you agree that ignoring the src attribute in ipV6 is the bug=
,=20
or you have an alternate theory that I have not yet groked.

