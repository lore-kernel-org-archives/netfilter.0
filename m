From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port-based routing with OpenVPN
Date: Wed, 26 Sep 2007 16:10:06 +0200
Message-ID: <46FA683E.5030307@plouf.fr.eu.org>
References: <20070915231545.224150@gmx.net>	 <46ED0DE4.1040300@plouf.fr.eu.org> <1190758479.13546.8.camel@laptop>	 <46FA3594.9050306@plouf.fr.eu.org> <1190810998.6867.5.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1190810998.6867.5.camel@laptop>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Mario H=FClsegge a =E9crit :
>=20
> these 2 hints solved the problem, now all runs fine. i inserted a mas=
q
> rule before, but without setting rp_filter

The kernel disables rp_filter by default, but the startup scripts=20
provided by some distributions enable it.

> (who would ever thought of THAT ;) ).

The practical answer is : anyone who experienced the problem once does.=
=20
Trust me.

The theoretical answer is : anyone using iproute should, because it is =
a=20
common issue documented in the Linux Advanced Routing & Traffic Control=
=20
HOWTO, and probably elsewhere. I myself hesitated to mention it and did=
=20
it only for completeness because it could not be the only cause of your=
=20
problem : tcpdump would have seen the replies even though the kernel ha=
d=20
dropped them.
