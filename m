Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A58462
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741426697; cv=none; b=WotKywkwLw9rS56YFDoLX51P8Bshloc7S9Cmaa2GyyWIwG6XjbcCl2OEUFU5mr+TNqmS3sBmqlt6SycVC1DGJJPzwL7XxSE0HgDz1wCZSxflwHBfBfsVvk24h+XwCP0sxC6TFc8UaNHTyCxJ0+DV5rzKpehoejIQ6EcJBMJWv1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741426697; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hXLvwEpBl9FTOL93TLA+WqSO9pujNfpqMeczMlq5Ix5B4A9D3kVSpH2kgq8U9Qbw5HxFynmJ4Qp4GLWk6MdaP+5Nth/FtytlTQ44Xm566JdAA0uCg1dvJFnMxnBpdWZdyK61nvYXM+0l88SqrkijDKejD2rBGMaMQTc3YZN4mhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clae.net; spf=pass smtp.mailfrom=clae.net; dkim=fail (0-bit key) header.d=clae.net header.i=@clae.net header.b=idlLnLhU reason="key not found in DNS"; dkim=pass (1024-bit key) header.d=clae.net header.i=@clae.net header.b=CVINzJXw; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clae.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clae.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=clae.net header.i=@clae.net header.b="idlLnLhU";
	dkim=pass (1024-bit key) header.d=clae.net header.i=@clae.net header.b="CVINzJXw"
Received: from stella.clae.net (unknown [82.64.199.61])
	by smtp5-g21.free.fr (Postfix) with ESMTPS id A6ABC6013E
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 10:37:45 +0100 (CET)
Authentication-Results: smtp5-g21.free.fr;
	dkim=fail reason="key not found in DNS" header.d=clae.net header.i=@clae.net header.a=rsa-sha256 header.s=dkim header.b=idlLnLhU;
	dkim=pass (1024-bit key; unprotected) header.d=clae.net header.i=@clae.net header.a=rsa-sha256 header.s=default header.b=CVINzJXw;
	dkim-atps=neutral
Received: from [192.168.254.101] (_gateway [192.168.0.254])
	(authenticated bits=0)
	by clae.net (8.18.1/8.18.1) with ESMTPSA id 5289bBjV489623
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sat, 8 Mar 2025 10:37:12 +0100
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.8 at stella.clae.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clae.net; s=dkim;
	t=1741426632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=idlLnLhUXVTNxTEsAWZRGxEYgkRpv4tZl4a7ZVTkeBbbpxxhXCB8fYVEGPsMdvs+pin0a8
	uG6nEA6cHYZjSF0oASXnXlApwxUtd1Fk+oQzRtyzqhxTUvWRYknlgEGc7KtIXKw082xBTg
	g61N5XXyoWq+k0/n2ERCmsONocxpWeQ=
DKIM-Filter: OpenDKIM Filter v2.11.0 clae.net 5289bBjV489623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clae.net; s=default;
	t=1741426632; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:To:From:Subject:From;
	b=CVINzJXwn9zY/rm9Lbf3MiLOaRN3p01TScdNB+U105ZgeP+AakGrgRTj2Dfr2Aj6N
	 4vXb8PS98PVkSavGFYTqeEKKERUB5tGcEzSBDQS1FVNQHm2v5EbMB+JXllR6f1MZMB
	 4x8KUL9LVsuTwpSvsrE2bT07XI/TGqZSdYwn08iw=
Message-ID: <b3be08a5-6b1e-44a6-b5f3-62747733074d@clae.net>
Date: Sat, 8 Mar 2025 10:37:45 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: netfilter@vger.kernel.org
From: Laurent ARNAL <laurent@clae.net>
Subject: subscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


