From: =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>
Subject: Re: [xtables-addons] memory usage in module geoip (probably)
Date: Fri, 20 Jan 2012 21:18:36 +0100
Message-ID: <8b53c851c9391f9bc9ce3427acdbab4c@mejor.pl>
References: <4F19928A.7050005@mejor.pl>
 <alpine.LNX.2.01.1201201800150.29700@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version; bh=MrdUiFH9vZOyj+MNH8tx5fPZIqWCjDgnsgrvvCaPQKY=;
	b=BDpjZVOdLT5Gjgg2g9H3ovI0GzuPUANq3ITKjDBD24KV50HbHQDg+RA/+a769OI6xB1xos3jHsoZJiqMwRiYryRr3+E/VHpISH4dDTa04QLg8kNWh9PsbLGB5N4OaC7w;
In-Reply-To: <alpine.LNX.2.01.1201201800150.29700@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

W dniu 2012-01-20 18:05, Jan Engelhardt napisa=C5=82(a):
> geoip uses vmalloc for its huge allocations, so that can't be it. The
> massive size of skbuff_head_cache would point towards there being a=20
> lot
> of dead skbs being held, which - in my nose - would smell of tarpit.=20
> Did
> you properly feed all packets that you tarpited also to -j CT=20
> --notrack?

Surely i didn't use notrack;) I has problem how to use it, i'd like to=20
tarpit packets
at the end of INPUT at filter table, notrack i can use only in raw=20
table.
Have you got idea about kmallo-512 and kmalloc-2048? I'll try every=20
single module and watch
kmalloc usage. It will take a couple of days for each one. Maybe i'll=20
isolate which module
uses kmallocs. I suspect xtables because without them i didn't notice=20
such situation.

>>I'd like to ask is such usage of memory ok? Which module could take=20
>> so
>>much precious ram?:) (I suspect geoip). How much memory geoip can use=
=20
>> in
>>worse case (db with ipv4 and ipv6)?
>
> The on-disk files for geoip are loaded verbatim into the kernel, so=20
> that
> would be only ~6 MB at worst for geoip, not 40+.

Thank you for all information.
Marcin
