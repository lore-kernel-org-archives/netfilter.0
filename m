Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5597FEEC5
	for <netfilter@vger.kernel.org>; Fri,  2 Feb 2024 01:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706837959; cv=none; b=HdRgt95mn5PEwmvc/FKpX3Gee8Emyf5rlPT04kCYUT4yPKl5ReA2FIoyS0wbuoUEEJDdrvhd60e5sOvmpEO8MzYVwiGZq9I6EyLggHVKhFJRogsfyELsmNeFhx4I9RCWN3lVzievNjtgrlgn2jRUIhzbgrsA/kF24q5YmBcujFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706837959; c=relaxed/simple;
	bh=gwCJi2ouYkYpSPMbob69FNQZWUNvcvkDJxquWnnbDfQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDqCqQJYsjCvz1CSpct4SjXY1yE1+kEab1ktNSB0P3CHbLrbrcag7adHd9CVKkY4sWdYhLLSZD3puaX7EIE5g1Kx2iINYzO8gXlg3f1j5TdfdeUdUnKjpSn3MW5c5ZTZEK9e3uX6fcZyHAwVxyA1Y9mFqiE4zGqeUSRoW8kZHUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NPKofKrB; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NPKofKrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1706837940; x=1707097140;
	bh=AQegO/ngWBQX6U4hKe9Ze6XkVLpgDV3FIB3wLi/+92k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NPKofKrBHTPhvcIz2NF4QHpFxDMVXntK3RNWJMsOXoDV3lxlsg4EPGGa/RUF48Z9S
	 JxgnYPB6MLDAg/9//7qb1KzIcw2DgoN+SLDIWhr3uwUWV7j63eCfw1AIzctMBcCqMN
	 LlE+ZpygvRw2+gxZf3OuCbq+OcZwQ7SK66/fP2Ix/p1Pp+teZIN00zCy3ReNUWTTvy
	 IWEGbQ1BhJHIUPbdTWSdtXeskswJ636D//jJ0WU64vt2Oc55mkR6ateJfcK2F2eh/R
	 WFM2Rl8WfniebrmpklwU/NFqS0I+zOAjFQRMdgOpRMMS4ba9rJR+p241+GmwC1i9Jq
	 9sAgWEkoC+qZQ==
Date: Fri, 02 Feb 2024 01:38:46 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me>
In-Reply-To: <ZbrLg8luc8tbZALr@calendula>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net> <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com> <Zbj04V-90zpQwEzl@torres.zugschlus.de> <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com> <Zbom4bTPnkTMbLNE@torres.zugschlus.de> <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com> <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk> <ZbrLg8luc8tbZALr@calendula>
Feedback-ID: 48716100:user:proton
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, January 31st, 2024 at 14:36, Pablo Neira Ayuso <pablo@netfilt=
er.org> wrote:

> On Wed, Jan 31, 2024 at 08:23:54PM +0000, Slavko wrote:
>=20
> > D=C5=88a 31. janu=C3=A1ra 2024 13:02:57 UTC pou=C5=BE=C3=ADvate=C4=
=BE Kerin Millar kfm@plushkava.net nap=C3=ADsal:
>=20
> [...]
>=20
> > I check manpage now, 1.0.6 (as is in debian bookworm) and from its
> > ADDRESS FAMILY section is nor clean (at least for me) the order of
> > inet and ip/ip6 tables processing. It is even not clearly stated here,
> > that packet will be processed in both, the inet and the ip/ip6.
>=20
>=20
> There is a command to display the datapath hook pipeline per device:
>=20
> # nft list hooks device eth0
> family ip {
> hook ingress {
> 0000000000 chain netdev x y [nf_tables]
> }

Pablo,

Is there a minimum kernel version required to get these to work?  I've
tried it on 5.15 and 6.1, both of which just spin for a second and
produce nothing. =20

I also tried a bunch of other 'list' commands and got 'list ct expectation'
to seg fault on 5.15, but it's fine on 6.1.  (And all of these other 'list
<state>' commands produce nothing on my machines.)

Eric
