Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AADC28371
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 19:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759003132; cv=none; b=DsgaREOTivwAPrCYrsuTCv81EoCC62os/rkyEl22+eHLEo76dUkzsRQXnbboGR3BSoQIujAN+h/nYkbiYQxWz0wUZR4DRkCi1VsKhZS3wa2UEPdz9J/VkdQtLXaSlnSOLLxteQn8CJ56I5xgfGzBZWNt0Zi7vzMfzCYSlgpuM1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759003132; c=relaxed/simple;
	bh=puK18UgkTjRQZyycxUA3dWot+u/ZAMuIse62R7rezV8=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=U5bpCBxY8l4u2aIjIqedMdCmW0DmXB7BkUDLTwE97Nqxd4+/56GJvCoDaBBfkEqnbVodccZuZXIwq7lHakM+Qu7IN2Cb5bIjkeA8kPA4zdeS4hMwL05cL1MFdNj+J97ZEaZCt622IvMRv7B2MA/HXVJSw7lu5+qEJrOhUoPa5wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=IPoVXewJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AHXYDW1o; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="IPoVXewJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AHXYDW1o"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 827ACEC0090;
	Sat, 27 Sep 2025 15:58:49 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-10.internal (MEProxy); Sat, 27 Sep 2025 15:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1759003129;
	 x=1759089529; bh=0lvZqvM36v7IcNdDZjjrSZCwiByf/Z+r4AmkEdBfUw4=; b=
	IPoVXewJDN9nxbyZpsyujsoKCByvPzbIzgBwsh2TEPBt1tfMl+Pdec0R/JkgDEYm
	h2ooVWrutbfeE3d5kV6Tbx/DSR38OADO758kWbX4z+Dc2sthq0am1iQi5kmY9SH2
	p1MwHrF5NpFLumc/xhbnOXUVRQ4vxGhNhwAfS+lycaHQS7AycDEwhpwLHE3Y1geH
	RqhMU2QpFOxN+9+OPWECibUxK7bAquMpcjgwL4SfdrSIqIykeSE+qiL6KD0se2Rf
	1mmanH/mA35rjOp4pGBWbsPacUFrU0S4y7vIi11SxTlEzts8rDce6RrjV09riCB4
	oamA+TVdx5jurOzjYiu2Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1759003129; x=1759089529; bh=0
	lvZqvM36v7IcNdDZjjrSZCwiByf/Z+r4AmkEdBfUw4=; b=AHXYDW1onqF+BSLLc
	cVUTT6VovKFGXYVM+xQ9smD610kOiFJveD/HMcNLoHypidCb9ICUoF49A7BmFvSN
	jz5i8JOgeBHuvIl3KLP67G+qOXnzF52ldPoO0cAEiKjuURW33nd+98cbBi1OLE9k
	wDty4XDdLLfclLmZVTxRHQYXWGVPeoOkTZbB7wqORcuDA0Eo3lMAbmTworQHKDiv
	Mzs/GdcCvYqSLC4Aaj+WGO+PtRBlamoEqjhzt4z7B5WOTKTcViqO9Wx8l/fPmTCI
	i4G72dj8Qx83/2rA86VAR69cRx6d7/MJC7opZjx6mCKq0Tt9C7XWErGjUeFfQHV7
	STxSg==
X-ME-Sender: <xms:-UHYaOoNHbOcIRtnp44E7_XgcpJ22-heXIdkPvUky3Ba1a69uejwTw>
    <xme:-UHYaHf8Jfn5bgJikudMXPrS6mwr57CN0zw4SPGDw0r-hqT6RWa33pfX4ftfO5uFJ
    0obNJzy9_5dm04iCedFrWEJvTa-UKL0r5OYb_nXgCwCncZBBTby>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejfeduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjghfufgtgfesthhqredtre
    dtjeenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhk
    rghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepgfeftdefjeeuvddvudffffdtffffud
    efvdeuueelgedugfekgeekveejteehvdevnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspg
    hrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugies
    shhlrghvihhnohdrshhkpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-UHYaJXDzr2kyIuU4jjpZcEgLn9M3NtLSJVHLuw2Bj3MqJugT7Md1g>
    <xmx:-UHYaHht9z8waMXMPkNGbChexBz_DyWk-mYVC2hp8YggB7Nkd1t6IA>
    <xmx:-UHYaM_pGW0VkMsRciMzNENjfTvKui5z724GmCDCnX1uZ5_eG64Qsg>
    <xmx:-UHYaJByhGYwkTOz_eWGQYn0Kr3bG_FfI4mWUZFfTym60LdLihETKQ>
    <xmx:-UHYaE5_3fEXLRtc1A-l9jYkaSb9IIRVwLPCIvKhArOFxStCh-4cbx5H>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2685F2CE0072; Sat, 27 Sep 2025 15:58:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmmvrmHs2kGs
Date: Sat, 27 Sep 2025 20:58:28 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-Id: <f62b7c23-a152-4ec3-a9cb-f97c322ab1f1@app.fastmail.com>
In-Reply-To: <826D2B00-B189-4992-9535-67B314C2678F@slavino.sk>
References: <3a8cc7e8-febf-4b28-ac22-ad03f936e879@app.fastmail.com>
 <8902E14F-5A51-4455-B40A-AA8B4F97BED3@getmailspring.com>
 <5f21dad4-bdad-4b03-bbfd-c767768058e8@app.fastmail.com>
 <589E8454-6788-40BA-A2F5-B60ACEADD97B@slavino.sk>
 <8f4996a6-2b16-477a-b753-515d2af8a84c@app.fastmail.com>
 <826D2B00-B189-4992-9535-67B314C2678F@slavino.sk>
Subject: Re: list elements of set
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Sep 2025, at 8:54 PM, Slavko wrote:
> D=C5=88a 27. septembra 2025 19:19:42 UTC pou=C5=BE=C3=ADvate=C4=BE Ker=
in Millar=20
> <kfm@plushkava.net> nap=C3=ADsal:
>>On Sat, 27 Sep 2025, at 6:24 PM, Slavko wrote:
>>> D=C5=88a 27. septembra 2025 10:59:54 UTC pou=C5=BE=C3=ADvate=C4=BE K=
erin Millar=20
>
>>> 1. the nftables is list of objects, thus one must first filter the "=
metadata"
>>>    object, it is first list item, but who know if it is guaranted
>>
>>I don't think this particular criticism carries much weight.
>
> I understand how are metadata useful, and i do not ask to omit it, but
> my idea is/was that "nftables" can be object (instead of list):
>
>     {"nftables": {
>         "metadata": {...},
>         "sets": [
>             {...},
>             ...
>         ]
>     }}

Ah, I see.

--=20
Kerin Millar
