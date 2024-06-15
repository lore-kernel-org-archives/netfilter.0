Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FE81FBA
	for <netfilter@vger.kernel.org>; Sat, 15 Jun 2024 01:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718414882; cv=none; b=alFoKSPFof1nwsRHbG8DS1JBfQRG4tVwxL6iCDFQ1Yhv3Fdv85lKaDu1+sqGcLbjfi4KnY3rM9P+WFg52oM0WSdKeJetDu7XThMvvJb4AFw7q1LGigBqz+FqAYjuZUpWCWlA/RhW4uXD9epCpYwcK8Ip6en9+7eSuYtf00nDhQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718414882; c=relaxed/simple;
	bh=Hvbx6FQEiZON6fiMDPy+l3a0EGiBwSzufekq2UdnDf0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=NJZAcLv6OSUCPn5qm1QXJ0HJwQ9SaS15KKidMtSGlNSFrGHkOVlSy32U+EUQa7KeLlAH3AXOKJxzg6BqaQ1Apc9PmwT9wLExB9bjMogj+tjQvFCwGP6aqt7in1PC74dAS1oykTgxRkGfyZjc5HLSozPIYX05Cubcuse3ojgkbDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=m8KZ8mH7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E8GvpyKI; arc=none smtp.client-ip=64.147.123.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="m8KZ8mH7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E8GvpyKI"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id E34251C000CF
	for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 21:27:58 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 14 Jun 2024 21:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1718414878; x=1718501278; bh=nGHAo172kD
	fYuyxHzZ+czicTo4UfYIItlmojHJesSR8=; b=m8KZ8mH74BQWpr0SUqBeUFpnSK
	lHB4kq2aSEgUVd4kovQ7MSnOlWWfGDc50Hp/kz1/zSuBoqxu/qUE5QGrOcxqkqku
	8jB8B1xdFR5k7noXzO4+EtyIB2hO4T9RMERoYU0LJta7UQlv9zXBFTPECEimuwyo
	PMgPWuobcr/5qKyQJhvn0OW2j4vaI01T2v5b4lG+qI4au4uFPQjXNCEaqQ3x8CwB
	CTgQn3CsCQD4K9S3PUfxrlC0VrIsH5h/YT6df53Jk/VPLoXEdEmOUfnUBBkr+NgJ
	oVcswlarl5Jgt3JSWYL0B6RS83MxLpVrRYoF/f7LGmFcpJt0rcZ7hVSBaAgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718414878; x=1718501278; bh=nGHAo172kDfYuyxHzZ+czicTo4Uf
	YIItlmojHJesSR8=; b=E8GvpyKI3JQoMYi8oEPRTaXReS53PVuZ4c9DQAnHqQHx
	kGkzXodTaOgn5ZfBPayveC+j8e6pxiP0TeUbZp27Sx67KYn90FnhGia6L0IaDvMD
	jnBSNcn8rsYBB+8baGOC7RMJuiCOqjxbCkjP1503MCAkIaIGCzJIBzv1ukEAKH1v
	oYzSFMYxnJr2Vb/JvYEALyybAi1fHyQuFcM2CQ4hbgp8eb+V5y4WRbhUou/smF7N
	jexAAeGaRmw00a+7gyfSrBKN6ivRRCDs/U9PnS1W6GQIHcVsNGZ8sXzaEFZeMA/d
	GUTw6vo3SxoRqkeVm80vC4INQdgIyTIjVLTYLzCjHw==
X-ME-Sender: <xms:Hu5sZgSeiIxEDTFpQKPDLKqs4bXC-CAw6JwUUN2MuhoVDIHJcJAcGg>
    <xme:Hu5sZtz7yP9EaBg5Jtx2EJgl1rAt3CVxeJgb3e90bRfz3jlyTBvW0zQ--MO1OXEzD
    SZL7q5ncCqDBLVX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvtddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeejudejfeeuueduteelffdvge
    dujeeuuefgheevteevfedvueejgedtteejtdejveenucffohhmrghinhepmhgrrhgtrdhi
    nhhfohdpnhhfthgrsghlvghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:Hu5sZt08C2k_rVhNeVMOQInozkp3K0Be1nL4cgJYZ-WRqZp2bG_-_A>
    <xmx:Hu5sZkDkFtmfRgNlLvjR1MHdFpqm4P0iisW7_5csUi4ko7W9GcTbRw>
    <xmx:Hu5sZphzFCc-3hi_W8zMnPVHBBrl_wnQprPueTLwp2Ug5HwksKtjiQ>
    <xmx:Hu5sZgpkluQLD6ex8v2Er0-h1tZGMpVwOIKzENWf4sMSM-PcezRihA>
    <xmx:Hu5sZpI4frwTtOeFODYAZEr3JEpNnW727qLyswUqn1uxrPImuQU-IvGZ>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3C1551700093; Fri, 14 Jun 2024 21:27:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <47e42cb4-dbca-4586-879e-21f0752ebf03@app.fastmail.com>
In-Reply-To: <20240614191511.3e9cd1a6@localhost>
References: <20240614191511.3e9cd1a6@localhost>
Date: Sat, 15 Jun 2024 02:27:38 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a counter for vmap verdicts?
Content-Type: text/plain

On Fri, 14 Jun 2024, at 8:15 PM, William N. wrote:
> Hi,
>
> I have this anonymous vmap:
>
> ct state vmap {                                                 
> 	invalid: drop,                                          
> 	established : continue,                                 
> 	related : continue                                      
> }
>
> Is there a way to have:
>
> - a counter for each individual verdict
> - a counter only for the drop
>
> but without jumps to other chains, shown in the wiki?

To do so requires nftables 1.0.8. See, also, https://marc.info/?l=netfilter&m=168933264008248&w=2 and https://wiki.nftables.org/wiki-nftables/index.php/List_of_updates_in_the_nft_command_line_tool.

-- 
Kerin Millar
