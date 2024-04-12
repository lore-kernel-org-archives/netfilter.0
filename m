Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA154FA0
	for <netfilter@vger.kernel.org>; Fri, 12 Apr 2024 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712921953; cv=none; b=UfqjiaI/jKkvrCidB+HasX1xJa2OuVdNT6u3ZGWbJJHlSmtGF7EdwNBL21YkO2+8TLzc/nkJhdXhMhrxJolk97nAT2PAcRNIetWSLNjEOWVfjligOoEnEC+goC/nBUWsVyXU3A3qXpebLE6utKMuwbplb5yYlAcPfQt/TAGf7m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712921953; c=relaxed/simple;
	bh=AIGIzKiyAoX1Af4qQpVJyj8TDXRNQYf7jguAnDWtk0U=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aWF9N/JlFpbrlPFO86K3PUxX8ItEDO5PSt9a58pHX83SE2yZyskwLjrEfpsvQVhXAXKBenNgbAvxWnskI81+Maqup9uXj4VUZQBG7Nq3syHU91Aywjz023fyRl8yv+9Ba+/mr5TTGuHI577m9Ql/94P1r6Isdsikmg1SlAB7Wdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=MWrlS+9+; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="MWrlS+9+"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VGF2k3DkFz9vyD
	for <netfilter@vger.kernel.org>; Fri, 12 Apr 2024 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712921950; bh=AIGIzKiyAoX1Af4qQpVJyj8TDXRNQYf7jguAnDWtk0U=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=MWrlS+9+xszzofAlBFudwXQ7jXuPbncratDv+7xwuM/V7KE8EWR+qrJ27MXgTLwGw
	 50NcrvNSy8c2gfH8+HWASi2+osyUGblUQp9xRae/0xYT8wugVcbmS50XdzbuvLcLmF
	 tBzfJ5JvoMwT2KorRZbfvfnfGzvq3a3werAFMr7o=
X-Riseup-User-ID: 41E1931CDED3658841BA750CBD762E881C56E986F49736EABEA7BEB6053204C9
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VGF2T6kcLzFw3D
	for <netfilter@vger.kernel.org>; Fri, 12 Apr 2024 11:38:57 +0000 (UTC)
Date: Fri, 12 Apr 2024 11:38:48 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: connlimit from wiki.nftables.org not working
Message-ID: <20240412113848.0fd84173@localhost>
In-Reply-To: <34397891-d5b8-45ca-8bbc-190a71b34cc6@app.fastmail.com>
References: <20240410172343.1f7f5ee2@localhost>
	<f0514bc1-c1dd-4f24-97e5-8c40807dbae9@app.fastmail.com>
	<20240411165412.0f0c65ce@localhost>
	<34397891-d5b8-45ca-8bbc-190a71b34cc6@app.fastmail.com>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Apr 2024 21:04:53 +0100 Kerin Millar wrote:

> # zgrep NFT_CONNLIMIT /proc/config.gz
> # CONFIG_NFT_CONNLIMIT is not set

Same here.

> With that in mind, are you able to "modprobe nft_connlimit" at all?

It returns a fatal error that the module is not found.

All I find when searching is that the module is missing in different
distros and some references to CVE-2022-32250 which doesn't clarify
much:

https://research.nccgroup.com/2022/09/01/settlers-of-netlink-exploiting-a-limited-uaf-in-nf_tables-cve-2022-32250/#rip-control-by-triggering-garbage-collection

I wonder if distros have deliberately removed the module because of the
CVE or if there is something else.

What would you advise?
