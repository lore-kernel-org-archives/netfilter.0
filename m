Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4413E3F2
	for <netfilter@vger.kernel.org>; Tue,  9 Apr 2024 19:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712691205; cv=none; b=IQjZVNvXrITPO490XMm37Bcts708dEKnCKqP7+xigQbqjdL3kWoROMZtiyg4+B2c8RYeEfY8rYyEztNiDgI+bWItZnkQuMBDK1FxDVhKZnGhvMQ1YfhKFMCadP9L/tS/lHasH/VAeKiZ9bbFg6t+Tth5dmbG314a+jzxFBXl5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712691205; c=relaxed/simple;
	bh=jcPLBBjcUXEC2AGn3+oP9+fh4ayLV48wB9JSRfDTWFU=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXgSYj8k3wTuTosX2GjxAvpsKrg0PbN/FAfdOnf18UB87X9bj3/CnlS/hjKy5nm7SDsMcuUmVUtqLHrRD/8q+r1ZgCGfk6fjC85Xb6daFWy5cCCz4WZ+SfuIdJays+yWlvE5OXtFRCdu4yVDdZk6EF/WKWh1/IO6TvLouQhJC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=UATGxuLw; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="UATGxuLw"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VDbj94YLHz9wj8
	for <netfilter@vger.kernel.org>; Tue,  9 Apr 2024 19:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712691197; bh=jcPLBBjcUXEC2AGn3+oP9+fh4ayLV48wB9JSRfDTWFU=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=UATGxuLw0dwFzd/3VV9MBmMcBSvRQpolCpAfwWu01ww4s56ioUru1VKtRbMSEGhTT
	 9w1Gzp7x8PoZAx6zfD2O71q5qXJgorR7KoSvwdZz/O5s5ppdygNfqDP8Di1J1SW7X+
	 c/fI3+ifpi580EBE3inXnuf/3lFzykeNCDz0Etk0=
X-Riseup-User-ID: 482DEECE4028D1D7763C2C31E1DB9C0F643025DD69EC3B3134328BC39E773A55
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VDbj772nCzFsjN
	for <netfilter@vger.kernel.org>; Tue,  9 Apr 2024 19:33:14 +0000 (UTC)
Date: Tue, 9 Apr 2024 19:33:00 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Correct way of setting the TCP max segment sizes for IPv4 and
 IPv6?
Message-ID: <20240409193300.2aef4ff7@localhost>
In-Reply-To: <3C74BD22-CFE3-444A-AFEC-C532D7F2AACB@slavino.sk>
References: <20240408192441.657ac116@localhost>
	<3C74BD22-CFE3-444A-AFEC-C532D7F2AACB@slavino.sk>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 09 Apr 2024 18:43:58 +0000 Slavko wrote:

> I decided do not bother with that and i use common limit for both
> versions.

But how do you know what that limit is? What about the RFC?
