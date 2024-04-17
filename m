Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96483CD1
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342571; cv=none; b=ZI7Kx0X8u6hqh/8BzDP8e3MTWFKWS1pGpQkeBPTnR11x3n0ruF1GU95MJK5fOvpQzrSmC4mEP6GMropJAqYpSTVNR+JNALCNmav6zR4fYjd96OnAxYdcqx2racTbcrk9yTFItZfwBeNrJUYvC4KdqEpGUKKlBskbp2IRSYHZrag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342571; c=relaxed/simple;
	bh=brvipSLYSRtNAzAQDJQBrfo62ezc8rIzSFBBARkxaOs=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtDDGZQCbMFjUZXkeZ9FoES8dBPbqgXn4jqIf7/HFr5BpbTRwVXMWxVC+Hd5tDbgb2qJKVPWP5l/vqmdDHWsIFYTO9vxBxmxINGE3L+Lbkl8k9cHVdyCHLrod6/rwBZGR30R7gvRJIEycBjGaKTgtFNOu8zOJWrOastPYpmB2r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=bDoc+98w; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="bDoc+98w"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VKDbY19rlz9tlH
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713342569; bh=brvipSLYSRtNAzAQDJQBrfo62ezc8rIzSFBBARkxaOs=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=bDoc+98w5cWkS6bMONTfCClkJ00ZbrMeLhFrJSlTgRNoObSW895TjSshSxOgsZA1N
	 OEeHc9l3Qmvi5inw6S7siAAZSl/7aL4sSl80yKDHVxpUv3dQd6TSMNM1jdRtlTASvu
	 zIALjf7CTNNLJ83Nc3aAbub/napoBUX7zVpeNW9s=
X-Riseup-User-ID: A15B67A52A515050105D88B3C98E9FDD52E0E7B2CB4AB37316C9C4DDD840B281
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VKDbW6l1MzFtSk
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 08:29:27 +0000 (UTC)
Date: Wed, 17 Apr 2024 08:29:17 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-ID: <20240417082917.5cbb38ae@localhost>
In-Reply-To: <20240416210851.a9f14dc3c046ce42af06d87a@plushkava.net>
References: <20240416174748.5612bd27@localhost>
	<20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
	<20240416191250.04884e9b@localhost>
	<20240416210851.a9f14dc3c046ce42af06d87a@plushkava.net>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thank you!

Your tool works great for IPv4. I couldn't get it to work with IPv6
addresses, as it says:

host_to_ip: failed at /usr/lib/x86_64-linux-gnu/perl5/5.36/Net/RawIP.pm line 480.

I also had a look at Scapy - looks very powerful indeed. Needs a lot of
learning as well :)
