Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5AD79CF
	for <netfilter@vger.kernel.org>; Tue,  9 Apr 2024 18:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712688622; cv=none; b=XYA+XCfWQDc2myelkiVL+AxdJk+8ZNhaBoGX3wV5MelbSSWPapgN5HWpwoZSxUwz8Cy4IGJajERKC6WIeUBsMvlK3OMGIfHWrvkJrMlsgUwOzMEFRI1/seShHMJ7ZyA4z4AN8hucjaTN/ALetLGuYUJo5rMP+vRvwXvvU585lt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712688622; c=relaxed/simple;
	bh=sWy4zOEIBqM/3BHPOw0cLugOiqAbRlq9TDS8BXzC3A4=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=n17zWS4twOqo6NeM99cuEe98FDoVNHMYm79jqnj/6PEnd+FogHeygjEKgWfem12ven8aEOhZr0w83TevOiw6d1tKH6/RGTob2Yv+h7S2KkuQIbdGPrmT7R8y2RRo1cVCje99khMFGQg9EFHaxOpYjh0YJdKpAx0qdPe4oTpK72o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=G8YyPDvU; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=BA0tbuqn; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="G8YyPDvU";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="BA0tbuqn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=sWy4zOEIBqM/3BHPOw0cLugOiqAbRlq9TDS8BXzC3A4=; t=1712688618; x=1713898218; 
	b=G8YyPDvUP3Jj/UKV8YBfy8SmW9Sh7P2HWEqwFUSu9cJ/Pe/22kTv4tfhAegZJtc7X79fUUUIJHW
	fq9TyePLJuNj9XPlXkOrAzkBk82H1nO+2ikOwGrLCzqyXC//ln37iOw/g5/LVFoPfm9Jk1MTsh22c
	HTxuqpBtcJuojl1GBbA=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=sWy4zOEIBqM/3BHPOw0cLugOiqAbRlq9TDS8BXzC3A4=; t=1712688618; x=1713898218; 
	b=BA0tbuqn86ZRXKIaABnxh90skruMGL2/sb29EKp22gAwf8Hvvv97LL3Tiz7uPVzFB9hfAUs8BP4
	iUG2KZOuCAw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1ruGRu-004drD-0D
	for netfilter@vger.kernel.org;
	Tue, 09 Apr 2024 20:44:02 +0200
Date: Tue, 09 Apr 2024 18:43:58 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Correct_way_of_setting_the_TCP_?=
 =?US-ASCII?Q?max_segment_sizes_for_IPv4_and_IPv6=3F?=
In-Reply-To: <20240408192441.657ac116@localhost>
References: <20240408192441.657ac116@localhost>
Message-ID: <3C74BD22-CFE3-444A-AFEC-C532D7F2AACB@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 8=2E apr=C3=ADla 2024 19:24:41 UTC pou=C5=BE=C3=ADvate=C4=BE "Will=
iam N=2E" <netfilter@riseup=2Enet> nap=C3=ADsal:

>Looking at RFC 9293, =C2=A73=2E7=2E1, I see those MSS values are differen=
t for
>IPv6, so I am approaching this like this:

I decided do not bother with that and i use common limit for both
versions=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
