Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF938275AF6
	for <netfilter@vger.kernel.org>; Tue, 30 Sep 2025 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759229941; cv=none; b=ubktUE5hPKvOkT2wbYudQVgn8IMtViVDUPGdZeh3TgDOBg+Ml6malD3FwSapfiijZT/umwdNlTG0iPrerBeA1a+DVuVgbGD2wOxCdJNYZxafCT5B/qlPpQ78TpIpi7fVkXTEVMkbG+Jmp1rQ7pDt332wQC2Zqt7xt2s60XXKfQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759229941; c=relaxed/simple;
	bh=B7x7VKJaaQgHxtU25qa0hNhB9riKcdtxbIR4fZNumS4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=H8b2NYoZl5Vk1OEO9Mvr1U8A2APO2TCFxkybT5SwxxQXA9QUgb1zL5X5Z0sWEsZ/Z7Ebo7rbFuAxxLptXgviGhT+94r591Mk0H5L7ilUX7t9j64KIbVQSDmR+SKviap19/4LI7hs9vAtHXoxnZUouHmNKn/C029Pez/ISC+mUkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us; spf=pass smtp.mailfrom=kevin.km6g.us; dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b=V8tJrLif; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=di6gJFrx; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="V8tJrLif";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="di6gJFrx"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id B23C3EC0354
	for <netfilter@vger.kernel.org>; Tue, 30 Sep 2025 06:58:56 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-11.internal (MEProxy); Tue, 30 Sep 2025 06:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1759229936;
	 x=1759316336; bh=J3rRF5Pn5QvQUAdPIMsPLUOu7uFfJT/sxu948fjocdU=; b=
	V8tJrLifjems2lgLy5nS2Zhb81Fqwuoo1qhAhfNY+lq73avoywJqs47x17Y26OMR
	NkAaQctv7fdrXMiyeMJBGX1Q4jRZAFyp/dLWGjo0nfbSY2ERV5FF7PGbOAymgxJS
	I2S5gfRKMyNi1K4ufyPqrQfQ6NTRmblyK+2E/CXPJ9pAi0sSvzIp5M5tKQyLTTv7
	YCyF3AkBHmNWgW+SLC3yIMaQy16CFmGBhc3Qy8a3fPBEjSd+a8Kv5SAugTcb2gZR
	+VKdHqIA/p+o3a1J2qeeNjSWwCR3izV7ZfPZvVfoUgiVjU4OEtUfmsQfX++Xiv0Y
	DICuQOnU7QY71zor/ChHQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1759229936; x=1759316336; bh=J
	3rRF5Pn5QvQUAdPIMsPLUOu7uFfJT/sxu948fjocdU=; b=di6gJFrxll1RZ0JdP
	uqYXAx3cn7dAWcL1CtdWT7hnWwCBKhJ+W0H7I5QCVMouu1PygOHLk0kI+3ukHkEX
	ARTW01mLfV8i12MeVlrvQ06tS+eICjZ4GVkn19GYuwwickd1oZ/SowaD5a4nmGbd
	tTqeOAIS48qLHTuzjMK7htdmitChQSK1JT3tYk/9A/5nXP2G5rmr0CN1XwwNHhu3
	2f5c7tD0zU/JcI4fzzdQw7OM3cEP/5diyYUCxgwa70HU2RN8yNcTZO2qeBaf7agU
	9IWXsPtaPce/zdhuCW+GiHHxz7Rk2vg06Bdeg6aHDQyXAxS+ixUH119fpWTwgtkt
	4E5Ew==
X-ME-Sender: <xms:8LfbaCXvrlr1DYsTIH70VyMDAinfdzmVRNYayigI6HasQjVfDgJRRw>
    <xme:8LfbaJbkAS-0taHvmnQa-fPWr7w0bH7JhOMeD2QgrGGtJSdbqlkkAuRNCwslavJxu
    jWW1i1Cv3THAA8TCp-Eov2-0XhR-UEgODe1nf59orWoplyVI02gYFKn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdektdeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjghfufgtgfesthejredtre
    dttdenucfhrhhomhepfdfmvghvihhnucfrrdcuhfhlvghmihhnghdfuceolhhishhtshdr
    nhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrdhusheqnecuggftrfgrthhtvghrnh
    epgeefgeeileejleffkeeuteeghfdvvdefudekveffhfehfefhveeltdegffdvleelnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhishhtsh
    drnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrdhushdpnhgspghrtghpthhtohep
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8LfbaKGhw74saONN6xBpgxjJ6tYroP1Zx5SrupVHkjfWptuzCQDsOw>
    <xmx:8LfbaLT4YwN6hfBAVOkHNddFXm1Qjthi1r5eiRxfju7gU6PLAedvfg>
    <xmx:8LfbaBCSF0K6l7nU64goWHRmAeiDQmhhgKFGUjASbsCPZkaV33io4A>
    <xmx:8LfbaL19rplxG8DTDLiMrEBwIvjvthxduWND53qyfLZzr0L3IswGFg>
    <xmx:8LfbaAbOcJL3CWMz8g_-XgQGWxoXiz_QI1HZXyL0VamZQSTcH-TfCQMG>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1C4BF15C008C; Tue, 30 Sep 2025 06:58:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A3XVuJbdWRTo
Date: Tue, 30 Sep 2025 06:58:35 -0400
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: netfilter@vger.kernel.org
Message-Id: <14641fff-4f8a-4866-a7f8-a8493ca9cfaf@app.fastmail.com>
In-Reply-To: <db91f59a7a80fa48a46edbd90bf5da8a65dd6c3a.camel@scientia.org>
References: <db91f59a7a80fa48a46edbd90bf5da8a65dd6c3a.camel@scientia.org>
Subject: Re: nftables: conditionally enabling rules?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 29, 2025, at 21:53, Christoph Anton Mitterer wrote:

> Any ideas? Or is there something like conditional importing?
>
> It would be nice if one could e.g. simply say:
>   include "foo" if $var eq bar
> even better would be, if one could give include a further parameter
> that ignores non-existent files (which right now only works with
> wildcards).

Would you change the conditions and reload the rules on a frequent basis? If so, I'd suggest that you consider using vmaps and sets instead, whose contents can be changed on-the-fly without reloading the rules.
