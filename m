Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F6213148
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731433627; cv=none; b=Fc7sOr+7bg8XMMw1j9C3ncN1k5xKOmzyOJklkYd1/SzdsPxiEL0YAmMIsjjcqVU6jpBhgQVK0AW75p9KMZvPI9Z5KDDPac3gY8Yx+r4oXHWRVJy1nkeBtPiY7dwo190PBjvE8qJsVd8vKVe8qLVHgo+DDnfIlj1XcudN/4IHTSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731433627; c=relaxed/simple;
	bh=E0gBBWusucHtVVw/Ncbtyb/GuF+6JiNxCxGy6Em4/CA=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Qqnnuav0HCw6y4sRdWmkfniD9GSOjaw5OC57cdjWKOkUiSGqosDQwbUns6Tb6I/tgK6aRGGvdpr1Yj07FaDA8mbDkOVneRsUAi7EXO5ibo+gzF0p5owijjisBzNtABl1BMVZFcy4EZnoXQU96J5vv7IiIyZxrM+GnhC+mhhtN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=hLoaNklk; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=yG+Uyhnh; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="hLoaNklk";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="yG+Uyhnh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=E0gBBWusucHtVVw/Ncbtyb/GuF+6JiNxCxGy6Em4/CA=; t=1731433622; x=1732643222; 
	b=hLoaNklkA8KYjsuC0acoMu2hXiR1267p3R7uqBUa763kvjxs03eH+jRKhGPvWucnNwEgSQhd5Hh
	lL6tDWLPm4tXCkgne92EU+aLJ5qs1ROBoRLI4gefBwbzDyVOJiR8CMSzLktXFN25BCR3qlvzwyLz4
	aCb8apUVJxCNYBlkOw8=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=E0gBBWusucHtVVw/Ncbtyb/GuF+6JiNxCxGy6Em4/CA=; t=1731433622; x=1732643222; 
	b=yG+UyhnhqX5c1XPOSK/sxg8sapjpy7kGFPkmUvKnWUYnZwgkIykUekeLV2wpPJezq82sLz4lBxC
	dfcANHmwLAA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tAuyb-000EMz-0O
	for netfilter@vger.kernel.org;
	Tue, 12 Nov 2024 18:46:53 +0100
Date: Tue, 12 Nov 2024 17:46:50 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: ipset vs. nftables set
In-Reply-To: <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
References: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org> <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
Message-ID: <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12=2E novembra 2024 17:31:11 UTC, Kerin Millar <kfm@plushkava=2Enet> wro=
te:
>On Tue, 12 Nov 2024, at 2:55 PM, Thomas Koeller wrote:

>Yes=2E Rules may only reference a named set from the enclosing table,

But one can have multiple hooks (chains) in one table, even with the
same priority (i not suggest that)=2E Thus one can combine multiple
tables into one and share sets, eg=2E in raw & filter hooks=2E

Or one can mix iptables-nft with nftables, it requites more carefull
settings (hardcoded iptables hook's priorities, flush, etc) but it
works=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
