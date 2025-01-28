Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A98C1A2389
	for <netfilter@vger.kernel.org>; Tue, 28 Jan 2025 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738066380; cv=none; b=ZAxvqi3pO8G+oBWYhSy8nZVblRdP4cTIrPxj+qmFsVOQFSmttTe6e5iZAuTzI61JFXZ23q6wiKExJEyt2tVsaqvVjlTGAbuNs9YmEt7C/ohpdPyVjb8iA7Ol1ye+4y8BGluYv8UVTNPST51AC8+ykMdEcO6qRRzjsNKL0YyVUeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738066380; c=relaxed/simple;
	bh=bE4sRdmFEDXzkN13XjPBrvBvjyaVg3qw9l7dCSCaCZE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PExg1Qux2hjCSPA8llc+MuE/MiYEBJkR5fXxMSfiGmk711NZNidk991KRjH1CQlpxaQeslasxkjbdkvKYZEPt/DIv1H+Q4XKRaRb6fo+BHHuJFhX6bY0RFwnutZvD4gTWFWe0JR//7kd0/8WmgLqKXVYdAYrReKYd430QDR/dmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=WRrdA8Yq; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="WRrdA8Yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738066370; x=1738325570;
	bh=bE4sRdmFEDXzkN13XjPBrvBvjyaVg3qw9l7dCSCaCZE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WRrdA8Yq0TWwozQkD6U/0WIGBmXNTg9ZRz+PmqsnZGOIUUcDKywwJUP9z8y87AmuY
	 bZG9IqFkV0BwKlXNXN2Xh+Q6zwXKvjbHMl47LiSO10gJ/YCBsAhsRcI76rm9V432u8
	 KfuGV8omVclnHTiGzxHGV1ebfrxAhEVsQKcksNH/fLYyp6QRleOeiyPnblcjUGO0LW
	 A+pKrFGCiX1eA+x1b2kD4+3QwkqvWR8GHK+XT7L7YjVsAdJebyZkJfBywlJovvfTxm
	 0ypiGZ20SAiytRR+HusXsVGsAruHBSvfzxBrkzFqNRyNuyeg9gvDMfraIn/E2DVTTx
	 IIL4gJPV/KXgg==
Date: Tue, 28 Jan 2025 12:12:43 +0000
To: Jeremy Sowden <jeremy@azazel.net>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <4-BUomgzCwsEgMXaENNpoeDPlG0zjCBc71q5lN9v6lLCuxC8sPDf3RUPSDsBefrwQrZUZdOYQ_Ww6LnjxQH3oapz5L9mF1nXvlLoxQ_iC7w=@protonmail.com>
In-Reply-To: <20250128120204.GD485209@celephais.dreamlands>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com> <20250126135021.GB3073@breakpoint.cc> <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com> <20250128003706.GB29891@breakpoint.cc> <KzQMgyTEENAtLkTnyJgmjSJRjhrPRkiRZnDoPpM7P8n7Xs-yWpoBwP_SP12Tmn2ZGkEFLnzRRAOr4BNFwYUCKifrV8lgAtDEfki4KlpDaXU=@protonmail.com> <20250128120204.GD485209@celephais.dreamlands>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 2acf9197dd9dbe4169d69808c290ca0653a7b714
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you! I text searched but skipped over it.

sunny
