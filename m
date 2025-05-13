Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D379D0
	for <netfilter@vger.kernel.org>; Tue, 13 May 2025 00:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747094983; cv=none; b=qfOnFXNRtVuaFrLkLg0laNTZRA0P1hghKw33mXSJXSnizlQfsQS1xEJWoWVrDwZNrEsLED9dRPFjsAF/Bhm3p0dSOZNoSrYnU+NtwOQ4Z9il4NJK+qgpMmDKnkzCBoGXN6VHaN5SBEce7ozE2a5jlx39YjfNkm2JfgG0ZfHw+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747094983; c=relaxed/simple;
	bh=Dn5rJW8g91THceL2RGnMcvuUcFN3YuNISTMKfIzMmkY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XLDR/TGH19Udt5e5X68CI7qZzATrHlEITP2OLnt9cJRzY3H5yrGnF3iXS09Aa1FQhyvxoyJYkVr6jPoZjkULX0iRznbnX3l+KPyftWSpb8/BxcXistJwLLV6TtOp5/CtPQVwxsUiwLSbdBscC/KmsjtrgsQx8SgZphkOJeI2jms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=hWrK1e0J; arc=none smtp.client-ip=79.135.106.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hWrK1e0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1747094972; x=1747354172;
	bh=Dn5rJW8g91THceL2RGnMcvuUcFN3YuNISTMKfIzMmkY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hWrK1e0JmaQdbzQ8uE1bXxa6K310S9Ws/uNxHeUzuQfSUteDSLkgfuVzlnl4gRPa5
	 FJndBnVmAMUq6uaxAUpzFezeWPags3N6/OXWAuwrGyeHZv3jnXOSIu0TqSl9qIHbHL
	 oJONY/BbYtewQjNpvDzdXvS4/4Qx/fRlkY61P94fX7jogx9M+i3tT6yysY7blZ5FPQ
	 nmTp30zGz+JzTHY8LXGMbfi2nixWNpfhDlFlKPRhUjT8+IiUBc8S0GFs1nSUWnkrd/
	 ECmORJiDR1TID3u8dYqozi1wpLweYBjAFNIKH1AyNAZys7OcpiSp7GRetLSU0P8KI1
	 vi12s8rYkkp9w==
Date: Tue, 13 May 2025 00:09:29 +0000
To: Slavko <linux@slavino.sk>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Repeated SYN+ACK count
Message-ID: <ryChuZBO4efft-2Z56m-00YfdyrIQvVzNX2tKtkdMku92epV_dOhk6wzT_UAr6JTM19JWayFCkCj6UBAtf6NSnnhHAPatzQjJyKyNZJ26K0=@protonmail.com>
In-Reply-To: <6ABC13EB-FB13-4FBD-9FB8-57D16CCD109C@slavino.sk>
References: <6ABC13EB-FB13-4FBD-9FB8-57D16CCD109C@slavino.sk>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 33b620b247f53a5bb8b1f7f3ad37a2ada599a7a7
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> tcp flags syn,ack / syn,ack ct reply packets gt 1 counter

It appears that you do not wish to act on these counted packets;
so, I suggest parsing and analysing the packets with a script.

sunny
