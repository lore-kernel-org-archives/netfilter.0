Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660CF12E7E
	for <netfilter@vger.kernel.org>; Sun, 16 Jun 2024 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718558267; cv=none; b=TTFHIe99IF6xvFrzVEwKcapAqGHXnH0xOJGVMlhrPd0xfeBJ+XEbMi+ZX+IWbHZUjP0R++aArNbQNOV35o2dV3iMWudREJhYuTxjBNT23Qu88Xuo25xNWuElc27FYw/atvr13UOqD32iKFqaQ+bWUABtxrIHRhyXaXXr1hH7qaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718558267; c=relaxed/simple;
	bh=WmIjk8u31puA0XuLnEa/UvD3MI/7lH0U4vyPyE+vZZk=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rlVCZmkOKi8EdG7rsQ8rR8jKn0sub3IdWNAtkK4VnpC1T2EpyF2VqRKiie9oZ00SmV2dBk2vnxTyedheoIzXxAjb/76CMhP+1n5x+hrXm1VGcao8jjeLXfNFTem/4/YlsG6/2mYQOi+iqCjSqcPHbfa2ClRId+OLWJ81if1iLuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Fjgc3XWb; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Fjgc3XWb"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4W2KTG73qgz9vjB
	for <netfilter@vger.kernel.org>; Sun, 16 Jun 2024 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1718558259; bh=WmIjk8u31puA0XuLnEa/UvD3MI/7lH0U4vyPyE+vZZk=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=Fjgc3XWbj81L3sClWgdqnRwJ0aYd8XWJ2q1L2F89pgRWJyv4SLWloh+ZeHmZipmgs
	 L+tutvZMgDdHHIVYuob6zTL/6xZOQdsE6jr9q8Kh7/Cq7kcjChm7SJ+oX27E/FIa3I
	 BkRqwMKxf955Hurj+damgl7qHHdsWSR5bczsOAZQ=
X-Riseup-User-ID: BEF58492E0980574B1CBDDB5BD986C41270F33442139F29E5E4E345E6A6584AD
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4W2KTD0KryzFpfC
	for <netfilter@vger.kernel.org>; Sun, 16 Jun 2024 17:17:35 +0000 (UTC)
Date: Sun, 16 Jun 2024 17:16:48 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a counter for vmap verdicts?
Message-ID: <20240616171648.59271196@localhost>
In-Reply-To: <47e42cb4-dbca-4586-879e-21f0752ebf03@app.fastmail.com>
References: <20240614191511.3e9cd1a6@localhost>
	<47e42cb4-dbca-4586-879e-21f0752ebf03@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thank you.
