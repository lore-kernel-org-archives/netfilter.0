Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93CBA27
	for <netfilter@vger.kernel.org>; Tue, 28 Jan 2025 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738067363; cv=none; b=uVU2JDmCnsHuRJzsXZvufHyqBXDjkLBC2y/lhx8C5rsybdblLZcG8RKk8thBIHMyMoRSQrFLFW+0nIruIZOzo+MYe0onlyWVGRcDyI7+U+tZNXciuV75sKJBEJE916gqG9uj7FW/vou7EAwhLveuxWIwIDJ02jizEsZToMQzJPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738067363; c=relaxed/simple;
	bh=UXPUS0Lkhcl2wUPNFQX5dYCz7KO8rfH+QI8X4yRwuFY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mM4XqSb4BvX7f6nM2ngFOk8HomD9ZjtbC544KsBYyDn8VoROYjRk0J0dQYK9eHYHi2bcbZn4xVaDAYAG9I7LUlcTkDvQGmutuXnm+iIgY4/bVT6Xq9IaBM7nDm5FV09oGwyijv9BVG0EnL9s6+rrlhfcwY48F6ZWXc7loJbCqHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=myWE7j0k; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="myWE7j0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738067354; x=1738326554;
	bh=UXPUS0Lkhcl2wUPNFQX5dYCz7KO8rfH+QI8X4yRwuFY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=myWE7j0k3PNOkyFhsJ1H+Y4Z1XgEnbWZAoOpfTZedi5xK2I1cA/f3xdsgjJrMvawy
	 jDtHhXMZaGUL7f1hdL7cBTdoNraZLIWiByNufp25+BvfdZH2k83VSlUj+4/LwomPif
	 uQM6RW1qqmdxat3GclDxVcUhPkwLxDwDj9GCbBi+JaMTFRKONdsTiuG5HucnKPi2dD
	 +jz6nDs8LHaOvLJu8/VwRwB7kc39eA3tqHnBKKkfHNa1Otyx6jHL0n5JpQ5ebNuOwq
	 YDtP5lVU7f3fWi0LlbW5hWiq8dQhzBC552YHevGbX85FtpOO5SshlSfygq7M9kztdB
	 cZb4L56Vw3CTQ==
Date: Tue, 28 Jan 2025 12:29:10 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw payload expressions are mangled
Message-ID: <qiQaz27CG67_-dcWF19YNnJU4W9h6O-LNgP_RIR9qgh15WrTTffgNjrhf3UKORf1uXIdhNLlmNt5z_5_sqFIJrFhylTC17cDC_LOfsvUuPM=@protonmail.com>
In-Reply-To: <gwahcYIw793HXoIlydvHfjEr4aIOm4Mmv7VlsDq0N1KU6zZyRQTS219wEnMH0KqmR2Ir9DhDbPzUYBy4m98D1KQf9WC_Zc9PrxFWgo1X-u0=@protonmail.com>
References: <DZC45RRhLNfzeCW9I6ahm9glqdw7JeVCHAtNRmJKEGsvLMzUaU1kI-yv-5rVp2mJq3dJPyHN2yWVbSiwc7JWWvZOf4GXBmtiPpYZS9zVKEo=@protonmail.com> <ZtbaVgOFLwFIr4ve@calendula> <gwahcYIw793HXoIlydvHfjEr4aIOm4Mmv7VlsDq0N1KU6zZyRQTS219wEnMH0KqmR2Ir9DhDbPzUYBy4m98D1KQf9WC_Zc9PrxFWgo1X-u0=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 0b704dca18eadbe16506de1cf73dfc46af7fdaca
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> I cannot reason as to why VN is matched as 2 instead of 4.

I was incorrect when I manually translated the rule.

It still stands that LI must be zero for the rule to match.

sunny
