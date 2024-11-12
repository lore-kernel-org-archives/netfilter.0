Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5F8209F2C
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 19:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731440682; cv=none; b=HaFdDFU0CGPhNoi8Ke5Aw/6s7l6Ug9PxF1nQ1xarhP4PMb9pjSLntq4RYulbhq0ny+r1F3/xiWom7GmzMnhkw1gq+0EjL55Qv2lW/lAH7566e6DqwKjecq0rWo8PvS5tM7JZxdKNiA/QXhtHAeSfgtQR1XdVujFTzKehdVAAHZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731440682; c=relaxed/simple;
	bh=dTyNJozQxYdN57YwhFHWlItfv8mcWpIVZSibz1H32JU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=S1AulXOSGQkINlN/DIhkmWp+QpLwUoLzSfwco2kXxfdSTtioAxjNIGehvEKHFHJMpC29tTeOoOli2Wa9pnnnmmw+81KZrzcIx/RfftsOIE6DDmo+K/gRtbFCL23k2Szfk6cuSOYFcvBTSja9nClR0b1m2hBjcyVHmGmQk6Rfu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=BSgbgq3F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XY4KF1hm; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="BSgbgq3F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XY4KF1hm"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 191B81140064;
	Tue, 12 Nov 2024 14:44:38 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Tue, 12 Nov 2024 14:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1731440678; x=1731527078; bh=Xg6sSsNULOxrBpVleGd5M0wgVG/zj5aJ
	V0ZVPPMht+0=; b=BSgbgq3FMN79vnpMD9UOm2BjYtgQ45duU/X1biWVQoTTLD74
	1msYmY5cQNpD/c6l1rfwNSbhUEHXnlSRPFlgjC972U7fEJZ3WEY+DltzrwHFKMmH
	ztz8ftAvT8DPziUKOGkh4ctvmVpL8G3jl9XgkFUBpjLc4uWn56WWp8UhlFsREe0B
	OjKkLpX0Bzks3Dg7srHk5aLomcPxrxzkboibofsaR45P47zVliHEG5wCGvKjld0x
	x5xUHGlUSzTNlsr36w/i/qLzMIe0H5ztPmwNB86dxPweeMtSfIzzx4mNXpGd9Fo5
	TN6cSUxWnK1wboqtx3uERHI13rgI/QU9wrt/KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731440678; x=
	1731527078; bh=Xg6sSsNULOxrBpVleGd5M0wgVG/zj5aJV0ZVPPMht+0=; b=X
	Y4KF1hmmG/c6krQrEnTAJRa/11NLeLEz3MDy+Ws7+Yai9JWoNByjwbinoc1J1l9G
	LmIZ5XzkMfIYz1QNnkhYd7tasSaNi5vruTOEI+cNislTaKkZWfirs7IpSUMt/kmg
	DZ4nubAhqj8gldNJ+dnE+DL7FE/y2zm7U1T7E67Ya2Rc/SSUmO+4fAr/CH0bC8w/
	EQpZJksA4ZVgZKkUbsl0utMizUCDPEzPletgt9C98PNqm6PPUlCnaEE0HI1Kapqy
	UbLDEyqbchNmipAFVtrO0GcZFsxRC++gCYXhQD1QhC6py7Ks5NWj4g+y5jTRoeFC
	RYHZV8hdxz+sZ6RNt4b1w==
X-ME-Sender: <xms:JbAzZ4pjUTA4rWIZHEjOkAvKCK7cTFwCtiavtKYCEFaz6h9eWx7zsw>
    <xme:JbAzZ-p5Q2m4aqs9zjYA7XHGl-LLLRzGd05yJWq6TFXbJKxw0COv8IwaAUO7eVtHa
    GjdrNIga8eCtj5h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggdduvdegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:JbAzZ9N8W7hS0LMeHM22Wl7Oia60i6ABT5pDzRRsqQdm4AHLaEATfg>
    <xmx:JbAzZ_4jgQLxpoNSVqtRkYC0tzJVQf5kZDziFAL19kb0ipbzCfLnaw>
    <xmx:JbAzZ35LvsWVIfkr_oweX-foZ69QnSNFc-7spz8DT5RuqiE9vOIuhQ>
    <xmx:JbAzZ_j054av6N_fV62fx3uU02W_pJgheEIkMLu1A4UOMIgGVC7kpA>
    <xmx:JrAzZ5kBjcrtHRd43bsNjxkvuq3MFU4HcWW8p28lP00NnsdmuVds-nKI>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE9173C0066; Tue, 12 Nov 2024 14:44:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 Nov 2024 19:44:17 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Florian Westphal" <fw@strlen.de>,
 "Pablo Neira Ayuso" <pablo@netfilter.org>
Cc: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Message-Id: <85dff1ec-b8f0-4ba0-a893-d942d12fed81@app.fastmail.com>
In-Reply-To: <20241112181855.GA28817@breakpoint.cc>
References: 
 <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
 <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
 <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk>
 <ZzObEveL6rLYzv-b@calendula> <20241112181855.GA28817@breakpoint.cc>
Subject: Re: ipset vs. nftables set
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 12 Nov 2024, at 6:18 PM, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> > But one can have multiple hooks (chains) in one table, even with the
>> > same priority (i not suggest that). Thus one can combine multiple
>> > tables into one and share sets, eg. in raw & filter hooks.
>> 
>> Don't do that, please.
>
> Why not?  Single-table approach makes sense, in my opinion,
> provided that single table is controlled by single entity, be
> that a program like firewalld or traditional sysadmin.
>
> With multi-table things become awkward due to the imposed
> scoping rules that prevent cross-table use of sets/maps.

I read it as being an objection to (potentially) using hooks that duplicate one another exactly. Mind you, if it be considered so objectionable, why doesn't nft refuse to compile rulesets that do this? Or, at least, raise a warning.

-- 
Kerin Millar
