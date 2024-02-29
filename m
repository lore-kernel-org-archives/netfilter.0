Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [65.21.140.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936AF6351F
	for <netfilter@vger.kernel.org>; Thu, 29 Feb 2024 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.140.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709202007; cv=none; b=qb0Y83vSXyHr2MBAPcsxYIbKVliF/KyFf9O1cF3YGvHNOm+5pNsl6bpXQ/hoJLDRbDhzejl6p8wWE1OcNs0rQ9JzzP+uofTTLMtAh2fgXW2LCX7zN+a2BMoFANLdzpllymk6HtisW1fkctyLVaP6co8PYEBLZ2MoSsbRu5iI8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709202007; c=relaxed/simple;
	bh=pZIaPIR1wciX9zu+AGOmWc3tvzyq1ke64pqUYImfaQ4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=lw55C9lxAinMejQe7HUeqpodbDj16cECe11A3e8FdZ9RmkeLcyxEzm6MFt5+NCZ+u4Org2UzKgQr8eBNYapl+ArCThXFvhMdrgHsAk5d+jrUKiGYKm28wBJswpjPjXTFiPiA/TqJld9WItURm01aQaoAsInkisoj+S0fZEBAEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch; spf=pass smtp.mailfrom=at.encryp.ch; dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b=S1UcX9XN; arc=none smtp.client-ip=65.21.140.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="S1UcX9XN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1709202002;
	bh=pZIaPIR1wciX9zu+AGOmWc3tvzyq1ke64pqUYImfaQ4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=S1UcX9XNmX7Fpk1LJSX+PBkVN2h0qu+V6jSODO0CXp2Fo0sqH5wnMSi2kcl/XNq1v
	 QglhuVXud/lQ5KQM9J/9TGs7hgVaI/Fu9sOlJhuz+y6XpNAII8x9ZF2MsvlWz//blp
	 wGQHMyEyIs8jg4L8xU5Im8lOfGIn38a+CvDVDZXU=
Date: Thu, 29 Feb 2024 10:19:56 +0000 (UTC)
From: seentr@at.encryp.ch
To: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>
Message-ID: <d819f6e1-6c09-41f1-aac4-542a39f45c75@at.encryp.ch>
In-Reply-To: <8adb4670-f8c0-498f-a06f-8564ec846e37@gmx.com>
References: <8adb4670-f8c0-498f-a06f-8564ec846e37@gmx.com>
Subject: Re: snat with dynamic ip address
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <d819f6e1-6c09-41f1-aac4-542a39f45c75@at.encryp.ch>

Have you tried masquerade? Seems like it is what you are looking for.

2024-02-29T10:11:15Z Lars Nood=C3=A9n <lars.nooden@gmx.com>:

> I have the following table within a NFTables rule set, but the address
> given below (192.168.1.213) is assigned via DHCP and will change from
> time to time.=C2=A0=C2=A0 How should I rewrite that line to do SNAT using=
 whatever
> the current IPv4 address happens to be at the moment?
>=20
> /Lars
>=20
> table ip nat {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain postrouting {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 type nat hook postrouting priority srcnat; policy =
accept;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ip saddr 172.16.3.0/24 oif "wlan0" snat to 192.168=
.1.213
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> }
