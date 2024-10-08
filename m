Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD315F3FF
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 21:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728424020; cv=none; b=gjaGkazCIMQU4NbdEZDn9Y/fqd41gZGJWf/RDO88J5cZ/N6AnQ9SVSQL2beCehLkdrCKsHf3p9IuiJGpof49eQ+PWvQm+fz03tMZbA/eGOxU4PGwo+w42PZM+gIH5QuhQD92cHWBy1Z0CtxNFJ1bfoe82xHMA3mAf37YtS6pQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728424020; c=relaxed/simple;
	bh=k8+ku8EmNhVcx62dUwGZ0eLGAb7YkZfgvaG3gdIInSM=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sDDygwaQzCUxpSuO7g6gujSXtBFwdQXTd4sweAv5KVZnpVUVKQLuEQBZJ+6SkdL+hvLVIxTWn2LlaoiyZut267FSHZGFL3ls9Lawii/t9pl4K9TEJ22p+BE7NJVWBxNUNFCg+S+sTVrRtM9+8U9Ud3vnEJFCRk3fMSbNPYN0tvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=u4szb1fL; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=BRPlIXm8; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="u4szb1fL";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="BRPlIXm8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=nDfqXiSiL1IvH2B7DFGv3aeZY5gxwJV4fi2Am4srLxM=; t=1728424015; x=1729633615; 
	b=u4szb1fL1ldvSTLCsYHCeRYbg6uf0AdsHunygq7WXQOM9wCsGpynL4wD/G0PoTak3v7lN6zqK/o
	tp82VvU85qPNOuSfxvd/TKNH68H0SF87yd57TZGQ4hkkGB1FJYIxAXzAgGJl3QUfisHw0lWG8MGtj
	JMy5EUHQ6LNuHVBsu/4=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=nDfqXiSiL1IvH2B7DFGv3aeZY5gxwJV4fi2Am4srLxM=; t=1728424015; x=1729633615; 
	b=BRPlIXm85Z0FTEfm2T63NABvbYEEJM8FabFlsEgamz++KcgbOt5SDynnu8HvEp0bK/kUUNrdnB8
	6Of58k7A7Dg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1syHxP-000S6T-2Y
	for netfilter@vger.kernel.org;
	Tue, 08 Oct 2024 23:41:27 +0200
Date: Tue, 08 Oct 2024 21:41:25 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: Problem with ipv6
In-Reply-To: <98f3cf05-f4fa-4f13-9044-508ccaf17728@mtasv.net>
References: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net> <bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com> <98f3cf05-f4fa-4f13-9044-508ccaf17728@mtasv.net>
Message-ID: <174AE88F-91A4-4189-90E3-93814F0BB318@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 8=2E okt=C3=B3bra 2024 21:18:14 UTC pou=C5=BE=C3=ADvate=C4=BE Mart=
in Brampton <martin@black-sheep-research=2Ecom> nap=C3=ADsal:

>Is this a sensible rule?
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 icmpv6 type { destination-unreachable, packet-too-big=
,
>time-exceeded, parameter-problem, echo-request, mld-listener-query,
>nd-router-solicit, nd-router-advert, nd-neighbor-solicit,
>nd-neighbor-advert } accept

For IPv6 here is one simple rule: you must not block NDP, nor in INPUT,
nor in OUTPUT, it will make your life more easy=2E When you understand
NDP in more details, you can limit it for more security, if not, just allo=
w
all icmpv6=2E Do not try to be too smart, othervise you will break IPv6=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
