From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Setting NOTRACK on all tcp connections
Date: Wed, 1 Dec 2010 15:47:29 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012011547020.13019@obet.zrqbmnf.qr>
References: <4CF65D15.3060109@trego.co.il> <4CF65ED5.50808@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CF65ED5.50808@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Wednesday 2010-12-01 15:42, Pascal Hambourg wrote:
>Raviv a =C3=A9crit :
>>=20
>> I tried to setup a rule for notracking TCP connections as follows:
>>=20
>> iptables -t raw -A  PREROUTING -p tcp -j NOTRACK
>>=20
>> but stiil i can see a lot of tcp connections in /proc/net/nf_conntra=
ck.
>
>If these TCP connections are established by the host, you need to add
>the same rule in the OUTPUT chain too. Also if you have IPv6 traffic y=
ou
>need to add the same rules with ip6tables.

And since we're ultramodern, it's actually

	-p tcp -j CT --notrack
