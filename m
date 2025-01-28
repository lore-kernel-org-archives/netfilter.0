Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32E9768FC
	for <netfilter@vger.kernel.org>; Tue, 28 Jan 2025 05:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738043334; cv=none; b=k9guex5o+EOqhO0RnXm7Y/nX8/fCezzwl6/TUV2hlzevpI4E9QuVouk8dIR7lqEkN+OTzDJHkEcPbcSoFjFFdibKJQCUiPETwYp62SU+MyS9uyUuux4j8Zd1+o+SNo7gzmhTgJIIv52ydbE5LkAJH9mT65VM/XLGiIkm8FsauyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738043334; c=relaxed/simple;
	bh=WOEKQSSnTvEdeuXRD4AYhdhppiRZDUrAt1CN9yrvMwM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzYkACtyyrpTmK8peVZRa4/QaTpnLegbg1vCFryh9yqnU9XwuJv3Z+X7Bf6DqNgnbv0SMgbq961dXS/mLj1KiotCjw0rXSFJXCuR68Jok/Xh9oyN/sV3QhiK2qGzze1SVG0DoNLk+Q64/mU1Vqz2+Zg1tHIs4X54WxV8CAw5aVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=OwANgsM2; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="OwANgsM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738043324; x=1738302524;
	bh=WOEKQSSnTvEdeuXRD4AYhdhppiRZDUrAt1CN9yrvMwM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OwANgsM2QGz0NOLaTEcnP5wgPANF1OzimFqsC6WDJhotxpGoIJhYwRBpqQ9N5uFeM
	 A/QekSvWH0mTTj+o9hjX4/w2pPDQOnipcJ0y0aGnf9ChlPsAEP3MuQJUgmExat5Mjf
	 NP1uW5Q6PdHWvC6S5MkTLjTwSCPgqEGxm/+K9obs3XE5Itf6E0BdibVYusrsT1KK/i
	 8LnM8YLbQYGUm1N1oYUqRPt5c8XlXzpbaJMKTv5rJ1tI/49rsfF3HIl/4J0g+ZME2B
	 NDOha3DOuOeFcMkcFauylQikRsETJFhUNfJuTWMmjxmRvEdLsKMHyU+TTCqT7IOb1w
	 iphneSyo3VCpA==
Date: Tue, 28 Jan 2025 05:48:39 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw payload expressions are mangled
Message-ID: <gwahcYIw793HXoIlydvHfjEr4aIOm4Mmv7VlsDq0N1KU6zZyRQTS219wEnMH0KqmR2Ir9DhDbPzUYBy4m98D1KQf9WC_Zc9PrxFWgo1X-u0=@protonmail.com>
In-Reply-To: <ZtbaVgOFLwFIr4ve@calendula>
References: <DZC45RRhLNfzeCW9I6ahm9glqdw7JeVCHAtNRmJKEGsvLMzUaU1kI-yv-5rVp2mJq3dJPyHN2yWVbSiwc7JWWvZOf4GXBmtiPpYZS9zVKEo=@protonmail.com> <ZtbaVgOFLwFIr4ve@calendula>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 3b4fa2d63d992cff533690d85d0af72e0c8960ca
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


The rule translation results in matching the binary:
"0b0001010000000001"

It should be "0b0010010000000001"

or really any selection from:

"0b0010010000000001"
"0b0110010000000001"
"0b1010010000000001"
"0b1110010000000001"

in order to match an "indeterminate LI"; as my rule was not concerned with =
this value.

I cannot reason as to why VN is matched as 2 instead of 4.

sunny
