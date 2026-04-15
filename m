Received: from cheems.de.box.skhron.com.ua (cheems.de.box.skhron.com.ua [195.201.247.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423D7263B
	for <netfilter@vger.kernel.org>; Wed, 15 Apr 2026 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.247.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260578; cv=none; b=IQbM1RY9kKqHaTqCTF6+C+kM/w7LJJMQKzTGSsI2dlVJp5eky8LrQ3IZ5GJ0sF7Zye16sCpHFIH7P/YMwjpHpMXSmCIEIYRO72z+giyoHvLS+K/gwNxWl9ZqvADEZgyLx89ug68Kp+BDySOAxKs196AwbYR7b30PdIjD5tmbOpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260578; c=relaxed/simple;
	bh=m0weUQ9qJ6tZky6Eml7Yx72z7ZlSM3+UX8+pvQjuF+A=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qSZRArGxEgMrndt0t/yfV35f6u//7dlhnvdHuCmObaRq9XTdoUBjAvWvC3sBvBpXWVxkYn/uCqxb1XRH/3nGWshsQL6uEi06Yw+VGpN9hotLsCN6Evtg73QuLZFZNzKHupIBgdSKbc8wKAGW3ltJENa5HuP/QJ5I+++4jQpCN0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch; spf=pass smtp.mailfrom=at.encryp.ch; dkim=pass (2048-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b=Qu1ldL3Q; arc=none smtp.client-ip=195.201.247.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="Qu1ldL3Q"
Received: from pl-web-01.skhron.eu (pl-web-01.skhron.eu [88.218.206.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by cheems.de.box.skhron.com.ua (Postfix) with ESMTPSA id 9BC76C140D9;
	Wed, 15 Apr 2026 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=20240721-cheems-de-box-skhron-com-ua; t=1776260573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8Qgo37vDzm13Vk8m6Aqk/pZtwfBdH2Nrd6xzuOgX0w=;
	b=Qu1ldL3QOwVwVVBCDyCbhxjrP92KGm0i6RiGxrDmJBG0yXDl6P0bV6hQUmJDW3TPJTNpIq
	AIow+zak68K9nlsyxwLf4vXrvpDhqJthGm164PxCzI4qhZb4UeF+G/uFsw3p3YMI3uF7Vc
	1EJARpcGbwQxrVR/3ydguuyzl4feK3MSPHZV0Em0h7PGak5fw2aUxvkqd+lpoHhZqOMRz6
	P2RKcT7oOyxlmeU2BEpYw83qhKAxmQI0XHCXMBYBFsRyGNSscDDbNpnaAiu4S7u1xjzaWi
	AC5Z/BkyDJJIIinsmaKRQh1VngmT8mWsFoC6ObGkWh5S4pqzOg6ZVT+wwOGg/A==
x-ms-reactions: disallow
Date: Wed, 15 Apr 2026 13:42:49 +0000
From: losts@at.encryp.ch
To: netfilter@vger.kernel.org
Cc: Subham Pal <subhampal789@gmail.com>
Message-ID: <f340bfe1-e30d-4208-90b7-e14b94f05506@cheems.de.box.skhron.com.ua>
In-Reply-To: <CAHeizqEmito55KBs=J0Mymi6nd12D-9aVw7+1+UY-LDYWEMqQA@mail.gmail.com>
References: <CAHeizqEmito55KBs=J0Mymi6nd12D-9aVw7+1+UY-LDYWEMqQA@mail.gmail.com>
Subject: Re: Renaming nft sets & maps
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <f340bfe1-e30d-4208-90b7-e14b94f05506@at.encryp.ch>

I think that your only option is to create new set, change rules referring to old set, and delete old set.

Can be done as an atomic change in one transaction.

2026-04-15T10:31:14Z Subham Pal <subhampal789@gmail.com>:

> IPset gives an option of renaming sets. Is there any similar facility
> to do that in nft with sets and maps?
> 
> I couldn't manage to find any.
