Received: from mail.thelounge.net (mail.thelounge.net [91.118.73.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCBE5731A
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.118.73.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689279; cv=none; b=WTacVs0+GCZt9qwCJmySHWS8WsOKUDy7U4fcW0wWAYF7jXXygrmb7Is2LVzIXxhBhQOsxbCGG4FIxtu0zibyI72R92dpECG7Llywds+0bVKzvchSqL91HN2Y5xkeg6a9B5AHObcIDWz0CogOCPIoUgV9NGdzvi6++89RCbAHNDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689279; c=relaxed/simple;
	bh=x1Spe5Jrdk8klfpHeDsZuBLn/4cHvONFry3wQA8bDAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oWronDSN3m5+66S3OHK6gxgvteLX50n5KrIY5/wTFUhpUuKKFIiHG+wUnRXm8cPvz92Btp9hyphZ6GDCf6a7XcBMOrvqmVsxnEvaswuicUSxY4sC6L1604oNek9VGO9VuF6Sey/KLxwJ21ZCgA5Dh9hyFCDknJ888hj1IR72+UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net; spf=pass smtp.mailfrom=thelounge.net; arc=none smtp.client-ip=91.118.73.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thelounge.net
Received: from [10.10.10.2] (rh.vpn.thelounge.net [10.10.10.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: h.reindl@thelounge.net)
	by mail.thelounge.net (THELOUNGE MTA) with ESMTPSA id 4TPw3Q5b4SzXgg;
	Wed, 31 Jan 2024 09:21:06 +0100 (CET)
Message-ID: <841e1c2e-1ea9-4e1a-929a-7f954296b8fb@thelounge.net>
Date: Wed, 31 Jan 2024 09:21:06 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is there an efficient way to delete multiple elements from a set?
Content-Language: en-US
To: Anton <anton.khazan@gmail.com>, netfilter@vger.kernel.org
References: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
From: Reindl Harald <h.reindl@thelounge.net>
Autocrypt: addr=h.reindl@thelounge.net; keydata=
 xsDNBFq9ahEBDADEQKxJxY4WUy7Ukg6JbzwAUI+VQYpnRuFKLIvcU+2x8zzf8cLaPUiNhJKN
 3fD8fhCc2+nEcSVwLDMoVZfsg3BKM/uE/d2XNb3K4s13g3ggSYW9PCeOrbcRwuIvK5gsUqbj
 vXSAOcrR7gz/zD6wTYSNnaj+VO4gsoeCzBkjy9RQlHBfW+bkW3coDCK7DocqmSRTNRYrkZNR
 P1HJBUvK3YOSawbeEa8+l7EbHiW+sdlc79qi8dkHavn/OqiNJQErQQaS9FGR7pA5SvMvG5Wq
 22I8Ny00RPhUOMbcNTOIGUY/ZP8KPm5mPfa9TxrJXavpGL2S1DE/q5t4iJb4GfsEMVCNCw9E
 6TaW7x6t1885YF/IZITaOzrROfxapsi/as+aXrJDuUq09yBCimg19mXurnjiYlJmI6B0x7S9
 wjCGP+aZqhqW9ghirM82U/CVeBQx7afi29y6bogjl6eBP7Z3ZNmwRBC3H23FcoloJMXokUm3
 p2DiTcs2XViKlks6Co/TqFEAEQEAAc0mUmVpbmRsIEhhcmFsZCA8aC5yZWluZGxAdGhlbG91
 bmdlLm5ldD7CwREEEwEIADsCGyMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSdK0bNvBQK
 NnU65NczF01aWJK3uAUCWr1qowIZAQAKCRAzF01aWJK3uEznDACGncwi0KfKOltOBmzIQNIn
 7kPOBFU8KGIjONpg/5r82zwDEpFOTKw+hCttokV6+9K+j8Iut0u9o7iSQNA70cXqkaqPndxB
 uRIi/L6nm2ZlUMvQj9QD5U+mdTtSQH5WrC5lo2RYT2sTWoAFQ6CSnxxJd9Ud7rjbDy7GRnwv
 IRMfFJZtTf6HAKj8dZecwnBaHqgZQgRAhdsUtH8ejDsWlfxW1Qp3+Vq008OE3XXOFQX5qXWK
 MESOnTtGMq1mU/Pesmyp0+z58l6HyUmcoWruyAmjX7yGQPOT5APg2LFpMHA6LIu40mbb/pfg
 5am8LWLBXQRCP1D/XLOuQ5DO6mWY0rtQ8ztZ5Wihi5qA9QKcJxmZcdmurlaxi3mavR3VgCIc
 3hDPcvUqBwB5boNZspowYoHQ21g9qyFHOyeS69SNYhsHPCTr6+mSyn+p4ou4JTKiDRR16q5X
 hHfXO9Ao9zvVVhuw+P4YySmTRRlgJtcneniH8CBbr9PsjzhVcX2RkOCC+ObOwM0EWr1qEQEM
 ANIkbSUr1zk5kE8aXQgt4NFRfkngeDLrvxEgaiTZp93oSkd7mYDVBE3bA4g4tng2WPQL+vnb
 371eaROa+C7/6CNYJorBx79l+J5qZGXiW56btJEIER0R5yuxIZ9CH+qyO1X47z8chbHHuWrZ
 bTyq4eDrF7dTnEKIHFH9wF15yfKuiSuUg4I2Gdk9eg4vv9Eyy/RypBPDrjoQmfsKJjKN81Hy
 AP6hP9hXL4Wd68VBFBpFCb+5diP+CKo+3xSZr4YUNr3AKFt/19j2jJ8LWqt0Gyf87rUIzAN8
 TgLKITW8kH8J1hiy/ofOyMH1AgBJNky1YHPZU3z1FWgqeTCwlCiPd6cQfuTXrIFP1dHciLpj
 8haE7f2d4mIHPEFcUXTL0R6J1G++7/EDxDArUJ9oUYygVLQ0/LnCPWMwh7xst8ER994l9li3
 PA9k9zZ3OYmcmB7iqIB+R7Z8gLbqjS+JMeyqKuWzU5tvV9H3LbOw86r2IRJp3J7XxaXigJJY
 7HoOBA8NwQARAQABwsD2BBgBCAAgFiEEnStGzbwUCjZ1OuTXMxdNWliSt7gFAlq9ahECGwwA
 CgkQMxdNWliSt7hVMwwAmzm7mHYGuChRV3hbI3fjzH+S6+QtiAH0uPrApvTozu8u72pcuvJW
 J4qyK5V/0gsFS8pwdC9dfF8FGMDbHprs6wK0rMqaDawAL8xWKvmyi6ZLsjVScA6aM307CEVr
 v5FJiibO+te+FkzaO9+axEjloSQ9DbJHbE3Sh7tLhpBmDQVBCzfSV7zQtsy9L3mDKJf7rW+z
 hqO9JA885DHHsVPPhA9mNgfRvzQJn/3fFFzqmRVf7mgBV8Wn8aepEUGAd2HzVAb3f1+TS04P
 +RI8qKoqeVdZlbwJD59XUDJrnetQrBEfhEd8naW8mHyEWHVJZnSTUIfPz2sneW1Zu2XkfqwV
 eW+IyDAcYyTXqnEGdFSEgwgzliPJDWm5CHbsU++7Kzar5d5flRgGbtcxqkpl8j0N0BUlN4fA
 cTqn2HJNlhMSV0ZocQ0888Zaq2S5totXr7yuiDzwrp70m9bJY+VPDjaUtWruf2Yiez3EAhtU
 K4rYsjPimkSIVdrNM//wVKdCTbO+
Organization: the lounge interactive design
In-Reply-To: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 31.01.24 um 09:14 schrieb Anton:
> Hello, I've been experimenting with nftables sets for the purpose of
> geoip blocking. Let's say I'd like to add ip blocks for multiple
> countries to a blacklist or to a whitelist. Perhaps the most efficient
> way to do that would be by combining all required ip blocks in one set
> (for each family). However since country ip blocks are a moving
> target, I would need to regularly refresh parts of that set. My idea
> was to delete all ip addresses corresponding to an ip block from the
> set and then add the updated ip block. The problem is, this is very
> slow. While adding an ip block takes (in my VM) 0.09s, deleting all
> ip's from that same block takes 14.5s.
> 
> This is how I'm doing the deletion and the time measurement:
> printf '%s\n' "delete element inet test testset { $(cat test.set) };"
> | /usr/bin/time -f %es nft -f -
> 
> (the test.set file stores a comma-separated list of subnets)
> 
> Is there a more efficient way to do this? I could of course flush the
> set and rebuild it every time I need to update some part of it, but I
> thought I'd ask before deciding to implement that.

that's what swap is for - you don't mangle around live in a large ipset

/usr/sbin/ipset -exist create IANA_RESERVED_IPV4_TMP hash:net maxelem 
512 family inet
/usr/sbin/ipset flush IANA_RESERVED_IPV4_TMP

/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 127.0.0.0/8
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 10.0.0.0/8
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 100.64.0.0/10
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 169.254.0.0/16
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 172.16.0.0/12
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 192.0.0.0/24
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 192.0.2.0/24
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 192.168.0.0/16
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 192.88.99.0/24
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 198.18.0.0/15
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 198.51.100.0/24
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 203.0.113.0/24
/usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 240.0.0.0/4

/usr/sbin/ipset swap IANA_RESERVED_IPV4_TMP IANA_RESERVED_IPV4
/usr/sbin/ipset destroy IANA_RESERVED_IPV4_TMP
