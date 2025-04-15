Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356401F5434
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733993; cv=none; b=Qqpq8coQ17Xd514hDcQTxLoTJxj67FuTmy8ouPFbvpJzk6s5ukLHBfIiiGQrnhi1uoAbrtUXopLGqkvJ00ROGMv0JZfDNaw95fFITbMfHVD6GoAgCs5s4abadInBSy0DDHxyL0oqBoo9aeeuv2gwq5y31ayAxfoLC62DSGinxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733993; c=relaxed/simple;
	bh=DJ7ESwDTckB6XgY8jpwGuN3j+Z5WCVz448Mb9QK+qoM=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZqRL77uMxhNwE3CbL56xg1pScv+octK6vnZ9Kh8onz4x9i9UnUUpvloClaCSFrnnbvOojdy07wOMjGrfnLyTRaAbyasqqSEZl04HSvJoklRUdzv23rVg44xnX/gX/xM6Kf9yyBuwLZyWQAbIynqNEsi4Qib0/Cbo0yCK4J1CN64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=J+7Y5SCS; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=Cma5+V2B; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="J+7Y5SCS";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="Cma5+V2B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=E3MTMCU8wN26PKH88fNxs1q7eunpB5gpduudQSlFtwY=; t=1744733990; x=1745943590; 
	b=J+7Y5SCSwO0hLusdnT064RMNfKi439rpwaH8+MIoeXEnx8UP6wpzksxDCer6lewW6swY9FJezZW
	Si8tQke773pulNoMq0VZugouSGwDsEvBunPDgkMySk801HlfXgtLolGvvcJJ/xZAFOYrYDvGZrQpu
	Z39RiiFk2PA384QxNKo=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=E3MTMCU8wN26PKH88fNxs1q7eunpB5gpduudQSlFtwY=; t=1744733990; x=1745943590; 
	b=Cma5+V2BOskkuPQ9/cXj35rsDiDIZd1+suHdoLhvX0bFu1g3tV9Y99e6k7nWrRWactTCuCyvaMv
	YW6TmaPpdDA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u4j0l-000FHM-0n
	for netfilter@vger.kernel.org;
	Tue, 15 Apr 2025 18:19:47 +0200
Date: Tue, 15 Apr 2025 16:19:43 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: [ANNOUNCE] nftables 1.1.2 release
In-Reply-To: <Z_6BJ81Iw1uS7zuY@calendula>
References: <Z_1KxMUDT0D8e6wH@calendula> <d110693b-efa3-4742-8d6e-f56c83ef66ff@slavino.sk> <Z_5vmAQdcUCOg86F@calendula> <01529A93-9DCA-4F48-8F80-C4CB32A11B43@slavino.sk> <Z_6BJ81Iw1uS7zuY@calendula>
Message-ID: <111EC295-F2A7-4418-A913-8BA847B19666@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15=2E apr=C3=ADla 2025 15:54:15 UTC, Pablo Neira Ayuso <pablo@netfilter=
=2Eorg> wrote:
>On Tue, Apr 15, 2025 at 03:22:52PM +0000, Slavko wrote:

>> Now i add one network, and one or two seconds later second
>> network::
>>=20
>>     nft add element inet filter testset "{ 192=2E168=2E1=2E0/24 }"
>>     sleep 1
>>     nft add element inet filter testset "{ 192=2E168=2E2=2E0/24 }"
>>=20

>After this update, two different intervals with different timeouts are
>added=2E

OK, that is good, and IMO expected=2E

>> Another example is to add subnet of existing element, currently
>> the new subnet is not added (or is merged into existing without
>> timeout change)=2E How it will work with this new behavior? Will be
>> both in set? Or error happens? Or something other?
>
>After this update, with subset, an error will be reported if the
>interval overlaps=2E

That is not good, it will break my current use case -- set filled
from BGP, as from time to time networks of different ASNs
overlaps=2E In really, i use auto-merge in this set just due this=2E=2E=2E

I hope, that in one big atomic add, all timeouts will be the same
(set is flushed in this atomic step), but one cannot do it in cycle
(with separate add), as even ms are compared=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
