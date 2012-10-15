From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ipset] possible bug handling multi-resolved FQDNs
Date: Mon, 15 Oct 2012 19:12:07 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210151909410.1546@nerf07.vanv.qr>
References: <507C430A.5010201@cica.es>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <507C430A.5010201@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org


On Monday 2012-10-15 19:08, Arturo Borrero wrote:

> Hi there,
> I found this:
>
> root@pica:~# ipset create repos_ipv6 hash:ip family inet6
> root@pica:~# ipset add repos_ipv6 wildcart.fedoraproject.org
> ipset v6.12.1: Syntax error: cannot resolve 'wildcart.fedoraproject.org' to an
> IPv6 address: Name or service not known
> Syntax error: cannot parse wildcart.fedoraproject.org: resolving to IPv6
> address failed

When you write "wild cart", I have to think of the movie
poster of Jackass (The Movie).
So yeah, so much for cards vs carts.

> root@pica:~# dig +short wildcard.fedoraproject.org AAAA
> 2001:4178:2:1269::fed2
> 2607:f188::dead:beef:cafe:fed1
> 2610:28:3090:3001:dead:beef:cafe:fed4

