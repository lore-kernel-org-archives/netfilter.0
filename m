Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B419CC36
	for <netfilter@vger.kernel.org>; Wed, 18 Dec 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524676; cv=none; b=MOxvgEnpdFHTel/KQBAdWojqgnkSZLEfDiIUINGyeB6OTbFVbMBN8zAGcUevB87krlXsEXZWslvC/1l2qtaIDXFqO8hyCsiElP1QbZy70pRTqxeqCmO1rOei0hOnpQzluuWQut/jP+Jhwc4YTaTavj7kZpfW1cezaxP829EP5vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524676; c=relaxed/simple;
	bh=mPJ6m1huKHFcJ5ph4kCJkFCX3XzHq68kFDOeFO0cNOk=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oNdDOkuBDiYWY8pwTNZr4dO6eR2o+Fs2hoYpmC9g6BD+4oQtR79r1mIUusiHm+zZdv3dtYBfrgiX2/apM/y7hmwTjmMV/FosHJFeqXQL8R0hzAydU1ofpz0pyiLgswGAGRjP+YPGFhf2aYEHvoEO+V+1rL49szspDY1txF6Vy2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=c18NnZke; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L0HxFyYU; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="c18NnZke";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L0HxFyYU"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id D6B641140183;
	Wed, 18 Dec 2024 07:24:32 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Wed, 18 Dec 2024 07:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1734524672;
	 x=1734611072; bh=P7fk/N4IfgoKXvMVHaTan53iBi1InIlnS0PGjKXXWXY=; b=
	c18NnZke+mi+txBnCLYvdzy1S6Pn1Gvhyw66Obs57+yjWXI7R9z9k9k9MDpCzJkV
	/TzFhY1Pc6lCqLaItH9SqogVI3whJ5iq8xWSZnQ7JrIvNNoeZvyoHfHzEt/R4Zqz
	ewjxACDOqBlLO+erl+T19Fw6kxXBi7myoy2A+wpJMBFDXac7srMWfquIkKpCXlM4
	ZbI4awedNfvgbud9L04trpGwrwFhTHBL9uk5tikhbWnulCG0SaBry9Ir0Anqtpl/
	osC+hj8nG42QeWCjV1uWiS2aYUIutYH9SXG5okzUKcK8N4vK3x/DudOUpHZ3Y0eP
	ibhy9Cmb0mvIaDACCPqsbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1734524672; x=1734611072; bh=P
	7fk/N4IfgoKXvMVHaTan53iBi1InIlnS0PGjKXXWXY=; b=L0HxFyYU+XTTJjkLN
	aYHiBzAxAUk+duxhAN2cHT/hSydj8RWz2rhkCHLIMBMZXkNJoBKzFcYDJjrds9A4
	/quVoq/CswKeTsuQnZGQRlxUvffY/2B/mz+VaE63zLhy+PKqAbbSHQhSr22JhMvY
	DFo1AOzxw4b+botLfTXQnNBaHFGjOB4hGHuFJKtUwQN/UjvQ1FJ4KsHU3XCGeZoz
	DHiDQ5q7TUt2eJQR0I1leG+60M4YMS+OVVlosmn4hRIoYQSrHeFk/bF8dlF9xVbp
	QCdl/JdQ2XZ4Ox4r25lgTayewoljwwCMATtMhz0oR/yTF/IMqzCeZ4kXKk91o3gj
	pnlVg==
X-ME-Sender: <xms:AL9iZ6AvrOtIo8gd60DDMCuDbjoVY7B4gICm0ijqrXnTzMk_lvWz1Q>
    <xme:AL9iZ0gjkPqCMmsH9KmnZS-k67a1tWsZOJQgaojJA3WgGBf7Orji7lkDfw4E8AMiz
    djaq0-Zhz6c-UmW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggfffhvf
    fkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdf
    uceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepteffue
    ffieetvdeuheffvdduueejkeetheekjeehhefhkeethfevkeetueevtdejnecuffhomhgr
    ihhnpehnvghtfhhilhhtvghrrdhorhhgpdhrohgtkhihlhhinhhugidrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehkrghssehfihdrmhhunhhirdgtiidprhgtphhtthhopehnvghtfhhi
    lhhtvghrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:AL9iZ9kN0hwvVDjA5fSgYrng5fe3s5u_ormkEXiWZc_qHyKojdY8SA>
    <xmx:AL9iZ4xH0DTeYofGXau1NZqaj19f2SFXQPfBJ-uvzHSbcdxRegmmdg>
    <xmx:AL9iZ_QCSjYwVuhUdVKGOMgSYzX2M9qn8MtvzAvoUkiI3IzTgQN6NQ>
    <xmx:AL9iZzYWAW4lY7qnPiEVwMeCjq7RozSDnvgEDs7LlAVXoplGDcT9ug>
    <xmx:AL9iZ2I43JGy_yR2eMGxvIWpmrh4JH258TyOGJEWIYDhXSPgSk7Ut0BE>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4B7C13C0068; Wed, 18 Dec 2024 07:24:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 12:24:06 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Jan Kasprzak" <kas@fi.muni.cz>, netfilter@vger.kernel.org
Message-Id: <4fa1f631-bf9c-4d20-9830-31d3e57297b5@app.fastmail.com>
In-Reply-To: <Z2K7YwrEyJqzTWtV@fi.muni.cz>
References: <Z2K7YwrEyJqzTWtV@fi.muni.cz>
Subject: Re: nft table flags documentation
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Dec 2024, at 12:09 PM, Jan Kasprzak wrote:
> Hello, netfilter users,
>
> I am in a (long overdue) process of converting my iptables-based scrip=
ts
> on my servers to nftables. I am also looking at what setup other users=
 have
> - I examined e.g. the configuration created by firewalld, and there are
> some parts which I cannot understand from either nft(8) or nftables wi=
ki:
>
>> $ nft list ruleset
>> ...
>> table inet firewalld { # progname firewalld
>>         flags owner,persist
>
> - where can I find what these flags mean, and what other flags are sup=
ported?
> nft(8) lists only a "dormant" flag in the TABLES section, but not owner
> nor persist.

https://git.netfilter.org/nftables/diff/doc/nft.txt?id=3D4955ae1a81b73f9=
a61b7fbf1a73e11544513548e

For your convenience, below is a textual rendition of the relevant secti=
on of the man page, as of nftables v1.1.1.

       Table 4. Table flags
       =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
       =E2=94=82 Flag    =E2=94=82 Description             =E2=94=82
       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
       =E2=94=82         =E2=94=82                         =E2=94=82
       =E2=94=82 dormant =E2=94=82 table is not evaluated  =E2=94=82
       =E2=94=82         =E2=94=82 any more (base chains   =E2=94=82
       =E2=94=82         =E2=94=82 are unregistered).      =E2=94=82
       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
       =E2=94=82         =E2=94=82                         =E2=94=82
       =E2=94=82 owner   =E2=94=82 table is owned by the   =E2=94=82
       =E2=94=82         =E2=94=82 creating process.       =E2=94=82
       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
       =E2=94=82         =E2=94=82                         =E2=94=82
       =E2=94=82 persist =E2=94=82 table shall outlive the =E2=94=82
       =E2=94=82         =E2=94=82 owning process.         =E2=94=82
       =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98

       Creating a table with flag owner excludes other processes from
       manipulating it or its contents. By default, it will be removed
       when the process exits. Setting flag persist will prevent this
       and the resulting orphaned table will accept a new owner, e.g. a
       restarting daemon maintaining the table.

Also, https://forums.rockylinux.org/t/rocky-9-5-breaks-netfilter/16551/5.

--=20
Kerin Millar
