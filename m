Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE3323315F
	for <netfilter@vger.kernel.org>; Wed, 16 Apr 2025 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797774; cv=none; b=pqgxuMCN/iY37cVk+vTgdhBQTGds26TgfdcQzrkknGSQbymPmmH/GJofLrPC5xIWN4tndaD3vxUMzGWlx9PhJRwsYKfFbEZ3T32O/PJF237RDCxpTuNy30h2QwAeKhAg1DC4OueyRYMJ4k7hJq3I4QysmKqY5A9bJJielsvk0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797774; c=relaxed/simple;
	bh=twpc5q6PXSpPE1XUbSs6WlxGhr+J+RPb4cAdsrCp7QA=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TAr7DfQuJFZPgDaVpG4JvyxRvPMwqWbsX0NcBFoKZhv02mTvTX3k7x2cyNEp9fBW187ZvXqW1hm4KWy+enWSlm1CmzmHKC/EXzVUIyKmXpW8DND3UkfoFBCIx7AB9lc8qksoKVUC6Sq7pNHQxeq0okW1MGS6iMWsl4ihMnw6KO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=gm1u7OVl; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=De0woQA0; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="gm1u7OVl";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="De0woQA0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=twpc5q6PXSpPE1XUbSs6WlxGhr+J+RPb4cAdsrCp7QA=; t=1744797770; x=1746007370; 
	b=gm1u7OVldOirIl8naVkYGZGO1WdrW2F/fUpnLGtfI1ISsLR5mLPMNi7YrfPzZwgYfosTTXV4Ljd
	wICnvsyfkR2TE/FI+24PlC7J5NW0joMPuaINKCKYCTbDfYfTB7G7pswBO2HUlSWb3f9Teq1crpjcA
	Dj812gID4WHGemwntsg=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=twpc5q6PXSpPE1XUbSs6WlxGhr+J+RPb4cAdsrCp7QA=; t=1744797770; x=1746007370; 
	b=De0woQA0Xaadh8sEtpNtoyXCTz8c1fllTQUjmbbyvfOPH5mrQ/4QLkO/DmhLEwvnKgLgPwqeudz
	ldYrY200oCA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u4zbO-000J9T-0V
	for netfilter@vger.kernel.org;
	Wed, 16 Apr 2025 12:02:42 +0200
Date: Wed, 16 Apr 2025 10:02:40 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: [ANNOUNCE] nftables 1.1.2 release
In-Reply-To: <Z_6JE714_89IOzb3@calendula>
References: <Z_1KxMUDT0D8e6wH@calendula> <d110693b-efa3-4742-8d6e-f56c83ef66ff@slavino.sk> <Z_5vmAQdcUCOg86F@calendula> <01529A93-9DCA-4F48-8F80-C4CB32A11B43@slavino.sk> <Z_6BJ81Iw1uS7zuY@calendula> <111EC295-F2A7-4418-A913-8BA847B19666@slavino.sk> <Z_6JE714_89IOzb3@calendula>
Message-ID: <E881411A-02BD-41A5-86C1-3CB5124EA8EE@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15=2E apr=C3=ADla 2025 16:28:03 UTC, Pablo Neira Ayuso <pablo@netfilter=
=2Eorg> wrote:

>Otherwise, auto-merge becomes of limited use with timers=2E

I have timeout on it just for case, that something goes wrong
and content is not updated/flushed, to prevent stale elements
and auto-merge just due overlaping entries=2E

I use this approach with ipsets (i have only one public nft host
yet, for testing it)=2E The main difference is, that i can have subnets
and its supernets (as separate entries) without any problems in
one set=2E

>Let me spin over this again and get back to you, thanks for you
>feedback=2E

You are welcome=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
