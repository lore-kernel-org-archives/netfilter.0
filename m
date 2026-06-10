Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB63321DC
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114588; cv=none; b=sw1H7rUQUghaKRmYGkrLdx7B45u2LF9bvOCf+nx1ESWW9ujC1UABn0nqixcL5xGrEFuixPtzXQBzUpfZC3KmOvevyLuNiFNYbY0DKxPJ7S8Pqec+bOgiY8BPspNhFpjAeCgwOIx9rUG3fji/qNSVwAxRUMRHeaTy/UZ9TRurfe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114588; c=relaxed/simple;
	bh=mT0Y+gLh2hz1DwUFoODS0GGRGy5Cy/gZradfm5IVR6w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Z9kB95IWJd6loXrH8YqZIK7z3wNxCmONt3w9vA+1mdaN8McEhnxH+kAPPveP2iMcede0CDhzYiSxeFTfNxeWU1UeSwPGGkZN9XCuLPreFQoBdT2XhthYIjSwqcilMRLeZMXp9OmdUrdTahNgyGj4s1G17MMlzp5Wgd5+c+n+qYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=hohjppPD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jLB037dq; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="hohjppPD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jLB037dq"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 97A751D0008B;
	Wed, 10 Jun 2026 14:03:05 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 14:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781114585; x=1781200985; bh=hRl3mNBQFKGVzs+nseh0LNVMR6YWWbmj
	O7dz7QTtHMg=; b=hohjppPDP1tJ4PIk9e/3u1bAQknB4wKIIIMFKPzAqRy3LCeC
	WkD5ZkHArFL4F+UPasHUCEuX4orSu6A54lyrnecGnTX+fsMz/eDNl+MUvRbM/Rzh
	Fz7tcq3IbKo0WZ4jONd5WTzjr11ua5q0B2HpeB1ME48ykKZ9meFUhKHSzuFD+AKD
	9SS8qYBV1FMLUn01lD10bByYndf3gZDlrn0fwLSPcyA7YLOBSw6x6aya4ij4sRX4
	izYcD2qyh7EX6PBNkw9gt5iX+lNNe09WRFb/u/99KGl6WQDUCLQ1pcoa6CZ1d9Oq
	egH9LoFsaM73+vpkQgir+x3D2+2tL+SmoTXPnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781114585; x=
	1781200985; bh=hRl3mNBQFKGVzs+nseh0LNVMR6YWWbmjO7dz7QTtHMg=; b=j
	LB037dqWb04mTFyRfoIYOsSqIQGqoMpgMolu3NuK7g3pUqK2PTXuN6fDRL8TNZv7
	bNOQyh0JQwi9GbNlHyW5efS/cUdfEejuy8/4qFq7Y0JLzAOrYqUgfwNDkhK95g3X
	VRyDOImV1i+sasWH8AAMalzJzU3WLNKsYhoPi2UysZgHGZT/wBaOmvoy+DULSYgj
	/L4Rcpl2jGCpFwR438OxESVS2/tiOkFe9Z6EPOkDZO45Fz4sf45lBnsBx9VazbmK
	nvW7ZSYz3+YyXFJj5APJs0KxAjwqSmdXZTtJQj37ICHT9RglF41usI8x2gbgVyRO
	gGBcqz7ILQn5vnnuYtrsQ==
X-ME-Sender: <xms:2aYpanLga01DmVSmCgN29BMci58YoKalLcJ3bHrNCln_4epcE4xckA>
    <xme:2aYpal_QO4NocrgohlDvmL_DiU-FvZidTSZeVuaqeAQ_AtUT4X9oLCcWBeAXPfyNr
    Rkz_Iw0_4IYUP1WxtA6bwdzoCMd_FJV3CvkkzE5s6pp2BwONSl3>
