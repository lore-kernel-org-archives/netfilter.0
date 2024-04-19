Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399EF81723
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713525565; cv=none; b=LtrfPw4QF7HWKJ7DLbFBYqkAHjhygbSvbQcS+xM5IuwMWOYheLKXHYId97yCqNaINuiDHhEdLzF+ugCTUIZNYt3KdpbhfGob+pORBPc0HoftEIK61R5DPHMHgIU3iHMcBKUFX9So1Em3JQO2EOjYIlwpmMCiH7fzUJ2CmLzz+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713525565; c=relaxed/simple;
	bh=hcirpQB2JYRMxLSGGXIiYKeUXLMDyL4cGqS/E+p5eGI=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IUva+q0r04329Wx7Sjxkp0+0IBsQLXWk6Dz23WA5R5++QZqp5XvMp6rm9XKS0TgQZDyPcnd/ZO27FXL08Vq0TbC3wKVMCzU9Cyji0N55GoJJLbfXEEwUuFn4AMjKxSnR2rXAOQ2fNpiGbgfkQCAO9wZmiQYFDI93J6CnYl0Agak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=JkOTuKXW; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="JkOTuKXW"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VLXGb5HMqzDqQF
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713525559; bh=hcirpQB2JYRMxLSGGXIiYKeUXLMDyL4cGqS/E+p5eGI=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=JkOTuKXWF0n62FQb/DBHhDvOGZ+/M3wrO8YZc9D3r1gtE4KgSUztf8ZJw3eGP4p+a
	 U7C9pEN7/hcAjraAdSWBqtPlmBqmSop2sCroonEuMttZQQTcxBt14Uc3O9wUmVEMLy
	 qtIsF7WVefT1YUk0iLGNl0Wvv6C3ryej/AGs4xvw=
X-Riseup-User-ID: A5F6E96EF4126D865CE631CD56B1E365B2E7FA91C82C9AE320B1147B8E139AB7
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VLXGM5jKgzFs23
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 11:19:07 +0000 (UTC)
Date: Fri, 19 Apr 2024 11:18:54 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-ID: <20240419111854.60983f0a@localhost>
In-Reply-To: <7370616d-56c4511e-0a47-40c5-8f38-4d70a6aad4b1-at.encryp.ch-74726170@at.encryp.ch>
References: <20240416174748.5612bd27@localhost>
	<20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
	<20240419105542.74aaac89@localhost>
	<7370616d-56c4511e-0a47-40c5-8f38-4d70a6aad4b1-at.encryp.ch-74726170@at.encryp.ch>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Apr 2024 11:01:59 +0000 Serhii wrote:

> Have you tried vmap?

No, because, IIUC, it would still need the repetition of 'drop' for
every element. Isn't using an anonymous set possible?
