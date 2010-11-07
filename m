From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: unable to source and destination nat at the same time on multi-homed
 server
Date: Sun, 07 Nov 2010 17:10:03 +0100
Message-ID: <4CD6CF5B.2030606@plouf.fr.eu.org>
References: <4CD6C4C6.3050508@joelly.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CD6C4C6.3050508@joelly.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Joelly Alexander <alex@joelly.net>
Cc: netfilter@vger.kernel.org

Joelly Alexander a =E9crit :
>=20
> in other words - source-nat must be done before destination-nat, but=20
> iptables does not allow this because the output chain with=20
> destination-nat is handled before the source-nat from the postrouting=
=20
> chain;
>=20
> does anyone know a way to solve this?

You can mark the packets (-j MARK) or the connection (-j CONNMARK) in
mangle/OUTPUT before DNAT, and match the packet mark (-m mark) or
connection mark (-m connmark) in nat/POSTROUTING.

Or you can use -m conntrack --ctorigdst to match the original
destination address.
