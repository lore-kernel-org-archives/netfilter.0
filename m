Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097913D6A
	for <netfilter@vger.kernel.org>; Tue, 23 Jul 2024 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721730190; cv=none; b=LZR4FUf7G30zP0RA4HlXwcNMePD+WanGCTSsJgMp5RfEZqRcAPMQyZqOS8l4OYmmFtEvhEA1jvpSQaq6aBN4Lk1G7CqqEIPKTWEwpWlUADFv449Gg8fA13cgZbenfwEuwZeOKoz/EaEyHEZZskH3EFSn032WEcRh6kmrb3FolU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721730190; c=relaxed/simple;
	bh=Y0kMi8hfq2WHri1adiLoysABNHO0SKz6BA+ijiNOmVM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dRSW6ZsNb56CA5iL4v3ZRXGjLyeZjq1ZhSKTXOUuJrEOMJPINdCOLAyohIk99KH3WrpCJ4S66TxtyXNaEgrV0syY8cdhKsqhtTBzcVSOBHEFA2QuimeVTD7NUz+QKDedkG5cdEYFwUtYSYicGD7Ozj1cJbVhaEwxFRrZVh/wY2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=kwzytNrB; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=vLt+0T2R; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="kwzytNrB";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="vLt+0T2R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=Y0kMi8hfq2WHri1adiLoysABNHO0SKz6BA+ijiNOmVM=; t=1721730187; x=1722939787; 
	b=kwzytNrBqOGcjIZViC/dqOazZ07BYGMwf5qkrADKZUS+ernsqu63ZjdSHPPD1lDli7hYnWcrBDX
	X3dKGuePAzKGSGJARElvTuTQNGKiDeWLJh2HZKDBSL3NqR2pNjH5Oa0pSc1Ee83MhcRK1xOQQhV13
	lM0e8Th6gqg+RhPgPFI=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=Y0kMi8hfq2WHri1adiLoysABNHO0SKz6BA+ijiNOmVM=; t=1721730187; x=1722939787; 
	b=vLt+0T2R3MbI13eL3Sy3rQE7jc739aBsBAGi1SrD9a7zir1j++LOztsIrLHC850k6dwnK3DkRaN
	0bQzw7/kABw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sWCfg-000YU9-1j
	for netfilter@vger.kernel.org;
	Tue, 23 Jul 2024 12:23:04 +0200
Date: Tue, 23 Jul 2024 12:23:02 +0200
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Sets update
Message-ID: <20240723122302.63dcbfed@bonifac.skk>
In-Reply-To: <Zp96TJrXOz3ZIPLK@calendula>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
	<ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
	<20240721132337.29d2fbc9@bonifac.skk>
	<4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
	<20240723092439.7b9f7b58@bonifac.skk>
	<Zp96TJrXOz3ZIPLK@calendula>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x8C5Wm0lc3xhFDrKFMM/f56";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x8C5Wm0lc3xhFDrKFMM/f56
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ahoj,

D=C5=88a Tue, 23 Jul 2024 11:39:24 +0200 Pablo Neira Ayuso
<pablo@netfilter.org> nap=C3=ADsal:

> commit fa23e0d4b756d25829e124d6b670a4c6bbd4bf7e

Found i properly that is (will be) in 6.10?

> You mentioned you are on 5.15, right?

Yes, 5.15.150 (openwrt), i choose to use openwrt mostly due its luci
(web interface), but as i usually don't work with openwrt (only on my
home router), i have not set build environment for it, nor i follow
its patches, thus no simple way to get newer kernel nor to patch
existing for me.

For now i installed ip(6)tables-nft (+ ipset), it seems to work. The
only downside is, that i see no way how to customize openwrt firewall's
(chain's) hooks priority (to ensure that they are run after iptables)...
I hope that it will not be problem. I hope that can live with both,
dropped before or after nftables.

But i will like to abandon iptables at all, is here some workaround for
that commit, please?

regards

--=20
Slavko
https://www.slavino.sk

--Sig_/x8C5Wm0lc3xhFDrKFMM/f56
Content-Type: application/pgp-signature
Content-Description: Digitálny podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEwhNakIB2F5/fdXmSAQVZxpJoYkcFAmafhIYACgkQAQVZxpJo
Ykd5gAf/XmV266qfJHMzXztIZf87aqWwYAS3RscESHLpHTE9B3EqRtFsPtWsL5hk
pnkepMTQpJM76j92Vvcpwmpn8Aar8OCzZKLUJbDFOLrDtkLN4XuE3miojMsG/WTw
5yByHLDnuhRQPizv2aneidNKP15sVd5VF6jr2+65P7gFaAr9UM+3ZvNdemffclXO
XUhzM8DtQjv6TYjeydooCtah25hC+cQXhVfSx2A1VuIeUxMZdk3dM5/V1x0GYCna
TsXLrwNQHHINNCL3eZ7AZLTBavSi/BpZg4mePTtCRArZYx3RqI8qI0701GPogxNR
zqaW92H3+szFf2Q6UnTlYkD6FgLS6A==
=q5oV
-----END PGP SIGNATURE-----

--Sig_/x8C5Wm0lc3xhFDrKFMM/f56--
