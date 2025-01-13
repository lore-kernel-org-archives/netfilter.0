Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9992204589
	for <netfilter@vger.kernel.org>; Mon, 13 Jan 2025 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762979; cv=none; b=fWXZGVR1ax05imE3w5TdGbqOuxw9XLaOapueBjZsRLQ2DEYek4spb0jNfTTBo5NBkpmKb5v4iOm7RwY6i1cBMPGkSEpNFlukJUuYTAeVE7fmjxKooEaLhqZEuhGo474w8bv058iCzJJfPuyZJEECHt2cH8UIKJYfDtZldGOxj74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762979; c=relaxed/simple;
	bh=4aNC1FGt6A5LBYTbc4lJOL9fl+nTFenqRLkO97KZ0ss=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=PHW6YfDMnUMOyIyqeqtQeSwKjy1zAqeAoFP5mxAIA58AeiGf1CTCkaoBgnz296ChgMMEfH9ID/+R+kQ/ACwQiqUUO4QTQfU/QXZtG5fz2Ax3VBrUFENhYiZXRym5VAI12cf00103BywzMlBO9BN/q9TbHiGz26QKa95p65Xbo8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lrose.de; spf=pass smtp.mailfrom=lrose.de; dkim=fail (0-bit key) header.d=lrose.de header.i=@lrose.de header.b=Tglx1MHk reason="unknown key version"; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lrose.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lrose.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=lrose.de header.i=@lrose.de header.b="Tglx1MHk"
Received: from mrkos.uberspace.de (mrkos.uberspace.de [185.26.156.186])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id E1F561805F3
	for <netfilter@vger.kernel.org>; Mon, 13 Jan 2025 11:09:34 +0100 (CET)
Received: (qmail 25594 invoked by uid 990); 13 Jan 2025 10:09:34 -0000
Authentication-Results: mrkos.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by mrkos.uberspace.de (Haraka/3.0.1) with ESMTPSA; Mon, 13 Jan 2025 11:09:34 +0100
Date: Mon, 13 Jan 2025 11:09:35 +0100
From: lukaro <lists@lrose.de>
To: netfilter@vger.kernel.org
Subject: IPv6 source address randomization?
User-Agent: K-9 Mail for Android
Message-ID: <DC202CB2-1D44-4B7C-B4D4-F03416D58B0E@lrose.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Bar: -
X-Rspamd-Report: BAYES_HAM(-2.242535) SUBJECT_ENDS_QUESTION(1) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.342535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lrose.de; s=uberspace;
	h=from:to:subject:date;
	bh=4aNC1FGt6A5LBYTbc4lJOL9fl+nTFenqRLkO97KZ0ss=;
	b=Tglx1MHkiGYmu1TI5xFfhMyqkSfihN5/turzV4yQLKzlnW17iwu2cLyH89tmCQ8vpYPHS8qd5i
	8sMkKtYkEtTZ6tufElIdn5V4Zf+J1ooEHx9gBtIWbzNU1OU6rOks+5bzAbdn0ND8Rq+SXh+XJ0ly
	bLDBCvA/KwhRp1KFQRUyBVRZf1mzJxPn9XEfCUgrf4bJ0dah35nzWTaWQZNDxXb6RQi41LeoWw9Y
	kTjqSjAA5NufEWHlKxS+h5y3Daf7JxqtGSB5alEzNFS2CD70dBiN6Fdcx21zjzhZXvPixRv+Vf4Z
	07tvdIT1XmI4FQC77gdbelxmhmOG1uUXlPNu9KJR4gdDVfjnUkWyD3xoqwenNdV3ciSrFWaLUdjZ
	ZF/CN+Sh3TszNO7ZZQszuq9Hf0ppFC9ft9bn/5bkfkWETe9b9JC0BVsBbAIzPn0lf+hYTipvfFkB
	01JUrZcPl/c/20aaUtUV/RG9CMCwJWR9zB996NFC+P3KjSxRhZKmeza68kumbKg+G+ExwVECVgRp
	UUt9k9wB/vGZKfUixC/muqChGoXML1F7BWyHavqrE7lzZQkrmTCdfga5F+KRPDHfI5HHkS+E1M3/
	sM8WnMs/t3qrDX3ml9SxQZvAAfVY51zHV5gi1iZuVPh/zmB5bM484Yx38ClwG8OmZcPAY/xc+Akh
	I=

Hi everyone,

I am using nftables on a VPS with a public /64 IPv6 subnet as a personal V=
PN server=2E All IPv6 traffic is NATted using the server's public IPv6 addr=
ess=2E The rest of the /64 subnet remains unused=2E

However, for privacy reasons, I'd like to use different IPv6 addresses for=
 different connections=2E In the best case, outgoing connections would use =
a random source address and port combination=2E Is something like this poss=
ible using nftable's masquerade or snat options?

Thanks a lot for any ideas!

lukaro
