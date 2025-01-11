Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E3139D
	for <netfilter@vger.kernel.org>; Sat, 11 Jan 2025 13:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736600596; cv=none; b=Ae9K76xgU7QQA12kc/OGR1+JjYG71IjcNNdSclxqszu9CiajtVLoe8whmp5ifxjuwa4dkfxzJxIKgIZNUTGl9aXpJXWRKsJBasP99eHU/iyVraFBIRtDZoIVzXzqpPRIIg13WhLySTymfsI/jSrWW64STo3lC9/Fv1V74uDDyxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736600596; c=relaxed/simple;
	bh=QdX8031eO9fbl15FAtM+6wa8u0x/NxSrCnhH+lolw+4=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=q2FtsHx0pFZg0XfA0ya2/FK3eJKqYRNSjnm8qtqaAVT6noQfqtM59+s8uNX1c7u5WcZxmFRls31FvrShIC/hOh9RvQZUhBa7no6hk3e52lQAEzPETi8zqmJaSQ7nivcixSxCHXVN9SAMmwxbjpDfCcHkpgYfhM4K82Oy196Q/2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=vfkYky1N; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=0m5D5i7T; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="vfkYky1N";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="0m5D5i7T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=QdX8031eO9fbl15FAtM+6wa8u0x/NxSrCnhH+lolw+4=; t=1736600591; x=1737810191; 
	b=vfkYky1NxQZzDEssm/f7wNbnox/1OwCdakxAB8rOFd0zurHADsJomVXFu2B9YU3WSRhMC0o1unZ
	A8BP5C3jSBSYr+rsmEcwPa7TMIqnFQK9ezeEUKsOkUJQaUIx6M4+wNjeIqgC0gWCxVpAssh0uxQpG
	bp5fclK41s9IpxS6lL8=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=QdX8031eO9fbl15FAtM+6wa8u0x/NxSrCnhH+lolw+4=; t=1736600591; x=1737810191; 
	b=0m5D5i7TnVneDT/nW7bGlbDF2OqMX0YeaDAkDZ68U1QXdFqbKoPuW5qVm6ZALT8blKHWbrOp4wB
	z/z4S8WKlAQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tWb8v-002AuG-0I
	for netfilter@vger.kernel.org;
	Sat, 11 Jan 2025 14:03:09 +0100
Date: Sat, 11 Jan 2025 13:03:04 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: list sets
In-Reply-To: <20250111123339.GA14912@breakpoint.cc>
References: <20250111110759.6bc33181@bonifac.skk> <20250111123339.GA14912@breakpoint.cc>
Message-ID: <D631BB11-D079-4FE8-BC0F-AA85334D5A7E@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11=2E janu=C3=A1ra 2025 12:33:39 UTC, Florian Westphal <fw@strlen=2Ede> =
wrote:

>Try "list sets table inet f2ban"=2E

Thanks, that works=2E

I am not able ti find that syntax in manpage, am i blend?

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
