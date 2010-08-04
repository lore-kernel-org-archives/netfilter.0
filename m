From: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>
Subject: Re: snat range not cycling
Date: Wed, 04 Aug 2010 09:43:40 +0400
Message-ID: <167431280900621@web47.yandex.ru>
References: <4C5832F9.50004@trash.net> <x6bp9jy7sj@gzp> <4C584C63.8010607@trash.net> <x6vd7rwrah@gzp> <x6lj8nwqu4@gzp> <alpine.LSU.2.01.1008032001430.1519@obet.zrqbmnf.qr> <x6sk2vo9eq@gzp> <003901cb3358$1346b250$39d416f0$@net> <alpine.LSU.2.01.1008040008360.3134@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1280900621; bh=sdmWjPAFS7jKyxF4lJcxGo9t5KHNrBp3RCFS5VuKtak=;
	h=From:To:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=DuHr8oxC8hx3D3OQHmD+Zj2N8Ogy4yT8vQKb2cA0ETMHa1dCOwM/jCZ3cDDySs2Z6
	 xKCR75B0o8O+n5M/rypJI92e/ctaZj6ZiiRNEIDl5k0kcIBsssS61NvubaaSf96fVg
	 fE6oaV0tpc/qYtN2ZRRTUyf5+MuQvcL/1CjHNjFM=
In-Reply-To: <alpine.LSU.2.01.1008040008360.3134@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

04.08.2010, 02:09, "Jan Engelhardt" <jengelh@medozas.de>:
> IIRC the algorithm tries to give you the same source address for a given
> source address. (I hear that banking sites and other sensitive stuff can
> get unhappy if your externally visible address suddenly changes.)
>

Only when --persist option is given. Otherwise original source and destination
addresses will be used for selection IP-address from the pool.

Timothy should try connection from different source IP-address or use different 
destination and see how this change situation.

--
wbr, Oleg.
