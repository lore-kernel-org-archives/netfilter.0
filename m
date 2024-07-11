Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1316EB61
	for <netfilter@vger.kernel.org>; Thu, 11 Jul 2024 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725300; cv=none; b=pdB6SF7Qn+XV+LU2ly65d9/AW4QS+L8wtxZnpoCwx+/45S0u32t8d7nGcOHOapFOkpWjzopBi69bxIkM/hWpfUlLs7jsWj+3UPl1F8xLYBO1HPMR8DWznbErPRUSbb3GYBVGs8JDS+ltHP2iaBFDe6xyjQN032nygCMzIlGCOto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725300; c=relaxed/simple;
	bh=vgaqrkTnqz8E+a6EuIf0Q9z4cCabkYR9fsdsCrZ/Mwo=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BC//zH1I18xbkabU8fuyHi5xl5DRJfrhjcYgwhhM8iju0oEn3e+B6kA4iHEzJ2IYK/2tV/wW1ObSd2TabZVUQn8QK0JlITt/ibsT9vjuaW7b3Qi129A0yeAEHD7ICmFxTrGJSTDGBEjbFglOno6JOtiJMwSOyh+8QvXvkUrhlG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=PJXpRulc; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="PJXpRulc"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WKkv00g7RzDqNV
	for <netfilter@vger.kernel.org>; Thu, 11 Jul 2024 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1720725292; bh=vgaqrkTnqz8E+a6EuIf0Q9z4cCabkYR9fsdsCrZ/Mwo=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=PJXpRulcIBoAvPiWbvFDkFskrgyxb2soPYl12fLcqyHYAFrPQBRcaqmu29D98e4fc
	 tNBNsmEgvEj6sNlrRuaLPcE9Qkp4OBFgUqKvILJYW2lq3cCjOQMpKMf96SN1v05d1q
	 KHzkx8Oc3qS0v//v9i4/N2hFGsudAh5ZF+vhqy+c=
X-Riseup-User-ID: B56BAA46DAD279B840BAFD947AE0D7197941825016B464B7469EB61937DFEEE9
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WKktz0nFNzFvM4
	for <netfilter@vger.kernel.org>; Thu, 11 Jul 2024 19:14:50 +0000 (UTC)
Date: Thu, 11 Jul 2024 19:14:43 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables rule optimization - evaluating efficiency
Message-ID: <20240711191443.26d294df@localhost>
In-Reply-To: <1c12afa3-40fd-48df-9076-92277570ef3b@app.fastmail.com>
References: <20240702190318.618a3933@localhost>
	<20240710183451.0f193976@localhost>
	<1c12afa3-40fd-48df-9076-92277570ef3b@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Jul 2024 22:27:02 +0100 Kerin Millar wrote:

> Indeed. It cannot be presumed that all instructions are equal in expense.

I suppose it may actually be even more complicated if different CPU
architectures (all capable of running nft) are considered in a
comparison. So, for simplicity, I was hoping to be able to evaluate
things at least on a single architecture.

> It is a pity

Well, I guess I have touched a subject not interesting for many (hence
not documented).
