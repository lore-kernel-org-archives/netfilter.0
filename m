From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: port based routing - help with tcpdump
Date: Mon, 08 Nov 2010 11:14:32 +0100
Message-ID: <4CD7CD88.6010100@plouf.fr.eu.org>
References: <AANLkTik6E8KDgN8S+J952ULLpzUjy2yAY9oNA1jv+ZEJ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik6E8KDgN8S+J952ULLpzUjy2yAY9oNA1jv+ZEJ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ilo Lorusso <sneak147@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Ilo Lorusso a =E9crit :
>=20
> I implement port based routing using a howto I found from a website
> (http://www.sparksupport.com/blog/tag/port-based-routing),
> which I can see is working based on various tcpdumps from
> various boxes. The problem is the port I route out to the alternate
> interface does not connect even though I do see the traffic comeback
> so I know the routing is working fine.

Any filtering rules in INPUT which may drop the replies ?
Is rp_filter disabled the alternate interface ?
