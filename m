Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E698846F
	for <netfilter@vger.kernel.org>; Fri, 12 Sep 2025 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681236; cv=none; b=J7qOCc6GYld3QvNKUjvv4dXk3aBRAt0x+qzU1Aq/bpP75QKt7F9yJsGpjLR7XYQgbg3dnDGMlb9RWBbC21hksQHzWLKgh1d20Jid+jN59TmPALYexvjRvPM+bw2RtHHINwyvwU0FEAbUsuAm7/bPW+8J4CqxrTaSRSE+fTrQHcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681236; c=relaxed/simple;
	bh=ygaKDxsstYb8hl/QHdVPDVkZw/+TClIMqcQUHWg53Ww=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=rkO1tEwWU8/r1yApXNUUS+Q9V9C1sLYyjSx0yP/77wJ5XAFQuisZ0UEoyV/7uT6t71fLmbseY+sW96T+FQW9pZ0bk6iqLAAnObfpUd73Z5pRMbc3VQa1spjXB7jYRK78WiWAj9tCpPb5E6ylEsDwWis088jUuMq9rlm+7x+rDvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=placidnetworks.com; spf=pass smtp.mailfrom=placidnetworks.com; dkim=pass (2048-bit key) header.d=placidnetworks.com header.i=juan@placidnetworks.com header.b=PLfikV6N; arc=none smtp.client-ip=74.208.4.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=placidnetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=placidnetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=placidnetworks.com header.i=juan@placidnetworks.com header.b="PLfikV6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=placidnetworks.com;
	s=s1-ionos; t=1757681233; x=1758286033; i=juan@placidnetworks.com;
	bh=EK6vzC7GatScfKa2EvjdFiV4q/Yxk53z4DyBAO4il7U=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PLfikV6Ny8a7EWaoFMQomZ39nNlSnRVbXAetISAtSOH4Yy9M1vmRxgW0bHiBnKzY
	 B82TCfiiCgxcdcn4TG0uZPRaf13lrvqxMIE2mkmvy/5t/5VXCmdE6U6QWk/O8Ti29
	 DRCfhceFSYd2n271NX7Y7Q/anW1jy+81VXwbhq8Uj2x3JY+6gxf5uAKBegyiuvuSb
	 MJAdSw5DSxZClaTRg3y5+Wi9YS1/3pvGNo2Naa3ycWF/Vf3N8GMkxOmnmAEB0QywK
	 W54wZQo+XvxL62OuozfV1OjjTR3mJNqt2lc7QX8Da+m5Go0U+R/nx6Ye6+lU9Brhm
	 FvA7EmFpZDcD8noQtw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from
 open-xchange-core-mw-default-12.open-xchange-core-mw-hazelcast-headless.open-xchange.svc.cluster.local
 ([10.73.158.104]) by mrelay.perfora.net (mreueus002 [172.19.143.1]) with
 ESMTPSA (Nemesis) id 0MfFYy-1umetv29DW-00JZkq; Fri, 12 Sep 2025 14:47:13
 +0200
Date: Fri, 12 Sep 2025 07:47:13 -0500 (EST)
From: Juan Carlos Lazcano <juan@placidnetworks.com>
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <1714012059.534025.1757681233048@email.ionos.com>
In-Reply-To: <aMQQ0vB83DCfeboy@strlen.de>
References: <1643443761.529082.1757676483522@email.ionos.com>
 <aMQMg33uIM63vKAC@strlen.de> <aMQQ0vB83DCfeboy@strlen.de>
