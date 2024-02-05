Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41D3CF7B
	for <netfilter@vger.kernel.org>; Mon,  5 Feb 2024 17:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.41.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707152927; cv=none; b=sTtw6+heebpbCp/uvGW7yg+30VV8CjfzumweFkiMQDh2qbph+iaGz3Ly7s364E8jR7x/Pbr0i/KVLhSkFwUngvJP8rmP+cfGVmz9g2eTVMgOSpyupGsKilxC5YIKihSRwMx4sjaMc7q4Lf9GUnUi5r10nXpRhIFQV4aHmJ/jGOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707152927; c=relaxed/simple;
	bh=lBmcvRPvnHeP0agWIg/RIIHg9/Cz2r+YLAczWaEr6eI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssJlWrQIhzz/jIkMsCqC4fJHUZDsL8HUJ7+6ytrMhyg5bvYd0QCEHC3mzFKf6I+ggKmBQlU5bUVyhAEwENOWIGR4yxisBk/Rdeu6ukrC6jDH2LgqLz24AN+hfm4d9Zm2l8quSQxiTV4PLE+BCA3z5R2/Fjp79PdKEQZRm+vO/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=XwiOYPfH; arc=none smtp.client-ip=185.70.41.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="XwiOYPfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=xv7cwjx5trbhjnkgn3sglm6aye.protonmail; t=1707152562; x=1707411762;
	bh=vsxnOOuG0c7lJEUVDy00Kj2jzKLuRfrLCIEkKI/SpaY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XwiOYPfHo0g4xXTy0901dR3ZThCBnorms8avOs76JALxskv48QgRPIIuHPjvQFEbu
	 YYAhvSbs3x3SWa11s5kpvFIMJvJeHSsIidEtCitHkrIHviJ7KAyhi9k/10mx+R+Tbs
	 BEnkHx0g60IHGtbqm1+IG+VihULiu3WFOkdR++ZxLKnfOf81I3vRrSCMN+CuggIJG8
	 Gff+VShloMujEBCYHLTF4KpTIsP37vfNS/m9S4OGI/blJDdEdqebd+DovTOdbpRHc9
	 BlvkQA/k2C2roc+gcAz6Tftz5SAyIi5nBWMH29yEuaQ3lrISwejns4fQB63lZNaWeO
	 OoJ9AyVH1oy/g==
Date: Mon, 05 Feb 2024 17:02:16 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <clHlpumTk0UKqy_54SFkWToltmb6w40b0TQh2_xQ9h0WwoGFYXvEWUCiXhSvBV5h8elVzIlVTkYSMInXDLfaYt9QP9tVeqfoQxXTyXR0Yk4=@proton.me>
In-Reply-To: <ZcCutfqrH/SHlaRw@calendula>
References: <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com> <Zbom4bTPnkTMbLNE@torres.zugschlus.de> <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com> <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk> <ZbrLg8luc8tbZALr@calendula> <exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me> <Zby0eB9G4Qi2DJbT@calendula> <2_5uNX_sumsVU038csU_coYap0tNQR6gTiA1GDY4Onp16EhEPGkvRE80rAwirPIiGCn9eVKjFNzc8D_zQG98pDys1uxfCIeYh6k3KG6jGXU=@proton.me> <ZcCutfqrH/SHlaRw@calendula>
Feedback-ID: 48716100:user:proton
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, February 5th, 2024 at 01:47, Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:

> Strange that userspace crashes depending on the kernel version.
>=20
> What is your userspace nft version there?

This is on the current release of OpenWrt so previous release of nft.  Same=
 behavior on x86, aarch64 and mips.  All other commands from my monkey test=
ing just return silently, only this one fails.

$ uname -a
Linux rtr00 5.15.137 #0 SMP Tue Nov 14 13:38:11 2023 x86_64 GNU/Linux

$ nft -V
nftables v1.0.8 (Old Doc Yak #2)
  cli:          no
  json:         yes
  minigmp:      yes
  libxtables:   no

$ nft list ct expectation table inet fw4
Segmentation fault


