Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F9205E1E
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 05:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713678446; cv=none; b=daWrJOLAllGgQixELdvTZxPxJXKh8FGNsLz2+AW/4yg0RQ2G2Iz3g0MO91VyB88T0fbsVWTzfaHy/DUCVxCno2D2q8gCFRNsN/5wsZaOdQp8StxIt8FzWQtVJBVlupjjDvT/g6oKqaZTc5nw6BBfdPkUfZ5JhimnQvadMVwKdHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713678446; c=relaxed/simple;
	bh=VdyW+UviWj16dwu0N0CxyrpG1nbhMPQT9wr9cHwFUls=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sYpxidpN/vgzaiR/vyLJvS34tWAvvHlPT6xO0WtmL7dx5p9bDYltU9sIA4vGazStl0dnBvZeyhKQGVTpUmEecu7u0oDY1DfSM1lJcVh+DcxvQVZa3ml6C9FhLWCFDjADCpIWmbWGwY9ZCig4kcoC5K/iEGCKnaTnSYeeT7y/U2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=IOFOfASj; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=WRlyxjxy; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="IOFOfASj";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="WRlyxjxy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=CrWzlH1B3NM4s5yig1iN0HG7ZA34lP1ijp96KPxPe+E=; t=1713678441; x=1714888041; 
	b=IOFOfASjc5UFL5ypgGXfqOrTkSNuIRpIcjWJfVP5Xh9xjJ9ySLM7jdtufJIx8qVC6JQoRx5ET+W
	MDja8AGC/XByQr6z2TBy0EqVnsv1e2ZvqJwPMcLR4SzeptRcV11msAKL+qEKFufoK6OLMZk1URR2m
	YovHsrVpDv4CQtl7Z0Q=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=CrWzlH1B3NM4s5yig1iN0HG7ZA34lP1ijp96KPxPe+E=; t=1713678441; x=1714888041; 
	b=WRlyxjxy0bR42zj2997ITCLh59g+nCgS+pHGdnXLX2Pf0I+McHMAs5S9JLK8I7SSHZVp815j4Bc
	UiX+NDxnuBg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1ryQ2i-000g2l-1O
	for netfilter@vger.kernel.org;
	Sun, 21 Apr 2024 07:47:13 +0200
Date: Sun, 21 Apr 2024 05:47:08 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BThread_split=5D_nftables_rule_optim?=
 =?US-ASCII?Q?ization_-_dropping_invalid_in_ingress=3F?=
In-Reply-To: <rNVqfcHpj4XyJlxISjkKDdyRHbyPqlyF8MOHq07xz1_V3vc99maPQTsAuxgA2PZNbvff2dUfl2s0YdJBI4muw8A7FiMeKu2KvnjK0fG7kYo=@proton.me>
References: <20240420084802.6ff973cf@localhost> <20240420183750.332ffbad@localhost> <rNVqfcHpj4XyJlxISjkKDdyRHbyPqlyF8MOHq07xz1_V3vc99maPQTsAuxgA2PZNbvff2dUfl2s0YdJBI4muw8A7FiMeKu2KvnjK0fG7kYo=@proton.me>
Message-ID: <4850DCFA-8E78-4052-AE9A-CB67FD4916CE@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 21=2E apr=C3=ADla 2024 3:45:31 UTC pou=C5=BE=C3=ADvate=C4=BE Eric =
<evil=2Efunction@proton=2Eme> nap=C3=ADsal:

>I'd be very interested in seeing some statistics on how many actual
>invalid packets you see on a live link=2E  Stick some counters in there
>and collect dropped versus passed packets=2E=2E=2E
>
>My naive guess would be there are only tiny percentage of rejected
>packets=2E

Your guess is not as naive, at least on my low traffic server i have ~70
drops (IPv4) in last 7 days=2E On my router it is ~370 drops in both, the
INPUT & FORWARD chains (iptables), in last ~100 days=2E That are
really tiny fractions of other drops, but many drops (by IP) happens
before INVALID rule=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
