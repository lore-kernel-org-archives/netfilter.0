From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: block network access for certain users/groups
Date: Fri, 30 Jul 2010 11:00:43 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007301036310.27811@obet.zrqbmnf.qr>
References: <op.vgmcupy42qajpl@imac.local> <4C51D771.1080904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C51D771.1080904@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Lars Nooden <lars.curator@gmail.com>
Cc: Elmar Stellnberger <estellnb@gmail.com>, netfilter@vger.kernel.org, peterb@chiark.greenend.org.uk, chris@chrisbrenton.org


Ref: http://marc.info/?l=3Dnetfilter&m=3D128043201731932&w=3D2

On Thursday 2010-07-29 21:33, Lars Nooden wrote:
> On 7/29/10 10:09 PM, Elmar Stellnberger wrote:
>> iptables -A mychain -m owner --gid-owner blockedusergroup -j DROP
>
> For starters, consider using the REJECT target instead of DROP if for=
 no other
> reason than that it will make your engineering easier:
>
> 	http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject

That page - especially the summary - is leaving out one essential featu=
re
G=C3=A1spar already mentioned it in another thread; the CHAOS target fr=
om
Xtables-addons.

It is hard to press its behavior into the three rows
"application connects to non-existent service" / "na=C3=AFve network sc=
anning" /
"specialist program", but the behavior can be summed up into:

1. Connect: With an x% (tunable) chance, failure is reported promptly t=
o the
   user/scanner. (This is to elicit point 2.)
2. Scanning many ports will be slow/expensive. (nmap)
3. Syn scans produce nonsensical results. (nmap)

> 	http://www.chrisbrenton.org/2009/07/why-firewall-reject-rules-are-be=
tter-than-firewall-drop-rules/

