Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19FE156C71
	for <netfilter@vger.kernel.org>; Fri, 14 Mar 2025 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932735; cv=none; b=MiwnQvDMZKDzKcoRAQeVs4k9dGp5zNpoZyXa0vLkOh4jk3jgl1npNE15U21OWxWN4DrVph8ljJ0sJVdn9IXkARN/ZiRVWxJYoAxZNzZRlM5qwStaCqsZtxnF60mZEC0CA8SiYB9TZV8lpdDii50cVjsFL1yyWfZwZivK8UwtFVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932735; c=relaxed/simple;
	bh=zN+xxo5EpCzw0DzyzDhhlMFwPcW2kmtVrc38n3a4e6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MOgXOn55dUTncdfNRhJD6pyabEbJV6KxE5e+M9i+uAaXZJSO7uDb3NLdQ/lywLgP91DAEoKM/3fUf0EPdFmClKYI4I3teauQlx4meCxOn6kYXqeMUcsUav1tB77Zufq/NoF3pvquthEVyRrp3eAP0HeeMY/oKC/SBeuRlZDP7oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=Q/09jqIB; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="Q/09jqIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1741932730; x=1742537530; i=lars.nooden@gmx.com;
	bh=ZDK3adcsAxucLO9mzLRMHhjzpueaBLlbyAcmXIiLOiY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Q/09jqIBkXCtKfryXMC5HWYiz80uWNL3drXDgi6gfdIXJLLwNbZQaDO0eVC0XO/g
	 phw9R7j3rY/wBmopn1vuDcWGrvlrh+NC1hmzuxcClTm4GeHubvD9S9ILvN26DAPOg
	 RB7XDXXD9qrrNMCT2mQ+cYf3VB+OWSkrXRQR39h+fm5IxqWxt8T7HrjKjdjk1RQGu
	 xwj0mRHQ4LB4yASP4+9De8nFDLqLlpg6fRgaEQDvIbt9ota50GpW2KtQDr82I4TQG
	 9Cn2EKzaNce+Qrma4wh2Ifl5231PElryw1jZq5zdlxu8tNH4mYuK7V5BTT2Pakyae
	 P//o2JYK0Wl32qIX9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.11.9.65] ([80.220.97.94]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M26r3-1tut9P2lkv-00GgwU for
 <netfilter@vger.kernel.org>; Fri, 14 Mar 2025 07:12:10 +0100
Message-ID: <40db327b-f34a-484e-af97-18d43b02394e@gmx.com>
Date: Fri, 14 Mar 2025 08:12:10 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dynamically appending addresses to a named set
To: Linux Netfilter Users List <netfilter@vger.kernel.org>
References: <6eec303a-752f-41e7-a903-37b3614d170b@gmx.com>
 <34c26829-a535-43b5-accd-884f4acd0614@app.fastmail.com>
 <Z9Hk8SsJwZArWo9C@calendula>
 <7773800a-a467-4821-8ee0-bab3bc001ab7@app.fastmail.com>
 <Z9IFgS-NOhJKUsFk@calendula> <cd939795-b632-4eba-9ff0-c003c4419ba0@gmx.com>
 <Z9KeXyPhYJHsXFqg@calendula>
