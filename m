From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 03 Apr 2008 11:29:14 +0200
Message-ID: <47F4A36A.2010600@plouf.fr.eu.org>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080403081822.GA13254@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: martin f krafft <madduck@madduck.net>
Cc: netfilter discussion list <netfilter@vger.kernel.org>

Hello,

martin f krafft a =E9crit :
>=20
> Is IPv6 connection tracking on 2.6.18 just broken?

Are you using a 2.6.18 kernel image from Debian etch or a custom one ?

IPv6 conntrack requires the (now not so) new nf_conntrack, but in kerne=
l=20
versions older than 2.6.20 nf_conntrack did not support IPv4 NAT yet.=20
Only the old ip_conntrack, the IPv4-only conntrack, did. So IPv6=20
conntrack and IPv4 NAT were mutually exclusive. AFAIK 2.6.18 kernel=20
images from Debian etch are built with ip_conntrack in order to support=
=20
IPv4 NAT, and do not support IPv6 conntrack.

I am just a bit surprised that using the state match in ip6tables with =
a=20
kernel without IPv6 conntrack support does not trigger an error.
