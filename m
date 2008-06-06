From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipp2p segfault with kernel 2.6.24.7
Date: Sat, 7 Jun 2008 01:39:19 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806070131140.20733@fbirervta.pbzchgretzou.qr>
References: <4849A942.9030204@zensoluciones.com> <alpine.LNX.1.10.0806062322340.20733@fbirervta.pbzchgretzou.qr> <4849BB1E.7060704@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4849BB1E.7060704@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?S=C2=8E=C3=A9bastien_Cramatte?= <scramatte@zensoluciones.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-06-07 00:33, S?=C3=A9bastien Cramatte wrote:
>> >
>> > I've build latest IPP2P with  kernel 2.6.24.7 and iptables 4.0
>> > When I try to use it I have a "segmentation fault" :
>>
>> What steps did you take to compile it?
>
> I'm use  set of patches from http://linuxbox.pl/index.php?go=3Dkernel
> These patches are quite up to date ...

That page has not been updated in a long time. Not only does it use
the legacy patchomatic, which is largely superseded now, but also
references "projekty subversion"; a few things have gone into
mainline, many others into Xtables-addons, including ipp2p:
http://lwn.net/Articles/277804/
