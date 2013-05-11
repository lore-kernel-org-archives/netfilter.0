From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: synflood +syncookies + conntrack strange behaviour
Date: Sat, 11 May 2013 20:26:35 +0200
Message-ID: <518E8D5B.3060200@plouf.fr.eu.org>
References: <518C479D.1070904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <518C479D.1070904@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Alex Flex a =E9crit :
>=20
> a.) Shouldnt syn cookies (which is enabled) deal with the syn flood=20
> without compromising my state table?

No. Syncookies and conntrack are unrelated. Syncookies are in the TCP
stack while conntrack is in netfilter.

> c.) I  tried disabling iptables all together (thus no conntrack)

Conntrack and iptables are two distinct parts of netfilter. You can hav=
e
iptables disabled and contrack enabled (not very useful though).
To disable conntrack you must not load, or unload, the conntrack kernel
modules, or use iptables' NOTRACK target on all traffic.
