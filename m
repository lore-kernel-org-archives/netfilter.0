Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60271209F2C
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 20:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442234; cv=none; b=KLn/DUljPV4RvVkfLkTDh70Av+aGhCpJ69sZU75nWlg4Hm5kaGZfFSPNCjuh/ApxHNihnxV3Pg6udEwNtzwBCn0BF6vRRXah0A4eflYk9Mp6CZoGOPYZsbJpLVKc5qJ9nQAX9QNhzRhJJoIpq38w0bYm5eTVaTphjNtVu0etJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442234; c=relaxed/simple;
	bh=0QW2ky3VTIEsld5V2JEDdZEdd9b6oatdW8Pw5SexYOo=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DRg9RBfen2930C7OiitWurHoENFyFIvzvbZgbNd5KkX36H6pUnntZ9JLad4HqkoBUucyeDAYESnnFoPWRG/7sPyqR/B7fKWWTagn7+SYYOLtlE1vEn/aXFSrS139rGsu1axNemywsItD6CUUr4EK87xBAoAmLp+3/9kAM/NYm6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=uspJ5NZI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NOFgLBcH; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="uspJ5NZI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NOFgLBcH"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 5949F1380636;
	Tue, 12 Nov 2024 15:10:31 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Tue, 12 Nov 2024 15:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1731442231;
	 x=1731528631; bh=0QW2ky3VTIEsld5V2JEDdZEdd9b6oatdW8Pw5SexYOo=; b=
	uspJ5NZIMxEJCRiQvrdYhZZzaZbrrD1x+g8lAOg0C+TvWCpIMk3KNVMiMFaG+Ffn
	CkSREGF7SBdPc3pN9APsZAmmaqlH5oLiR8eyZiH0sc7fd42Wm490crgQGf+nTSKy
	+8ftJcloYQiIrdqCfIGOosakKzf6yfzJ2xW+iPdXPFDXmKT3y5kQ6Z5eTXQC4tJ0
	z8TeDLH2l48T8BjI9J6dlLdYrxcb9JJQFim/d6zpUd8SDhu1hdtcjjN5mR9dDm1F
	Rga+0y5cQ0tG+XjuhpNGl8OGOwFW5/PMsqEhH9PqALdAmUqReu+U6q5VbaZRR0Vp
	iB6GSwnXgsUoeSYNpfrJig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1731442231; x=1731528631; bh=0
	QW2ky3VTIEsld5V2JEDdZEdd9b6oatdW8Pw5SexYOo=; b=NOFgLBcHkWk9hjDt7
	ZJpOtLvSAIYBiLVPu1nEvc3YbwRTA5Nl3Rt207dtewxXpAxjtAmD3SAjkKK0kezY
	pI/Wwr1lrNVpS1dkTtuSR3JXM71l4u6UTyl4mibz4ow1JWIzlDW8+vut0ba+JUge
	lX9htLmLTl6DtwwKfkrwrDMLnXqFvR3Wy2EjhqNTOdh3kg+fsU+qGzKCal8uExen
	DZIeiF4mMw0JtrNcsJ8knTITg82FWy/1+CpEV9Gc3awrgVCFmawNeiMeyH5J7hNL
	DhVj/A2x7DvoarCmoqPTiDx7kfP51YOJdl41iKQHHGZvdI7AwLhFUTGa55iYtNdr
	S8uig==
X-ME-Sender: <xms:NrYzZ0L9nwi0fhlLC-sfMzxh-sCCDw5xtHypRS6uPI7OZdwJM_soww>
    <xme:NrYzZ0I9dmZUCcYdD-NUlBBG-hreMKGiH0_V3FuATM8vm2NQeRdGIdL5V1j0kc5ki
    4hvKScfXO_EbCLn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepteehudeviedvfffgieevudffkeffkefgtefg
    kedvvddufeejgeelhfegvdejteegnecuffhomhgrihhnpehnfhhtrggslhgvshdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhm
    sehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehthhhomhgrsheskhhovghllhgvrhdrugihnhgunhhsrdho
    rhhgpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:NrYzZ0u5mYdpZ56ivl9_qCTew_owYnT8qbUYQhLl7k5vC-tG4a4Prw>
    <xmx:NrYzZxaz9PiNB-VFv2vyTipPEL0RrLbmqNYeMPMY5cy2TNrGU2g1ig>
    <xmx:NrYzZ7bIoUEM6eTvA6ZNx0NdGvamAyPIXQUfVTxErQk5Dl8NpKoiNA>
    <xmx:NrYzZ9CV5Ki59TzEY-M97YOr9mnUCV6FWlmqA2F0w4p72jwSj98sKw>
    <xmx:N7YzZyzLSrqmCbkO1ectAN4PhD25082h8YtCu8JxBNvjipfv6bW-djIr>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B10EE3C0066; Tue, 12 Nov 2024 15:10:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 Nov 2024 20:10:10 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Thomas Koeller" <thomas@koeller.dyndns.org>, netfilter@vger.kernel.org
Message-Id: <16384f7e-faa1-46d8-8961-9175dd4014fd@app.fastmail.com>
In-Reply-To: <ea13484a-ed25-4812-b6b9-928ba19531e4@koeller.dyndns.org>
References: <c7d037d9-2261-4627-8e46-bd960f1ab6d3@koeller.dyndns.org>
 <ZzOdbYay4hhiwqbZ@calendula>
 <ea13484a-ed25-4812-b6b9-928ba19531e4@koeller.dyndns.org>
Subject: Re: connection tracking state in rules
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Nov 2024, at 7:04 PM, Thomas K=C3=B6ller wrote:
> Am 12.11.24 um 19:24 schrieb Pablo Neira Ayuso:
>> Because there is currently no support for connection tracking at
>> ingress.
>
> O.k., I guess this is probably obvious to people more familiar with th=
e=20
> kernel's netfilter subsystem. For the benefit of all others, it might =
be=20
> desirable to have it documented somewhere in the nft man page (or did =
I=20
> just miss it?).

You didn't. This constraint is formally undocumented, as are various oth=
er aspects of nft.

>
> So, does this mean that I cannot use conntrack state in netdev tables,=20
> since these only allow for the filter/ingress combo? What I wanted to=20
> achieve was to create a firewall that just protects one particular=20
> interface, the one connected to the internet at large. Netdev seemed=20
> like the way to go.

It very likely isn't, but it also depends on what the term, protects, en=
tails in your case. You might not even need connection tracking to satis=
fy whatever your requirements are.

In general, I would say that, if at all in doubt, you should avoid using=
 the netdev family. To use it effectively requires for some understandin=
g of its raison d'=C3=AAtre and where it fits into Netfilter at large. T=
here is a modicum of text in the wiki that may help to better understand=
 its strengths and weaknesses.

https://wiki.nftables.org/wiki-nftables/index.php/Nftables_families#netd=
ev

--
Kerin Millar
