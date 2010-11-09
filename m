From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: port based routing - help with tcpdump
Date: Tue, 09 Nov 2010 17:05:11 +0100
Message-ID: <4CD97137.5000706@plouf.fr.eu.org>
References: <AANLkTik6E8KDgN8S+J952ULLpzUjy2yAY9oNA1jv+ZEJ@mail.gmail.com>	<4CD7CD88.6010100@plouf.fr.eu.org>	<AANLkTimeCfv9i13L9PFpOxTRbzG4c4Qpa7XO5quK2CEY@mail.gmail.com> <AANLkTikRY6mYY5fAAN4Ey-BaOQSOiXtx-StUejyQGG+x@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikRY6mYY5fAAN4Ey-BaOQSOiXtx-StUejyQGG+x@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ilo Lorusso <sneak147@gmail.com>
Cc: netfilter@vger.kernel.org

Ilo Lorusso a =E9crit :
>=20
> im having simalar problem , i set the below up for traffic that gets
> forward though my linux box..
> I can see the traffic returning though the alternate interface yet th=
e
> port does not connect..
>=20
> I have turned of RP_filtering on all my interfaces and there is are n=
o
> conflicting Deny statements on my iptables .. is there anything else
> that I would cause this?

With tcpdump, can you see the return traffic going out the LAN interfac=
e
? If no, can you "see" it in the FORWARD chain (insert a LOG rule at th=
e
beginning of the chain) ?
