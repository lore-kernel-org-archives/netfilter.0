From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Dynamically adding rules - are connection tracking states maintained?
Date: Thu, 24 Apr 2008 21:24:49 +0200
Message-ID: <4810DE81.10302@plouf.fr.eu.org>
References: <989878.86998.qm@web57314.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <989878.86998.qm@web57314.mail.re1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

noa levy a =E9crit :
>=20
> When I add a rule to (or delete a rule from) iptables,
> while it is running, does that have any effect on the states in the
> connection tracking table?

No.

> Will the table be flushed?

No.

> Are states linked  to the rule that allowed the initial packet in [..=
=2E] ?

No.
