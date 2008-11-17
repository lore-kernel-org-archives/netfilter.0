From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: conntrack: will it restart after delete?
Date: Mon, 17 Nov 2008 20:34:51 +0100
Message-ID: <4921C75B.2020201@plouf.fr.eu.org>
References: <gfs68h$560$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gfs68h$560$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

sean darcy a =E9crit :
> I've had a problem with a udp connection being setup before DNAT,=20
> occurred. See "where are my udp packets going?" Nov 15, 2008.
>=20
> So just before setting up DNAT I'd propose to run:
>=20
> conntrack -D -p    udp --dport 4569
>=20
> but the user guide says this "blocks" the connection.

The user manual only says "this can be used to block traffic" (cut an=20
existing connection) with proper ruleset and settings. It does not bloc=
k=20
traffic by itself.

> I only want to=20
> flush/empty it, and let it start again with DNAT working.
>=20
> Does this do it?

I guess so, although I never used conntrack (no need yet).
However I would run the conntrack command after setting up DNAT rules,=20
because a packet could arrive between the two operations. Deleting a UD=
P=20
conntrack entry should be harmless, as the next UDP packet would create=
=20
it again anyway.
