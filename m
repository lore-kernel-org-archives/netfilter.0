From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Windows/NetBIOS & SNAT
Date: Wed, 09 Sep 2009 16:21:43 +0200
Message-ID: <4AA7B9F7.3010304@plouf.fr.eu.org>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com> <8ed551510909061501v5a2812d0sd46efd3a5ec07904@mail.gmail.com> <235149.15070.qm@web33406.mail.mud.yahoo.com> <4AA761AE.2090603@chello.at> <413380.44233.qm@web33403.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <413380.44233.qm@web33403.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Nicholas Couchman a =E9crit :
>=20
> mangling the actual NBDS request in addition the IP header informatio=
n,
> which I don't think can currently be done in Netfilter.

NAT helpers such as nf_nat_ftp, nf_nat_sip do mangle addresses which ar=
e
embedded in the TCP or UDP payload.
