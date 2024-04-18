Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [65.21.140.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154CE16FF38
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.140.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713457008; cv=none; b=k8LaT2zvD/iCUDlwbB3p2BtK4p9TpzFZ91jSZ7A5+NCQyXsRN0qbBTd6OtEfQbdwlRvT1JxEt5Wv4MW0xARw0JolEQWq8Eq0NnsuSruHlbVjGgU5gjIN/9rqANKjRvV78nTmcU5Zy4X6fNDKGMtUX6iEnsFeFeipVQ1eK+hdn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713457008; c=relaxed/simple;
	bh=H2WiO7j2saEkuMpOynpLGKzd0xjNHVX5TiUATS0bnUo=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=IUYigERGmgaAOQyVsonEkD9QFMs4NTo1HM+awi04SR0HxQERpW7nRgex/qyohrIH9knuSGIex9F2GFvT5o+zma9K6K3FR4/XEW7MM7zu//llALYmD9BAq6b4HzFcAEZlyyNLiKeZBgwM6eA0yfdDEyuBlXtbBO20eWj4lEjCvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch; spf=pass smtp.mailfrom=at.encryp.ch; dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b=IuTyWgjG; arc=none smtp.client-ip=65.21.140.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="IuTyWgjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1713456992; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zwL9QDtQieYzFjBVkmxgYUMF3gqtYdZV+GYeZtDk1ag=;
	b=IuTyWgjGl1QWexmQEoxRMfBmLoE5ulVyLVhKXeZ4ONrbOo35iYHk74olb67fWN3tLzrulu
	d7fI3ZFJwlmr1E2ot+DFz0aoJpsrVqk7HESwMVLaNf5HV1qQRdd4LjyTqkHqDgiQr4ws4P
	fa/j/Qs0olnhC5oDi7aqcYCUDgK5A4g=
Date: Thu, 18 Apr 2024 16:16:20 +0000 (UTC)
From: Serhii <lists@at.encryp.ch>
To: netfilter@vger.kernel.org
Message-ID: <7370616d-29a7cdb4-057f-4e56-a950-010bdd25c347-at.encryp.ch-74726170@at.encryp.ch>
In-Reply-To: <20240418153254.65058b50@localhost>
References: <20240417194340.20430839@localhost> <7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch> <20240418121340.58c1fa6e@localhost> <07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de> <20240418153254.65058b50@localhost>
Subject: Re: DoS/DDoS protection for end nodes
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <29a7cdb4-057f-4e56-a950-010bdd25c347@at.encryp.ch>

No, nftables hooks are running too late to have similar performance as XDP/eBPF offers.

2024-04-18T15:33:34Z William N. <netfilter@riseup.net>:

> Then nftables can be used against DDoS with the BPF performance, right?

-- 
Send unsolicited bulk email to carle34@at.encryp.ch
