Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A53E13FD99
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731445454; cv=none; b=cFh+jS7+TqcHvOKUii/YgsohjkBzqB6Ggq1HV/JbgWRfm6oIcUgXMEPk2m91kZ7FDZrRY0AFxlgnmlR04XEKaW68Fyyh9u4XdNHBjRXhCOYUOmAUPU9Ozt9Xl+n2IJ51Pkjd+TLq+Gc4hHWEMqCXHUANB/yGVVq4eA/9D1eE0xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731445454; c=relaxed/simple;
	bh=7CMCoHdr60HJJLAIp/4ZvnvOyKvA+bxwsJmDkx52nmY=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bvZA5QvAlWntgYsPun6XuQOFBqTR0uzFWEMbBRWt+itOUk+IBJW3xTqIemDroQ7+s1q6zO5OoRsYDtmqcqiYiN79hL0+bpF3XF18dJ3y2PeAS+KbToTYHo68u1/OGoEZrDVKllC7q6Z/9/qNj8+M0Hujq3zV3QioKJmQEGawN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=tv+e6mYn; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=EQ3g3ZtY; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="tv+e6mYn";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="EQ3g3ZtY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=7CMCoHdr60HJJLAIp/4ZvnvOyKvA+bxwsJmDkx52nmY=; t=1731445450; x=1732655050; 
	b=tv+e6mYn+oWvtbgksea4MilahzjYOYFDWJvBX8adab2OPlU7pKAx32EDpOwUAQF/kcm6ZFcFhDc
	FOCXTlZ2OqfvzxlK2sQFWDGmcx2slxWFjXwXjFyQ8RSbSqa5Voeh2FLJBsBAHBCkZD0PE6D9G8FCL
	YnbhiougYR5y4efA7i4=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=7CMCoHdr60HJJLAIp/4ZvnvOyKvA+bxwsJmDkx52nmY=; t=1731445450; x=1732655050; 
	b=EQ3g3ZtYPiX3EYP1YSQPF7+YZdnUidiwIRFUcz11y/33zd9298LXBKBo32u6pE1606rmDkRVUxZ
	XLKgYBmhUBw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tAy3T-000F1e-22
	for netfilter@vger.kernel.org;
	Tue, 12 Nov 2024 22:04:07 +0100
Date: Tue, 12 Nov 2024 21:04:04 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: ipset vs. nftables set
In-Reply-To: <06f7d512-8cbe-451e-864e-73cc939314cc@app.fastmail.com>
References: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org> <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com> <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk> <ZzObEveL6rLYzv-b@calendula> <20241112181855.GA28817@breakpoint.cc> <85dff1ec-b8f0-4ba0-a893-d942d12fed81@app.fastmail.com> <ZzOzJcTdsryZ-GxZ@calendula> <06f7d512-8cbe-451e-864e-73cc939314cc@app.fastmail.com>
Message-ID: <21C0CE1C-FA6B-461C-9202-1783D65F9132@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12=2E novembra 2024 20:23:27 UTC, Kerin Millar <kfm@plushkava=2Enet> wro=
te:

>If my interpretation was incorrect, then my post can be disregarded=2E Ho=
wever, I would still be none the wiser as to what you were instructing Slav=
ko not to do=2E

My intent was, that when coming from iptables, one is using
the same tables in nft as he had in iptables, and that results
in four (or more) nft's tables -- raw, nat, mangle and filter=2E

But in nft one can take all (needed) iptables's chains and
place them into one nft's table (per protocol or in common
inet table), as one is free to set appropriate chain's hooks
and priority=2E That wasn't possible in iptables, as its hooks
and priorities was hardcoded=2E In other words, the iptables's
tables have different purpose as nft's tables (only grouping)=2E

And as one is free to set chain's/hook's priority, he even
can set the same priority (and hook) for multiple chains in
the same table and it will not be error, but often it is not what
one want, as its order is then undefined=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
