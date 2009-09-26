From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Multiple --to-source not supported
Date: Sat, 26 Sep 2009 13:06:05 +0200
Message-ID: <4ABDF59D.1010706@plouf.fr.eu.org>
References: <B7A55E8C969B974FBC89274E565B8B2D019DFBCA0A@US-COL-EXCHMBX1.green.sophos>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B7A55E8C969B974FBC89274E565B8B2D019DFBCA0A@US-COL-EXCHMBX1.green.sophos>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

Dave Sparks a =E9crit :
> I am trying to setup SNAT for a large network to roundrobin over two
> different /28s which are on the same interface.  The obvious way to d=
o
> this with iptables doesn't like the dis-contiguous cidrs and complain=
s:
>=20
> /sbin/iptables -t nat -A eth1_masq -s 10.0.0.0/24 -d 0.0.0.0/0
> -j SNAT --to-source 1.2.3.210-1.2.3.222 --to-source 4.5.6.50-4.5.6.62
>=20
> iptables v1.4.3.2: Multiple --to-source not supported
>=20
> This used to work in earlier 2.6 kernels, why doesn't it work anymore=
?
> Any tips for workarounds?

Support for multiple ranges was removed in kernel 2.6.11 and above.

ChangeLog-2.6.11 says :
  [PATCH] Remove NAT to multiple ranges
  The NAT code has the concept of multiple ranges: you can say "map thi=
s
  connection onto IP 192.168.1.2 - 192.168.1.4, 192.168.1.7 ports
  1024-65535, and 192.168.1.10".  I implemented this because we could.

  But it's not actually *used* by many (any?) people, and you can
  approximate this by a random match (from patch-o-matic) if you really
  want to.  It adds complexity to the code.

The "random" match from the patch-o-matic was superseded by the
"statistic" match which was added in mainline kernel 2.6.18 and iptable=
s
1.3.6.
