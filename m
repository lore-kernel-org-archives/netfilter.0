Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1198131732
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721556309; cv=none; b=jHSZVkWZuEs82vZGxdzC30KDMaSnqehgvwp5q/rltVa1mmohBPuSuNazODtPKnb5jJT6lN/wF+vR1KtF5O8YhoZ71mGPdZ6vaLju2JWFofpvlTrVMxCc6/86OtIxrCjGzmYH2t3Ho5oVN745K58ApBVzlSvZTSEmNiDKKYOnmVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721556309; c=relaxed/simple;
	bh=QjBDEGTuJW0wJd3qvSfv6i3QZEj6bNbZJ/qAVt8V+lE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=ridfQqjaG+w+wy2sK4MDdSIVSEkU4GUt10enjGymahbpfFFSp006bH8WcxUVGAhBRhkW7smI42kV5sdd/8leuXYAh8fFYdUAENgGxOLhJsQ/op56PZH2vv0EI84ZPBBgWvNekuO+QMrZ7yBIn6HQM3rd9Najb0xK0BJzvCwVv6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=Tc1Trx2F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j0KJJomQ; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="Tc1Trx2F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j0KJJomQ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id DD98011402FD;
	Sun, 21 Jul 2024 06:05:04 -0400 (EDT)
Received: from wimap25 ([10.202.2.85])
  by compute2.internal (MEProxy); Sun, 21 Jul 2024 06:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1721556304; x=1721642704; bh=ovt30spx2W
	YoMFaqe7jfSSsiN/ACMNlUCYggjgo8urc=; b=Tc1Trx2Fy4lrBD5ldxMe4W04Jz
	QsTxMkmzFSSV5N9xGRFWspT7tjF5z6Ye3ORX29n8PmBs3vZLe+tB9AuMcne1AaNW
	0l8tYNhni7Dbi+C9q5mdxghRyuaVNwuYE3qsL9Z+jl3bRbP3RuscBQ+ArEx2OtEt
	f3t9XoMtEirgi/eeOtZJ/fOmJvlfM3i3sG8SQrp3YzcCQK1tRU2IQRjAejyfB2DV
	+JDNGBIq1dHb4M6VHzLVNNaP2ssV6iox26xtIDUU8DBiU6SUuG2VNKRHP3Q+A9kJ
	Fi0dp7Rji4RNDP8rZtc5B3aIfsnA3cltjyil1+uvrGDOMSKCHOImCvGW2TOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721556304; x=1721642704; bh=ovt30spx2WYoMFaqe7jfSSsiN/AC
	MNlUCYggjgo8urc=; b=j0KJJomQU9lOQFtB9sESCS9EE/RcUcweuWH7GqR5Jv2D
	iclnBEkTqLdh22JR8T6cLL9G6C3dV+xy/hc5GrkxIvyzWL2EIrdzRIecWNuLObw1
	TZti0dyZXL7P+Y2rBML5xtgJFFovyYXGYbVpYE6h6I+qtSwfpoBjVFh1OGJs75He
	f9aCCmYySAvAJA78WepiF29bhZBtoqGZG72qDbWdNGQbyOrwU4RyV6drD6z2/62s
	WEbJcSTpIEBBfjOq3yI+aSBcuS8zgMfsOrQ+4/f+zTttWb46LclPo/DFWpUxiHEt
	NnTgE3AG10mW8mJRK/oF40qyYEvSM5nhAzfWzIakZQ==
X-ME-Sender: <xms:UN2cZgW4geXEwTllY2KrM5uyXWV3gfsXwvc1N3nXp8lfOyWKffs0DA>
    <xme:UN2cZkn0IYbvC_7cJE64k7qPr-iEBBPIVnIXryxlxycGFao0HJ6LVmlCei4sZ5VMe
    cjpbikEJdYlLKuF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheehgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfmfgvrhhi
    nhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrg
    htthgvrhhnpeekheffffetgfduiefgkedvfeduhffhfefhkeffvddvfeekuddthfffieeg
    gedvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:UN2cZkbxmhZTXx_MvgfhAmeajkUb1We9qFZ25bwuJvpBv_HE1bYYBQ>
    <xmx:UN2cZvUKKTpXg_6UjG5Pf7Bzra04ZkkJTMOIV4pzuymRa_2JKo3SoQ>
    <xmx:UN2cZqmMcW8z1cZMw2dYfNG-WQvROx2fT2HHTX4vSNowNdOiwOfw0Q>
    <xmx:UN2cZkdWazI14l7ooVpYe27BqcUsIepcgrTWlyKP2m_F6C_6WLMFQA>
    <xmx:UN2cZuuf2Nh7K7kCo9lOKb_JVmMs3Y025GppUApVVcpkVnh77bxkMY7D>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B07F51040061; Sun, 21 Jul 2024 06:05:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <39b7b5e4-30b7-4513-a390-482c8f19f36b@app.fastmail.com>
In-Reply-To: <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
 <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
Date: Sun, 21 Jul 2024 11:04:44 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Content-Type: text/plain

Hi Slavko,

My previous message contained a minor error.

> Yes, grouping elements in this way is sensible. Note that there is no 
> need to worry about the ARG_MAX constraint because nft is being made to 
> read from the standard input rather than use the -c option. However, I 

Of course, the -c option isn't relevant. I should have written something like "rather than convey the commands as a collective argument".

--
Kerin Millar
