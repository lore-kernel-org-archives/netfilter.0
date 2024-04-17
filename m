Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A9B13D290
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713363171; cv=none; b=jH6tcvBbigrWgZpqM62CUWzXF8NwyEeNc7xWLbLorkV2TfDB8x0WNNkekB0TXhfzm/zQulNo513ISKphaalSBTzk24SFhU2AGxh3ww8gZllj+HHaNCoJLPNv3Y3xKnerx1Fc/G29+/lb8MU0bqCdX21JCw9IYeuyvCLWgUV8tcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713363171; c=relaxed/simple;
	bh=pTLMcH4oDDv4Qv+ZWwDlxfuINR6BLh99ytjQsiKSUaI=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hzd8JlZF0mTmb5Im9WeQCUfnGY6oY651q6BURTHorMDqspH9G7GZ2HmuSSWhUC9IexFjPYbQI1HLRuU/cr7XdEZ62uX755Nov4fPYNXVsUWzytEDemO7rxHS4PO6A2r5ZQWS98dq2PVkiBBnhFcTBu7+t8HGTCdeWYj/9n4DibI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=H3nOLgVl; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="H3nOLgVl"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VKNCj44B3zDqjV
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713363169; bh=pTLMcH4oDDv4Qv+ZWwDlxfuINR6BLh99ytjQsiKSUaI=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=H3nOLgVlrfDfD2KNVryvx+dmkdyICAScvk/FGc5DWWsk0Pkq5UuungXxHZ266DUmO
	 sDm6lNDei7ofxo/6ImaB+jNf4yNwrcMoP1onKMFibhw/0dUwrGJakB4t2RzR9MbJYT
	 gvkPEOPWi07ubJ7m7IFSSUAj8VBwkgha6F/b87ZQ=
X-Riseup-User-ID: 25B3EF4DB40A5AB1BED680AFAF87ADC8D06510138A02DF540320B9C5A774A54A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VKNCh1zklzFsZl
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 14:12:47 +0000 (UTC)
Date: Wed, 17 Apr 2024 14:12:30 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-ID: <20240417141230.0bc7b1bf@localhost>
In-Reply-To: <2e3ee5dc-0628-47c0-937b-21daac1c76c0@app.fastmail.com>
References: <20240416174748.5612bd27@localhost>
	<20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
	<20240416191250.04884e9b@localhost>
	<20240416210851.a9f14dc3c046ce42af06d87a@plushkava.net>
	<20240417082917.5cbb38ae@localhost>
	<890e6c2d-ed3a-4a0d-84ae-5cd1a2425316@slavino.sk>
	<d7419059-cfb1-40df-9280-c673775cb04a@app.fastmail.com>
	<fb8c2fee-c2fa-49ec-87f9-c563d04f3343@slavino.sk>
	<2e3ee5dc-0628-47c0-937b-21daac1c76c0@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Just tested on Debian 12:

# hping3 <host> -c 1 --syn --tcp-mss 100

This triggers the discussed rule (output from 'nft monitor trace'):

...
trace id 98d76ca4 netdev filter ingress rule meta protocol . tcp option maxseg size { ip . 0-535, ip6 . 0-1219 } tcp flags syn log prefix "TCP MSS: " counter packets 0 bytes 0 drop (verdict drop)

hping3 also doesn't work with IPv6 though.
