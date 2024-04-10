Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A655168DC
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772138; cv=none; b=FNKboiUeRrs0hO/XwHoWCwdHOby7NZ+a3GcgXE2o8wyT/oNqGbv+U9G2Ex2fX5IbiNeUpZA9U4j4FOZ4LV25aIt+NwsLLDKq5o2/IuzLIlNEbZKhfSqMGDFN68OaEMYjhkFCPLVZtT9QGxWFYots3S7uqJsA+STpU4nWmMBVFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772138; c=relaxed/simple;
	bh=N2rMPii8NwKUP9K5h+VBaWvMOZvQMFEE3kEUamEYqAM=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gIq/WmmGXYHjMms63lhEjbkuxCgZrmkYCww26+Jn4CIf08+SxGNJiNrr+NVP0u//Iq36OFyXDZlVk2dpmx0R1OOzIVoyMF6NnNo10OZGBrNKu1JrSPIOOJWC3YaoJ/UZOlrFZJT8IFNLs7I1JxI1bVFRl8HfOJiGXfd2BsmX5p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=eO8k7MFH; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=hmGeadbt; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="eO8k7MFH";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="hmGeadbt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=N2rMPii8NwKUP9K5h+VBaWvMOZvQMFEE3kEUamEYqAM=; t=1712772133; x=1713981733; 
	b=eO8k7MFH3t5Es/nWuxo3mvm/hB9Ly2BCQZaYFknccimMCjE74MODgZ3yN+WfWzho5t95ETIoojX
	UiJREAJUWms6Ehsv6gNdrMbhG7HoJeDVCMllG7XfMRZ3CGKgQWkrj7XoLSwXF6de8NVm+DJhX1+cY
	7uqw4U6zCeKAY9vYz9M=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=N2rMPii8NwKUP9K5h+VBaWvMOZvQMFEE3kEUamEYqAM=; t=1712772133; x=1713981733; 
	b=hmGeadbt3Aqr+TILKVPtR3Daufx/s6JaBtppwxC/20+TtPzqWGn5gl1fUz4l+QQHS8e13quSlp7
	Eq4rAyfCKAA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rucGw-004ib6-2A
	for netfilter@vger.kernel.org;
	Wed, 10 Apr 2024 20:02:10 +0200
Date: Wed, 10 Apr 2024 18:02:06 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Correct_way_of_setting_the_TCP_?=
 =?US-ASCII?Q?max_segment_sizes_for_IPv4_and_IPv6=3F?=
In-Reply-To: <20240410154851.6a627134@localhost>
References: <20240408192441.657ac116@localhost> <3C74BD22-CFE3-444A-AFEC-C532D7F2AACB@slavino.sk> <20240409193300.2aef4ff7@localhost> <9AE2B9F2-FE7D-440F-A595-F015957ECBFF@slavino.sk> <20240410154851.6a627134@localhost>
Message-ID: <7E895779-0120-44AE-B0DE-4BCC2AF897F4@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 10=2E apr=C3=ADla 2024 15:48:51 UTC pou=C5=BE=C3=ADvate=C4=BE "Wil=
liam N=2E" <netfilter@riseup=2Enet> nap=C3=ADsal:

>By asking "What about the RFC" I didn't mean "Which RFC sets the
>numbers"=2E I meant "Why do you use the same MSS for IPv4 and IPv6,
>considering the RFC explains they are different?"

Ah, OK, see next=2E=2E=2E

>How? The two corner cases are different and 1220 is > x2 than 536, i=2Ee=
=2E
>very far from the "corner" (limit), i=2Ee=2E it would not improve
>efficiency=2E

I am far from TCP nor Linux kernel expert, and my English is limited=2E=2E=
=2E

But I understand that "overhead" problem as more worse with lower
number=2E Thus MSS=3D1 is worse than eg=2E MSS=3D535 and that is worse
than eg=2E MSS=3D1219=2E=20

The 536/1220 are not minimal allowed, but defaults if no MSS is
send=2E=2E=2E Thus lower values are valid, only often not wanted=2E=2E=2E =
And
i guess too, that lower (as defaults) MSS are worse in IPv4
than in IPv6, as IPv6 doesn't support fragmentation, thus only
segmentation happens=2E

Finally, any FW rule adds overhead too (to packet processing), which
can be neglible in this case, but happens=2E Any FW rule requires
maintenance, that is overhead too (while not in packet processing),
etc, etc=2E

When i consider these (and perhaps some more), i decided to
not bother with two different values=2E

I can be wrong, but i used FWs without any MSS rule for years
(decades), and i didn't notice any problem, and i learned already
that sometime to be too smart can be worse than do not act at all =2E
But i was not target of any real (D)DoS yet, only some kind(?)
attempts (to be honest)=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
