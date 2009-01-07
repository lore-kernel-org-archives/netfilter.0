From: =?iso-8859-15?Q?Roland_H=E4der?= <r.haeder@web.de>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Wed, 07 Jan 2009 21:04:45 +0100
Message-ID: <669090226@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: netfilter@vger.kernel.org

> line 144: -A PUB_IN -s 192.168.1.0/24 -j LOG --log-prefix "PUB_IN DRO=
P 8 "
>=20
> says: 'PUB_IN DROP 8'
>=20
> your log says: Jan 5 13:49:12 firebox kernel: INPUT DROP 8
>=20
> this is not the rule matching in the log. otherwise it would say PUB_=
IN=20
> DROP 8 in your logs.
Okay please redownload this file:
http://www.mxchange.org/downloads/firebox/iptables.list

I have updated it. Output of "iptables -v" said version 1.4.2

Roland
____________________________________________________________________
Psssst! Schon vom neuen WEB.DE MultiMessenger geh=F6rt?=20
Der kann`s mit allen: http://www.produkte.web.de/messenger/?did=3D3123

