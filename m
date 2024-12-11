Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908501AF0B4
	for <netfilter@vger.kernel.org>; Wed, 11 Dec 2024 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733941674; cv=none; b=XHl1ZO1dSgk8dAITKfMH1NDcn2D2PX0sMMsihwYF+23nwsng1QvCMsyKnbBXDdD0DmPBb8UJOa3SDVQnyiZAaPTi+VLISELRap4gWgrassxQg/ClysaSJVCOBnZnqIGrZPW8MIJv5rWpB1rpuEGoVgCfYXB5YcF1pFdPjnJnjcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733941674; c=relaxed/simple;
	bh=ksks0vnt02VAktJDdB8JL3k3YgNQ7Sco24VBD1rEM6w=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=th40OB7eOX2jYKr/tQIJMAitmQpcMI9+sj5nvyiHoNl97BHk6Or0YAnyglEt0ENzR/QL+W+ydcwQioahYbXKT9usdqBCxffNg53ZhP/zL7Ht5bXV0SceSbmZTHY3yIzZNOAoa3fgY7jE8MIu2ouo8ZfYgIZqNeOQxTqLKU9Gs7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=bb/8zuHs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ikqDs5gb; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="bb/8zuHs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ikqDs5gb"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 690F01383D36;
	Wed, 11 Dec 2024 13:27:49 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Wed, 11 Dec 2024 13:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1733941669;
	 x=1734028069; bh=jdK5k5wOOduYUEwEZgmIQDRAh7ko886uM4VcGMIeDgU=; b=
	bb/8zuHsU4ocqe3SsRnrKTB80/3TmdsvJnCVNsHuKU9sSNhPqlrj/3KOc7riZJdc
	UWrkB3qnHOohX1u0BK/TdPWzi+ddl0rgy7Vi4VjZcMn0/Lm48B8YlpdyODtGpJU0
	ExNm84vAHz6PzrsOmnejx57QrJ7OG1bWfBim8sHd5Tm8GZnnTFTDynLfyZUNEMBI
	dJ6eMpq5q2zcVVUCfZPPMOQHEM8cEWEC229yAe2Aydk8k+nSSFXIcbIR7Y9RbwGh
	4Mph8yFJwP8tEJdwi19e4rWpex60wNGb90s/FYfEcouzjZTdKnVCnMEfiV7XbMMV
	uW+sSMWUw3HddxT838fS9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1733941669; x=1734028069; bh=j
	dK5k5wOOduYUEwEZgmIQDRAh7ko886uM4VcGMIeDgU=; b=ikqDs5gb7NnW+n2ZW
	Sy2Jlm/wEqQgeFGxXmKAlmcUz/tc3aKXFSnHf/U7XZF0bLewK7R/Gb5b0NQvGbil
	6vuGKE35jI2xDQChv6v5vaUWAYKWYjkgbSIwGMA/f1AxKnGlsEjRzGUnkAeSJg/D
	L7xcTFsMaXaqxV9iAU4bhTlQRZXEokFlw3rcPGXLhovR2GIl14vGzxdBdxI0r3ep
	lhWgHfKykZKOf2ZpJdYAAZQtqJtU8xOTw/S0Y8IpEau5MWkge7xvJpNbUEv4ZK3h
	EVKCqZGH0q6x8SNjPmqPZgyfsIHsT31rqtSdXLvlBvV9AKH2N/Nvg+TVe2BIH/OP
	MdPWQ==
X-ME-Sender: <xms:pdlZZ3WSoeM9WNp9w0hWarRhdU1xgfpT4luGphJq_jKdTRjVFDip_g>
    <xme:pdlZZ_mVMtekmh_En25xnTE9mXwr_q0NIaRHRlNEvi5YWGF3CBKGXZGW9qs_G8Fz8
    Ojqq4FgiD_J1CnF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkedtgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoufhushhpvggtthffoh
    hmrghinhculdegledmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepheefgedtkedtfeelgffgfefhveffvddvgfef
    feelvdffudeitdefvdeukeegkeeinecuffhomhgrihhnpehgihhthhhusgdrihhonecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhl
    uhhshhhkrghvrgdrnhgvthdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepvghlughonhdqnhhfvhesvghlughonhguvghvrdgtohhmpdhrtghp
    thhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:pdlZZzbpMzqZzmOT6SkuTQIkk3BzmAO6aeRWBAIAgvFdC5X1oyKp4Q>
    <xmx:pdlZZyU8TIJvFc3laSKsNBuvdtvwLr5MKD7gI69dliY9Xr0h3wOGGw>
    <xmx:pdlZZxme3ryqBVaMYk-oAjK8BqTrHFDXFipeohFfE8-upHWZmpCyIA>
    <xmx:pdlZZ_dixlrbj4A5uIBzlRx_rB387H7WZVM707fc0HbAtoi0fzOVwA>
    <xmx:pdlZZxvH3uzdsr90UiWlZGNi_l1Zj4oZ66yeByQgVoZ7PLWdmNyP44zl>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 112FD3C0066; Wed, 11 Dec 2024 13:27:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Dec 2024 18:27:06 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: eldon-nfv@eldondev.com, netfilter@vger.kernel.org
Message-Id: <920d4af4-0119-4533-9fe9-f23efe57c184@app.fastmail.com>
In-Reply-To: <Z1nCMHHK6EjEMekj@localhost>
References: <Z1nCMHHK6EjEMekj@localhost>
Subject: Re: conntrack-tools conntrack cli json output option?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 11 Dec 2024, at 4:47 PM, eldon-nfv@eldondev.com wrote:
> Hi all,
> I see some other netfilter tools support json as an output format,
> apparently this is done elsewhere with libjansson. Would it be
> obvious or a welcome patch to add support to this similar to the
> xml output of conntrack -L? Is anyone using an existing tool for this?

These days, I think that most would welcome the ability to obtain well-structured JSON output from their tooling. I would suggest looking into libxo, also.

https://juniper.github.io/libxo/libxo-manual.html

-- 
Kerin Millar
