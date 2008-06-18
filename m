From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Why is this traffic dropped?
Date: Wed, 18 Jun 2008 22:39:15 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806182238380.14231@fbirervta.pbzchgretzou.qr>
References: <200806181711.m5IHBbkX023710@doug.ats.sensis.com> <48594DE4.9070006@freemail.hu> <alpine.LNX.1.10.0806182036500.14231@fbirervta.pbzchgretzou.qr> <Pine.LNX.4.64.0806182217030.11333@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806182217030.11333@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>, drabe@sensis.com, netfilter@vger.kernel.org


On Wednesday 2008-06-18 22:21, Jozsef Kadlecsik wrote:
>> Seriously, FIN packets should not be dropped, otherwise a connection
>> is lurking around until it times out.
>
>Absolutely true. FIN packets which are OK according to conntrack are 
>marked as ESTABLISHED (or RELATED).

No, only connections that would have been NEW can be RELATED
(i.e. RELATED is an augmented NEW state), all other packets
are ESTABLISHED only, be it related or not.
