Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F329136995
	for <netfilter@vger.kernel.org>; Tue, 16 Apr 2024 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294810; cv=none; b=ReYZzM6nRgyhrJOgLsKK4rMfPa3IOJ8tfpzcAmgD1qktUpcSURWBsOdZ7ljqZ+dA6Vo+C7PUCfApFO1BGMaPyiNVrbbtUS9+CaAgwuUfElWN1HhzS5zWXWaWGDIxqajkbtFyMnJWrUdk3n+KJ1COeP8+TwIKPXxjmFZSBTy43Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294810; c=relaxed/simple;
	bh=5RhSB0fUE+T7FMS5wP5SfAVJkrNOxIn3JIc2Dinh63s=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUjY8x0UsbIxPcjD2hSNVlVXAGfb2hBqRFg2m+DIzr0YZCA4KrJJ5PCizWKCujQ+B6YQ7Xvox2sX8hgvK6CAycYQxukXmdOCw83/U7SLi5jTGzj4Pye3YOLAk3iM6QDZWWrY/LInKKjHPaiwtHPK6whzzjwwIs/OhRRwAifNIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=AcjzLCKA; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="AcjzLCKA"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VJtwy1Djrz9tWp
	for <netfilter@vger.kernel.org>; Tue, 16 Apr 2024 19:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713294802; bh=5RhSB0fUE+T7FMS5wP5SfAVJkrNOxIn3JIc2Dinh63s=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=AcjzLCKA8gwqnmGloqi3Vlib4vE0aRaB8VSjSNZWHogzZzC2iYyaZhmsG4TMHkT37
	 4Y/RrGbErbRanR87FuoAyXVJJEzY5J+6DNrkEC7+dxV1Dzc3vdu/PNV70+lNr/e4Te
	 Wb90g3zo89Y0PoMMfyaKB47fntH1/RaET9lkxQJ4=
X-Riseup-User-ID: 0072F702215FF35245A0C106560F909944EC4E90CCEA06DE79C07796758891CE
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VJtwh4ZsYzFwKH
	for <netfilter@vger.kernel.org>; Tue, 16 Apr 2024 19:13:07 +0000 (UTC)
Date: Tue, 16 Apr 2024 19:12:50 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-ID: <20240416191250.04884e9b@localhost>
In-Reply-To: <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
References: <20240416174748.5612bd27@localhost>
	<20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thank you, Kerin!

Could you please also tell me:

What is the way to actually test this rule? I.e. how do I send
"improper" packets to see it do its work?

I have been successfully testing my other rules using nmap from another
host and watching the 'journal -kf' and 'nft monitor trace' but this
one is difficult for me.
