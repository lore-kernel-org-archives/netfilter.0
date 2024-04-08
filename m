Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6811448E2
	for <netfilter@vger.kernel.org>; Mon,  8 Apr 2024 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712604310; cv=none; b=NiFuVqAhkofHsgAGA/ONnX/kkxLV3uzpCWfUPnjE1sDvGoesMutVJxznDs9RPQk47nJQCqqFuHMGJah59hIL7gwP9INUyuv6+Ef+Nbb/d8whjLLt8/L4WHifEyw/zGH6fv4aLRa/QjSERaX4g3RpS5Ktr9PKoK1z350p5nT21lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712604310; c=relaxed/simple;
	bh=xPMEYiXIaxNDRnqA0Q8x4HUkkxWqC8BOJ2jT0JNewj4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=SB73QqRJcp1qe82wT3qBHr6I+XeqX5J0TmnyIwyoJeQyiS1Y7phL8GnwXi0fX+Y60Z743d5ZmNARTGnTw5lzZJ0yIIR8HNzNlV5lqxHnaoDLNzzGb9XdDknwfElSmM4GVUqrcSeRQD5sAejG9NYEyZHgTttdbPIeeazslA5Xhfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=r03sZc8Q; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="r03sZc8Q"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VCzZ63dcvz9wWC
	for <netfilter@vger.kernel.org>; Mon,  8 Apr 2024 19:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712604302; bh=xPMEYiXIaxNDRnqA0Q8x4HUkkxWqC8BOJ2jT0JNewj4=;
	h=Date:From:To:Subject:Reply-To:From;
	b=r03sZc8Q6NzAV/iDWFkbn1JGUhLzePaVhUm5YqGS9A4UantGhS6KzWSQF8ZDwTd3b
	 Wm5jtU6Tk9FJt6l1nw/R6V3l8ePjARua+IaedpppexrpdpQ5N6G3QPpEhH9oK9DiuM
	 542uWl05BRLIdXYRx+GaApWySPV2oJIX7P1lnb/M=
X-Riseup-User-ID: 950396E9F9CC5AE51EDEFC5648D871191A758FB858BEEBB1FB1C7EAB301DAA3E
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VCzZ430C5zFvVZ
	for <netfilter@vger.kernel.org>; Mon,  8 Apr 2024 19:24:59 +0000 (UTC)
Date: Mon, 8 Apr 2024 19:24:41 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Correct way of setting the TCP max segment sizes for IPv4 and IPv6?
Message-ID: <20240408192441.657ac116@localhost>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have been looking at some firewall hardening examples which suggest
setting the TCP maximum segment sizes but they do it only for IPv4.

Looking at RFC 9293, =C2=A73.7.1, I see those MSS values are different for
IPv6, so I am approaching this like this:

chain ingress {
	type filter hook ingress device "eth0" priority -500; policy accept;
=09
	# ...

	# IPv4
	meta protocol ip tcp flags syn tcp option maxseg size < 536 drop
	# IPv6
	meta protocol ip6 tcp flags syn tcp option maxseg size < 1220 drop
}

My questions:

1. Is this the correct way to do this?
2. Is it good to do this (setting TCP MSS) at all?
3. Which is better and why:

meta protocol ip tcp flags syn tcp option maxseg size < 536 drop

or

meta protocol ip tcp flags syn tcp option maxseg size 1-535 drop

4. How do I test if this works correctly? (Debian 12 here)
