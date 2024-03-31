Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E267A8472
	for <netfilter@vger.kernel.org>; Sun, 31 Mar 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711904594; cv=none; b=fVOmaD7+QKjmeXz/09Rgkfh9AY3hKDlBH6ySevnpZIONfWNXzSfcceluYK7OgdJES7zeiaAwI/RfXQNSP81bqxALGo0kQL3DEGnEq96+se5s991HFIUNIUpMXqKprDuYXHtpJySqbvgoE7DRhtjx/k4a4+4saoOuuzKTBIw4t7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711904594; c=relaxed/simple;
	bh=eMqBl81QiJYd+5Nyp0TJ6z/Vv6uuFRMtWm5MD7setKg=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHgZl/jAJ8qjvqSE++mndnmixm8qv5YDwQbWm0NF95gb7VA5iQJ/5f8TPzeLrBryej1Ehr7ENBE3+X6+vKGFpjHbp3KON2iPTta7lQzKODp01ch6fNPIUODVorIJg9QmMyWGLz3BUBpoMOZv/MYyUwT5gFBKDwkEyCeXGJ05W5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Q2Oj869v; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Q2Oj869v"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4V70p36Vk7z9s58
	for <netfilter@vger.kernel.org>; Sun, 31 Mar 2024 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1711904588; bh=eMqBl81QiJYd+5Nyp0TJ6z/Vv6uuFRMtWm5MD7setKg=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=Q2Oj869vlidnwkA/IxRw1BpdnqN0NDNrH+HyGRoy0IfgwDmj3mMJczB54CyxffpaT
	 1YVsG1uGYx4JjpdsCKRNjmHTnkXOvNg9TUPXkEz75YYjs1dGGQJCkzMWthJkcNM1ij
	 8zeoFMPYok9TxPI09lzoHLa+zqAJVI2H3pl+k/r0=
X-Riseup-User-ID: E290932BF2D87718E38EBA2B7BD725C4589C0C4962A782F67411594338B69CC4
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4V70p31cFgzFps4
	for <netfilter@vger.kernel.org>; Sun, 31 Mar 2024 17:03:06 +0000 (UTC)
Date: Sun, 31 Mar 2024 17:02:59 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables: How to match ICMPv6 subtype in a rule?
Message-ID: <20240331170259.068a0db3@localhost>
In-Reply-To: <f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
References: <20240330194139.561b5a24@localhost>
	<f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks for clarifying.

I actually found the magic word "code" after posting here but I still
wanted to wait for a reply. Yours explained it perfectly. I suppose I
have been confused by reading too much from different sources :)

On Sun, 31 Mar 2024 07:33:42 +0100 Kerin Millar wrote:

> However, there are some errors in the manual. [...]

Have those been reported anywhere?

> icmpv6 code <icmpv6_code> # where <icmpv6_code> is any valid ICMPV6
> CODE value

Having such possibility is interesting, as the integer code has
different meaning depending on the type, i.e. it has no meaning per se
and it looks strange to filter based on it only. I thought they must go
"hand in hand" but obviously not. I wonder what purpose such filtering
may serve.

In that sense, the output of:

> # nft describe icmpv6_code

is somewhat confusing (e.g. compare type 1 and type 3 or 4 in RFC 4443).