Content-Language: en-US
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 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 jw==
In-Reply-To: <Z9KeXyPhYJHsXFqg@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NVU5kF74FM7TX2i8Ws+Lp9OeO/uPyD3DRtPcCuTFoBvDkTd+k05
 ke5fwALxs8NKtNtnNDxleTWLGYFtGB7DXWsuBtebitHo+Md78moONK6BZwk32zAlkWGC5Y2
 TPDOwahImjCuU49hyXJJ6+9/AgLKUlBYg6fCXfXmnadshfPz2OCaV19w7MdqEazfxwqStXh
 2pYUXSZibwsGCd5YnIzqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UgzMvg14+S0=;exqIqX2SkmLb9+Dhg2kZWp2Sc/9
 6mELhi7NLE2hnB9xUT2ATndGjAcBmM1Q0BKs4dVs0Da6ick8PMk99N9GqpLFlcY/YdwiEtxTi
 HVTmsVepnkZW4YM2SoiqXJzdNRNj0Sp7hYbzP+oMmvLGxi9iVI8o2DZoYCQK7TU0nxCImlKMI
 eqiLxFeQBesqNOB/5LvMmp4pJ2qXoxu8EB8J3akvBlKtzIA6JfNxDkHv/V1/kLE6+UXy82Mv+
 UmQfkGlMlhIDElIDsG0htalojRtOy+r1Ru7WFIvymH3xnteKOOQEUx0DkFJjRgyVYy/2iZHap
 h0DD5rGb2ojTuFfC4MnXJE3Yp9UOcvbBJfaoAR5dPsmS4/wpHqTnZMWI9QARzA5BxHuzdpgyP
 DAakCjQ9csXc3Y5/gzLk/XkTrF+gXc35ysSRqbxo9eiP9KwC6OsenvhFRv2sJeMpMHtHQKG7o
 k9nvvab4TpUsS2LyYmFSjarq+bSyRi8v8lSwbD6skorW3zWSM+LXxADxAJXzpqLIQG4aa5tvo
 PS6JWRxexuHh4zUF5aLW6IT84jeNGO4Ri7YXvrdbztVdgMwaMrlG98yzlc1nZU0RAB3qqRm26
 YGqLwMn2F9c1p/eeA3J3cEXytlOWSSLjkx841x9SkNyJGk0s36e03UFZm0/f7TcLlCiOTAnsJ
 NPE6b3M7rjnKkhQqVc15q21kVZ+69YnSOAN3ioso2dUdoQa4L1Urdb3SwO7qZqGPAGV8q0P4x
 xWOvf33lc/uZpMi8U8MZESkqZQati1RUAtYywOk7cG/UIScuYBroErkmdd9h0VtVZzTVH4V70
 vpajviQsu+Y54SpAKKN68mQqiho0QrT9jzcFLmMXz4a5RTj3+8swLTYf/L/ZEk/+eAYEAdKh/
 F8YcbI18a//8MwHZh9Kcq1y2nvP41ddwkPaDrzMTNlKVlLUhmdp7rFt4tTGxknvRCQkmlcsRG
 kUNFHIop6gxmf3Li5hVXJCBAlFBZwpw3pm0jtocddzZ/NaSJWa3dOXyGxWbFQevFzE5DezfUO
 DGNDh5QoABx7S0TcPZFg/JAvOI+pvR31NhF07EYYurSVTJpNkm1GZw8OLMSlf9bScJPND47tv
 IugFVHpFMaRjjSSr9+/9hvUKvLNs9vwVF0c9H4KtwrUmOY2M4KYUXe0oaKHRxk8+dCSu27bmD
 saFOp4xwmUsvy43+kO+oHu1kTgoIPOm8Sd41vvVxPvz8vd+8oYFUTLEakl2/DCMNQTS0PMvw6
 9sxeBYNURCmMvI14lgpJz7jjCKHhkME35oDJM0NNT/w58rzqnuMdDvhYuwb/5ZzDpBqYzUHhe
 17pzYx20PSlBG+mN58qCOksEo35Hq0Np5UbYvueubGDDbkxKhr8j2n9C6pnK+wM8G0WksiJmb
 jRmnOieSEQrBL8uOMeiyx7C/hq7EkoPpvzEHs=

On 3/13/25 10:59, Pablo Neira Ayuso wrote:
> reports EOPNOTSUP because interval sets do not currently support
> updates from the packet path.

Thanks.  Is there a way around that using nftables or is the main
workaround that I write it to a log and then have a script parse the log
file to then call nftables with the address settings?

/Lars
