Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5ED219FA
	for <netfilter@vger.kernel.org>; Wed, 17 Jan 2024 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705505458; cv=none; b=Xgjel3nzc/y2UWx7XYe9PAYORtUufNVHgEY3f6WAxDQCdcO3FHdnJhnSC8MJa05rzfCtQFtOeUfsXVdFfYdkiLRBmkVPbo0iGU0FEhcyHic73wuiBQ5hTKjxWu4c8H46+ObKHGzur+wa6hVX6tAaFmt73C7+hX811s7WqNUJSi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705505458; c=relaxed/simple;
	bh=6pwjzXAovvodo+OFjeNawQ+Ch74DR2Xdh9QbqWU3j0U=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned; b=AvANJ0Zj8J/P/tTCac1SIkFTICiuRTSVTfgRztfkvXrPKjf2Va7gol/yyNGfDp6gDKOzBY4qzygnVeaY6/dsTAPAdgRPOiQ2tbbOZbxNmktXt5ZLYg05+WX2Uczd+KH6Iw7mcRlpFJJjsSzYh4HjTH2e8w5Ax3Purc9fRb9Rtc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=dxy8KX7W; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="dxy8KX7W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3ffWS0QGgEbpuTB84P63mrrLZROkSKs21+JD9ac60Fc=; b=dxy8KX7WMqLGcyeGFctRq/CA3N
	8oVF1mTbhFP86RM05kBUnCN5X2y6+u00n0Ytq6r4AsEDfLVXO6KYkvYqsnUK6rav+7Yx/22sDKP7u
	4pZIdwkjYaacbM0UbpL544EV97bY0zxuRK8ia2pAaYdbM14ZNzMbXbB2oLUpSvRIAFh9/qiKeBOkk
	HqLyT4QKuXUALkLGkOFGMEG3JQjgy4OyQMNXu1hs4oI79fke02lqbjv0wANpTlhG3gwwZ9QbMOoIo
	YXiPbxIPNQ8s36vRvwWfmv7HdG7nN9Bdivc7hl2gQKNYf8BcfLz5UOqNTdqSgxsafde/ldWIQZAy9
	vXYKaa9A==;
Received: from celephais.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f] helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1rQ7IG-00EXDf-1I;
	Wed, 17 Jan 2024 14:53:28 +0000
Date: Wed, 17 Jan 2024 14:53:26 +0000
From: Jeremy Sowden <jeremy@azazel.net>
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org
Subject: Re: Debugging libmnl client
Message-ID: <20240117145326.GC213513@celephais.dreamlands>
References: <50854203-77c6-4145-8d87-8b493ac492a5@tana.it>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6uXBjaU7aZ3/i6fq"
Content-Disposition: inline
In-Reply-To: <50854203-77c6-4145-8d87-8b493ac492a5@tana.it>
X-SA-Exim-Connect-IP: 2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--6uXBjaU7aZ3/i6fq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2024-01-17, at 14:21:07 +0100, Alessandro Vesely wrote:
> are libmnl debug symbols available?

The details depend on how the library was built and installed.  Based on
the location of libmnl.so.0 listed below, I'm guessing that you're using
Debian or Ubuntu and have installed libmnl0 with apt.  In that case, for
recent versions, you should be able to `apt-get install libmnl0-dbgsym`.

J.

> mnl_cb_run() returns -1 without calling the cb().  I found a file using d=
ebuginfod-find, and did so in gdb:
>=20
> (gdb) add-symbol-file /home/ale/.cache/debuginfod_client/c27acdf07e5746f0=
a6c74055e6b21dbe700e054d/debuginfo
> add symbol table from file "/home/ale/.cache/debuginfod_client/c27acdf07e=
5746f0a6c74055e6b21dbe700e054d/debuginfo"
> (y or n) y
> Reading symbols from /home/ale/.cache/debuginfod_client/c27acdf07e5746f0a=
6c74055e6b21dbe700e054d/debuginfo...
> (gdb) break mnl_cb_run
> Breakpoint 1 at 0x2860
> (gdb) run
> Starting program: /my/client
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
>=20
> Breakpoint 1.2, 0x00007ffff7cb9860 in mnl_cb_run () from /usr/lib/x86_64-=
linux-gnu/libmnl.so.0
> (gdb) n
> Single stepping until exit from function mnl_cb_run,
> which has no line number information.
>=20
>=20
> So it's not a good debug symbol file, is it?
>=20
> What am I missing?

--6uXBjaU7aZ3/i6fq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEbB20U2PvQDe9VtUXKYasCr3xBA0FAmWn6eYACgkQKYasCr3x
BA0M+Q//d3Rm34guLBhYjHyb8glFJdznmAMmRk1pdDaMlEwN1S1T2/m+MiL6QEuX
iJ6985fSM6jzvNNjCzZCKT7B6/3q6zeDHLhtGUFDlK76LOEAsba1LJ7LD2cm1c/Y
ZeDudUeK9fMy9ass8veUc9NRLnOffv7HFhX8ehEBGBHe5xzthJNCZdkx88N4azvH
bJdUL3riA0F1WltM0DeiTpsIXxzs8iqqwN+ekCz0jEAuEpDA8tmjjnGiTWMFePtJ
64Hq9Ku+LXOIDA059vbVvAtdHodQdjKh7xVuMKldgKrxEvlrpJGikWduz01jLnE6
y/TgjjXv+iaD8Yi/u1YtMFNfOpUoK6ytM56kaA7ZwcEYucYzG1fgFi8YiOpV4loe
GFmlUXcOhj8V/yIh4pLmgHNmLOcytQRNSY/3Lin52OAMGRq6luOWarNqSBbLOciC
weEgAanCf3cRs35EeJ0v7MMCrxAcEy4658X7skwjHn2hlZmLGcWu2CyENRXHqUx8
trKXEhuSVwQFAUI0TuWjvLZ9ekkhAfRAtN5pbJV6DowQ4q1TcQW8W1WUS+wF8zf6
mShRfc4p7f119kyPcjienp5uR7HQ3hTOpOS5qa07YJwJkw/tBIgpVE/j7jfJkoRB
hIinBpiQ3zkGqxYV2ATwnVUatZKakNxQzUkETeagvrJXydfU4V4=
=mJOb
-----END PGP SIGNATURE-----

--6uXBjaU7aZ3/i6fq--
