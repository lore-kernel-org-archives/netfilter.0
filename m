Received: from smtpa40.poczta.onet.pl (smtpa40.poczta.onet.pl [213.180.142.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92980468E
	for <netfilter@vger.kernel.org>; Sat, 16 Mar 2024 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.180.142.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710614498; cv=none; b=M/+19F581olvnQhAYQKkyTtrlnMc8GcZ2nkFeYrk3So/2A+JFdDR/K6F2SmglxqHHNr+Mn6Qxhr0ywkYWdPW/aIteXtGEgG3De8uyX1sLon1sfIwqW5tSjAuu2HZbfQj0WVU2XZ9+qr5k6H+vI1uK7A1CnyB30P6892owR9vUqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710614498; c=relaxed/simple;
	bh=d9SroKPqjITdvDE/uz4IUUx1azfzlEXkuYpTIIQVu18=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qNG4fNPFwYJkQO3h3cVPE2lb0MsXn5fRy7CyWP3pBenF74HhF82EJsVNDVe6X7TWx8IF1Dwwq+rNv1dI84RUbgQOFic5Kv2Nli4r4AkLKtQpR3sfIzq7YqyYZhxyxLXkqChRYNNOo3p0LDhBgGUOD/PfGOqajsuTThxBCfpAM2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=op.pl; spf=pass smtp.mailfrom=op.pl; dkim=pass (1024-bit key) header.d=op.pl header.i=@op.pl header.b=kWZaAfhu; arc=none smtp.client-ip=213.180.142.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=op.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=op.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=op.pl header.i=@op.pl header.b="kWZaAfhu"
Received: from alfa.kjonca (178235054008.warszawa.vectranet.pl [178.235.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kjonca@op.pl)
	by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4TxqgD5WwgzlfbvR
	for <netfilter@vger.kernel.org>; Sat, 16 Mar 2024 19:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
	t=1710614424; bh=oiAhI9HxtpqWy4w4m+ATDfv/GXIDlfeX0cwnln2x/Bg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=kWZaAfhupMbMbVI2QCRkeVyWO1m40IGSKVpFlly8VgkkXWW2XFRE9Yvjjk7pVXoJ4
	 FyHwhpLfyuntVHiizSwoOFphb0y7gjXcdVgv12jhEzaEXnA3Aa828arC+CB78LULKw
	 OGUHnBoa5wC7tXpnxyeKunlglDGZgzFhBVW8mJdo=
Received: by alfa.kjonca (Postfix, from userid 1000)
	id 4TxqgC5FFmzmbHV; Sat, 16 Mar 2024 19:40:23 +0100 (CET)
From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
To: netfilter@vger.kernel.org
Subject: Re: nft ends with error
In-Reply-To: <ZV5sxC/YNUDeFgcE@calendula> (Pablo Neira Ayuso's message of
	"Wed, 22 Nov 2023 22:04:04 +0100")
References: <8734wxtz3k.fsf@alfa.kjonca> <ZV5sxC/YNUDeFgcE@calendula>
Date: Sat, 16 Mar 2024 19:40:23 +0100
Message-ID: <8734sq9g14.fsf@alfa.kjonca>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ONET_PL-MDA-SEGREGATION: 0

Pablo Neira Ayuso <pablo@netfilter.org> writes:

[...]
>
> Thanks for this reproducer. Proposed fix:
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231122210106.183932-1-pablo@netfilter.org/
>

I know that it was several months ago, but it seems your fix works - no
error message.

KJ

-- 
http://wolnelektury.pl/wesprzyj/teraz/
