Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98242153D8
	for <netfilter@vger.kernel.org>; Fri, 18 Apr 2025 11:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744976023; cv=none; b=Hpq4omQx5lAJraL07FhfV5WfkCm5PnJMqNPPGytNLoTEzUrFH+YpTRHuMD0FpIYMADHeqB6qcVR8uqh2TojqDV3DFe7hLKbUxfM7rKpQKJu6jbSRrf+O8wy03MnMDKajstEGX98zq7IfonQPornGYr+hWOyAJp+OsmwrnJ7jCI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744976023; c=relaxed/simple;
	bh=3TthzMlIujopOauy66+jJL6qIB4y7swwlRxqxaXqcQw=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rMifnlLWd9iIpPOl7xuImW6sMkD+nVNUAJWVenGJovDF4ODtPA4buMD+UKxXPvSV3CRN+Fqxxj0BAxmkMhcwN2E6PmehHKtg1SsoNFYqj4SEluuy+vBepG7s+Ax3MtLbjZ/M9VcKk+RLnt/AWk/ovtIPIPR2xMtC4yXvVca6Co8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=t1M2ZlL7; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=McKmBahN; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="t1M2ZlL7";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="McKmBahN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=XigLpyS7t698Cby8hsGfSpvoDJVFrnAT12t/hoSKzFY=; t=1744976019; x=1746185619; 
	b=t1M2ZlL7CXbNFsizqf9qkeBDWlxzOJY6abC6vSZdKxXgDiumVfeFqAlnhV6YxK7VORTlTd+PwGQ
	NgsLOHJyEXc8NLZR6O502XPD3JOb/JCxrDLftDvK0ibM8Rd8k8fcVonSlcsk4oogecIDnoZLLDyad
	j62RXOfSmWcnzwMQqyk=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=XigLpyS7t698Cby8hsGfSpvoDJVFrnAT12t/hoSKzFY=; t=1744976019; x=1746185619; 
	b=McKmBahNwpCwbEXHJqKSft7Pz+jjG6FlhN3QNg9v1BBxr+sDBJ91so9GdMff0y3z7WlpeU2vMEL
	+Kjy5GKOHCQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u5jyN-000URi-0w
	for netfilter@vger.kernel.org;
	Fri, 18 Apr 2025 13:33:31 +0200
Date: Fri, 18 Apr 2025 11:33:28 +0000
From: Slavko <linux@slavino.sk>
To: Netfilter <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
In-Reply-To: <20250418110054.GA788356@celephais.dreamlands>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk> <20250303193533.GA16225@breakpoint.cc> <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk> <20250303220055.GA4034310@celephais.dreamlands> <20250405115436.7b67e491@bonifac.skk> <20250418110054.GA788356@celephais.dreamlands>
Message-ID: <E1AAFA8B-84AE-47CF-B9B9-26C87F2E2B0A@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18=2E apr=C3=ADla 2025 11:00:54 UTC, Jeremy Sowden <jeremy@azazel=2Enet>=
 wrote:

>Apologies=2E  Wasn't sure after your continued conversation with Florian
>whether my services would be required, and then forgot about it=2E :) Wil=
l
>make a start=2E

No problem ;-)

Be free to contact me offlist if some testing will be needed, i have
prepared package in pbuilder already, thus applying patches to it
is simple now (even with my limited C knowledge)=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
