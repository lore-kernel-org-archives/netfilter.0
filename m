Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05504158D7C
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706775781; cv=none; b=ETTmWaTi9QU2GsHy/CoQO6nhMQrelbJ4sjANCUpIe8VdblsD0gUuWSo/XJ2PLBk17aN97hwXh9qQ0zKpgBGhsFrEdMzVjoqeQiixxUBLiTezNvwCzgLfKh1nRltw2zt89B7KgsUeL2yw+KLVqPzss6RG1QWwocZSu3ZAbiSglK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706775781; c=relaxed/simple;
	bh=+b0IAWBvI0IJRg3ZFUq839DyMXqj2CY60lkfdk/VMEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PWlSHEDngtCqfp32S9ifP5jjZw+OmRrcck7eqjxCzlyPyH7ZiLGT8Cc10DJasGH1FD33wul9NPYhGgTWX511N5D6UsKofxQv98WkPshGU73ypdin2bHmyo+VwTdlveV6fjnkXOz5sbUQmHSB0bfTCsRoiLeCjmDRWmtDHGmGwow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=CFJcdscp; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=jcF/IdZY; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="CFJcdscp";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="jcF/IdZY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:In-Reply-To:Autocrypt:From:References:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References:Autocrypt;
	bh=jl9l7QdrVmvWkAZ9WQ4YZ/1T5FhnsJDw/SCtOkcq2ZA=; t=1706775775; x=1707985375; 
	b=CFJcdscpArnL8OwO0f78fO4Clv7BKnvCXeB6bMc0Q2dbyNPb4BWlBVsBdJZukPzhCWhy5Z99D7h
	eRUZSJof7mQDEcwD0MY+yBn9JXTYQbH8Q+SxbN8h2yYjwxsBOacJM+WNCGUqR3XtwYxXAICJih43i
	FPUyt34Vj+jlEArEJOs=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:In-Reply-To:Autocrypt:From:References:
	To:Subject:MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:
	Date:MIME-Version:Message-Id:Content-Type:In-Reply-To:References:Autocrypt;
	bh=jl9l7QdrVmvWkAZ9WQ4YZ/1T5FhnsJDw/SCtOkcq2ZA=; t=1706775775; x=1707985375; 
	b=jcF/IdZY0yyFfdam7OCMSfhAFG8vw/xoAUH2pAVQBeEjx8uwJRGUW5ze9leEHPoX1GgoL3TGiRn
	McxoJMQ2cCA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rVSLT-00057R-1M
	for netfilter@vger.kernel.org;
	Thu, 01 Feb 2024 09:22:51 +0100
Message-ID: <7226e29c-5b1f-4845-8171-fd633f4a896c@slavino.sk>
Date: Thu, 1 Feb 2024 09:22:49 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Combine ipv4 and ipv6 in a set
To: Netfilter list <netfilter@vger.kernel.org>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
 <ZbrLg8luc8tbZALr@calendula>
Content-Language: sk, en-US
From: Slavko <linux@slavino.sk>
Autocrypt: addr=linux@slavino.sk; keydata=
 xsBNBE2fIMwBCADjOr4MY1rKxZnb4hsEdYBDFIHhZO9U3iLN/rNWSFKh3LeERd3Bu5gMz7Hk
 kn0nsoV2ijRKTLlXE0yzUtoJL+8WdNdWONt//cYcl8Z9V80uGFWfL6h0XWlqlup4XLTPZYz9
 7f/k1UsTltiIWd5hK6JU+PA6bFVO3ogq9Nx6ru6pNzQtx6D7D5ND9/4rN45MIYolEMMC2/1J
 bvM8PFdwB+QmJbj2fKb7jboKFS34VrUQ9xsVJske9/lC0MTWN1HT+dFiXvvue7TmwOgBAd/B
 24eGPVtcA2D13IRqhItDTS1DtacnzY3Okx/OEMdUIhjqKCBUGHeP22SagvAaKi8UYBBrABEB
 AAHNIVNsYXZrbyAoTGludXgpIDxsaW51eEBzbGF2aW5vLnNrPsLAeAQTAQIAIgUCTZ8gzAIb
 AwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQg/mquDkYjbYGXAf9FbEfo0wF7hfYgqll
 CfNSoCcGcj1WkqqXD0kkAY/5wIFTbOOtrGn7TijhuFu9aIzjd+K+3Q9tk4Tt6MSg9ibp25b2
 HLZPp8UiyPLeE0BAWFgAgtOrrIDg8VkvjfO2jSJjkHhHOWVP1xZYSlApNNhU1KUit7RE0ueV
 bWG45a8ONSp+eNCSHkgMC8VtoF3oMegi0rgFUXSdiEsZlrpXo0Q7HPFObg2ElTC9QgFr6Lmh
 uw6I+BvXE0arwa+4ndcesb5pV6TDONOrihgYvZIyZ6V4Bgnt9C6lvK1Y/e62W73YBAEIvQo7
 j90m0lrBEAMhUhj4aGooeJQ2b/aXkrBwc+9vos7ATQRNnyJKAQgAp8mP9O2fH0KnS1yJzAz+
 7fAM8dxFJbagFkv5ljvQ/qkEYh4uI+hWjgV7ok9+9kuzFiHbv8nczhcMr/J0JX4kok/5B5B4
 QuBdCXAoeAiWaPB4V6peLXheJKsBbBP/wNAFthJitt4P5XXrZbL4hv4+5Vm/uYXXYdQczGYa
 2UGMVZxYyH1wh3Ywfk2c4RvPfxfe7Q8pdvpK8U+mKKVDQ6kaTEJXB4EGkp80ncpEDmJEzqvj
 svKoHHruMUnuJdNkuKvE/knpiOw9jbifIkTQfLEJKgmJE6OpgQ5SEJpGBtCTEJr9Wo1l38ji
 6ujrUZyjBerdcucsXOKXk3n8mJhy4pshfQARAQABwsB8BBgBCAAmAhsMFiEEz0au30POX8OO
 zaE5g/mquDkYjbYFAmACuOoFCRY5xCAACgkQg/mquDkYjbYddAf/SWvH2Z5J23ZNqxpdORYU
 jUyHISTo3WaO0k72VdIHJqCHR+XSerysTyuBO4mf8SYQ2VpkIVLbOfxLKoHNt7jeVa+bjVki
 OFCjRPFhn3K+CVPwK45gvDqaAzQI4FAf2zCtdD0Zt44rwkb2e7RP7kGcI5EirVpU14bDk71g
 lE2JSezwkRYU+4ZUrDo9tGcUzJYjwHMvLXR5+yRIV+gqea1nb6871CtKh1w00X2VUXjDBtXo
 xSAd+NoTI57gwlnQOavvaITo8eGAnpSx9qA2k25uSVH76dn8KpL6O3b9MWfGn4o2KbA+3Cpg
 taCpoGgpKB7I+cQ4VywRYFH9rEMRgmr9Kw==
In-Reply-To: <ZbrLg8luc8tbZALr@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 31. 1. o 23:36 Pablo Neira Ayuso napísal(a):

> There is a command to display the datapath hook pipeline per device:
> 
> # nft list hooks device eth0

That is nice, except that it returns empty output here: nft 1.0.6, 
kernel 6.1.69, inside LXC container... No error reported, just no output.

regards

-- 
Slavko

