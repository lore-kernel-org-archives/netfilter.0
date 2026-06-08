Received: from smtp.rodier.me (pigment.rodier.me [45.63.101.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1197640BCBA
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.63.101.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930910; cv=none; b=Nshs0rRWdE0x4kC6wegmb566u+ZcTm3ZXvLSfGa2ATqemDMCK1LlAA7JaviYW+r13syejCAYWuZSeZlZDfCCMVMjsfGOFEUI0UbP4WnSTkHdRtBjhfowno+pla1K9GpflH1m14lWKbvbdMExOOo4fT9EMon9Nnv4UMSDNYJiPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930910; c=relaxed/simple;
	bh=kYmr/eNKF5Lb81OVkX1DRmmKAOl0RLlJuFTeE0J+MEc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n1t/ZTnqGvGJi/S+8VE2gdmTeU27AaoI9mRLDryTBelaR+h16uMEOM5iO+Thc6SKUE/IlfNNvgwhQlGqgTwqcB2gDakepLPcIWvXz4oTwsUaHqaVdeLjlPHFjrZk1r8revaZiVwuWpA6jQWBhTcomkYNv/AI7bv/KprIMfktV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rodier.me; spf=pass smtp.mailfrom=rodier.me; dkim=pass (2048-bit key) header.d=rodier.me header.i=@rodier.me header.b=Pgkbf+Ch; arc=none smtp.client-ip=45.63.101.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rodier.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rodier.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rodier.me header.i=@rodier.me header.b="Pgkbf+Ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rodier.me;
	s=pigment-2026; t=1780930898;
	bh=kYmr/eNKF5Lb81OVkX1DRmmKAOl0RLlJuFTeE0J+MEc=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=Pgkbf+ChlzyYCkuzfBfSdI+Mncj59wJlUtDp8kBmcUSHwGwk4R4D27EcFtjkKeiv6
	 D+AkWHYuzR77SA2tZd8x+NoL90AThK7Wzj2f9nkc1peRXH+Op5ONHf2ZH8Eu/AiqNo
	 0oU+OenvkiBwydRz6ngzWFB/pOTMHz699Rwdubn3tSj8IhoeQbVKzCIoD7qg0DjCi4
	 fDtjzTN4PTKuG3zxuIu59bOmumJB2V2UVfC2sSMK75lhJQ8lsuVtQtmnRI18pnvogj
	 tepLJTqIywA5z2V0+fpMPBRbGqe+hv6bLFOtft45i/zORBk8CNqDCX+lpk11Mtc3kF
	 hBbViJ3t/1kCQ==
Authentication-Results: smtp.rodier.me;
	auth=pass smtp.auth=andre smtp.mailfrom=andre@rodier.me
Message-ID: <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
Subject: Re: Question on rate limiting on nftables
From: Andre Rodier <andre@rodier.me>
To: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Date: Mon, 08 Jun 2026 16:01:37 +0100
In-Reply-To: <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
	 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
	 <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-08 at 14:32 +0000, Slavko wrote:
> D=C5=88a 8. j=C3=BAna 2026 12:45:55 UTC pou=C5=BE=C3=ADvate=C4=BE Kerin M=
illar
> <kfm@plushkava.net> nap=C3=ADsal:
>=20
> > If the problem can be characterised as "I endure too much log noise
> > from sshd and I find it annoying" then perhaps configure sshd(8) to
> > additionally bind to some other random port than 22 and expose only
> > that port.
>=20
> Not worth of change ports, soon or latter it will be found
> and abused as default port.

There is a big advantage on changing the port number, though. It is
reducing the noise considerably. Also, a connection attempts on a
different port should immediately raise attention, as it is involving
more than a basic SSH scan bot.

> Fail2ban or so, can block addresses selectively. BTW, here after
> long time (1-2 years) of banning the counts drops from
> hundreds/thousands
> addresses daily to tens daily. Currently, i have banned 30 addresses
> with bantime up to 90 days, from that the ~20 is today "spike".
>=20
> regards

--=20
=F0=9F=8C=90 https://rodier.me/
