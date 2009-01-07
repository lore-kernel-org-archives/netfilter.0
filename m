From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Wed, 07 Jan 2009 20:43:37 +0100
Message-ID: <496505E9.4050206@chello.at>
References: <668614976@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <668614976@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org


>> there is no 'INPUT DROP 8' rule.
>>    =20
> Please have a look in line 144, it should be there. :)
>
> Roland
>
> PS: Sorry for that commercial line, I need to use webmail. :/
> __________________________________________________________________
> Deutschlands gr=F6=DFte Online-Videothek schenkt Ihnen 12.000 Videos!=
*
> http://entertainment.web.de/de/entertainment/maxdome/index.html
>
>
>  =20

line 144: -A PUB_IN -s 192.168.1.0/24 -j LOG --log-prefix "PUB_IN DROP =
8 "

says: 'PUB_IN DROP 8'

your log says: Jan 5 13:49:12 firebox kernel: INPUT DROP 8

this is not the rule matching in the log. otherwise it would say PUB_IN=
=20
DROP 8 in your logs.

greets

Mart