X-ME-Proxy-Cause: dmFkZTEXp7Wint6Slx7HyaKa6DDbqCLydcwi/27Ln9A0Rl2LPMUdZWUZZfUlOp+aIasJQ0
    3hOZT5FtWic6I0UwQWjv3Hi8VL9K1VH/t1PwfqNMi5ZLY3pfvjeocOgWX7vmvLQe9j25g+
    n6FRiEn6/eW5iqHLIvro8bCrPrD7pWHNAqae76aLVmZNRJ9Ij9rNgR58VgnEGb9Zxu/n74
    VspXtsXnmyiKgnkQmiwZLsZ2YZ/v+1/vhUZJy2u8SFIhKvw7WdbVw9ebLY7eqmOuiV07IE
    o1BjhNTrfdlQi6kOu5sX5I/UeL47BHOQm8+254/deVIyu3DK/SBxrFI2CiSes9NtuIjNW0
    I47poME6P5XtjizNpNGehpW0JtHGX9kA+9Gt2Y4ZpUT1vKD3wCrCvxAhTtpGs08tU1NMSI
    gtCU7a6O14raY9LrXTTxidR04xeIieBN/X7iMjMJCxbDz9/uWH00bIR6cGNUSqQ+EXOF7b
    K42q5zDmi3JudRQF6MCTF2BJvXXUNnziVw6/zTuOu6HxVmzHsxfNojVhpXF8cbHPVWjpa7
    ZrnYgZ/H0XaSHljECxgtT9WuX/AxnFJW7aIYtrgnxaft/CtJtrX6e0hpnPnyu8ETCBqA37
    4bd1ryisQzTrx5CZ4bwXdmO9s+2GkfU0ZglfPSvI6kGJTejg5dHCVZZfadgg
X-ME-Proxy: <xmx:2aYpah1IF--YB-vLwrfVTOrFQRal6UJ1y87Fh5FlrikO8yYdl7EYxw>
    <xmx:2aYpamALSoBD-gOPZd2hPyfdz5ilHGdgbeQnCekjFake2GziDC1TSw>
    <xmx:2aYpapeVBcwmu7pBVUdg3YZJc69UbVZP6hB9DUKuzMCI0QgRo50a9A>
    <xmx:2aYparhGklnrRNY6fHUOZvt2_fhXzY3UKlz_G5LsJUe5BlxXkibtBQ>
    <xmx:2aYpagvYAQf8Fk5iRQ5bju48Y8tPGgIxecSwLzNVuU7vCxb-ojFiF1ez>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 43AAF216008A; Wed, 10 Jun 2026 14:03:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbmbupR3g_CV
Date: Wed, 10 Jun 2026 19:02:44 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Randy Bush" <randy@psg.com>
Cc: netfilter@vger.kernel.org
Message-Id: <2c8aa7b9-b387-402f-be90-a59f8b669e30@app.fastmail.com>
In-Reply-To: <m2ik7q1ff8.wl-randy@psg.com>
References: <m233yv2r20.wl-randy@psg.com>
 <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com>
 <m21pef2ope.wl-randy@psg.com>
 <6fcf67b9-4fee-4b1c-85f1-597afff788ba@app.fastmail.com>
 <m2o6hi1hku.wl-randy@psg.com>
 <ead376de-4dd5-4725-86df-bf7cf798b672@app.fastmail.com>
 <m2ik7q1ff8.wl-randy@psg.com>
Subject: Re: prefix len confusion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 6:19 PM, Randy Bush wrote:
>>> we also see this (distributed source) attack on proxmox clusters' web
>>> interfaces
>>>
>>>     2026-06-07T02:01:39.274405+00:00 pv0 pvedaemon[2276]: 
>>> authentication failure; rhost=::ffff:85.11.167.7 user=root@pam 
>>> msg=Authentication failure
>>>     2026-06-07T02:01:42.970943+00:00 pv0 pvedaemon[2277]: 
>>> authentication failure; rhost=::ffff:85.11.167.7 user=root@pam 
>>> msg=Authentication failure
>>>
>>> can we safely just add ffff::0 to the v6 bogon list?
>> 
>> It's an IPv4 address being logged in the form of an IPv4-mapped IPv6
>> address. If you wish to block it, consider it as an ordinary IPv4
>> address (85.11.167.7).
>
> if nft treats it as an ipv4 addy, then the ipv4 filters should have
> blocked, n'est-ce pas?
>
>     tcp dport 8006 ip daddr $PROX4 drop

Assuming the packets arrive at $IFACE, that pv0 resides within $PROX4 and so on and so forth.

-- 
Kerin Millar
