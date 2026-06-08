Received: from smtp.rodier.me (pigment.rodier.me [45.63.101.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED9340281
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.63.101.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924452; cv=none; b=q754CVZsnnXAyYWN+TEtucfzjEqYR9Isi/xRKmCikILhRELYyHE86bha6dVHlcphshPvJvNhPLgh4rSGPJyh1Ufp+V+IHCnSpHzAOLgUImoZoFVy6g44FFPznf+bg2M0VpD8eP/UtapftSixJLq+AHgOWGZnQdf2Qd4BMa0Q+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924452; c=relaxed/simple;
	bh=Mi3ax6/Ly7Tj+X8l4VXeECGRyfps/P37zCDIzvYV3uQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hT1ghhCZZ/D8jqQmJ7cmme+Z1Rbm3yL7v2R3fSZsJcdGw+/PGbMXhroKBmsdg1mnvGkULx7qn5pCXs0uXjEiw+08TmmF7shAR5nnWgHv7w3BVHnBTLFrWYAA8EwuKC0aERdFcPja6mGsF2IXzYMVf/mAV5muB+V1Jrt3/VOsS6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rodier.me; spf=pass smtp.mailfrom=rodier.me; dkim=pass (2048-bit key) header.d=rodier.me header.i=@rodier.me header.b=bySFruM4; arc=none smtp.client-ip=45.63.101.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rodier.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rodier.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rodier.me header.i=@rodier.me header.b="bySFruM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rodier.me;
	s=pigment-2026; t=1780924447;
	bh=Mi3ax6/Ly7Tj+X8l4VXeECGRyfps/P37zCDIzvYV3uQ=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=bySFruM4dBFbDH/wnIuYKdldi3fXF+eaw3o3Nw61ghuoxF4V9i5jv5LAz2LKbZu40
	 hLvkpXFgMdTCkvE29miu7tEZVD5BopBDXhtr2OphqJIG35snByaVc2vBeNkyem2sPk
	 Irlaorr4ZaQinMxhmwX5z1GD3SBJX/jmrWgKmu6/mTydY97M3dQ34IvvzWosGCW7Bp
	 jD95nJrBfx/Sxxw3HrD4umrw3G8gGndXjign7vRxL7sxMtmfUPrBp2tDkXzc+5CfCF
	 lEDDbxDtNFAKqmfSJ3cCX+rawZ+X6TVWfVFvQptipoyoYFy6+OHOcpFpOAGVmBpziV
	 EZjni14AUQjaQ==
Authentication-Results: smtp.rodier.me;
	auth=pass smtp.auth=andre smtp.mailfrom=andre@rodier.me
Message-ID: <f6b24b083eb96773e6446ea0b2b1ff196a682d00.camel@rodier.me>
Subject: Re: Question on rate limiting on nftables
From: Andre Rodier <andre@rodier.me>
To: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org
Date: Mon, 08 Jun 2026 14:14:06 +0100
In-Reply-To: <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
	 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-08 at 13:45 +0100, Kerin Millar wrote:
> Hi Andre,
>=20
> On Mon, 8 Jun 2026, at 12:30 PM, Andre Rodier wrote:
> > Hello,
> >=20
> > I am testing nftables SSH connections attempts limit, and I read
> > about "meters"
> >=20
> > I would like to know the difference between these two methods of
> > new=20
> > connections limiting, and to ensure the first one is correct.
> >=20
> > The first option:
> >=20
> > ~~~
> > table inet filter {
> > =C2=A0 [...]
> > =C2=A0 meta nfproto ipv4 tcp dport ssh ct state new,untracked \
> > =C2=A0 limit rate over 10/second \
> > =C2=A0 counter add @banned_ipv4 { ip saddr . ssh } \
> > =C2=A0 comment "Ban SSH bots"
> > }
> > ~~~
>=20
> This sets up a single token bucket whose state is controlled by any
> host that sends packets to port 22, facilitating trivial denial-of-
> service attacks. Consider the following scenario:
>=20
> 1) one or more third-party hosts hammer port 22, keeping the bucket
> empty
> 2) while it is empty, you innocently try to ssh in
> 3) you are added to @banned_ipv4
>=20
> >=20
> > And the second option:
> >=20
> > ~~~
> > table inet filter {
> > =C2=A0 [...]
> > =C2=A0 meta nfproto ipv4 tcp dport ssh ct state new,untracked \
> > =C2=A0 meter ssh4 { ip saddr limit rate over 10/second } \
> > =C2=A0 add @banned_ipv4 { ip saddr . ssh }
> > }
> > ~~~
> >=20
> > Is there any advantage using the second method ?
>=20
> Yes, because an individual token bucket ends up being maintained for
> each ip saddr. Be mindful of matters pertaining to resource
> consumption, though. You probably don't want to size your sets with
> the intent of being able to cover all 4.29 billion addresses that
> exist in the IPv4 namespace. As such, it might be preferable to ban
> shorter prefixes - such as /24 - rather than individual addresses
> [*]. To do so would reintroduce the problem of collateral damage (as
> with your first option) but would limit the blast radius to batches
> of 256 addresses within each /24.
Thank you, this is a very useful and detailed answer.

>=20
> It might also be useful to reconsider the problem that is ostensibly
> being solved. If the problem can be characterised as "I endure too
> much log noise from sshd and I find it annoying" then perhaps
> configure sshd(8) to additionally bind to some other random port than
> 22 and expose only that port. If, instead, the problem can be
> characterised as "I'm worried about being hacked" then be sure not to
> permit password authentication.
I used SSH for my example, but I use a port knocking sequence.

>=20
> [*] This is made possible in nftables by its support for bitwise
> arithmetic, e.g. "ip saddr & 255.255.255.0".



> --
> Kerin Millar

--=20
=F0=9F=8C=90 https://rodier.me/
