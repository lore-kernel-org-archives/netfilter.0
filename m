Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734535F48F
	for <netfilter@vger.kernel.org>; Sat,  3 Feb 2024 15:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706975426; cv=none; b=OwX4y25sP5Iac0YmbpuXemqUAs3D7F1yYg84jA8T573/HKLz7L3vKOxXZCdgIo7UUAaaZznlN765X9eMpPmIPaqMYYICMrZVB8+glTMS4BqVzmNrEqxtoobVyedU9M3dS828XGvxyj0TI+A0fxSk5P7/HOVSpjHpzc36+AqMDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706975426; c=relaxed/simple;
	bh=Bed56F9EPoOOtF4/OvyZtCsV1P1Z/cTN3NlRsBcXyvo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEHZojBagsW5J5hBKy3ecxU/x9jgc8+YERYv6IuaTAgs/UEIb+JJsQ47yyov9W3B0phv2nAvMhxC05j808f6w7LUrx5V/1t1NuUK88LGGIpGZeTy4h6pKtKr1NsmWnza0BJIHVa7kK9S1TFbPI/maNHK+lI3Kv7q+vAvitwJv5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KP4TkjgX; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KP4TkjgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=xpln47ubx5csfou2xagrefp2he.protonmail; t=1706975406; x=1707234606;
	bh=Bed56F9EPoOOtF4/OvyZtCsV1P1Z/cTN3NlRsBcXyvo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KP4TkjgXaSykITS2CVNwQ+Mk5JGRwpg0r6NBzcgquOF7HVqH/T/oiaSWPx1zIN594
	 9BvXRvczoclnNNjBkMJqUd2rNDoGhX5yWC88e2EEGNZqLGahM0Hdv6nuHzo3CLIHzQ
	 xN3TE2Ow6IzkyUpXcW8eC1OawUTr6r/sleW8Hi8ZwZijwfJTIDm2HAIqEQyC5+HOdH
	 WzUe+IUnZnpmAyqO0fbjF37aOqhTk7eyN1u+QJUzHBf8VvKhMVMnzgczVoBgy+Wj5L
	 cPxn/FQ3rO/Urbg2zAUfZgrAw0REqN0Bmn2Criaz/W2uhihd4MddEGLYAOJriP2nGr
	 Wu3qjEUc8bt4g==
Date: Sat, 03 Feb 2024 15:49:54 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <2_5uNX_sumsVU038csU_coYap0tNQR6gTiA1GDY4Onp16EhEPGkvRE80rAwirPIiGCn9eVKjFNzc8D_zQG98pDys1uxfCIeYh6k3KG6jGXU=@proton.me>
In-Reply-To: <Zby0eB9G4Qi2DJbT@calendula>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net> <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com> <Zbj04V-90zpQwEzl@torres.zugschlus.de> <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com> <Zbom4bTPnkTMbLNE@torres.zugschlus.de> <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com> <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk> <ZbrLg8luc8tbZALr@calendula> <exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me> <Zby0eB9G4Qi2DJbT@calendula>
Feedback-ID: 48716100:user:proton
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, February 2nd, 2024 at 01:23, Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
> Works fine with -stable 5.15 and 6.1 here.
>=20
> Does your kernel turn on this?
>=20
> CONFIG_NETFILTER_NETLINK_HOOK=3Dm

Like Slavko, my test devices (both OpenWrt builds) have

# CONFIG_NETFILTER_NETLINK_HOOK is not set

I'll have to check and see how much it grows the kernel when enabled, as th=
is
seems like it would be useful to have on by default.


Re the seg fault, I'm still trying to find a minimal reproducer, but it loo=
ks
like just about anything fires it off with k5.15 (I see it on x86, MIPS and
aarch64 devices).

Eric
