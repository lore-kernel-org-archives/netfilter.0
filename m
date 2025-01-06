Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0EC1E0B61
	for <netfilter@vger.kernel.org>; Mon,  6 Jan 2025 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736202982; cv=none; b=t6I/OxTYN6VwpngtwvM3q5i/JMI5/YgD7x/t9xsj0XeP4BNCG0zQ4xJ0hB0jCurJuxQmxogSQvxAAOnnHTv1st0BSl6QfCK0eHNXIBukUmlDv7nthhoxe3dEdV0WE9ct5hQbuUxadlhfRqBuIojnDJzTvg0nOOqncW/ALqEth88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736202982; c=relaxed/simple;
	bh=JlHhhyNIcYyt67ZsWAQYWR2cP3T9EvcoZTo0JyjAy60=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IMXacBeZMOND2ANa/3UcTbT4DH6Zwbu8XesHhIYoZq0buO3oSGlegcHyLUfR4XKR+6icEKX7LXgIJJa7T46qzoTY1VfaIZlPfh0lWKp0qCoh/PPXp+z7PlYlGlQGvAUrr565UWG++XzrQ394laCStquKPR8oINOCKRAlCPkItuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us; spf=pass smtp.mailfrom=kevin.km6g.us; dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b=awbPOSnK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nT2y/2m5; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="awbPOSnK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nT2y/2m5"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 812E3114012C;
	Mon,  6 Jan 2025 17:36:18 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-05.internal (MEProxy); Mon, 06 Jan 2025 17:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736202978;
	 x=1736289378; bh=tMKGMHAI04fFEs/5TzHWzsEUFQWHMlLkHZUHFaP6jjg=; b=
	awbPOSnK0cO786b1o81oCsQLWutjm8opN29+8dqxvN0Hkx5LgxjIsI9phqz9WEdq
	3OG0keqwVN8cCcoNbYZGol33Z6fXfOnwrh/MrDNkb7nwEbkP08QYqNYSpAcLp0ed
	weqDog9Ajae9MGH37fsy7sUOvcoonzE8f7xDAjjDKagC8Xd9wqGsZdPZ8niHupf4
	IKKvpTQESX+8RREn6ZGd25TLYxPSFXDR3HKVb3bv4bCsk22I+saQUpngbF/mbutw
	ovmhohsTcHMhZcejgf6ueSrsV8fF5JyJsrXg+gLWAfX5SHrDkosQZaqvv0WY29J1
	gVs2yiaSn2z3S+NFOqqjjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1736202978; x=1736289378; bh=t
	MKGMHAI04fFEs/5TzHWzsEUFQWHMlLkHZUHFaP6jjg=; b=nT2y/2m51zsZVa+Av
	v9ZN2lIdCeYZcRbHl8dLxMS14OQjjUzW3RsOihKGh1C8mXqIM6enSUP7wvAbQeXN
	DNoOhAgVumpQ9r5uoj8fYEeq2566ubF9JFOgHo+0xd5hxnJBcliKjf6QqTEtyfRd
	vEKiX2N8VHY8iH1t0IccxsuWZ+OG3YY1NNBW0/Wl+xkkelKnCELGQ2HPMrg4i6mm
	BbtlUxU13+YYpwQTyhfjSlOf3vYk/mfml9J2u/Y7MuFx1kmNo0IfkQq6gArgo3qG
	/YOZJkKf6ulV0LzyEbJILnya10d0yKX1CKM/icLFvY2D+yBEPFoHMvv99maFu6IC
	7Y72A==
X-ME-Sender: <xms:4Vp8Zy415lvQWodvkAn4LdB7mGp8Dj52TiKnFkFE6hRQirL-6KyIYw>
    <xme:4Vp8Z74UKicT2RvirMTzqS4rJXjM9QrU6H1vaxZMR7U5qBKKOkPTEm3Ojd7jFXvHt
    6-yWDGDFTeQquR9AmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegudcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjg
    hfufgtgfesthejredtredttdenucfhrhhomhepfdfmvghvihhnucfrrdcuhfhlvghmihhn
    ghdfuceolhhishhtshdrnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrdhusheqne
    cuggftrfgrthhtvghrnhepgeefgeeileejleffkeeuteeghfdvvdefudekveffhfehfefh
    veeltdegffdvleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheplhhishhtshdrnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrdhushdp
    nhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhoth
    grthhojhhughhglhgvrhesghhmgidrnhgvthdprhgtphhtthhopehnvghtfhhilhhtvghr
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4Vp8ZxfhFVb6qTfpBbrKKG82-lF68KAXzg77z4E9OGzkn4Rr41ZWeg>
    <xmx:4Vp8Z_LsogeBULFm4CVII3gvOOfq8LDkeJ1LgDzzYbmGy_CGSFgwgg>
    <xmx:4Vp8Z2ITnCh4StpL9idFOKZz9-rVxeVNyVzYJN7HsvannfqcrSCcNQ>
    <xmx:4Vp8ZwzpHN9rbX9ibSzJBXGNK_Hx9fgdx0EzFoYcvq_feGOPp8UTSQ>
    <xmx:4lp8Z4jke9X9KFE42Z4ynnnQGC5sBn7LtJGjZUslXQi2n6B9o5Ftsjgh>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BB3CC18A006B; Mon,  6 Jan 2025 17:36:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 17:35:46 -0500
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: potatojuggler@gmx.net, netfilter@vger.kernel.org
Message-Id: <57c39b0f-3aa5-42db-8ef0-7a928420e50e@app.fastmail.com>
In-Reply-To: 
 <trinity-8c3627be-7f9f-4150-a74a-5a69dbd8781a-1736180864807@trinity-msg-rest-gmx-gmx-live-548599f845-9tnlq>
References: 
 <trinity-8c3627be-7f9f-4150-a74a-5a69dbd8781a-1736180864807@trinity-msg-rest-gmx-gmx-live-548599f845-9tnlq>
Subject: Re: aggressive firewalling via nftables
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2025, at 11:27, potatojuggler@gmx.net wrote:
> Things like QUIC should work as well, since the TCP handshake goes 
> through, and the UDP traffic afterwards should be allowed by "ct state 
> established, related accept" in the main file (not tested).

A small clarification: QUIC does not use TCP at all, not even for an initial handshake. It is entirely UDP-based.
