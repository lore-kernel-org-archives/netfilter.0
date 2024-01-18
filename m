Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2DA1DFC8
	for <netfilter@vger.kernel.org>; Thu, 18 Jan 2024 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705573008; cv=none; b=Vv6SSEhjYb9YRM74YOq1xQvFLN050kuDRdRQYTnEDM5xRkBBmk73rR9JdfKvOqHSaqsb/k+X2uKH/pfAsHV+KwbE37oC5qGrnc2XhzORcAsFjUQWbtnaBAiPNyX5tjjkNL2GE2hviW4FYxBJwps+woQqImc5AkRA+V6ulfGbbok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705573008; c=relaxed/simple;
	bh=Nx0NE/j6J8eJakvWHpUjenVArKv319ARmdNHJOwnKY8=;
	h=DKIM-Signature:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:References:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=C8mu1es/4yVQlO3JkNvvXR+wMl9LBrG00ba4NVfSU5W0q4PhVBROJOHtExEpdTb/gcKjcGyBq28IVyFTuQA5wbLf0oj+JvKUTbgeY5g4gksOsdENDDD7zWu5zxwmQGgVldMIzkrNXXXVLYBW2Ec/t4CmE0OPH2Jgkp5Z+L7/Umc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=PkrkyN7y; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=CE3HK3rb; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="PkrkyN7y";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="CE3HK3rb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:In-Reply-To:Autocrypt:From:References:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References:Autocrypt;
	bh=PxPnb0Yv7zBvZOR04ARkLL80+8DsK0xHFjpcf1ZZoUw=; t=1705573003; x=1706782603; 
	b=PkrkyN7ySFRHxq7YBgn1H3h+BoNMLyJnytCOfti6CeEHogn0Y4WyNVKNqT+0n9F+H3HBv5CN6Zt
	iq5Y+4204qnNGvrIOMOWneB+wnT6KboV8rrO0XPeAQ4HziH5kzVQxM06pPcDNseMiffSR1Ge5rQc6
	Vz0ui7BXFhlckQQvc2M=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:In-Reply-To:Autocrypt:From:References:
	To:Subject:MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:
	Date:MIME-Version:Message-Id:Content-Type:In-Reply-To:References:Autocrypt;
	bh=PxPnb0Yv7zBvZOR04ARkLL80+8DsK0xHFjpcf1ZZoUw=; t=1705573003; x=1706782603; 
	b=CE3HK3rbj8W23vTg3XVGoRiyfpRwaoyQe8QXUbKZ9t9ykqGUw/ENGNxOSaEbGtsXhsX6jPiim/r
	LNfJpeczECA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rQPMm-000d4O-3A
	for netfilter@vger.kernel.org;
	Thu, 18 Jan 2024 11:11:21 +0100
Message-ID: <5acd45a8-19f3-4e3b-94c9-72ee0bc69552@slavino.sk>
Date: Thu, 18 Jan 2024 11:11:19 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Debugging libmnl client
Content-Language: sk
To: netfilter@vger.kernel.org
References: <50854203-77c6-4145-8d87-8b493ac492a5@tana.it>
 <20240117145326.GC213513@celephais.dreamlands>
 <d80d5d52-0209-4144-9b7c-51194935e9cd@tana.it>
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
In-Reply-To: <d80d5d52-0209-4144-9b7c-51194935e9cd@tana.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 18. 1. o 10:05 Alessandro Vesely napísal(a):
> On Wed 17/Jan/2024 15:53:26 +0100 Jeremy Sowden wrote:
>> On 2024-01-17, at 14:21:07 +0100, Alessandro Vesely wrote:
>>> are libmnl debug symbols available?
>>
>> The details depend on how the library was built and installed.  Based on
>> the location of libmnl.so.0 listed below, I'm guessing that you're using
>> Debian or Ubuntu and have installed libmnl0 with apt.  In that case, for
>> recent versions, you should be able to `apt-get install libmnl0-dbgsym`.
> 
> 
> Didn't work:

See https://wiki.debian.org/AutomaticDebugPackages (Archives)

Did you add (extra) repo with dbgsym packages? By that link, they are 
separated from main repo...

regards

-- 
Slavko

