From: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>
Subject: Re: snat range not cycling
Date: Wed, 04 Aug 2010 10:52:08 +0400
Message-ID: <194591280904728@web65.yandex.ru>
References: <4C5832F9.50004@trash.net> <x6bp9jy7sj@gzp> <4C584C63.8010607@trash.net> <x6vd7rwrah@gzp> <x6lj8nwqu4@gzp> <alpine.LSU.2.01.1008032001430.1519@obet.zrqbmnf.qr> <x6sk2vo9eq@gzp> <003901cb3358$1346b250$39d416f0$@net> <alpine.LSU.2.01.1008040008360.3134@obet.zrqbmnf.qr> <167431280900621@web47.yandex.ru> <005601cb33a0$38670290$a93507b0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1280904729; bh=KIuHsrRM9Pe1pvdDdRofbo4iDgNYWCP0B+iqL+BYYqo=;
	h=From:To:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=NeVOJOi2SC22af9dTn0gPwA7wPBD5Q6hNvZcObLJ2tvNA0NM2AI7uk4B4YfRJScJc
	 OPGyFXZzuWMBMfAEppLcTm0S4zLvrTPyM2tMnfYqEEhSHgKLrAoSjHX4uB1bi5zxW9
	 +1O7UgRzi740UAecjP0Rjne6z1UDjSGT0xsf4Tmc=
In-Reply-To: <005601cb33a0$38670290$a93507b0$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Timothy Hayes <morphieus@earthlink.net>, netfilter@vger.kernel.org



04.08.2010, 10:42, "Timothy Hayes" <morphieus@earthlink.net>:
> Thanks I'll give that a try.
>
> Wouldn't it trying to keep 1 to 1 mapping make the SAME target attribute
> redundant?

As far as I know, the SAME target was removed from kernel two years ago.
The SNAT target with --persist option is the equivalent of SAME.

--
wbr, Oleg.
