Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch [185.70.40.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130541218
	for <netfilter@vger.kernel.org>; Mon,  5 Feb 2024 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707153379; cv=none; b=K18Ov0MQgk2L0tnZlNOHmzB/hFHSpoH2m0qUmxn6qXkHVuOCZqbsQ99/MYL5dbBrS8pGksn5LL4ay1v5zww1+16GA6tsCnaS0t5lGsFZXsYiwP0U3Eid50DeEyKmJvS3WxWtT9fquB/dDm6K7xWy05ccX+mRZ0sswfHxfRMUIlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707153379; c=relaxed/simple;
	bh=heex8nf6nmkGjQKJa0dFHw5dj3kDcTPkMzmci4jrLQs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qBxmN+d/1mqajjNus7Q0tixrxYhKPTEE16UtD9c0gPw1jQVWBh+PVT0l03ODNHRDl8l49sYjA0ZriroAIPaRZZFsPmBC9pjKnSIOSZok7aaHBHp6dnrhlg+mOwgr+1Ndmed38vwnXEvFrkWoP0P6gIulWN/fkogeD6cpuM6JQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=YfPiqcKW; arc=none smtp.client-ip=185.70.40.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="YfPiqcKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1707153374; x=1707412574;
	bh=JOH4/zeirx3Qy5yhzkax7wa72Iyathun4zezNCW7ooM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YfPiqcKWhzBAQu/FzM6gyYZDIoG+cci06T56zXAdPd1i4XRoQBGuyTDsKfG7n7TDD
	 OSRzhhd5Hu23UjvOj9rzHT/5/rQsz4AtipWuf0iBs+H55LMSUkNr9kK5+gf1uSHTU/
	 63UXmqvfdz4yFNglbXWJgQMrrlPcCV+IbpBj089r3nitUZDBS4wtvD9Vs0z3eYCfYd
	 ExvcZ83KNgkbCyQfjjaHqaqu4xvrtNvaqEXLbh9mSCM/NkFsPmZMupBdnjCRHasBRG
	 +XuM1ckD6idQUpzZGIItCQ8TRGrLKxAr3u1WjSL5Im9jDx9SPbD4I8XgOfaX2DF911
	 pmNabxGb1n1kA==
Date: Mon, 05 Feb 2024 17:16:08 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <EDuwP8fOpfMn2JwcM6jATDEUk-sLHlo0Z6gE1onTNg5mzlps2rvswQw7XKeRnKvkduO6jZrIfyidqSYIMd0DtfP_dCvobI6lFupbpetPylQ=@proton.me>
In-Reply-To: <ZcEWJ8U08NuqxHgc@calendula>
References: <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com> <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk> <ZbrLg8luc8tbZALr@calendula> <exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me> <Zby0eB9G4Qi2DJbT@calendula> <2_5uNX_sumsVU038csU_coYap0tNQR6gTiA1GDY4Onp16EhEPGkvRE80rAwirPIiGCn9eVKjFNzc8D_zQG98pDys1uxfCIeYh6k3KG6jGXU=@proton.me> <ZcCutfqrH/SHlaRw@calendula> <clHlpumTk0UKqy_54SFkWToltmb6w40b0TQh2_xQ9h0WwoGFYXvEWUCiXhSvBV5h8elVzIlVTkYSMInXDLfaYt9QP9tVeqfoQxXTyXR0Yk4=@proton.me> <ZcEWJ8U08NuqxHgc@calendula>
Feedback-ID: 48716100:user:proton
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, February 5th, 2024 at 09:08, Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
> Fix is already available in v1.0.9:

Excellent!  Thanks.
