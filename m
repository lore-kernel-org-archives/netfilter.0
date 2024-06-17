Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1538D
	for <netfilter@vger.kernel.org>; Mon, 17 Jun 2024 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585402; cv=none; b=YA9efuOOVLWPY+g/gW1vNVRIR5y/JYtgcoZ6x0b36+elaCaI9YE48aOPxI63DN/wzMamjwCvsDN/I0La+VrybHeU8u97WcoRpeRylfRFfPgFP/xG277XBKNxaBIezbTOGtjHIF1/s9UHAd43PPLe+izW5L9D92C+e9npCwm8X5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585402; c=relaxed/simple;
	bh=Rb+nnn7v7NKw9TYCG7vSII340ZpXlrXEe9J8LM4edO0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=BWWcTvRUdCECFHbpWkycdiaSskKSi1wK5RU0BGJZk5r8IhnTFFMSY5uOBwOD2NRXMvZCTnsEfrwKCf3SAPIMQSneeWvuwP7PJKLSZ+jLSe7JX+uDiJm0YtsQdobdxO+1H4cUCJdLjncik493ECI6PtjUPpJgSPZCw61xiLXMwls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=hYwhVX5n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mMRiJkaX; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="hYwhVX5n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mMRiJkaX"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 600151380081
	for <netfilter@vger.kernel.org>; Sun, 16 Jun 2024 20:49:59 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sun, 16 Jun 2024 20:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1718585399; x=1718671799; bh=M2aFAA7ZPD
	MiKitvylO3LXOgBe6zZojn0RC8+9qS+Hs=; b=hYwhVX5nkmQQETuRsxcrNdADi3
	TEs+AxTpwFDAd8wCL2R49AMoe/ERvo468UKjj47psm26iyzID/yh3TnKT4SuqxQN
	46T9Dj4vkPDNjhSZtVJ+ktI1xltncs9tmIj86wU+GpmuR/HFaq9K2Luh9QHLCq63
	Xtk6cOdcUeILh6atv2/lR3VizHxZkyXyxW9O44Rg7Oreh3Q9ZyPxCXQtIRz+ZkPP
	jKBuQ8tEtP3d7eOKLI1OtHlP9kE0bH6jZW6E4SEgw582mPqkdv86t+Km0ry+Nv1b
	BsJl7F7c0ljsovW2MeNtXxLlpxHZwoI4fM4WsIDNCxk9L3U9XpcSyga03Zrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718585399; x=1718671799; bh=M2aFAA7ZPDMiKitvylO3LXOgBe6z
	Zojn0RC8+9qS+Hs=; b=mMRiJkaXgrrywv/k4tpfBJqV6QVM0TcAKxaV7IILM8dz
	izniS1dlZcx3csEFK1MF9QXDMHrZt54kxG++IBcPqEBAJ9so4c5eyX2M9YJKdIXB
	2y/VHM9uJ5R2GNv72zJdAM4tlsZbTRVaPV5QaAB+0qKyxOgjD16Wi4DFdtaIWyrm
	RUG95aBNDZBUkakbHTZbvTRZqXQKmMMOI9UavPqz397VCveoit84JlvNSFVROM0P
	oZmkXYD+sQCFHf0FZYZ34sovi09F708KsQKYX77BOdIf4XMIFzHejEr1KEXUoPOA
	yQzJU/N7xYzCSogW2cAILn1ARznD7ehY+0/s0SF02g==
X-ME-Sender: <xms:N4hvZsQnydgwYRA4AkMDBIjOBmc4U4lrcrTgOmiEUQ3EK-PsWuS0gA>
    <xme:N4hvZpwiBvBvFqMvyUGeLTKMLv-MeWGzCMnXW7GRsA4EKSaKW8fZrxKai-f-EDozl
    AaqDoaT1Hf8ApGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvgedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:N4hvZp085dw4vAHPet8e1zZKWQB0_sQWpyJDTruSB2aXrE8segg_aQ>
    <xmx:N4hvZgBJr0346No1Xf6XgsQDYjVnPloWxjln-vFwqWJKl3OX4bxkiw>
    <xmx:N4hvZljZexcbp3qeg0KgSR9yBT5hm-_3jdZryVmZ8OEFEdrTJzfZYg>
    <xmx:N4hvZso2B3Nu7qrQVNX2E5H3-sQErML5jLzklS7ZZWp2Er5iJAWRyA>
    <xmx:N4hvZlJwMEiBS-xZ3BpOwoc_L67SEaC6tHZ_S6Cxdkq5W4E1OZVqZmao>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E3D051700096; Sun, 16 Jun 2024 20:49:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <75dc80cf-0cbf-4fc5-aa99-bc97e908b64f@app.fastmail.com>
In-Reply-To: <20240616171648.59271196@localhost>
References: <20240614191511.3e9cd1a6@localhost>
 <47e42cb4-dbca-4586-879e-21f0752ebf03@app.fastmail.com>
 <20240616171648.59271196@localhost>
Date: Mon, 17 Jun 2024 01:48:30 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a counter for vmap verdicts?
Content-Type: text/plain

On Sun, 16 Jun 2024, at 6:16 PM, William N. wrote:
> Thank you.

Please read the 1.0.8 release notes, the link to which is in my response to your prior question.

-- 
Kerin Millar
