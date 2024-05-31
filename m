Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5911C687
	for <netfilter@vger.kernel.org>; Fri, 31 May 2024 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717168777; cv=none; b=F8fdLkBlmszSfyXg5jk2D5DFTgbEbEiLblWP4ctCZgjtX4V+3zw5DJiH4gnXRySfSHVnnuqWA5bLdfEo0f5J7oe5gM2LocbncZtSLLiWMiFh30SP26n0j1c4ngJmLAY10hH0988Hsw47cBQjGvGuQ1rKUoCIFyTL7uV5VZap0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717168777; c=relaxed/simple;
	bh=MHt38tXudFNG4yOwp1HKpOwIIV2mizoqmmmPBJsZwSU=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=tj05BF42NrBAyOheXh2gEEi+4VnXeUvnV1wHpNGujAdLVta7285ACwD+YB/Ax72H/1XMPq4+6vjareKE0iV42y6vYKzCVi/KWP7kB4jP8H0Y1AkMOlCDCphxtpYDiBlRXoxGLJm+cLde6QiKZrxvaOGsKB43t3TVLVMFFQMgPLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us; spf=pass smtp.mailfrom=kevin.km6g.us; dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b=mdxu7isK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FcNT/ERn; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="mdxu7isK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FcNT/ERn"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 01819138012B
	for <netfilter@vger.kernel.org>; Fri, 31 May 2024 11:19:33 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 31 May 2024 11:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1717168772; x=1717255172; bh=MHt38tXudF
	NG4yOwp1HKpOwIIV2mizoqmmmPBJsZwSU=; b=mdxu7isKl8Afl9BB4zLUJ/Iivn
	/OO4nIT70NVWfzEuA+j1R5dpSrKYzakPmHeQxQb7qyzX4P4sdLzz5KshfN9MuDyh
	rOuHcIRbq/erR85ROMT26/4y5iWJ5RgIX2D79uuRNQje3UdWhn/Qv3BJkxeoTmnx
	AsuC4EyjAeaVqqElx/kkrr6S61bMyyD2mNjl4JphYFjUGhPpE9n4WiUOCI/Bxdb1
	TGeC42A+UtSUtV3zgJuYfSJGFZ4iVPGuQWftPuVLovkLrXi5E9Hszs6qqdztTJWL
	/1dkkZyJeqISGt1osq/Y73vrX0ZqGHXb1KlKzvTgx0wxDsfInNuwARlMnPmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717168772; x=1717255172; bh=MHt38tXudFNG4yOwp1HKpOwIIV2m
	izoqmmmPBJsZwSU=; b=FcNT/ERnaUBzae6YE8YiA96skhVV/bYtITtcEp5di3PV
	/3MItHiABVQzxKK79I1bi3ztApaQnjYoe3b2/4Ik8KACjPJ3YnRtBXwv1kj4ba2W
	UtosoSnMbecoONk0jZ4qtjLRBIkmjgwJAJKqU6jAAxtTLQg6h6O4oCm+d+fYlkI6
	QsDR2DsNqle3aSc9iF2+gN4L7rqtpy/AJo+9xh7QPBzEq+ijevfwyIGlP/7lV7NZ
	0Kzx6lIQ6w1ABXysHUfcaLAXdbWgA+kRV/kDl18yFlQYW75A3J49c+otX9ODfm4C
	elqmgZx/EbdJqR/KovT5NEW8X9tN5X5SMBm/PQIiGw==
X-ME-Sender: <xms:hOpZZlTocEhtYLox0CG14W8_RKXOHE0PAfZJ-jQCo78bNvZsnkW-fg>
    <xme:hOpZZux_NJYH1iFpq2Gz0CWuhMYtU3N4S3XkK5-vlmr7fx61ZrAcZzbJ8r2DIj6Ov
    0h43uwHDsCXi5mjyBc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekiedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvvhhinhcurfdrucfhlhgvmhhinhhgfdcuoehlihhs
    thhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhsqeenucggtffrrghtth
    gvrhhnpeeiudevudeuuedvhfduveetveeltddvveejhfethfekffevgfehieffjefgvdeu
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlih
    hsthhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhs
X-ME-Proxy: <xmx:hOpZZq3XOKxI3qA43PQMz_cvC60UpSWrhCr-sIteLae6rBENXR8NVQ>
    <xmx:hOpZZtCuWIQ8BznHw5P1wiVeFU-wlA-DPoS6Dqo2PhmCLlSxNK4g_g>
    <xmx:hOpZZugS1coGQEMM_DZt4NySXrED3ONwuhTYs5tY5BQTZo7F-VzkGw>
    <xmx:hOpZZhoZfOo13q4ZkLlt1fWQlUf-AQN3l14KR9mKjqfjqw1vHiPljw>
    <xmx:hOpZZmJdlkge1ep7CUjRUfbo3WESts_T1VtFhRibIfNpiyacGXk7_h8f>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9BBD71700096; Fri, 31 May 2024 11:19:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c0a93cb6-5a99-4d5b-ba30-e55c418b403f@app.fastmail.com>
In-Reply-To: <1393698327.20240531171132@WKraft.org>
References: <14110673198.20240529174630@WKraft.org>
 <4ac23ef0-13df-4423-b1d5-aa9d5eb5423d@app.fastmail.com>
 <305618533.20240530185617@WKraft.org>
 <79ee1677-6a97-46c5-ba3c-af6e1b61638a@app.fastmail.com>
 <1393698327.20240531171132@WKraft.org>
Date: Fri, 31 May 2024 11:19:12 -0400
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: netfilter@vger.kernel.org
Subject: Re: Problems understanding nftables part 2
Content-Type: text/plain

On Fri, May 31, 2024, at 11:11, Wolfgang wrote:
>> It's not clear that you understand that the value of nftrace doesn't quietly reset itself to 0 between hooks, however.
>
> Can you explain this further? Which value of nftrace? What shall reset itself?

It appears you misunderstood the statement.

The point being made here is that once 'nftrace' has been set to '1' on a packet, it will stay '1' for the entire lifetime of that packet through the netfilter subsystem. It will go back to zero, or any other value, and there is no need to set it to '1' again in a later hook or chain. If you set it to '1' in a very early part of the netfilter lifecycle, you'll be able to use 'nft monitor' to see the handling of that packet through the remainder of the lifecycle.

Thus, if you are setting it to '1' in 'ingress', for example, there is no need have rules to set it to '1' in any other tables or hooks or chains (unless there are different conditions applied on those rules).
