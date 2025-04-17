Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE37209696
	for <netfilter@vger.kernel.org>; Thu, 17 Apr 2025 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744925245; cv=none; b=C8gCLm8nHDhwWhbqFFVMLKZYTRMMzCI5dX/sPzAmVCAbT4QDWSkvuNLuj/4b+mRl7eIJrnvMQPaYPA3ng8X30ROtKXUUXXxM3kLe98Ad7Lzze3cUrmKg4emsJ7CJPdu+SFdnoPtgwpb2AztADgRNk5tTo7gQLN7pGqQs61jKPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744925245; c=relaxed/simple;
	bh=xcAKuCp7VHfY5ZUj3C3IP8hRz7J/qNZKqHZpEZuoJBs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bFL9Pz6HgyI3+BPHjb6TFAS/Fp4ip73lq7hCgzXZ6p/AZ2GRuUiOqPvdxKrcZhj0zkpBXiM8W6W0lNbztS8vg3p7sEELMJuQM/FQHDR0yCLAx8cEXt0VgAhXxs5YtlOxXNBlg4FhmSTBCvHOIwzABT9RZ9nwqlGpHYeC/C4CeFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=HyZY2I8T; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HyZY2I8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744925235; x=1745184435;
	bh=xcAKuCp7VHfY5ZUj3C3IP8hRz7J/qNZKqHZpEZuoJBs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=HyZY2I8T9GMVJ8uXhZC14DcrFD18+wGUK7H/tnt+gbIFopL+YmIixXidKA1UtJrQ/
	 wCfUUdmLhd4isnLKuGxWyW5L7GNHgH2jjXktP0WonvJGxscmkIxMxGwydLUJJqZt8t
	 qtDGIyqNJn9ESuXG8BB+e2ry7+3xQcnskzYQwsQxkfSltlh8h1LEiS/nnZox6eI7fm
	 84ZQLEVFWtXBpN/3DgY+tVuCirj6398e6EI3H1In/MVXcXiM2IeJ3jFqSLJudwwq/P
	 SFTI9WXJqCZe7HXGNQXHZkqnuF9skQbYQ/lW9mqO68eg85fzJKo0mWvGJCYUXShpSW
	 Koc35Alft6wIg==
Date: Thu, 17 Apr 2025 21:27:13 +0000
To: Kevin Vigouroux <ke.vigouroux@laposte.net>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Can the PCP field be set in the netdev table?
Message-ID: <ULYEvwyZR2o5mOmJi1GCdWxJu-bftNMqoV8y_KVt3i9eXaWu7uTOBZk9D2-cXABoNO_SUbnRRKRUj9NyYjHbnO5NfkViqsjUsLBdfbyZc_Q=@protonmail.com>
In-Reply-To: <877c3kvzyk.fsf@laposte.net>
References: <877c3kvzyk.fsf@laposte.net>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 1dc963be9c2183654c4aa418516a281ef6113b38
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> [ bitwise reg 1 =3D ( reg 1 & 0x0000001f ) ^ 0x000000c0 ]
Mask one byte with 31 (lower 5 bits), then XOR with 192 (Upper 2 bits).
Why not just set a value of 192? It isn't what was asked for, either.

I would hazard a guess, and say that it is broken.

It appears as if the EtherType is being re-written to 192; which indicates =
that it is now an 'old ethernet' length field: definitely broken.

I'll have to look into this issue also; though, I can't provide a fix just =
yet. Hopefully somebody with more experience can chip in here.

sunny
