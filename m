From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: iptables DNAT algorithm -- another way?
Date: Sat, 13 Dec 2014 22:30:13 +0100
Message-ID: <548CAFE5.3090308@plouf.fr.eu.org>
References: <548B8069.4020802@brandeis.edu>	<201412121950.59768.neal.p.murphy@alum.wpi.edu>	<548C0500.8030408@plouf.fr.eu.org> <CAGYMsbuauVpzw+sF8mfKxwT=NMVt3OgBEw7DvF-T=ewKk=doYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGYMsbuauVpzw+sF8mfKxwT=NMVt3OgBEw7DvF-T=ewKk=doYQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Miller <johnmill@brandeis.edu>
Cc: netfilter@vger.kernel.org

John Miller a =E9crit :
>=20
> iptables -t mangle -A OUTPUT -d 172.16.0.0/16 -j NETMAP --to 129.64.0=
=2E0/16

The NETMAP target is valid only in the nat table.
