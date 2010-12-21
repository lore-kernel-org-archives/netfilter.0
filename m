From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip6tables redirect
Date: Tue, 21 Dec 2010 22:25:24 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012212225080.6728@obet.zrqbmnf.qr>
References: <26D8DC6230C54AACAA60179B4D5E132C@WINDOWS.KVI.NL> <alpine.LNX.2.01.1012021433430.5361@obet.zrqbmnf.qr> <1F82E3373D994D9B8DECFD9435B37B49@WINDOWS.KVI.NL> <alpine.LNX.2.01.1012022024560.23145@obet.zrqbmnf.qr> <alpine.LNX.2.01.1012151253070.23007@obet.zrqbmnf.qr>
 <loom.20101216T104439-767@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20101216T104439-767@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: Puneet Mohan <puneetmohan1@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2010-12-16 10:45, Puneet Mohan wrote:
>Jan Engelhardt <jengelh <at> medozas.de> writes:
>
>> >>Thanks for the suggestion, but I cannot find documentation fro TPR=
OXY,
>> >>nor for the local routing.
>> >
>>
>Hello Mr. Jan Engelhardt,
>Thanks for pointing out the version. But even those rules are not gett=
ing
>applied correctly. Pls point me if I am wrong. I took "Merge commit 'v=
1.4.10'"
>from "http://dev.medozas.de/gitweb.cgi?p=3Diptables;a=3Dsummary"
>
>REAL PROBLEM
>>ip6tables -t mangle -A PREROUTING  -j ACCEPT
>       	This rule worked perfectly fine.
>
>>ip6tables -t mangle -A PREROUTING  -j TPROXY
>       	ip6tables v1.4.10: TPROXY target: Parameter --on-port is requi=
red
>
>>ip6tables -t mangle -A PREROUTING  -p tcp  -j TPROXY  --on-port 3128
>   	iptables: No chain/target/match by that name
>
>Can you see what exactly the problem is because in the last rule I sup=
pose
>chain/target given is correct else the first rule wouldn=E2=80=99t hav=
e worked.

It seems your kernel does not have TPROXY v6 support.
