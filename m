From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Netfiler REAL Rule Match Sequence
Date: Fri, 16 May 2008 17:57:22 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805161756260.15590@fbirervta.pbzchgretzou.qr>
References: <774cb3b60805141321l6b8ce420ia10b6e027c80dd74@mail.gmail.com>  <alpine.LNX.1.10.0805142328140.5292@fbirervta.pbzchgretzou.qr>  <774cb3b60805150610h6aad9517l86eb7079e75cfaf4@mail.gmail.com>  <774cb3b60805150611w292f88d1le77aece2ade7e934@mail.gmail.com>
 <774cb3b60805150732o1ee9f5fao53537d46bec76ac2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <774cb3b60805150732o1ee9f5fao53537d46bec76ac2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?J=C3=BCrgen_Rochol?= <juergen.rox@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2008-05-15 16:32, J=C3=BCrgen Rochol wrote:
>
>C)  iptables -P OUTPUT DROP  and iptables -A OUTPUT -t filter  -p icmp
> -j ACCEPT and iptables -t mangle -A POSTROUTING -p icmp -j TTL
>--ttl-dec 10
>
>What happens now?
>* PC1 receives the reply.  This is the *first match* for this packet
>(as in B). So thats ok.
>* But other thing happens: PC1 receive the reply with TTL decremented.
>So the 3rd rule above was also evaluated. That is, for a same packet,
>2 rules were applied.

They are different tables. So, all is still correct.
Also, TTL is a non-terminating target, as are most targets designed
for the mangle table.
