Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DD3368D52
	for <netfilter@vger.kernel.org>; Tue,  2 Jun 2026 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418914; cv=none; b=kmt7ohK1nC9M+/LDWsqnpqNFbIFuaTiR8TIsdsU+ueqVVk4n1r4Djp7xpahM8nd2C78c/F0cA5TOR2/vbD0M8j/HDzSOEO25Vj/moy6o3WqnSy69C/EO3yvhDqmmNjPmkWW6X9WkEmmR1Er9ToABKKlYQeqBLYoJ6A1cdSyS5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418914; c=relaxed/simple;
	bh=n9OZ6ul3gfSvclWjhAs8X7wceFRdK2lhMSmywaCWBCo=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SJcTrUvZk4UPrzwpsozAz17lpQLWysmH6eJXk02A6H9Bh9JmsvnZ5o4t5vDx3mqmq7cA49WlrHhZKtMPJVDLa6B7y1sB/CS9/fcxP27z8giNkHYZAWDYYMB+kPcY0/Qe+GfF5rSTEtEplHAmCBsoB9KkRbknhz92nzy2vE3FI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=M6UsBySf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UMWOjE2D; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="M6UsBySf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UMWOjE2D"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E8D371D001C3;
	Tue,  2 Jun 2026 12:48:31 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Tue, 02 Jun 2026 12:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780418911;
	 x=1780505311; bh=GJ83mJztPNs8OTaZSwUjEsZV+PKuRdPGMNt7vb3e2fA=; b=
	M6UsBySfWnIu0jiorwmH5h4ucIjrHxK/rBEHBInCmfuHxp0wDgx2pQQPRY8Y4kC7
	45MvcIjUBTiqtlymE2UYbmnzxT7xZNVaaXGNC0b6K7yeKa982shQAVSe1L2bihB/
	mZowqHXM89rN+HE2ffzTbC9yjhrkH4VaMuqDvVfRfmS8JGFqxwatzmWb1BB3ahtI
	+nuvLzcWKQZXtLTrxH+OV6tp2p8hf1Up/1hI2msO4z4WZ18EkZVhojPKarMmaPoB
	YnRRhG3AJm2Pavx3lxOasvzDB2CW037xDJsYW0geMGrBip1H2kC8KQlos1gbHBWS
	RrrINiJ5xE2EoXa73KZlcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1780418911; x=1780505311; bh=G
	J83mJztPNs8OTaZSwUjEsZV+PKuRdPGMNt7vb3e2fA=; b=UMWOjE2D3XdXU6Lsg
	VtmzGr2i3WQZWS9gmezIlXXTgY3ng/5A/3Is7gRscjvftYDhUow7td33/sX1HREk
	n/TXosOTeW+v2oWD8kS3ms/0tRp9MD1BfgkOj4w6Xdg17l80/yrj4/MX6Y2kmyBo
	Tvd69df1JwPjLR5RG8dgueC+d4QEBpZ7q+e5t6T/GP86kR1acxh/AoK2fBRI/IDy
	udheOg+4trqHEVbR9wag5WBorHso/FCcmC/RWotRPvPYEUkPU7kq2kF7ilqXvpr4
	Z2FEg1xRtdmtDw7acTbU50ma6at3/1O4diLIG/czfAycXTghKT3fT4DUIfi1nmBQ
	9v2dA==
X-ME-Sender: <xms:XwkfahU3dGh66OaER7odheeRHhYoy2IpHVSlGtV116rlr23T0xFbTg>
    <xme:XwkfasYl47sS09U68vDg4p6NZMCCVpa34zDsSTRPLHrFtUyoTTtVNIQLIsRBJ_y-8
    6dEoQTQyAHH1ZCm2-pC_jrqKKlLAd3o94790zpTEcV9vLohbLWf>
