Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFDC1876
	for <netfilter@vger.kernel.org>; Sun,  8 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725754089; cv=none; b=gZgYdDFRr+fQxaNowcQ740nvlVrXl1/WSTWFPO8IsW8dwmBpjZ70Ln9ynsVu2mw2N6IZCzb97VwAQoy/zsmtSlA57oeWFQ7R3M8nLyZOykR21oTZNpD2dVPh9hcaBZ8TMoUAqQtFRA84g8qlU7jiotyd627RUAACwNKOGKivyik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725754089; c=relaxed/simple;
	bh=+IdOEn0nucnDFYaS8SI6zgL7Hk4mFjwSlft5zf6pCu4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uNRu9vBTwi/DkWGRS9AWWw2CYdH0qgq5z/CoYIcCKggAjXDRUvOKVjMTddQpdBingfR2JXBJ/tAUooftv6a4stRCCOcBEnUcpqGC3qQU5d/0Erra5BEaCncMXL6vbjx97HUsGko0np5UFIa5TwNEZfnf+iZy7XuFIMToEVglxW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=LzMw4/DW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JaXPIqlA; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="LzMw4/DW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JaXPIqlA"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B124A114015B;
	Sat,  7 Sep 2024 20:08:05 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Sat, 07 Sep 2024 20:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725754085;
	 x=1725840485; bh=fu1HCT2XrB7K3eKuCmEoxw/MJ1izfA2A9toHhKaAjSw=; b=
	LzMw4/DW8JoUhSgdMun9KSahivJ6t1o3BoUbDP1JJzyH5yWI/IquqwEy/bHOhZiv
	XCA/tFyxxfUjCtlIqjMTo3W75tX+sCiDZ97Vy+ETusFKQLzIC0tqGAr5UrQ2sXo+
	qioZ4qRa0cjp0tLb3iWKJKuareXsZWViDzL7cKTaJlHkKXm1sdjmQbvAkyWencwB
	GLaDgFE+nksj0KZig7+Tgjx/o0MQfRtvDREUsPl1WbgKG4ACRrc/QLqNxFMPvCuO
	CUNZopygZe8pJ1j647G9qZRvUcAGhB2OYaFZXBhAwyCo7wtPxa5FZHS3jh4W047i
	cTiTw3AhYeg6TgN3j7SvgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725754085; x=
	1725840485; bh=fu1HCT2XrB7K3eKuCmEoxw/MJ1izfA2A9toHhKaAjSw=; b=J
	aXPIqlAryMA+4G/mJW7HBzsSRb80zHfGNcw+qWKlJxAdMotmKHRQxZ8XHX+kN4jh
	R01qpqmc5QO/+O1vcMV8thLQ2nHA4QMF+QWEyyHwCUcu+t1dZo/ZeQQvnBMBLTmb
	F4uSPtLW/+cuXUlo7j3wSHcjQ/sKvJhCNv+7GsuSfis5z2bTA4DvRbXzE8hlgaEv
	mUFvmI795xHfq7Ws5uiE8HnAbv83hDjGcBYRU7riNc4QD3fcaS8t/Gr1z4w1L687
	D7XBw8fkbmEV+Utaxei8PeWL0EaQgOmopcsd0mcEUUlgbaDBMtqdvaT/Pq2SIr5A
	C6XvHu9YrHzjzleOvjKlA==
X-ME-Sender: <xms:5ercZgIkc4Y1rKy7i_BddPIKIITPYIDBBue-ackyrY0PeFZ-Pc3s9Q>
    <xme:5ercZgI9Lufs6Ez5KWGTy_gmyV4ypmXa4e6tLzv4ZiNsOcNb1HgV9y0ahBAngBer3
    _idclEnNLffpgn1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeigedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepgfeftdefjeeuvddvudffffdtffffudefvdeu
    ueelgedugfekgeekveejteehvdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspghrtghp
    thhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgrrhhsrdhnohhoug
    gvnhesghhmgidrtghomhdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5ercZgseuOq_IHPFIAeIcLeua7kbjM9gqDCcvxmQm1DkJJcQIyBZDg>
    <xmx:5ercZtYYaty9onFtY-6pGfTZvW3onpPF130BWt0noAR7YERsHX4c0A>
    <xmx:5ercZnabCOFphUBBOcXYwk_Z7YXV9hNqvA3tA7kMkqOuEawn1KO2AA>
    <xmx:5ercZpDRBLLnnGtHoabCWFAgYdkKZk_6oIqN4x31Cq39Pufjn6y9Iw>
    <xmx:5ercZuwoX-tIifwEme1cElmkZOkWlIESJMiLMQB0Wkey81i4zeKF-rd7>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 70C413C0066; Sat,  7 Sep 2024 20:08:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 08 Sep 2024 01:07:44 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>,
 "Linux Netfilter Users List" <netfilter@vger.kernel.org>
Message-Id: <7a0d6545-4f06-4279-8c36-29c6ae2f56cf@app.fastmail.com>
In-Reply-To: <3235fb97-5759-4250-9129-ba8006ffd53d@gmx.com>
References: <3235fb97-5759-4250-9129-ba8006ffd53d@gmx.com>
Subject: Re: Wiki entry on Element timeouts in NFtables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 7 Sep 2024, at 7:23 AM, Lars Nood=C3=A9n wrote:
> I am unclear on the differences between 'timeout' and 'expires' as
> described in the Wiki entry=C2=B9 on Element timeouts.
>
> If 'expires' is assigned, but no 'timeout' is given, then what happens?

One of three things can happen.

Firstly, if the set was not specified to support stateful elements, the =
kernel will raise EINVAL and nft(8) will print a rather generic diagnost=
ic message.

Secondly, if the set was specified to support stateful elements and also=
 has a defined 'timeout' value, the element will be added with the speci=
fied 'expires' value, but with no 'timeout' value of its own. Note that =
there is a distinction to be made between the 'timeout' values at set sc=
ope and at element scope.

Thirdly, if the set was specified to support stateful elements but has n=
o defined 'timeout' value, the behaviour will be as if 'expires' had not=
 been specified at all and the element will be added a permanent one, if=
 it did not already exists. I consider this behaviour to be a bug becaus=
e the outcome does not match the user's intent. I think that the kernel =
should instead raise EINVAL on the basis that the user is requesting for=
 the element to be ephemeral but the request parameters make the request=
 impossible to satisfy.

The set declaration shown in the wiki article contains 'flags timeout', =
which causes it to support dynamic set elements. However, the set has no=
 'timeout' value. Therefore, the third case of the aforementioned cases =
would apply.

> Will the entry expire regardless of whether additional matching traffic
> comes in?

The 'expires' value refers to a timer, the value of which automatically =
decreases until:

1) it reaches 0
2) a rule is matched which performs 'update @setname' upon the element

In the first case, the element will be removed from the set. In the seco=
nd case, the 'expires' value will be reset so as to be equal to the 'tim=
eout' value.

> Why do the two examples have 'timeout' with larger values
> than the 'expires' in both?

I do not know why the author of the article decided to present such an e=
xample without further explanation. However, it is perfectly legal to ad=
d an element where the 'expires' value is lower than the 'timeout' value.

Indeed, consider what happens when listing a ruleset. Unless the -s opti=
on is specified, the state of each element will be included in the outpu=
t. That means that the element states can be persisted and subsequently =
restored.

# nft list ruleset > ruleset.nft                      # includes states
# { echo flush ruleset; cat ruleset.nft; } | nft -f - # restores states

--=20
Kerin Millar