Subject: Re: Stateless NAT in nftables with maps for performance
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.38.83
X-Originating-Client: open-xchange-appsuite
X-Provags-ID: V03:K1:UtFJWKznDDL5z7X0yAeVqKOQ57LpTKowDTzX6jMMhpEWyU0c0YV
 JiGusP0bvEwVjr5NrVZkzdR1FLRyc2nRR559nCeBLWodBaELFsoWtwJcky+49+9e9XWOS+v
 fdMkQjPVPBZK4c8yhh2mHfYUn9mCHSq7iTVCzvP8h16wnO+3w4XUg7L9J7pqSQYQkD0/047
 l5N01zxmVKKrWAf689XFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pSydXcVDnyE=;7ejQDRTZy7vHisc7kaUSUrFvBGv
 OYZ4LQQbAQCQvoM4XTR6Z0JmUAqgyskYOZECFeNxWfJySIK/YQQVf2OxJohzq44sO33swmfKx
 3f+VmF5ihIpgm3WRusymYYnYz5faLNnv62pjw9JoC9dmGrUBPAnzAu2Tg/WomwFSExN+XCOnz
 5qLV69S0KjL9L6OFuM0QkgPAzwfFAMtNSHkH2d8IgTwnpbQ3wTK9l6405ef7zxMKIdHsW/Qzx
 tOrcIunVr1ObYN36vGifqo+csto6vykJyNSxlXiQEpF7uuq22KXnUjBAiC25pz2pQhCvraXGc
 QXy3P3y18UV1rNhA5rKp4bJRXwJ4KwD0ic36FcWIGOIw6fkN+CQlmo6qMoQdzf06/thcFlkRM
 Wlk+xERPBQisSYrkyaaFiM07ajHlLOFtPskEBweTVtLFRIMHZ/7Te4y4nc8JAIs3vw3C87935
 eX5Cx0aVogYkhV+wBT0MkVy9bsuVCVHaRTmCdcEl+4SXGuWRNKPYBbY149A4G2U6+3NQ/OeYu
 Obc1wgnYgvSJmmyIR2flzv8tgAP1Vl0wUTPOCK7XRkrM2Jgxjggb5hiQM/Lv8wsUhv+iul4r1
 2G6VHnv+0ckI7bcNBC89QzrAUAU8330YPsdyImdiGhCzEr1mgJKhyJmki7BN/DjkbU+Idkm2/
 iawV/7lcB5Qvx2kBjWek7WokBFsVz1OJ5iYu0zI3488WXW8USLgeojCwWSzFixYihM21LKWDR
 YLhViMQi0uLbrIZg7Fd5zyrqEJDqxZt8Hu0b/KoAyu55d9JIaNS6Urv31XuTBwJgsXZloUq87
 0Sl9enafLmw8RDZ3PXH9Qt1cZY6XX4Fk6Vtx0Hwu7tgYb+muCr9c+mtiM413gT6hcKET3bjrV
 Czf6aUULYYuUScxuCQJc/gkeYj/4i0YjaV+hyft/DbjVIiUUSSZzZOKGgw3nxdnFny1xB249w
 sZDRnlk2LdX1QwM072Di4y1jNcClELdzf2D1FZZYjQtCbOgnnL7jk65g0lBJGXPTxQ5XzaDnk
 9iAKr16BkSJrc2iiscZenM240gHh0UFfJN/gsU0Z4bJaINMAxnOfOtaZlqiNMxLAKv9HhbFGi
 S4sTLWjCgPDUaZl/o43+VpWNqn8gtF2e72s4P00Y+WuJBBvjqSLJ2hwEo8WYE6uqkqJYtLrCc
 KWGnj1LPke5VcHcQIsZMN2OgBhgblGvGiUbn8jKCrmVfxIHFhhgoyDqXNDF/M8LI8FCbkM4rE
 EdDYRGMFRpEcZbtwvIWwjq635BvLV9ino8oSPbQl2vbtXoaXTj8q3pQWzT3ITQiIetZo71AVw
 8M2r2/qUmdCClB2qLFJlVdqLBrTF6sl3Vpypr+f/XHLe1rAT/ouDQ1MrX1bDB5M5TXtDkH8pz
 xKMZvyk6n/0CrUgN4hJBEzB1rnO6F0ikiaePHyE6urqqV39NGtI6ZEH48KuQJuoX2y6vAoIzo
 NpXPHLrtVMMalqjTSboF6GPRVRbp0rLm/ik7ti8YQVkRjPzKNU5zvDGk1ayV+0gUvMPQGMF6x
 OaYqDMoA0glyVe3TwVGuIHDfxM4RLSz2zExlP0x1fm3bm663PG1zSrkNw0YpgVwDBq82sRowx
 ISgf5DsvsQmSW38l/QkEiP+tVYsC/620cpwPRCFlPeaxacImpmg8Za4wZ8YM/A73Lsf5vb6y/
 dygRcH5VRA2DUAkh0zhq0khKcmeWY8EruiFo2d4safx4p2EjWrRigzzPTUwJD6/VM=

You all are amazing.  Thank you for all that you do!

My echo/reply base icmp functionality for v4 is working atleast at a curso=
ry glance, without further testing I'm not sure what other parts of icmp a=
re not working with this approach.

> On 09/12/2025 8:23 AM  Florian Westphal <fw@strlen.de> wrote:
>=20
> =20
> Florian Westphal <fw@strlen.de> wrote:
> > ip daddr set ip daddr map @dnat_map
>=20
> Forgot the usual disclaimer: this breaks icmp(v6).
>=20
> There is a reason for existence of stateful nat after all.