X-ME-Proxy-Cause: dmFkZTFPeoT7Xv68+ttgUn4YJfqrTc21jaN3+2k1+yLYilNQUdMsKpsm/DwEk8CZ8WX0tc
    wvizsWRMHPpiS3Vq2RUjNOVc1DNwLbbIp2Ah2Gwr/4LlOHhteZrEsNgvjAf//AYQEGlY+C
    4rve0wicc31+jufyM2qxNp2SlxfQlW3gnqwCnh82caEYw+st0uSEt6LiNJLEQUi8p6p4SF
    zLBf7tYJ+SwBEBZ+FbY48aonFZGCU0LJUlYuBa6QWBGncD1GH0TKo450ZXsLP3XNHPVtGP
    H/7t9LkE0SxgAEb+mUt49aiAeuSsRelh6r362w5HMYqzI1JO/PGaBYwNOXktF20fkKF7ke
    VtIIIE4ja32Iod1BrtUyUtoLMtUikaVh8gqs7UK8zqc+uqASE2xisaqhnGSc+LenVIjPGq
    aZc6m1UmkxLIqT0b97RotWLUS56/2XMzt8auoiiLyriS+RY4igwlil92hsBk8JhFkLuLaI
    5EDLBVZIOBVqRHkcgOQ19JmZ/SSDYe9wPNXFzIqht9Ep/ZYbBK7S01eHYACNmXcV1plTg+
    v+blfQAyg7XARNf62OVqqzWuYYW65Vwr15OpUJJfD3DU9T37exzTyo7F9O6FToQgRY0D+J
    pSb6B6g1GvCmoWjY27yaNfBFXd1NWa4VWcAumCN1uiS74FQOs9pGlIVn3rNg
X-ME-Proxy: <xmx:XwkfaoCNvj5cIQJZHsCfeTrl_01cTJT39hxMwZEoTWY6Lbqh34xZjw>
    <xmx:XwkfaoeIHYSi5W2Li2Uq9bTLzeiRiwMC1pTCzex58YUgbzGKgRGVNg>
    <xmx:XwkfajLpdqFtT0aqIZNEZkpnia4mUp3CIqELtm0lgtnll7DdxeP_ZA>
    <xmx:Xwkfarch1Ijtehme6HDc7j9QLralxrj6Xe9TNYg_DQBczJ2ofka0aQ>
    <xmx:XwkfaqVtA-92nv6zzS2H6A0hu5XII7EbHwrcEXd8jhWiNWMOnJ3Nx1ux>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E116216008A; Tue,  2 Jun 2026 12:48:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AkwmOWhkQqyJ
Date: Tue, 02 Jun 2026 17:47:48 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Michal Soltys" <msoltyspl@yandex.pl>, netfilter@vger.kernel.org
Message-Id: <c4723eac-8af9-4146-8375-c389b21fbd4d@app.fastmail.com>
In-Reply-To: <287a4898-f45f-417a-8b00-a44801139ae2@yandex.pl>
References: <287a4898-f45f-417a-8b00-a44801139ae2@yandex.pl>
Subject: Re: [BUG?] success of adding interval elements to map/set depends on order
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Michal,

On Mon, 1 Jun 2026, at 1:19 PM, Michal Soltys wrote:
> Hi,
>
> Consider the following ruleset file:
>
> #!/usr/bin/nft -f
> flush ruleset
>
> table ip Main {
>    map snatmap {
>      typeof oifname . ip saddr : ip saddr
>      flags interval
>      elements = {
>        "egress0" . 10.192.0.88/29 comment "generic": 1.2.3.4,
>        "egress0" . 10.192.0.93 comment "sip": 5.6.7.8,
>      }
>      comment "SNAT map"
>    }
> }
>
> trying to load such ruleset fails with elements in this order will fail 
> with:
>
> /etc/nftables-test.conf:10:25-61: Error: Could not process rule: File exists
>                          "egress0" . 10.192.0.93 comment "sip": 5.6.7.8,
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> But if we swap the order of those two elements so the more narrow one is 
> present earlier, the rules will load successfully. Same applies for 
> manual adding via "nft add element". And same happens if it was a 
> regular set instead of a map.

Given the absence of the auto-merge flag, overlapping elements are supposed to be rejected. The consistent behaviour would be to reject both orderings. That these rules can ever be loaded successfully is an unequivocal bug.

Speaking of which, there have been various bugs concerning sets and maps over the years. If I may ask, which version of Linux and nftables are you using?

>
> This should probably either fail in both cases, or succeed in both cases ?
>
> Then there is also a question how that would/should behave in case of a 
> map, e.g. would
>
> snat ip to oifname . ip saddr map @snatmap comment "snat map"
>
> use 1.2.3.4 or 5.6.7.8 for 10.192.0.93 ?

Undefined behaviour. It would boil down to whichever is matched first. This sort of ambiguity demonstrates why overlapping elements must be rejected rather than be resolved by some notion of specificity.

--
Kerin Millar
