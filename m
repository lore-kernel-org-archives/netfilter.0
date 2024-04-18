Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC844168AE6
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713457927; cv=none; b=Qg/AFcJG5pTzHzazUVYarxz+xIRhKRpm8KbCnn4qJKJLP0FeFkX3/9HCzlD4K+ggW0aeBzL5i45G6WPTU2JJBXGWSAXNWmKv4vSrWrO9/sMDF5ZKVL4DmZfZV5Kt3sJ2gXJI07aILq6jvQaO9r1mTodpZj9Usjm8HFVkWwxG3kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713457927; c=relaxed/simple;
	bh=xSKTeTI0yui6+NcmolKLPdAsrhFjIj8W0xcCpEQn+w8=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eENll4Dyqq5Uf6La0Sp9adzxe2tFkYlFJPHHQwHGE4hWhuXmMYHl9UXRKXjvzQ4k6K5EzGNX57fHBnZTcZT9oeUjfrZ/CTzDK0ObnvtmUCK8p9ra1j4CzpjiiICxl6Z1HlapgixCVrSxdJB8B/Ta6Cbky5yv84IjcbBisVRopys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=mIXwhvQE; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="mIXwhvQE"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VL3Fq1sfKzDqSm
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713457919; bh=xSKTeTI0yui6+NcmolKLPdAsrhFjIj8W0xcCpEQn+w8=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=mIXwhvQEkGBQKqnS9UMIVTFdImFOkFt2TcASA2dwxU41jPcZwfJIPeOFskDXPEWLx
	 EDEPpGdXLyx/W32wao5SVMsVE37LLrxQ8vD4FiY8IRRqzzu0nTc+phzSvJKQz3EmTY
	 lPeHpFkSchFlHz2FZDF2+lPcp8vf5XHiF/BUNWNI=
X-Riseup-User-ID: 0B3AB8B59DCB19B502EC0CD5F7CEFD64962D604919DF4DCEE44DD80EE5D80C12
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VL3Fp3jLNzFtNy
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 16:31:58 +0000 (UTC)
Date: Thu, 18 Apr 2024 16:31:44 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: DoS/DDoS protection for end nodes
Message-ID: <20240418163144.10b6342e@localhost>
In-Reply-To: <7370616d-29a7cdb4-057f-4e56-a950-010bdd25c347-at.encryp.ch-74726170@at.encryp.ch>
References: <20240417194340.20430839@localhost>
	<7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
	<20240418121340.58c1fa6e@localhost>
	<07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
	<20240418153254.65058b50@localhost>
	<7370616d-29a7cdb4-057f-4e56-a950-010bdd25c347-at.encryp.ch-74726170@at.encryp.ch>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Apr 2024 16:16:20 +0000 (UTC) Serhii wrote:

> No, nftables hooks are running too late to have similar performance
> as XDP/eBPF offers.

In that case, XDP (and hence C coding) is still necessary, right?
