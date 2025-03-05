Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD17134D4
	for <netfilter@vger.kernel.org>; Wed,  5 Mar 2025 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181422; cv=none; b=AI50DeIlskUz64ED+csVJSTZVreIpfB92SljQYtMwRC3Ujwv+JdWEyfA34G9cqk4IiVp0rMp77eWQlyE2da3qQ4jzyJ2FJ7rLS93Kszwgs8E08NwoS2/Nb1+Ztb05zmyrNjwvvOI7faoNiqx/ed5+1zOdUEhFHGBKlIHTViNkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181422; c=relaxed/simple;
	bh=WFPmgY09gFLNAlSDB8ZNbqlSTP38VYcCKHXTOqTRst0=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=uh99Q4kAEO7k8ljiyIw+d7KLqGP2N/AegwZg5uqTnvbgR+jEN+lmQv//S1D+qvLHAvitUESa5pKVoOduxS+vKOXE9LJ3rGeNUPYxcPUD3PWNH+PY25l6fOsDh6uVBDBDSPeKIGvCYgPk6+vM5LkZmsZ07Ix+ikzlRlhWo+nEpEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=pzMvBVBn; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=LOkwQFe1; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="pzMvBVBn";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="LOkwQFe1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=5BWcosny7DXllWlEmo9PQAsLR0xWNH7cdZnEoMWrJP8=; t=1741181420; x=1742391020; 
	b=pzMvBVBn0hm9Nk7VbDFUyXoZkaF7Bq6EB78Smrm8HX6d28W3X07XUp17phK7CxN18PrGEgLEAt4
	sWn4vs0XGYTIfViLzBmbL31cSbbnxHEzbOrayANT9wWPjpGy9gv/vOepVp0wetHkm1rC1T+FSYQm2
	kgB7ADN89YFxnJcpSQ8=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=5BWcosny7DXllWlEmo9PQAsLR0xWNH7cdZnEoMWrJP8=; t=1741181420; x=1742391020; 
	b=LOkwQFe1RZ+4EIpb6ANE5ZrsmH9BpwAb0YRwb4nY8oHXqV4Keif0+kr5GMPqqoWpfSuwheNfpZe
	gTpGawoaeDQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tpopF-0023e1-1X
	for netfilter@vger.kernel.org;
	Wed, 05 Mar 2025 14:30:17 +0100
Date: Wed, 05 Mar 2025 13:30:16 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
In-Reply-To: <20250305142016.37749842@bonifac.skk>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk> <20250303193533.GA16225@breakpoint.cc> <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk> <20250303220334.GA19712@breakpoint.cc> <20250305142016.37749842@bonifac.skk>
Message-ID: <C9C45DB3-2903-441C-A219-6BA13C9235D6@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5=2E marca 2025 13:20:16 UTC, Slavko <linux@slavino=2Esk> wrote:

>That "solves" the "Unknown protocol family" problem and packets are
>logged with ARP entries (beside others):
>
>    arp=2Ehwtype=3D1,
>    arp=2Eprotocoltype=3D2048,
>    arp=2Eoperation=3D1,
>    arp=2Esaddr=3D158=2E160=2E47=2E125,
>    arp=2Edaddr=3D168=2E160=2E47=2E125,

Ah, i forget to mention, that fields "arp=2E[ds]hwaddr" are missing
in log=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
