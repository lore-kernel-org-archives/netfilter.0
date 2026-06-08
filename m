Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CDA4071E3
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929525; cv=none; b=VxePIqojrKk/WQWrVkxYRb0crA3OOJT/pNNkxHT6DcP4g2OLJD1a9c1bTSw8CSLDtvttjWu9gZrm3ImLtDlLas4ApzZM/DQ1firJNGEGPDpwFlGwIEGR1d6+e0bl9P2mVT9L7wLLryhV0Nm3e9E3X2gCrxzWL5AOfGzVNN8Gz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929525; c=relaxed/simple;
	bh=9Qtx+eCsdo0/CiffX75i1o5LqVHmjsueZz0A6tKUcis=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=O5IrrxcAZQZrkJ7z3BFL/2JhwkCqF0+XUxjIRMj02pKsdtqQ712TRy6SpfxZrcxU5klCPSJQk2mTI09VVyJRBCCINVmAV88vPPYgoT6M4iyeVcj/htEAegE4NPyiiUN4FFpODJFl1DTIyYsjaVYLBiEefuSslX1thVwaMQo6BNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=FQSPpaEl; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=CJP/eOS0; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="FQSPpaEl";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="CJP/eOS0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:Subject:Date:
	Sender:Content-ID; bh=9Qtx+eCsdo0/CiffX75i1o5LqVHmjsueZz0A6tKUcis=;
	t=1780929522; x=1782139122; b=FQSPpaElClJEikfWhuu7J6FMu8KL7+2zM+Zf8+S2onSeptA
	avEVdVD38gYVRVfotkyBOYWH4zWVazycA9EIhIgV7uVh4oVdzZQ1z3vcuCo+meOIGFVdDKRQVJPy+
	wsSi7hsoYRIsgeFvWRHf3xsOkY6SH9Wurgh5iCoYw77y55c=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:
	Subject:Date:Sender:Content-ID;
	bh=9Qtx+eCsdo0/CiffX75i1o5LqVHmjsueZz0A6tKUcis=; t=1780929522; x=1782139122; 
	b=CJP/eOS0ZQXfzmxV2me2caMgaWcsvqwkF2mTo3hy0tP4FSuK4HlC69Eh2zDwNSOPifG0QSfY7TJ
	zgmaRGBjFDg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1wWb1l-000s8l-0r
	for netfilter@vger.kernel.org;
	Mon, 08 Jun 2026 16:32:33 +0200
Date: Mon, 08 Jun 2026 14:32:31 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: Question on rate limiting on nftables
In-Reply-To: <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me> <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
Message-ID: <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 8=2E j=C3=BAna 2026 12:45:55 UTC pou=C5=BE=C3=ADvate=C4=BE Kerin M=
illar <kfm@plushkava=2Enet> nap=C3=ADsal:

>If the problem can be characterised as "I endure too much log noise from =
sshd and I find it annoying" then perhaps configure sshd(8) to additionally=
 bind to some other random port than 22 and expose only that port=2E

Not worth of change ports, soon or latter it will be found
and abused as default port=2E

Fail2ban or so, can block addresses selectively=2E BTW, here after
long time (1-2 years) of banning the counts drops from hundreds/thousands
addresses daily to tens daily=2E Currently, i have banned 30 addresses
with bantime up to 90 days, from that the ~20 is today "spike"=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
