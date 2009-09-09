From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Windows/NetBIOS & SNAT
Date: Wed, 09 Sep 2009 17:45:37 +0200
Message-ID: <4AA7CDA1.1040406@plouf.fr.eu.org>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com> <4AA62E6A.4030501@chello.at> <185948.38077.qm@web33403.mail.mud.yahoo.com> <4AA7B8D0.8020202@plouf.fr.eu.org> <952994.89264.qm@web33405.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <952994.89264.qm@web33405.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Nicholas Couchman a =E9crit :
>=20
> I'll look and see what I can find for nat modules - I did not see
> anything with *nat* in it in the net/netfilter directory in the Linux
> source tree.

It is in located in net/ipv4/netfilter/ because NAT is IPv4-specific.
