From: =?iso-8859-15?Q?Roland_H=E4der?= <r.haeder@web.de>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Wed, 07 Jan 2009 22:04:47 +0100
Message-ID: <669185869@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: netfilter@vger.kernel.org

> -A INPUT -i ppp0 -j PUB_IN
> -A OUTPUT -o ppp0 -j PUB_OUT
Or in other words, I need to rewrite the both exisiting rules for eth0 =
instead of ppp0 to ppp0.

Looks pretty good here. :) So far no drops! :D

The node is called "firebox" if you want to try it (Tor node!)

I think I can fill another bug report and credit you.

Thanks a lot!

Roland
____________________________________________________________________
Psssst! Schon vom neuen WEB.DE MultiMessenger geh=F6rt?=20
Der kann`s mit allen: http://www.produkte.web.de/messenger/?did=3D3123

