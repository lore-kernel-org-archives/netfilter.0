Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A91E86D
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712764144; cv=none; b=mxx7eMODvLCER6XjGgpxwXLGYSa2xLwBIAzkcSfc8KTRaWn9tuNyAs2qMXNw5guf5EIMnogHeEdmnwXP4b8LUUJUPHGUAFL8gHLL1aI6WgoljXFyijvKcWJBmx2HC2p7TD/IaYsc/5LoRJ77l/9NuzwyqH/nPNJYxepxTHcocpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712764144; c=relaxed/simple;
	bh=KmBcRNBBzl9CUxizaUvIqsY7aU3E7X7wR5wK9XQPIHo=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tgtp5BNpldaJA5L2RzJ8MPlNNLP0+w87JA39M6kj206ypdj1B4gFLkxUk46A9MBOvHBBwKzD5Gjjw6dQH37vw056mIyb/6d7XcFShA1ubVHPelBxP5FWvvNbPorkhOwJZKh8drAlkMflpb8DltLrheQHJF2Td4V9FATVxVfYXXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=WviOljBx; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="WviOljBx"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VF6gx4qYJz9wmC
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712764141; bh=KmBcRNBBzl9CUxizaUvIqsY7aU3E7X7wR5wK9XQPIHo=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=WviOljBxozD5yJc4+ksfTARddoSe3AifmcNM/W+ezgV+I1+z1I6KPGFf5OfOCwggU
	 qtzGNAbQJpjk6NXF+zpJ2UX0MfI7cpqvMnXT7sKHQ35yGbuLsSQ2Xi2XunB3Tsw3ca
	 CuOaiT9fItre4ohPGDXhV8sJwG/YFvG9Vhm9IGxs=
X-Riseup-User-ID: C3FDA133CDBEB9A7EB2B33A0770B05660FD368CC08B761059097E643AB85B592
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VF6gw2QXDzFpbL
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 15:48:59 +0000 (UTC)
Date: Wed, 10 Apr 2024 15:48:51 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Correct way of setting the TCP max segment sizes for IPv4 and
 IPv6?
Message-ID: <20240410154851.6a627134@localhost>
In-Reply-To: <9AE2B9F2-FE7D-440F-A595-F015957ECBFF@slavino.sk>
References: <20240408192441.657ac116@localhost>
	<3C74BD22-CFE3-444A-AFEC-C532D7F2AACB@slavino.sk>
	<20240409193300.2aef4ff7@localhost>
	<9AE2B9F2-FE7D-440F-A595-F015957ECBFF@slavino.sk>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 09 Apr 2024 22:04:41 +0000 Slavko wrote:

> RFC 9293, sect. 3.7.1

By asking "What about the RFC" I didn't mean "Which RFC sets the
numbers". I meant "Why do you use the same MSS for IPv4 and IPv6,
considering the RFC explains they are different?"

> AFAIK main problem of too low MSS is CPU increase,

This is how I understand it too. Wikipedia calls it "protocol
overhead". I don't know if there are other implications though (e.g. OS
fingerprinting or something else).

> using IPv4 limit for both solves corner cases...

How? The two corner cases are different and 1220 is > x2 than 536, i.e.
very far from the "corner" (limit), i.e. it would not improve
efficiency.
