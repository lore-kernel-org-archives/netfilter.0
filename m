From: Puneet Mohan <puneetmohan1@gmail.com>
Subject: Re: ip6tables redirect
Date: Thu, 16 Dec 2010 09:45:22 +0000 (UTC)
Message-ID: <loom.20101216T104439-767@post.gmane.org>
References: <26D8DC6230C54AACAA60179B4D5E132C@WINDOWS.KVI.NL> <alpine.LNX.2.01.1012021433430.5361@obet.zrqbmnf.qr> <1F82E3373D994D9B8DECFD9435B37B49@WINDOWS.KVI.NL> <alpine.LNX.2.01.1012022024560.23145@obet.zrqbmnf.qr> <alpine.LNX.2.01.1012151253070.23007@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Jan Engelhardt <jengelh <at> medozas.de> writes:

> >>Thanks for the suggestion, but I cannot find documentation fro TPRO=
XY,
> >>nor for the local routing.
> >
>
Hello Mr. Jan Engelhardt,
Thanks for pointing out the version. But even those rules are not getti=
ng
applied correctly. Pls point me if I am wrong. I took "Merge commit 'v1=
=2E4.10'"
from "http://dev.medozas.de/gitweb.cgi?p=3Diptables;a=3Dsummary"

REAL PROBLEM
>ip6tables -t mangle -A PREROUTING  -j ACCEPT
       	This rule worked perfectly fine.

>ip6tables -t mangle -A PREROUTING  -j TPROXY
       	ip6tables v1.4.10: TPROXY target: Parameter --on-port is requir=
ed

>ip6tables -t mangle -A PREROUTING  -p tcp  -j TPROXY  --on-port 3128
   	iptables: No chain/target/match by that name

Can you see what exactly the problem is because in the last rule I supp=
ose
chain/target given is correct else the first rule wouldn=E2=80=99t have=
 worked.

Regards,
Puneet.Mohan





