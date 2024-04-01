Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5D4CB4A
	for <netfilter@vger.kernel.org>; Mon,  1 Apr 2024 17:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711992009; cv=none; b=cimEW99Lo5ditPy2Q+4vtJv+ueEUf4uHVRzPE7GJ7g6dgKVH2SzHysIjum5KtvxfPPiCEE99uzPPff5OXZBGDpXuQyFajmQANTsVEokjBpidENFGopiibUDp8MaKyhE2VvP/IM5eXOtYKGR2rwjmrDUEgoLev0Vfp8vqRq2RXOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711992009; c=relaxed/simple;
	bh=8isSY1wBui+Oxg/ysCb15Ifq45e+1OJpltqPVIEea9M=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cP0swuMd1nPb6BFTZ5PFroMqhNzX1RAupoe91x6KoFA/7fcecFFPb5dTrdV5oRe9ykpygDnmmH0NHMWs053en0MDahYN7QN+mi4BDdMgq5iFO9edc6+6NKUxU4apaWzVByGGUQDAxlGAAgXwxH6Yusc9B2xXWO7Qfa4F0A0YlXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=oU0rl4Qk; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="oU0rl4Qk"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4V7d7656YWz9tYf
	for <netfilter@vger.kernel.org>; Mon,  1 Apr 2024 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1711992002; bh=8isSY1wBui+Oxg/ysCb15Ifq45e+1OJpltqPVIEea9M=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=oU0rl4QkKDtQckh4GfOc9cf63uiHgdAEIwsknYaxMdakxHcKfCNHWN4PXdKtj9CHK
	 K3w0QvYw0186OasyC4/b8fO6iavhW3ZlriaRffILo17BbR0WII+kj9hGkugA3ld+yb
	 9GuOKLVw1MND/gbenGQ3FoAKf/jnRMwKXinOzTuQ=
X-Riseup-User-ID: E597EEAA34DA9C32EA431F48A8353AE6A183C1F4D1C21606E67EF4D0E9CF8147
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4V7d755NDgzFtn4
	for <netfilter@vger.kernel.org>; Mon,  1 Apr 2024 17:20:01 +0000 (UTC)
Date: Mon, 1 Apr 2024 17:19:51 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables: How to match ICMPv6 subtype in a rule?
Message-ID: <20240401171951.6111f867@localhost>
In-Reply-To: <20240331193407.3e40cb6ed1c4b6e9fb038c1b@plushkava.net>
References: <20240330194139.561b5a24@localhost>
	<f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
	<20240331170259.068a0db3@localhost>
	<20240331193407.3e40cb6ed1c4b6e9fb038c1b@plushkava.net>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks Kerin!

