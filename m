From: "Timothy Hayes" <morphieus@earthlink.net>
Subject: RE: snat range not cycling
Date: Tue, 3 Aug 2010 23:42:33 -0700
Message-ID: <005601cb33a0$38670290$a93507b0$@net>
References: <4C5832F9.50004@trash.net> <x6bp9jy7sj@gzp> <4C584C63.8010607@trash.net> <x6vd7rwrah@gzp> <x6lj8nwqu4@gzp> <alpine.LSU.2.01.1008032001430.1519@obet.zrqbmnf.qr> <x6sk2vo9eq@gzp> <003901cb3358$1346b250$39d416f0$@net> <alpine.LSU.2.01.1008040008360.3134@obet.zrqbmnf.qr> <167431280900621@web47.yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <167431280900621@web47.yandex.ru>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'\"Oleg A. Arkhangelsky\"'" <sysoleg@yandex.ru>, 'Jan Engelhardt' <jengelh@medozas.de>, netfilter@vger.kernel.org

Thanks I'll give that a try.

Wouldn't it trying to keep 1 to 1 mapping make the SAME target attribute
redundant?

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of "Oleg A. Arkhangelsky"
Sent: Tuesday, August 03, 2010 10:44 PM
To: Jan Engelhardt; netfilter@vger.kernel.org
Subject: Re: snat range not cycling

04.08.2010, 02:09, "Jan Engelhardt" <jengelh@medozas.de>:
> IIRC the algorithm tries to give you the same source address for a given
> source address. (I hear that banking sites and other sensitive stuff can
> get unhappy if your externally visible address suddenly changes.)
>

Only when --persist option is given. Otherwise original source and
destination
addresses will be used for selection IP-address from the pool.

Timothy should try connection from different source IP-address or use
different 
destination and see how this change situation.

--
wbr, Oleg.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

