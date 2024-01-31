Received: from foo-jono.foobar.fi (foo-jono.foobar.fi [193.65.3.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FB69D39
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.65.3.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706700528; cv=none; b=G4lyvhR9DPeS2gFGY3cMMNwjN+Xh54M5F81DHRJLA97sRpooUerPyRphfxPssJ0niuIBP+wzqQMQ9BgtWJWYJSnE2mtdq1XCNtL/QPiEW2gWtK96rkvK3Hj2PO9pRnmkhpuKMjD/eOxIHVtMBCCa7ezq1Fsdt262g4hM32xZeOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706700528; c=relaxed/simple;
	bh=JqcdElF92pjKSC9h0hqvT7yEb7ZMM6JRlqP8RtZ3Z8o=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3Vd42zikQI8ShJveJI15j6uOx6czykL3YOhDXXkpB18UwrHcxH5yfhzAmsNsQOcV345g0QWGcVxgoZAeM4SQxqpVfGiLhl15W/u1gYFSjgtXYP8x1sBu2dW0tKk/bhFPIdtUIfaPp/kW3jbKRmnLm3662tbGl6hAyHFW/7Dl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bbbs.net; spf=pass smtp.mailfrom=bbbs.net; dkim=pass (2048-bit key) header.d=bbbs.net header.i=@bbbs.net header.b=VC0q0qrp; arc=none smtp.client-ip=193.65.3.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bbbs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbbs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bbbs.net header.i=@bbbs.net header.b="VC0q0qrp"
Received: from localhost (localhost [IPv6:::1])
	by foo-jono.foobar.fi (Postfix) with ESMTP id 4TQ04J4bXrzGw5CF
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 13:22:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bbbs.net; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:references:in-reply-to:message-id:subject:subject:from
	:from:date:date:received:received:received:received:received; s=
	key1; t=1706700127; x=1707564128; bh=JqcdElF92pjKSC9h0hqvT7yEb7Z
	MM6JRlqP8RtZ3Z8o=; b=VC0q0qrpMc/iDO9OxxxCyrsRufM65zUQ6q3rbm2nohU
	r2FQdXiAunLazjgQDGXi8bN6Qn4G7mZsfe/Qe/4QxMVjnyPulZfdECneZxz8yn4r
	WgtTzHoYMhZxA0uLkor2F0FFd7zitBRhfojJXueamNQ5esRMptTpehrIxq0atqjw
	OJKhC6RNzDpSt/5LoisbygwgNtxCWYrENVAYRCehxHW98qJCVk0X8MUYb9GxzHed
	lijzAyHvj421Ylm8J0ph5Xhy6P644QIEerOG17odf2VLryWrjXxm2P7Tj3vSgm6t
	ppo5B5N+2Z9GVa/5YGNteQYTZH/uLFPwOBmL2j2oNdQ==
X-Virus-Scanned: amavisd at foo-jono.foobar.fi
Received: from foo-jono.foobar.fi ([IPv6:::1])
 by localhost (foo-jono.foobar.fi [IPv6:::1]) (amavisd, port 10023) with ESMTP
 id ZEUUaTpuum2N for <netfilter@vger.kernel.org>;
 Wed, 31 Jan 2024 13:22:07 +0200 (EET)
Received: from risa.bbbs.net (dg4ybwyyyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:2e00:1900::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by foo-jono.foobar.fi (Postfix) with ESMTPSA
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 13:22:07 +0200 (EET)
Received: from localhost (localhost [127.0.0.1])
	by risa.bbbs.net (Postfix) with ESMTP id 4TQ04F1QxRzcDvht
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 13:22:05 +0200 (EET)
X-Virus-Scanned: amavis at risa.bbbs.net
Received: from risa.bbbs.net ([127.0.0.1])
 by localhost (risa.bbbs.net [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfnKYqQmH8lE for <netfilter@vger.kernel.org>;
 Wed, 31 Jan 2024 13:22:04 +0200 (EET)
Received: from cobra.bbbs.net (cobra.bbbs.net [IPv6:2001:14ba:2e00:1900::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by risa.bbbs.net (Postfix) with ESMTPSA
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 13:22:04 +0200 (EET)
Date: Wed, 31 Jan 2024 13:22:03 +0200
From: "Kim B. Heino" <b@bbbs.net>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <20240131132203.7a6c6eeb@cobra.bbbs.net>
In-Reply-To: <ZbofGH6H_mhSfAg0@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
	<e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
	<Zbj04V-90zpQwEzl@torres.zugschlus.de>
	<20240130152247.0303cee7@cobra.bbbs.net>
	<ZbofGH6H_mhSfAg0@torres.zugschlus.de>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > Foomuuri [https://github.com/FoobarOy/foomuuri] makes it easy 
>
> That looks interesting, but it is an entirely different language that
> needs to be learned and understood. I will look into it. Where do the
> rules created by Foomuuri end up? Can they be inspected by using nft
> show tables?

Command "nft list table inet foomuuri" (or "foomuuri list") will show
them. They are also saved to /var/lib/foomuuri/ directory.

You can dry-run it with "foomuuri check" and then take a look at above
directory.

This is probably getting bit off-topic here so we can continue in
Foomuuri's github discussions.
