Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FAA5B680
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706794984; cv=none; b=pfBSXj1Oe40r8fXpC9uTw0xK0mwSsQpztiaLGi1s9fuXAiHILSLD0v8/Znl9k6OewOLege5eZC2ExbEEkgfDBjX2Hx4uFTYSyrLKoQlHdvN7IIHlHDOqTMmBPGN+yFBxkwjL7unEfV8tSTA3hS0LKdGNJv22v9Vr8mH0waPzByw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706794984; c=relaxed/simple;
	bh=28WwWybU38uzPLlbWUIEpNG8eGckV1y5RSVf/+XlxNU=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mjdTqWCy7QBaqLtE0DeA72xDghqR8hRNZ6SUABWWy/DzVRaUdrauQm70FxJhZhKkaVAWQGI8jtyQXgew6PlFamR5CCzwfLYpA0WcYo5osaTQwM7jdB+qGOUtNf14zJfrpvalr/JxB/DPVn2/xu4DxqZfvle2wp/GM+y8SLAaD+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=hTDFjtT5; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=1zuaV/FN; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="hTDFjtT5";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="1zuaV/FN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=28WwWybU38uzPLlbWUIEpNG8eGckV1y5RSVf/+XlxNU=; t=1706794980; x=1708004580; 
	b=hTDFjtT5+FUlNN+yxPgYKEqL5zUny3tbXHB384C4Kl6h3dH9GAvEFXXEvAYBiEGwpP5xPd4j3m8
	A4VywJWXpp84HTnDkHZJXPayFr4uyiC9TX7deO5czZutSs6qDXQVxOVdIm8JWYBXN83XoyZLGT0Bk
	mIdSIC3qZRgZlbp3Omc=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=28WwWybU38uzPLlbWUIEpNG8eGckV1y5RSVf/+XlxNU=; t=1706794980; x=1708004580; 
	b=1zuaV/FNmW33cz1zt4kk9rV2zATScC753m6S5FGpQovfi9DD3ZIRkUY3wxLvbews6vMEb79u0dZ
	5o6hOOSRhAg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rVXLF-00066c-1B
	for netfilter@vger.kernel.org;
	Thu, 01 Feb 2024 14:42:57 +0100
Date: Thu, 01 Feb 2024 13:42:50 +0000
From: Slavko <linux@slavino.sk>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
In-Reply-To: <327e8447-e995-465b-9569-1a00fbc9ad68@app.fastmail.com>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net> <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com> <Zbj04V-90zpQwEzl@torres.zugschlus.de> <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com> <Zbom4bTPnkTMbLNE@torres.zugschlus.de> <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com> <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk> <20240131221012.289b2a17152cbcae39132ab1@plushkava.net> <75cb1437-0fdb-4599-aa8e-9f12fdf6057b@slavino.sk> <327e8447-e995-465b-9569-1a00fbc9ad68@app.fastmail.com>
Message-ID: <BA79D432-A474-45F1-BD3D-EC1B523DD818@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 1=2E febru=C3=A1ra 2024 12:48:31 UTC pou=C5=BE=C3=ADvate=C4=BE Ker=
in Millar <kfm@plushkava=2Enet> nap=C3=ADsal:

>The problem is that the size isn't always shown=2E I complained about it =
here:

I afraid, that it shows configured size limit, not real items count and do=
es not
show memory usage (on my version)=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
