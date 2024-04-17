Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D712FB3E
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713345812; cv=none; b=gJ4eCi25a77THSh+bo8c5hhQuogWxc+9CN89QgU9gQEICaMY1fqb27ZDAMSLrhYjQspieyRPg9dlBFyWmxhsn/KnLbT8LxrkXnb5qnZxnPZzlJCAlUgvJnB/CtGRwikdIea59Rq0ZWvcopmBxsXnm/e78AizmJ625LfJP2VNKTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713345812; c=relaxed/simple;
	bh=7R0RZoZbbULyYlb82i8FW9SdYzq55u/BcCKXvmr13cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GsZQHOuuQTL8xIhJZbBqwksMCWegUkGruyy9XaGc0lLPhPSwz2HZQqldTjI7+PGKDUGtrvRemtP4njtgdZ6WOIJ+LVZ0kshz0s7svf8LSOMLSaSoq1VmIFiAI+HADEBt/52ibPmJ0K06OZ3eXZYRQS8On531uultLMEtUS9ctkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=DiYO/1/Q; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=r3kY9Jiz; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="DiYO/1/Q";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="r3kY9Jiz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:In-Reply-To:Autocrypt:From:References:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References:Autocrypt;
	bh=jOhdp+JIoiCjy1nu9PNN2yYtCb/d9PUIRO32i/j8cNU=; t=1713345809; x=1714555409; 
	b=DiYO/1/Qiuhof65vbm9zF4xoIckuu9xYbXgViHT2JDRZxltpyi8C7k9x9adLIx+YAxvAclQ5q6D
	WRbrlNO4e2Dmn/uWMKibScF6XgPkflXFtzkBnHjDQ4TRqrx7JtevnQGxEleSU0/HLHudlel+gwHH6
	DeaB9l8raEiRb5aHPuU=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:In-Reply-To:Autocrypt:From:References:
	To:Subject:MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:
	Date:MIME-Version:Message-Id:Content-Type:In-Reply-To:References:Autocrypt;
	bh=jOhdp+JIoiCjy1nu9PNN2yYtCb/d9PUIRO32i/j8cNU=; t=1713345809; x=1714555409; 
	b=r3kY9JizLgKqmTM8LzwMxaIoFfY+LSadQBFa1Y2EBfgWf4xRAgSFQ6eBlFB21Da7qExogu4/Yce
	E303m5HdqCg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rx1Vm-000M1U-1u;
	Wed, 17 Apr 2024 11:23:26 +0200
Message-ID: <fb8c2fee-c2fa-49ec-87f9-c563d04f3343@slavino.sk>
Date: Wed, 17 Apr 2024 11:23:25 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Combining/compacting 2 rules into 1
Content-Language: sk
To: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org
References: <20240416174748.5612bd27@localhost>
 <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
 <20240416191250.04884e9b@localhost>
 <20240416210851.a9f14dc3c046ce42af06d87a@plushkava.net>
 <20240417082917.5cbb38ae@localhost>
 <890e6c2d-ed3a-4a0d-84ae-5cd1a2425316@slavino.sk>
 <d7419059-cfb1-40df-9280-c673775cb04a@app.fastmail.com>
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
In-Reply-To: <d7419059-cfb1-40df-9280-c673775cb04a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 17. 4. o 11:16 Kerin Millar napísal(a):

>> try hping3
> 
> It doesn't seem to have any way to directly control the value of the options field.

while i never tried it, is not --tcp-mss option for that?

      hping3 -S --tcp-mss <host>

 From other side:

      ... Flags [S], seq 50957424, win 512, options [mss 128], length 0

regards

-- 
Slavko
https://www.slavino.sk/

