From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: "raw" table versus "filter" table
Date: Thu, 19 Nov 2015 09:10:15 +0100
Message-ID: <564D83E7.7030207@plouf.fr.eu.org>
References: <564CF1D6.9000709@digi-value.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <564CF1D6.9000709@digi-value.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David TAILLANDIER - DIGI VALUE <david.taillandier@digi-value.fr>
Cc: netfilter@vger.kernel.org

David TAILLANDIER - DIGI VALUE a =E9crit :
>=20
> The documentations I found always describe the raw table to be used i=
n
> strict cases. But none give even the smallest justification.
>=20
> --> Is there any reasons not to use the raw table, apart dogmatic one=
s ?

Any match that requires conntrack, NAT or routing to be applied won't
work in the raw table. Only simple rules are possible.
