Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D5514E2C0
	for <netfilter@vger.kernel.org>; Tue, 19 Nov 2024 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732017839; cv=none; b=BAZLc0CmIbnhF5PMXqWJ4I5ENdIivPOeOYkqFwwLMFLfIIL2vfPXSaQmcZAFUZpIZQtose7ANDN2hcYP4RJ4Zc2DPD/ppRxGXbuogv35W2OMNHrpekFH1HDh/b6Fq/ZC3vaYrJZ3dCnL/pqO2UZ2LPUnxVO2mUhisxEd4XIUBRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732017839; c=relaxed/simple;
	bh=Fi58NIwUGtV2gP2kaQoiZpUeqwJ1Ndzsstf17yBx1wo=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=H8b+7zR6FhwbKFB0D8kIqyctqEMRQdIgG+tisP+K5jC2iOBr47dWhoDQkJz9EjZcRC2TyDMGYtTbz6S+9ZRb9dyCD0dncY+z0eZSeTpwZBYpPwg9mIfh8X8K70EPwobjO+ad5Imp+Tat0CWDePQqFjWo6L7cjZOrjC4fMtkxFy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=xRluvhIh; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=uL6Mh4uF; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="xRluvhIh";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="uL6Mh4uF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:Autocrypt:Subject:To:From:MIME-Version:Date:
	Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:
	Message-Id:Autocrypt; bh=kWhr9hoR9bghoAmzCfAQMRB6+NtEOFmLQ6bFfVyMR0M=;
	t=1732017835; x=1733227435; b=xRluvhIheGi+C2+u7e7CTxkZyOgE/LCPQRsCT5nslIsVRrn
	apdtHXZ8e4oLwMce3Na9Qr2w1kJryyo8JgJ2d3VMg/K04PsEtHLYbi4/qk9yQ2C9yfloWy1H2ON4N
	HiSm/AwfWSKBH1tLKk8wCXQPWEbFF9Qy2E3zUdWrPGnvnaw=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:Autocrypt:Subject:To:From:MIME-Version:
	Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:Autocrypt;
	bh=kWhr9hoR9bghoAmzCfAQMRB6+NtEOFmLQ6bFfVyMR0M=; t=1732017835; x=1733227435; 
	b=uL6Mh4uF9DXjq11xMONZsu0zDOsW2BGwZpQrFHIPqUGiqkXTYuwPGfibmBXRA7caLhzYUa1jI4s
	m5oUqQn0RDA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tDMxP-000loT-0V
	for netfilter@vger.kernel.org;
	Tue, 19 Nov 2024 13:03:47 +0100
Message-ID: <756a9507-5ecf-4ba4-a8d3-d364f13dbfd5@slavino.sk>
Date: Tue, 19 Nov 2024 13:03:46 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Slavko <linux@slavino.sk>
Content-Language: sk
To: netfilter@vger.kernel.org
Subject: set with limit
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

with nft v1.0.6 and kernel 5.10.226 i want to limit logging count
by IP. I setup set:

     set log_base4 {
         typeof ip saddr
         size 1000
         flags dynamic,timeout
         limit rate 1/minute burst 2 packets
         timeout 1h
         comment "IPv4 base log limit"
     }

It is then used in chain:

     chain input {
         type filter hook input priority filter + 5; policy accept;
         ...
         update @log_base4 { ip saddr } log group 0
     }

I see, that set is filled/updated by particular IP:

     elements = { X.Y.Z.W timeout 1h expires 59m59s360ms }

But i see 15 lines per minute (it sends packet every 4 sec) for that
IP. I expect max 2 lines per minute...

Please what i did wrong?

-- 
Slavko
https://www.slavino.sk/
