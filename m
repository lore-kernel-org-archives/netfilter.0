Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965F3B18D
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713454400; cv=none; b=OgZzHBDHglxjysAsCT0ZDBqnL9etp8oVM3vQdOyk2pYurL78mBruMkCvASfRtx3/fWaMtDSzwgLflIY5soK96O3O8yIlbLRpe64fJm7PVpbItS1NwJuk5P3NblrWO1Y8I1rI5SNrL/md5MWv/pMcG9JwYbFpd0UZup6YaEUUPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713454400; c=relaxed/simple;
	bh=W5jhnPs1IrLmj/sUya85o/5XfqpGhVk5jbuPnWjw3+E=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dlg8qU51LwAlTg8qb3MPO21ltj1oXHm9bMMpaUJbC/XzQjmbZh4hiK5uA++vsXhZH1MCxbVpLAn4qm9eyi24fLs28iysc7FmkWAxyMWGAadNyzRzCgQ+/fx/2PC1Byvc9LMl2sHSK+yGO1oEmJg6WOgWZ+2nvUjJEWf+s98oVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=J0RVJLE1; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="J0RVJLE1"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VL1y03lhQz9tWy
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713454392; bh=W5jhnPs1IrLmj/sUya85o/5XfqpGhVk5jbuPnWjw3+E=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=J0RVJLE14VQPgm/1GYW7ew0BFhy8PKYoV08IQz1uSvTqSO5uvCNuNadmYhwtsknxz
	 ACuqmh5FuU/cU580uEkWwSq7z5D9KvQyRgy0ABQfdQfoGgGFrbhLx5NGqf8w4o5HIE
	 loOQ/IwDEuNjsX/UuOaqRihjM2alZxgzD06k4eeg=
X-Riseup-User-ID: 0486284BD1FD8F7B331D72D06F85EF55C12F57BEF67FE2AD7EC75C761A2BC746
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VL1xz0bv8zFtt5
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 15:33:10 +0000 (UTC)
Date: Thu, 18 Apr 2024 15:32:54 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: DoS/DDoS protection for end nodes
Message-ID: <20240418153254.65058b50@localhost>
In-Reply-To: <07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
References: <20240417194340.20430839@localhost>
	<7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
	<20240418121340.58c1fa6e@localhost>
	<07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Apr 2024 16:11:13 +0200 Florian Kauer wrote:

> So the basic idea is to maintain the iptables and/or nftables
> interface and "just" translate them to BPFs in the back. So no need
> to write C if you don't want to.

Then nftables can be used against DDoS with the BPF performance, right?

Has this made it to the mainline kernel or it is still something
experimental?
