Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D481E520A
	for <netfilter@vger.kernel.org>; Fri, 12 Jun 2026 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781243365; cv=none; b=kZOYhXdSEaBtocxfA1XSDbQVvUMTw4xsCFogEuulPyBbZSZsdVvBxPuiVOi59adMWgtUQFHBcfPyOs0d4jkTEZUrP3wJp/t9qCBLduLeQtSEwGUOgsvA5j2xL+644VGzfQBZU2K+RH7wR4TohRgOqeVu5tN2138//0NJ0VZ36H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781243365; c=relaxed/simple;
	bh=ojYttcr7AOPUK396ThMaSOjBaRsBdRK8oIycpP6lKJE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WPlUeZRzyJTeJkdTUIm9DBZ7wezTxAwDvWJt4hX+Afpc9KqoTpVZ0s9k8Sgg3H4vJto/2dCOIMzvthGhvAM0qpE1XH/O+UbQIUu6gPvMzeCkqVT4IpX3Mb4RcBFIRLFXRIIfNZBJRNsthGdYo7anDIHb4rSom1tizax3n2o4OAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=d4L81kaP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=digm3Ebg; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="d4L81kaP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="digm3Ebg"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id CC1E3EC00F4;
	Fri, 12 Jun 2026 01:49:21 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Fri, 12 Jun 2026 01:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781243361; x=1781329761; bh=ojYttcr7AOPUK396ThMaSOjBaRsBdRK8
	oIycpP6lKJE=; b=d4L81kaP7zWTlejLzbiQ1pbq8Nxxnp6dS4zcBUX81NNQCjYs
	Sy4wV/fCIE2nWF/9wN6f9xt4ZoSy73whcmHkKpTVqIDIGZZFfj++xcaXHUyhM9WB
	D0EG6YBpcoxhw1CnriRRltjdFv8EyCzNleCSdZrXu5x1EpjY46UmDu4NQc3vcBPf
	kQxGp9CW7YM+imZCvJxYSKwSGfEpXVphGkFGH9/cCAytKUIRgsFzn1CTKUr55nSR
	Mq4jJjVxSUD298bl8KGPCy1evgzPxe6Ggssl40YRdR2J+VI0ShCFXhnQGlB4U63b
	NxrKkyk5bPz5b4x0QvEKX2DqBbg4hJ+YU6Wk8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781243361; x=
	1781329761; bh=ojYttcr7AOPUK396ThMaSOjBaRsBdRK8oIycpP6lKJE=; b=d
	igm3EbgjLzagi2DEUIuftgqIsU3sRpr1p3LPYbWfUKkqqYNKb8epE6cIWlF//Xzf
	ECC8ih69I49U7OleBPrz8RYKphYoFnIjl9TewGynWLL/oq3UvdVeyl91gVrrSq82
	B0vJRRLlKqoXxoKHXwprMigMiR3aanNIMqp+5gfH0OG534JHvw5XDMfxhpRQzXXr
	hBOgbvXPBxn4V07CquFaigoAkk3P6nI4PdfmHw79Q/6rkEbb/68kpybBRqCbqxV6
	Cnz56EhVJWWIR800eZUCrpV0PGGlQwvpPNoqPx/E0P7tioMtvJYd+fxUl4hNZiFa
	/ks04yxyCIJWtPa2Im4TQ==
X-ME-Sender: <xms:4J0rakMuS1XFOvPckJWTQv2caYwt6j7aYTnMU9_7giiItwO6POFXug>
    <xme:4J0raly45XfL1MB_tyRHWH9FLG5ljCWqoco1B1T10L0jumxaZABr_VX5Gr0_cwyoN
    zf9nATQxtlm2StDlZHf9g-FmKNq8T_7OOffwuIRUhvt5nTXa2Y>
X-ME-Proxy-Cause: dmFkZTESbOgUwCmwCTVhG0zXvj9gx14qJTsVvBhHytbl8SX/KeYNCvMqe/a+kT2kufuDA2
    YxHl/MUgXfKGChSArv/XCl8I6BMjZW9ofJDPTT7YvHKZx+jA+yHYEPL/XVxDsdPwPPFhtz
    d5t+3NPJPxgG6ebeOyMsPLrGw9HpHidcVMW+G6v8EYq226mkIRC1ELrmNw6dHvWgQYcLar
    gE1HYRC0JXlt7Bs2IavctxNGEkUinGo2vLLjQile1P42PphRLxunRyhbbwh0LVEnirl3cX
    TMAepfV3PKBjDvfsp5LkP83nGx/RKBCvYXl4uTA0um8ctGBRU+W9LgjdUTd+9XyYOOU6MJ
    N0zZqRNphoJnvwFqqIQBpzRO94cwBOl7lpUsE86K9VWdE9+yGem9d02o+gHV0eM5liKiCh
    rslwoZU101rUfzbG6DRyjLDB6cvni1LjpG0AFZAIkeNvMygqpnNycb26+BrbGRJr/I4ikL
    m+Hpj5BIsa5iUImAqnHPA+1VgPNjAgoL6NYVoozXR8eYs8hxxBqpyKl2B/1kvqZ7GSdHep
    2he8McTZHOLUodD/DBpIONTscKifvdN2oVVkaifFD8N6/+/QE2B+Uci5EUpp3csdu6+ba7
    wyY011IH4raRZ+RO3QLxnNSGkl5M+6aCg9z1OmJiqI5pcSeOVWu3x67sS3sQ
X-ME-Proxy: <xmx:4Z0ranzhKoKS8b4ik8FB3oLG8iSAICMo4e3f8QJvwDMANVN_W6Hh3A>
    <xmx:4Z0ravbquGMXzjUV9BR8826PlrFuavdnmC-KtSCWKfht8begSeN5jA>
    <xmx:4Z0rapQYcPV0XdK3ZJhrvNHtjn1zOBJBoAvAQjDCQGqc5SJfzyAtjQ>
    <xmx:4Z0rapwvbpoYfQP4oE2mKxzn1EDs4fAltJUbAftx59-zoLorh9jcWQ>
    <xmx:4Z0rajuWSwtkUjR-ZNQs1RrtAUjW3XryG21Qnc441ppANkWEFahET-YQ>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E3A49216008A; Fri, 12 Jun 2026 01:49:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0ZtpkyXIlXs
Date: Fri, 12 Jun 2026 06:49:00 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>
Cc: "Jan Kasprzak" <kas@fi.muni.cz>, netfilter@vger.kernel.org
Message-Id: <ce6502c0-8576-4672-9227-118f515f334c@app.fastmail.com>
In-Reply-To: <aimDYp2y_oxSIIzi@chamomile>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
 <ailH6MomrFCvxH8Q@chamomile>
 <74dd050a-3587-4fdc-b06f-c82a9fd398e4@app.fastmail.com>
 <aimDYp2y_oxSIIzi@chamomile>
Subject: Re: Logging SNAT'ed connections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 4:31 PM, Pablo Neira Ayuso wrote:
> Thanks for reviewing, v2 is here:
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610151735.192168-1-pablo@netfilter.org/

I have now applied this to a production host and tested it in a number of ways, including the use of the --src-nat option, both with and without an option-argument. In all cases, conntrack(8) behaved perfectly.

--
Kerin Millar
