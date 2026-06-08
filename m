Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0CA372062
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780937809; cv=none; b=HzZoiC2EftHc+xzTI8Rr1a2xWOHk1crBv0066RBRfoBYdgUh/5n1B9ZLGDNKrWibeIbAXYcG7+nemrH1rKbejhbl6WFWbWmM9AaVE9npufa3TW2luGRU7g4+/WGN1GUu8IRzW2tbChEhXQrDusrnDBXoq6LPaiGZsjtnq0xJVew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780937809; c=relaxed/simple;
	bh=LfiPmKDDvjBVgD6ZuZW4zOlKvGRwU1GB7HOBeTBQ4ic=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JYsinvmf8AwnZiT6+HDhWm4fE/9lP0okKc5if3QirS2zAQ2Dw8DZEQwezz7mQrBfwJj5ofsC8DjCGqyqMIn4th6JFVnz52yDtD2nrzqYrViY9mLVOirlfB6Fo2pEQ58PVlBaYcYCPxXmNKt6VfS7rH4ZatZstba47GrPHH3zUIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=Dzwc/F+8; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=gCqkMm/f; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="Dzwc/F+8";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="gCqkMm/f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:Subject:Date:
	Sender:Content-ID; bh=LfiPmKDDvjBVgD6ZuZW4zOlKvGRwU1GB7HOBeTBQ4ic=;
	t=1780937807; x=1782147407; b=Dzwc/F+8fIB+2m4qnreLWzBa7RyLWRH80yEnESyRYOa+qAr
	9NoaaRgixv8ohftjTs5QTI0J/hiAL+CDn7JtoA0QefzBxalqV1ZTXuDGmaJLnT906vxysmmQItUeX
	LCTHrmddOwHx7e9aZmA5dKJBkvQ0Svl6KFq78nhMNZ0LseE=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:
	Subject:Date:Sender:Content-ID;
	bh=LfiPmKDDvjBVgD6ZuZW4zOlKvGRwU1GB7HOBeTBQ4ic=; t=1780937807; x=1782147407; 
	b=gCqkMm/fFcH1hDX3hkFZOVPOesXCwV1kqiYMFIx6E52JVajZtevkcXLir4d+xsjYW1BkEJNz5d4
	SnDZ/22ZZBw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1wWdHI-000sop-2g
	for netfilter@vger.kernel.org;
	Mon, 08 Jun 2026 18:56:45 +0200
Date: Mon, 08 Jun 2026 16:56:42 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: Question on rate limiting on nftables
In-Reply-To: <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me> <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com> <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk> <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
Message-ID: <CF337785-88C0-4EF8-95A7-2C281AF067A7@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 8=2E j=C3=BAna 2026 15:01:37 UTC pou=C5=BE=C3=ADvate=C4=BE Andre R=
odier <andre@rodier=2Eme> nap=C3=ADsal:

>There is a big advantage on changing the port number, though=2E It is
>reducing the noise considerably=2E Also, a connection attempts on a
>different port should immediately raise attention, as it is involving
>more than a basic SSH scan bot=2E

I used high port for ~10 years=2E Yes for first year or two
the noise dropped significantly=2E That is from server where
SSH access have only i and password auth is disabled anyway,
thus i didn't watch it then in detail for multiple years as
it was just noise=2E About 5 years ago i did some closer
inspection and i collected some stats, and i found, that
in average there was attempts from ~1k unique IPs daily,
with spikes over 2k daily, i decided what i stated -- not
worth to setup non-default port on clients=2E

Thus again, changing port is only short term solution=2E My
scanners catching stats (on some sort of honeypot) shows
~8k unique ports scanned in last 90 days, and that are only
most obvious scans blocked after first acces, without well
known scanners (shodan and familly), which are catched by
other way before=2E=2E=2E

Try to guess how long it will take novadays to discover,
that your SSH listens on different port and how long it
will take to appear/share/sold that info on some dark
forums?

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
