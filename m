Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9133C82D8C
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706634448; cv=none; b=SBZvteDuCYLM6FfbOv79cPgG3NHEmBiugKs60YHWzhamDZ+TLpDgVNx9D94keyPJL3w5ycWu6q0Dm2dERBWN8MBNGVqpnxi938gdEbvRKP9heG+BZzAYe8yyKZwg+yaGrcK4kDBM1uNsX5goMDISxBcbpADxYH8qinKpTEW1CNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706634448; c=relaxed/simple;
	bh=et9R1WWI7EJzWC1jrB4D1oDjUgZvimCTyS2QRZujW5c=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=hc+0PrPSgJZrhT8Dfu5vFU2xo7yhdpHQcrbxObVIq4QNjCjgprMFnawyv9CyOWFDTVXRSXpwVUoXimgTHEOSXTSDyGNHbwq7rLQbzZkQzU+Pyqzag4KxM1ckVu0NM6g0Y6A8zKtrFhlhUx5TxAjHmywQOwt0SzbeITx4k5RJOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=v5YerbiH; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=1iLX/I4c; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="v5YerbiH";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="1iLX/I4c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=et9R1WWI7EJzWC1jrB4D1oDjUgZvimCTyS2QRZujW5c=; t=1706634443; x=1707844043; 
	b=v5YerbiHn1o3C7okiQ6OZbG1zU0Zvhg+lLf5PM+FgTd4ws6mxptglLMaE4SSJO1Jxf+R0Z9Dhju
	7Vk3PK1AYjfMR447goGkK16qbEQUbOiSg1SoZY+OdZFXz/NyqDSOYMry1r3LWagsUYv5b9AFIBf43
	GbRk37r96OAj4BeHkYA=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=et9R1WWI7EJzWC1jrB4D1oDjUgZvimCTyS2QRZujW5c=; t=1706634443; x=1707844043; 
	b=1iLX/I4czN1cx4iqkEXEIufwcJGmfABSy0B2baHeBgdQ8z21enjA/O0PtGAyZnYN6jcTTkCbSwD
	hubMC6uivDQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rUrTi-001cPQ-1A
	for netfilter@vger.kernel.org;
	Tue, 30 Jan 2024 18:00:54 +0100
Date: Tue, 30 Jan 2024 17:00:50 +0000
From: Slavko <linux@slavino.sk>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
In-Reply-To: <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net> <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com> <Zbj04V-90zpQwEzl@torres.zugschlus.de> <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
Message-ID: <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 30=2E janu=C3=A1ra 2024 15:17:32 UTC pou=C5=BE=C3=ADvate=C4=BE Ker=
in Millar <kfm@plushkava=2Enet> nap=C3=ADsal:

>Granted, one cannot create a set that is typed in such a way that an elem=
ent can be either an IPv4 or IPv6 address/interval=2E=20

Nowadays IPv6 becomes more and more common=2E While allmost all
can stay on IP(v4) only host, not all can use IPv6 only host (yet, as many
services are still IPv4 only)=2E In other words, many will have dual stack=
,
to can access (or be accessible for) all and they will need dual stack FW,
and IMO will need it for many years=2E

Having separate support for IPv4 and IPv6 was acceptable at time, when
ip6tables was born, but nowadays IMO firewall cannot be named modern,
if any of its part separates that=2E And any argument (memory, complexity,
etc) against it is pointles, as dual stacks are (and will be) here=2E

Nftables now has inet family, that is great step from iptables=2E But stil=
l
requires to maintain separate rules in it for anything with network layer
address, eg=2E mentioned sets (and for icmp/icmp6 too)=2E I hope, that it
is temporary state only and will be improved soon=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
