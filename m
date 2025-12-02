Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E638460
	for <netfilter@vger.kernel.org>; Tue,  2 Dec 2025 05:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764652969; cv=none; b=b3FVAQEqpKTp/2Rvn6IDzDiW2Npc+2kLuQc2Sevl3reh1VHZKBWcaAcfeUtff5bmIRd5SJe4XB3puYqU9MFVdLQNq1aOtiP4wUEx5lRuwpnehpiUkNBx1Vi5M4iuCrA64pkFM55856SMGluvzFnPVvdvdLbUxvmmS1lyik4Xt4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764652969; c=relaxed/simple;
	bh=AyXMBZaWF27mzjav34UCz9erjlgnBGz1fzwm9jb1zJU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sufRgly1kUaIIr67bvmZofePJppAj7RzH9Lx8WEF9LoQSKIWggX4cgdS07LjwtiSJTsjxdqEFJp1JNTKFGBDM23xjIhlcGHM5xm/INdDoTs8vf1yjxp0UJcx3zhj619UpHrL4+E6ilpCIlZCejXtDLDYNY+MAeY8fcnjrmeGKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=kLTxISpa; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="kLTxISpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1764652959; x=1764912159;
	bh=AyXMBZaWF27mzjav34UCz9erjlgnBGz1fzwm9jb1zJU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kLTxISpaiInjEiGFnMxOnC8K2HQzDwBb0Xh+pK7TMmon54jPSFIYcV3+WoH39dpHo
	 BPwbun0qisI/hQ7t7YA95IeZ5moktP0fZ/XVM6I3Mr8MMdW7Dt52ttdjfP+PUcrA8l
	 UNmh7vb2oqDkJDrAv+VI+ZwZd8l1+C556ht4EAckMd5cIKQIZLCEYt8ip6QYtQ6ndu
	 cJpgilTYVetbWHL4WW/9fgYGAqFVzhpmzwOn8zyQqOxxWhiwBOXi5w3fHVfA7MipCI
	 JdG2zImlXUkWhojkl71TXK4ssN1+lFwtaYAbYP3T5gf+xfGdrJXkhokNa4R/r9+RxA
	 PbXsXeMU6RHLQ==
Date: Tue, 02 Dec 2025 05:22:35 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <kuUJGRs1a1DdAt7MEJCz4fXLEjqeBjJVCBHC1on_UwwZ_dzm2oBlaegoGvfXtBfOdBiaqIIxr61cjENm4ruyDE0oFIJATfzuTBiD2n4uimQ=@protonmail.com>
In-Reply-To: <GkTCZ4QMPjhS04MCXYiLoDrM7d866Suc7ALxvplJpr9bcr6HRlooJ6_xsL4TUjr6Svkztc5Gz9FOqzQAON_GvpjFyPGPpUqaE_sGaBiNBgc=@protonmail.com>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com> <20250128003706.GB29891@breakpoint.cc> <Z5jQgcbCXiLyPwV-@calendula> <PVrkUQp56-Jj22U0UNcuDB2ECbRGvxlQdpV9wqJEScEZCv87qu5FdvjBKhhAzXkGv71nnXYmPI2TlxCo-dz_Mz-2Y52rrOVQLWvmPYm7cIA=@protonmail.com> <omRiDfO4yHw_nf-Xsk390UcpY_66yoc_oOELR6Fwu94Nr4QtjOT_1tcjVT_wOaaVW5QwqNRBvQonQbXXayhp1CFTAKEF3Qz0ToC7HenQBpk=@protonmail.com> <20250209014753.GA1766@breakpoint.cc> <WBhjrc0cnQh1u_11--tRibauTRslpdAmnTsjeE4tfNg85IDiO5euCk3pLgdnqOZEhq5mbDD2IRo_XykzL7V0UeSisrebbDrIjGon0qifnag=@protonmail.com> <Z6kq8I6WG96GkNsI@calendula> <GkTCZ4QMPjhS04MCXYiLoDrM7d866Suc7ALxvplJpr9bcr6HRlooJ6_xsL4TUjr6Svkztc5Gz9FOqzQAON_GvpjFyPGPpUqaE_sGaBiNBgc=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 0c7f54864e9a627c31783cc69926cf4afa85a8b2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

In regard to this chain; I would like to contribute code to the NetFilter p=
roject: what is the best way to exchange PGP keys?

sunny

SIGNATURE NOTICE: sunny_0xAD0EBA5C_public.asc
[KEY REDACTED, WE HAVE NOT MET]
