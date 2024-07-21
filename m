Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01CA944E
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 16:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721578176; cv=none; b=IMaCKy2QC+ABEwXyuaeEDMEa5MNzW5Hps7MUIjgu+Wf7YGO9QGgYFLhlMvNlR4bRGlQEUUgZJyVguEWBb8C4CEwc9EVAjvpSbVFhhtUpDs81oOyGRWTvGeVSqoXzZBQb39hOUYwzWQdv3pkOQX8hnNviLIRXEg2dDGK1XMo06jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721578176; c=relaxed/simple;
	bh=pwjTdtxGK41fnTFfMzlIUAefCzw3ld5+hXXCHWCwb+M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQUEbBmIGQCDiFcaEra/PT5FlWDEtuk/otakv8ps7JpgQIItfWIKAuMDZxU4mfhi2LWX2xakQ1p6b5gJDo2xwjisZevx4wg6wCmRIOGJTJmEw8fSgKr7H9lSNk/nH/SFL6bmD6dm8EfbDcUGgJvy22vx6wrLFbsyn0Q9CCQHx1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=GawQi1/z; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="GawQi1/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721578165; x=1721837365;
	bh=uLFAWqTcrSMn8Dycvyc+xVdO9i0ElLpubgkSvKZlaZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GawQi1/zql7gF5Je52Ez4JCyU5XQLcg9ZM9MTswgrHWpWDqo0dYs+ucsWsViphiVL
	 rkweAUP63vQlz4X3JW7c5qzxu1YfKr4uw4o4szxSk2j3O3Vrqocpe5XI/EkiXFMYDB
	 dVY2kYmNDahfOXkmB738azbamQBs64+T5kOEoTKyp1ROFUWZkarU3J+QIa3j/wgmOw
	 +I/TtdWKG1s2G1iJGPYK/LuqsQMnHO1X3cNvHuz6XIfi7iW2bVq00jxI1onwbhJ5+/
	 3tv7PTuy+HsYjGRS4y9Jr/1S0ggX9Y7eqZK5sj0kBUTHtXrn+accDx2HPQ2J+srlQN
	 L7MXe8mm167cw==
Date: Sun, 21 Jul 2024 16:09:11 +0000
To: Kerin Millar <kfm@plushkava.net>
From: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Sets update
Message-ID: <IaAIguFhd9166N8ahepxBr7RDvjeW_BR2R0yuNXw0bCEGePrIv2hmcAPU6J2PM6JciU1Rd3YaqzqRA75zSf8OliDMf-gqNetZkmd-3SNHf4=@proton.me>
In-Reply-To: <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk> <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
Feedback-ID: 48716100:user:proton
X-Pm-Message-ID: 708125b1e94c0e55b018df4b2a3475d097211749
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sunday, July 21st, 2024 at 02:58, Kerin Millar <kfm@plushkava.net> wrote=
:
> As far as I am aware, it is impossible to add elements in a way that mere=
ly reset their expiry times in the case that they exist

'reset element' was added in 1.0.8, but requires kernel 6.5 or later:

nft add   element inet xyz set_ipv4 '{ 1.0.0.1 expires 1h }'
sleep 10
nft reset element inet xyz set_ipv4 '{ 1.0.0.1 }'
nft get   element inet xyz set_ipv4 '{ 1.0.0.1 }'

See https://bugzilla.netfilter.org/show_bug.cgi?id=3D1689

Eric
