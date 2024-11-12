Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678A20ADFA
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731443063; cv=none; b=Mk1Cvan1jBXEAVL/3xX/BU6/MGeg+u61pY0jpELk7q7xbsQpXDLmE4MlK2VOb3x0HDhgjjfeoA0J6ndmNF3b8argyeEQXo5lfylnkOBCx6gqZRUwhXNv3J7HcSpGfz8Kt+iFhISqOrHW1kvSTpWsCvHDadAQ2HRcvjnQzYNDsD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731443063; c=relaxed/simple;
	bh=ThlzOHxE9bN/nHBdtx26KpQfeWeVVGkJtM73rqmK7J0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=miLmc1q40AOyy9dOnlEJQzaXD/T3t15J03Pms8Ki/iii8cVvkx7xPHY2lZnUChYEzkk3MhRi3XBRAMAWoQCO3+AzuXDq2bk4bfSlP0XiSLXfFW3QneULWXE7aXnw79ZuNrlDaLC31hsVG5Wu3DcVqOHDWIyEuxOgrzjMk3CPe74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=xNmujrxg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=byysfQ7f; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="xNmujrxg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="byysfQ7f"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 68B2211401C3;
	Tue, 12 Nov 2024 15:24:20 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Tue, 12 Nov 2024 15:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1731443060; x=1731529460; bh=oR8RGzcEys6jIpo9N8s6K9v5AvfUeP0R
	BA/FBDQuqQo=; b=xNmujrxgr+Sygh1STzQbQWMND4pPvkPDu/xz5J6Zn9pAYN1O
	4HKAnDtwDS3KElv3Uf3bmKj4DhzZBw4D88CaIx1WWCwkbwRDlg6LzK8nN2vFLkJD
	bnLhOa/rnJRsfsBEWjtE39eSQzKvirRjoouFJPElM0FPMfeIn2IM3bTtm/kcOrgP
	qcKxBtmvb72mDisc0xHC/PY1s5SFIoYCwpebuomzVPd+gwJI3L5trVy2weLxJlzF
	j79MMZq4nNJUePzr9f1jfYBhNPggY1IDa57875eo1sO3U8RDtTtb8ikwqpe91vj6
	Ijkru4xEKHiEENq4d6dQq3mGuIOVE624N+YNeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731443060; x=
	1731529460; bh=oR8RGzcEys6jIpo9N8s6K9v5AvfUeP0RBA/FBDQuqQo=; b=b
	yysfQ7fTTAoyT02yqUpY6+AR4x827Ylm8TuUVReAmI1Ux4iodbwqop9dXqOluk+r
	qLgOYS/6L6/SYwMywMgB+Hfaz5o/B0u1f4CDXpI6KeArJy5XnG8PahmSG6HxBWBA
	Kfmx/wrx5zg7djd7rNxCz+tNcudJ887IhOBKJockscfInhHuFrpqhbVCGoRBWuVm
	C6El0z4mO110yo4gwVA5ZSKOZmBrC4D5RbMdelH7bmfrXe/Nj6thZELOfgPaTVe8
	Iw2dY8TdLb1bb+Fay9K+jyXNZgTAdD1PeRM0mmMCUkTwzLQ0Ch4Q45hqG5BJnW9z
	4FPe2U42W4DIdyELNhqyw==
X-ME-Sender: <xms:dLkzZyP1O7Ms40f6EnkIqq5q3QYvDeTwhH2Felrve_oVoHC68TubiQ>
    <xme:dLkzZw_u_swFpNaiq-N0H2J3fhtj2Crs2aFl0KFtk2FucUpYKOm2uuoo5r5vuUq_J
    wPI5Z7sGT9snGlu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvh
    grrdhnvghtqeenucggtffrrghtthgvrhhnpedtuedtfedvieevuddtheeiudeluefgtdef
    uddtgedvffektdejjedvteffvdfgudenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgt
    phhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprggslhhosehnvg
    htfhhilhhtvghrrdhorhhgpdhrtghpthhtoheplhhinhhugiesshhlrghvihhnohdrshhk
    pdhrtghpthhtohepfhifsehsthhrlhgvnhdruggvpdhrtghpthhtohepnhgvthhfihhlth
    gvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dLkzZ5QuocHey7NPOyToqnb95477qNHHhVtT3zgpicHVhzfILzgn_w>
    <xmx:dLkzZys5zc6y_lt4fEttaJLJ_dGmfOfMpgXWkjXz8kATiHs-NAKTTg>
    <xmx:dLkzZ6e9pah4Ag44h4X0ShyATKh-pvusbv3mG9S9V7AI0CjRf2s2qA>
    <xmx:dLkzZ21m0N-mE-AzUAdJtdM7YhHz1HYJMHCE0GBJ4GEqiKCmhkquCw>
    <xmx:dLkzZ65M5K_XHOlmGgzWsIj0-AN7_k-aE4gJ9wuj8OGjait2N-g8UW83>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 050753C0066; Tue, 12 Nov 2024 15:24:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 Nov 2024 20:23:27 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>
Cc: "Florian Westphal" <fw@strlen.de>, Slavko <linux@slavino.sk>,
 netfilter@vger.kernel.org
Message-Id: <06f7d512-8cbe-451e-864e-73cc939314cc@app.fastmail.com>
In-Reply-To: <ZzOzJcTdsryZ-GxZ@calendula>
References: 
 <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
 <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
 <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk>
 <ZzObEveL6rLYzv-b@calendula> <20241112181855.GA28817@breakpoint.cc>
 <85dff1ec-b8f0-4ba0-a893-d942d12fed81@app.fastmail.com>
 <ZzOzJcTdsryZ-GxZ@calendula>
Subject: Re: ipset vs. nftables set
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 12 Nov 2024, at 7:57 PM, Pablo Neira Ayuso wrote:
> On Tue, Nov 12, 2024 at 07:44:17PM +0000, Kerin Millar wrote:
>> On Tue, 12 Nov 2024, at 6:18 PM, Florian Westphal wrote:
>> > Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> >> > But one can have multiple hooks (chains) in one table, even with the
>> >> > same priority (i not suggest that). Thus one can combine multiple
>> >> > tables into one and share sets, eg. in raw & filter hooks.
>> >> 
>> >> Don't do that, please.
>> >
>> > Why not?  Single-table approach makes sense, in my opinion,
>> > provided that single table is controlled by single entity, be
>> > that a program like firewalld or traditional sysadmin.
>> >
>> > With multi-table things become awkward due to the imposed
>> > scoping rules that prevent cross-table use of sets/maps.
>> 
>> I read it as being an objection to (potentially) using hooks that
>> duplicate one another exactly. Mind you, if it be considered so
>> objectionable, why doesn't nft refuse to compile rulesets that do
>> this? Or, at least, raise a warning.
>
> A warning to what? example?

First of all, what was the nature of the objection? The use of the word, that, was unclear.

If my interpretation that you were objecting to the use of multiple, equivalent hooks - with the same priority - was correct, then I'm effectively posing the question, "why doesn't the tooling reflect the underlying philosophy?"

If my interpretation was incorrect, then my post can be disregarded. However, I would still be none the wiser as to what you were instructing Slavko not to do.

--
Kerin Millar
