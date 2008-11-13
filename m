From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PREROUTING table and quota
Date: Thu, 13 Nov 2008 18:11:42 +0100
Message-ID: <491C5FCE.9060001@plouf.fr.eu.org>
References: <1226578553.8310.40.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1226578553.8310.40.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Michael a =E9crit :
>=20
> I'm having some issues using the quota module in the PREROUTING table=
=2E

There is no such table. Do you mean the PREROUTING _chain_ in the 'nat'=
=20
table ?

[...]
> As far as I can tell, not all packets are actually hitting my quota
> rules.  Instead only new connections seem to be managed correctly -
> subsequent and return packets are unaffected, and thus uncounted.

This looks like the normal behaviour of the 'nat' table.
