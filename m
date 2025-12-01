Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F7763CF
	for <netfilter@vger.kernel.org>; Mon,  1 Dec 2025 03:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764559500; cv=none; b=YTnFPDUeBi28h+z0Img9VXl4Ru5IHv2Hen3B38JLLG1hgd8wRxdaZ5uF1v4fUOsWb2ceryzlxXmBUbUVI4YjY8uxfLVs/3DEssvkG3WqoD/0xSBOagRiOUTMhrLKH+Fol3iI7ao3xHiVFtP/RU5bRzouXG2ErUf/vrtOxr5gCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764559500; c=relaxed/simple;
	bh=CbarZR2vs2TdSUVAh7VM7YSh+kATlp3yPUhk4BWe9k8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDQnrav3z0SlUa1eLAmlZSToZ83zMPophK2XRV38I8aT02DNS6dHjkELyIDjI5TAJuSClnhzjp4Yvffq48E2yTi4MDPiMzDDUOdtXLGGyqNpXan+oJPoFI2nDsMqemmdz/ihY8FTeUkcPfk+VYx62XLf7kO9iLd0+djczC3kRx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=f6Riokp3; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="f6Riokp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1764559490; x=1764818690;
	bh=CbarZR2vs2TdSUVAh7VM7YSh+kATlp3yPUhk4BWe9k8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f6Riokp39t8SK/tOvLmSvycmy58P1zbvShWEBV+M6xyBFxFjIDjAZcJ9cdFJlkOhL
	 Jc4/Yxi972BpSjfmDt5OFYn+BALCoIgjixamCyXPqyavlb2Vv5mjbHqef/Rel4bZuG
	 XWx4IgG5M7+DlOCC4z/jtbHWTNUDCuQvzs3M9mHhpLH5npd6GkIyeepL65UtYy/jSU
	 C4eunz+6+6y4qjKtlp6Zd+U8RnvaSCevnwRJo7kUdC5qR9FtrZNo45X1KCXR0OFrgx
	 2hmWTrmdQa9L+XEduWUVljdiEP3ULynpAhkxi1HYxKloSyfXALqu/25UWzaEi8EDGx
	 py5H+9NA7D1UA==
Date: Mon, 01 Dec 2025 03:24:44 +0000
To: =?utf-8?Q?Marek_K=C3=BCthe?= <m-k-mailling-list@mk16.de>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Filtering MLD messages
Message-ID: <sgxfyvDk1ibbTlel4b8x5d9EtgkRsuTIxlTkZda8a73vxe2oBuXeVDhjJ7iq8qmCQj-Kj0WI9ThmhtlrYOKMkNS6m2yMj2xg2G_KIgLV-7U=@protonmail.com>
In-Reply-To: <20251130210401.77c74ee1@ciel>
References: <20251130210401.77c74ee1@ciel>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 5b330572780c76d8e53cbcc45f86b91df0f8e934
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Marek,

> I would like to filter MLD messages:

If the following lines in the listed files, and the neighbouring functions,=
 also; appear to be incompatible: you may need to write some code before th=
is can be done.

Check line 342 in 'payload.c':
https://git.netfilter.org/nftables/tree/src/payload.c

Check line 458 in 'netlink_delinearize.c': https://git.netfilter.org/nftabl=
es/tree/src/netlink_delinearize.c

In lieu of an NFQUEUE program; I suggest using raw payload expressions of t=
he form `(ll|nh|ih)@ofs,len`; where 'ofs' and 'len' are integer values, and=
 are in 'bits'.

> 5. The source address is in the link-local range.

An example of matching IPV6 source addresses using raw payload expressions =
is:
`
@nh,64,16 & 0xFE80 !=3D 0
`

Regards,
Dylan

CONFIDENTIALITY NOTICE:
This email and its attachments are intended solely for the use of the inten=
ded addressee; and may contain confidential and/or privileged information. =
You are hereby notified that any unauthorized use of this email or its atta=
chments is strictly prohibited. If you have received this email in error, p=
lease destroy instances of it, and any information that was derived directl=
y from it. To be clear, the message and its headers (SMTP, IMAP, POP messag=
e, etc.) is 'this email', but network headers (Ethernet, Internet Protocol,=
 Transmission Control Protocol, User Datagram Protocol, etc.) are not.

SIGNATURE NOTICE:
If we have not met, the below public key is not useful.

sunny_0xAD0EBA5C_public.asc

-----BEGIN PGP PUBLIC KEY BLOCK-----
KEY REDACTED, WE HAVE NOT MET.
-----END PGP PUBLIC KEY BLOCK-----

Sent with Proton Mail secure email.
