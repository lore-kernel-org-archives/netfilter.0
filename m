Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B194815ECDF
	for <netfilter@vger.kernel.org>; Fri, 28 Feb 2025 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740765196; cv=none; b=oZS2bFxKULog61OjoyVJoKqznod3y4hSs/mQ/AG4gCo0l/OPyrhH9c6axV2iNkT1+fQMzulRvQeBTwe0rQTcNdojbJa3cVBbM8iBvoEjgPevwuB4P1kBD/gvXM1WZDDR8nl7gg5eM5uzHO8XSJ7EnQ3s53YqSX0RO6PjyLeQ8EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740765196; c=relaxed/simple;
	bh=pWnzxSWci5T4999zPuBQZVk+9saOAHvDWIDuTXAUr+E=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UysTk6enVM05u+A+JK0UCpsH422f7H4g+G+v9e7az1DF824ZsJebZk4ynLlLkARWO2vD801WiGopG0EtcKvI9QBkxfHFxhsOwUvkNcYRWjS3DkdKr/UuuVvSjA2zcdfqZyk9dWM5lmRWi3eYRFpicYeE7+lOfCm/IDkX3ltefXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arroyo.cc; spf=pass smtp.mailfrom=arroyo.cc; dkim=pass (2048-bit key) header.d=arroyo.cc header.i=@arroyo.cc header.b=Fy89ubkk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e6hZwTPC; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arroyo.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arroyo.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arroyo.cc header.i=@arroyo.cc header.b="Fy89ubkk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e6hZwTPC"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 978E113814F1
	for <netfilter@vger.kernel.org>; Fri, 28 Feb 2025 12:53:13 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-09.internal (MEProxy); Fri, 28 Feb 2025 12:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arroyo.cc; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740765193;
	 x=1740851593; bh=pWnzxSWci5T4999zPuBQZVk+9saOAHvDWIDuTXAUr+E=; b=
	Fy89ubkkJ13w848I+vHZKrx2DknCBcSw1nGVq4IZ9aDtHaBgj1aZjNi5NlV4mr7V
	Xb/pVJUM+7LNeetrRJJzWZDr9+01g8k028d0YQLSszFcaI/Pkn4UGoOKU1qC9u5u
	D5+72d1AXMSpfAvbZhbx0qQIDDCOGmf1lurfGH824W5L6/HWkyNEtnHRbxVpuvCS
	UX35lL33qhvdNcvpaqGy10TQ30Q42vM03XHxsHr6KRpoDlPx0ZpEuYhCQI1lC85Y
	FiscrRjMt8hCT1Com6z4NMutCEngY8mGjn1c430CYH6oE3z4BeFvcXAx1v/Sx3U1
	7tNohrGwCH8yUD5eQKFsjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1740765193; x=1740851593; bh=p
	WnzxSWci5T4999zPuBQZVk+9saOAHvDWIDuTXAUr+E=; b=e6hZwTPCy6ZKbR+s4
	foBkY3lbpx4QnFwXB437uPAkgSo5771GgnXFguQ+EPRijyyaAon96KxbRd+0C96b
	PTIdL2A+ULBpudBiWg1VpNp5mCct/ipk9h4JO0sPvy49Yh9PGTbD8OmJExxL+RzD
	5/ruKwSI16BkjJrkgv+ZlhwHnPsGI/6ZzYXx6mE8+xOrcDTnjZiCcCbxvpxtWkgE
	Jr57IqGePDWFwzt2W9F8/hZKTFwRKGwIVG8gJKhn/yvFMjRciovc19b/m8ZQLE4T
	fpFlFfq9A1LecesyUHPF9XnTlslyvqD/3qd1tAF6RGc1gDFaE8xcZbVgtPPQagjY
	BaFgQ==
X-ME-Sender: <xms:CfjBZ9AOoZlKvY0hCtdrr9KD-ojuSxcomB3-aN4PA0Pp1KWWrV0k2g>
    <xme:CfjBZ7hKmGw4cG_eIzXj5-16h3rMofAMjoF0G3yXaV-mGwtOD_m3IC22VMBfwmfz7
    ek50tYibaOJe33J8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeluddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculd
    duhedmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredttdenucfhrhhomhep
    fdffrghvihguucetrhhrohihohdfuceouggrvhhiugesrghrrhhohihordgttgeqnecugg
    ftrfgrthhtvghrnhepheelheeffeffteeiudfhgffftdelgfevffeufeegieefhfduvedt
    udfftdeikefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrvhhiugesrghrrhhohihordgttgdpnhgspghrtghpthhtohepuddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:CfjBZ4l4-Xif8MLuxGq_r1sV7VTLDwwUtInn_FvSa7IfG6rsDAKvIg>
    <xmx:CfjBZ3zUstVsUySX8bCBQ_NAqWEAg6MDy3P5MHJ0BUHWTu4jRYz_ZA>
    <xmx:CfjBZySln07utSiSCj6f-KPS5gXePVSszqltdq82I3iSTO3qRPvnbA>
    <xmx:CfjBZ6ZEbt4oXCkB8yKLMVX0yYgkXai4MueaXKtG1MMmEEjeAE_eWg>
    <xmx:CfjBZ769HzXWoWoG_2SW9WXa_hIQC1Z63M2c-sITz7PW-KVNknGn8tR1>
Feedback-ID: ia0a94750:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 595B918A006B; Fri, 28 Feb 2025 12:53:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 18:52:52 +0100
From: "David Arroyo" <david@arroyo.cc>
To: netfilter@vger.kernel.org
Message-Id: <8f181a41-8cfe-4f50-a7da-9e845981d568@app.fastmail.com>
In-Reply-To: <32148fc2-3cee-42cc-84c3-d96b5b32d197@app.fastmail.com>
References: <32148fc2-3cee-42cc-84c3-d96b5b32d197@app.fastmail.com>
Subject: Re: Using netfilter to intercept packets written to an ipvtap device
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I spent some more time thinking about this and reading the
code, and feel I understand what's going on a bit better.
It looks like frames written to a tap device go directly
to dev_queue_xmit, passing through the egress hook on the
way. And for an ipvlan device in l2 mode like mine, the
driver skips all the ip_* functions that would hit other
hooks and just calls the parent device's xmit methods, so
it makes sense that the inet hooks never see the packets
on their way out.

I've started a different approach using an AF_PACKET socket
and am finding it much less problematic than I feared.

David
