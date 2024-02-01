Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D806306F
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706808299; cv=none; b=aECohTY9nMaSpUQceA7UeoLMCV133IwpJWS8/ExjtJmwUGyXsfqJI53n4bSHVhJDaB9zdmBsXxmoLibxsJG+ZhS3rbOuDSkv9iGuVsp/RFtheNY7uABSqABhKFSP3ycOlQ6Gd9Uwa4Tb0PIR7ruNRY0EcW9DpPs4byr4q9u7S3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706808299; c=relaxed/simple;
	bh=aTtuM2aC2KmyVLpyiiZniFFXZQa/gAPjkWYd/X/VUX8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dXQYXiQtDhIFecJj9smk80z/VtQE4H/miZQNobj2X9I8Xq5GiIAkYgjdJHDRsgwwgahFnXG/Avx+2VDXueL887m7B3z6tWwEuoMD2r3ypWgXN+hOZSELMrfUUYGzqZJpzl1NOAKM5poeOoFvthGroy/tJzowh6fMdod98NLA8ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=YEkghol9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UZpqqDxG; arc=none smtp.client-ip=66.111.4.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="YEkghol9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UZpqqDxG"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 362C45C00B2;
	Thu,  1 Feb 2024 12:24:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 01 Feb 2024 12:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1706808297; x=1706894697; bh=AW1E3dIUfQufP66l1p6tydwiiagdGrWt
	xfXycMt0T4A=; b=YEkghol9THj+RlqtmxA+NNperul552LEywz6d1fGW0U7HQzz
	TaWH1m7uX/YgAV4+gEyvUnq4JAmHa3KSfXegaS2JVi4wdF+rncRbUA4PrBJf4sFN
	R+nUBL9e0EBS6qHTigTfA230jnU0kzJKen6/WcbDFhYeY3KRR0wa4PgaWDAoAGNJ
	Yy6GG9VI5kAOTs55rkN7a1aJb1GTIDTDHOs6wkS94DLIi+VFXD5l6E55Wp68G2wP
	f21VqVYDQSySktBgt8oY3fUv+Yhy+ONkkYtH2GtUQX1Oc97Xvayxi1xAlUSBxBGd
	TlKHzIIhlikks7LJUGbudXSlsGojLReEAKJW2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706808297; x=
	1706894697; bh=AW1E3dIUfQufP66l1p6tydwiiagdGrWtxfXycMt0T4A=; b=U
	ZpqqDxGyctQQPtvp4FCLdtTedOlu95GFdfY+lExbcNsfhHLZ6JTIftlBKVj7G8xF
	x+pt4uCHoqWap0u/m+BFjkl+0shIsf9XitrNj/ozK+hfJ3M5NOQPy1bKq044nqoq
	IQr1aa+9LfCimk7XYclDCJzv1J2rAUYvbAOUrLo9vcpA/MZLVVexnqutoFRpVukN
	uBF0WrpHDTHALHJo8TYPFkHWdpiNytlnlnkTR6K2dvCZSrbTooBkxKl/niRuIrz8
	JvVJ4BUX76opKHBGDTlkKSLiGRAFJ1ImOTlhQvumw5Fuhz70Sab2CIcBXVYHBdln
	/xouZaEO+KswgkthDbofA==
X-ME-Sender: <xms:6dO7Zbkrkmlti678cdz5PRt-848-vPR-oz4GD4I7ose6IOIZ8vidxQ>
    <xme:6dO7Ze3vBksjc_zbvXYXY79f1nI7XryGHYqoJL88Rhx36bEmFPTWbnkT4-Bifs5Gy
    -tbFwGR_1eGjfm5>
X-ME-Received: <xmr:6dO7ZRpuX9mIV4hImq3ThcVSnBR9Zazvk2UMxz2IiA3cqius7Abgmg8TA1uscA09EN5FcnJeBOqeA5fUjcu4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduuddgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkjghfofggtgfgsehtjeertdfjtddvnecuhfhrohhmpefmvghr
    ihhnucfoihhllhgrrhcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrg
    htthgvrhhnpeeihfettefhgeeftefgheeugeeffeehkedukeefffejgeeutdeggeejtdei
    hefhveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:6dO7ZTmpaJtiGjOkdiGmD-FgvXbA-_cfV0z0XiJGfukNawRKLuqTUQ>
    <xmx:6dO7ZZ0Had4zOn9VdtYiGOnlCtRi27tJWLA10QJAL6xAVluwaIXYng>
    <xmx:6dO7ZSvoMbu_PM2Tk9yO6dLo9JJrBxvWCaXA7-2oEsLY6HWpO7r9SQ>
    <xmx:6dO7Za9CLAFlFovIwb0uWcCTGGgQrWuGTT-w7ZIby3w_XBisbGqeOQ>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Feb 2024 12:24:56 -0500 (EST)
Date: Thu, 1 Feb 2024 17:24:55 +0000
From: Kerin Millar <kfm@plushkava.net>
To: Edward Dickson <edickson@hudson-trading.com>
Cc: netfilter@vger.kernel.org
Subject: Re: [nftables] Multiple reject withs in a single rule
Message-Id: <20240201172455.dbcd6ff0da8e545e06106e93@plushkava.net>
In-Reply-To: <CALqmkGz7HqTeAvyZwJDTcZsuSUVi6usAD8P6XwTnfMxzBSs=Fw@mail.gmail.com>
References: <CALqmkGz7HqTeAvyZwJDTcZsuSUVi6usAD8P6XwTnfMxzBSs=Fw@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Nov 2023 14:57:09 +0000
Edward Dickson <edickson@hudson-trading.com> wrote:

> Hello,
> 
> I am running nftables v0.9.8 and am aiming to create a single
> rejection rule which specifies multiple rejection types for different
> protocols.
> 
> Something like: "reject with tcp reset with icmpx type admin-prohibited".
> 
> However when I've tried this, nftables throws an error:
> Error: syntax error, unexpected with, expecting end of file or newline
> or semicolon
> add rule inet filter output reject with tcp reset with icmpx type
> admin-prohibited
> 
>  ^^^^ (under the second with)
> 
> Error: Statement after terminal statement has no effect
> add rule inet filter output reject with tcp reset reject with icmpx
> type admin-prohibited
>                                       ~~~~~~ (under first reject)
> ^^^^^^ (under the second reject)
> 
> 
> I am currently using two rules which covers TCP, ICMP and anything
> else, but would be better as a single rule:
>     add rule inet filter output meta l4proto tcp reject with tcp reset
>     add rule inet filter output reject with icmpx type admin-prohibited
> 
> But this would be better as a single rule, as the duplicate similar
> rules create complexity and duplication.
> 
> Is there a way to specify multiple rejection types in a single nftables rule?

A chain would handle this perfectly adequately.

chain prohibit {
	meta l4proto tcp reject with tcp reset
	meta l4proto udp reject
	reject with icmpx type admin-prohibited
}

Then, simply employ "goto prohibit" as a target in your rules.

-- 
Kerin Millar
