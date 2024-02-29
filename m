Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314FD5D462
	for <netfilter@vger.kernel.org>; Thu, 29 Feb 2024 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709201466; cv=none; b=YUlZ4CkHcJlpcAKE6jXNJNld+uf1wLsaGUPtwlk7+EnFmPwheIYEnoukkFjUzw579G/2Y7yzwgAA10ufaul4jJX7IxUvgQ1VQywnNAuGR+Qh/f4OXobiMWuicq0YaxOlsSzlhppcjIy8/z6UmQ9LYp7IOAiYL4yKU/qQHUHMiaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709201466; c=relaxed/simple;
	bh=GXjqJH3y2e7iUHhAfY3cNAg+u1t572iHrtxXXPvools=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=jrzWMtBXf38G9vgz7brO8xSu1gmnVy2KVfRnUEWngYoO0/BNi3U0oDZ5MbNHchvqqylR4PkWys2tF/KK/JPLRPDYFXViOhidtagcjePRqUF+ey5zLobHooonp3qRfQlwfnxuCAoBbvaWCe1aYU5pQvUi6dP4nwB6fhvQOF1coLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=NZo+PDX/; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="NZo+PDX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1709201459; x=1709806259; i=lars.nooden@gmx.com;
	bh=GXjqJH3y2e7iUHhAfY3cNAg+u1t572iHrtxXXPvools=;
	h=X-UI-Sender-Class:Date:To:From:Subject;
	b=NZo+PDX/GXHL+jS3ateuvon1ikx6J4ABl9w08eAxBaQQG9MZx26nsdT7MLnHQIp9
	 UhA/hOWQdY7UbZ8aNOf5nw1DtTy4OQfDLIKCl5UcvjnGidYIwztRf7fhWssbIh7+L
	 Tpsspnr/NPDha2q54E32kw9ZkweW1XRkfQNle2dC27IY/WxlGERc9/0ypRjfC0DhQ
	 O/9syhZ3E0BLz394A0lZk2JqMI4EeOrKbBeJ91poq5NnPdFam9eYi9yBS4R4X2PJK
	 fSi+koTAezXZS7idkhgOfpybqDeij5baU8n9uDaRvRA7v/YcAioUkx1Lt2PeUq8rp
	 jSTWQ8b0ugqxcSOiwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.3.168] ([80.220.96.92]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1McYCb-1rA97808Uf-00d0EX for
 <netfilter@vger.kernel.org>; Thu, 29 Feb 2024 11:10:59 +0100
Message-ID: <8adb4670-f8c0-498f-a06f-8564ec846e37@gmx.com>
Date: Thu, 29 Feb 2024 12:10:51 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Netfilter Users List <netfilter@vger.kernel.org>
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Subject: snat with dynamic ip address
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 xsFNBFMwE5UBEADohhbeU/1lQZ1d9TN6ePhW/vw42MvasRrWJpf2t6D/y0xxbpMZTWRCgQ37
 9UwAUATwfPKQ8ScZZaiTzQYZ+yAWkeOu/4BcOCr+k1KT1fW33lspRbMmmnf0OljbGazi01+F
 qXiC5pPvk3fj6nlSTI3GreV8bLxuTDltCnkkkxkgkd6W8MfEwCBGJySrk5ljnhIAi9PjClzs
 /qw/twOtHGy1EkH2huPgTOHmybgjOjz+3H19KHBnwSyZQ5me9ftWpUmaAMeImVW7nGNTqpUD
 NR01pELI8LwYzI6v8a95qflY0SKYu6bKg7sNlEvwFqm+ox6jBrm/w5dNhz71IJJDRa3Cpugf
 a64YZC021taHdTvs8fYqUOyYzh8g9ilkfD+fkJ6nR+2PUx9yeLBKCsJT0bkNdFGhmmD9aafD
 LMRhbFCHanEGERT89LRWpb26TTjdWn9Bv3n4TKc3gGX7YhFqACEOfB8zFIfb+cVASmpTU76z
 +hVTFbQcr8Vr67528ehiQFUvlptHgZlo24p8HhbKiKlLUEshL7KjDcXnUyiMoXNxkcZ99spY
 eWAMaapaipsGLTMfjEBxt5hxVti0ewTFc28sdbVY2jOesAIiNWhrxFEIhWW09o2PO9Z+3XRO
 Z/Hkrud0ofx2zVXwPmHhZ61yQkp+c9aso/rkMVojiVbsoy2jbQARAQABzSJMYXJzIE5vb2TD
 qW4gPGxhcnMubm9vZGVuQGdteC5jb20+wsGXBBMBCABBAhsDBQsJCAcCBhUICQoLAgQWAgMB
 Ah4BAheAAhkBFiEEU75BlAiumCkMIiuL3vIKtmU86ucFAmQR/HAFCRK8hNsACgkQ3vIKtmU8
 6uc4AxAAnKWsi3Zkt7lZqFgL8zrFFR8S8QOqBUmvn0YUw5OwwxpKdyPx4Yyp5ANG0Vuu/A/9
 s1B43PXh60ZCyW/bjJahQHe9UqRAv03PG2KE0SBbY1lB84q0lIJ6ZsmBgvqP+xPsKjSlYRkE
 MXe/UjiqFFkqqmu0lMXf0A7Z5WeR+yWkZ6fB7ALTJrBAXW4cisosAP6azV8Mwfdg0qiUpAUv
 BmaGP92byeOqARIJow9cuMtGlxC4s+JdRFs9emTTspeYTYRq9/7LhQ3Oifl2NdkT5rZCyh6S
 jBVBKcQjbWI4ytCgdOIJ6GFginDvIpsyTUEengK0BV1RaQEgmySq3y9Ag8BjLv72F69Lqh2T
 1sS0p1XelH04cZKNIkfHf3gMu7dlo25BySlIjufuZnT2iGG6Ym7/Z/ppOCHlPuDQxvoXf6oZ
 q2n9PQbQqFeSbns5Ptz/Zd6lJS7pbzRB2oeee9skbHV3TarwVN+b8z83ACr9OkL6QDsoCSIK
 vpGVDJ8yQpzAkbQDA+GJiuq/4RbAmTXBEPMD+W3ofg2ziYbkwZZtTHCgVlz3Q18LoEk/qz/w
 ya9EXevKZMrEFmOvEYViM7SMLjwzsYCWnjPtxOu70wzp1Sc8d9rs+9ytDyRnHivoKLsQ4czu
 Eixsk+kAX3HAgE+sANi+JGheOQjxCdA7bHt031kZYJ3OwU0EUzATlQEQALJiBEqFsa8oBktK
 W5kYrYvPfkWNc9+oyulSyDkFLIBK0dxfon+Icjxg9mHTVdnu+J5gZ5xfcJh293RjaGQa4Gm4
 E71KemjQempaEiuXL2RNBMElwtrLxDpsztRANstM0l76pBqHpruInJlNk62dcMf64c0TcZR0
 gf47ni06+ifxGCm2hCe+BoHJo+S4Tke7j33GGgDPNX6zLpxrqdauDko0cU0ArgPHH88ZxXP6
 OROQWpkZ31AvyyeFS1ghaeU4R5mKszalAUlSJ5gMBWmOAt7yT6GLNZCxwaFF80CY2Apnbk/N
 pUYYoS89MehbqdVIgoEsBOIP5gI/8xc7sV61oRTBPLJJhp1ngNl7+/V4EGdz83e9ukjvNrNc
 nJxntzBZWFe0deewViWjoStS9nmMhqNGchRmFd1Y8s496qlRC42z6uGyxfp2JddEMz61DtEq
 hWdfx8qVQtzYoUjVg+etMF3YC3G68OHCjFEmd8ygrWewH8G1s4R2OZ7EyFCzCIa10iu6EZr3
 Qem+r4tGacoOoPDPLBc25AJiQOehJ0hto2aYHENVfsksrS7cQesJ6av3KzUh5C2Icl/jPQLJ
 6vf9ncDLGNz7lAkJ+D2fT1a81BZ7kZnvjcI1MyapPxsxCjwvzlf63M/kIlQ2kirc87l/tqK1
 KGcDVQ6nEctWZLHIBABxABEBAAHCwXwEGAEKACYCGwwWIQRTvkGUCK6YKQwiK4ve8gq2ZTzq
 5wUCZBH8cQUJEryE2wAKCRDe8gq2ZTzq54KVD/9fzNALDQEKPFDpj8y/mrTGjogqJjB3/sal
 yn8XcIpDiqg+w9bM3VwABKNS5WfkvJmoFXQMvshxImlUwBwk6jy/tFz3IM6bCaQJlsJLE0B5
 T94c7Nq18kYAYGDf6RiWbtSDlJ5TNC+7/iZOrguONhYuXkjonct7kq0jBz8F0YbdEG/1yY9A
 gdBqZS8bLYXSqUfCOYpQiZpUuqTDfjhW1noyf9mQ3nfVIFRx+5as1uK17Aa+Ek7UCcXlvwKv
 px09+/v5B0t5kb8pFMCXskPxLqDGkWY2qslmjjz1X3AkMvxUpjCXXzPf4cP/PpmoxmtrR2Lw
 xGtE39Iq23jaHFmq6V8ZaIbAaHnRUsdFGpGo4HfQGmcU6Un1th2WkAGdnBk/J8zx+F0ZN/rb
 muhyBSZ7jtFea0k39C659RQPTW/xMfh0s4+Uv0OtN8zzcEFRl90X7aLjItIsjxIaubHx3hTp
 vskoxkCq4aQ5nkEi07ACjYT+irtXo5gkb1UlRjCD3z4777rRop9B2Pyd5p8cXZN/S/B0Cnya
 TjKTY3Y/5LVCy1yRNL0Zj5268s/0AnqN2VXluJX+JKyzwI588huxnpC4U5XLNMkj/1xpUxLb
 4jmdXXK1Lr7oxgP2B+mphM4UJE0GWSdCIkYGK7QOnxgozpsUt37nf2yRQyfTLBr8gFsQrctY fQ==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pw0/W0F1ccyXxU9v6uQBP3F3VMu2TyVxgNb3plyPS4a9HnUJPhg
 mLZ3lcAlWUb8oOmeJ/ScPH5h1LtuFBzOYhsMvzU6nHsuXyl1Zb+DZ7XbGr4Tju4Qx9MxChL
 zd6eeb1IXZW+uibK+U7SIPMPNyBetpLvrfbtDFVvn16mGLnN8pNWRIcSurYkzE6YHq2F2Zg
 y9Nf7a+M89m1xfWzUO2fw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8wmLgfqWP8U=;tCelZYr4pmVDXkBjOrAMxJnsZDr
 uFVQv2E6LgkJuYyQzxM1CjfdCFWajaoHn7svRzSGXBu0vkBhSpEeQZQudFl8yw4HeTR+Wvw26
 9aOq5G/1p2VAZxGmOjVxKU+YEO5TD5l5twyA0YPJu4zDrwO/8vclUlqArPPR9JVpSWs2/O3zw
 92iORb4xcJBRBrXz/byLrDtXReJwC5oAJrULZmGb8Ogchf+/F33VtjVfRuthI5kl/wWPwEtiX
 bQp0DcEd3S/z1TBJJXxscy4FDeYcDW81GsdgA0MUFzypuFdOLKpmslHb+zx34zyqqnphOCaVK
 hWE3CScbJHuDpkHnE7aRZeFTZIK/LXmWXsR79XaG1I1jrLPkd8IV5SF9U977ri852Rs7KL3Ir
 cyh16KrAF9i7BtJW9m7emEeSjIiI4zjJDT90O4FtY0aagUmsgFkOkXgsYHYPvqXipfJ6B5bBq
 0qrmnS/MHigq+SoSFTdR+xfKQfPTzrgUkvcu8UFHZrlCyJDJxU4hypo0qhQlibwWI2d4cXTSp
 9M3GIJIIeGcW+DwbCSlF4BreUO7B0y0Qo6h9XvQcrX3NFu2hNO+xvH32aW2z8JQ4yBwy/vioQ
 8U6HThl1Oe31HFL4sO+wT7qbkRSQDYjq49ZQSi2zQUEbZfZcFfgW1zCyv6dVikldlfsajPOkQ
 uuu50IFLRsy66pxcSJgixrjz3/JwSQiaePjcYgZzfXdQTIHiLUMiBYxVkAf3GzS2d8XI7Z12D
 dIA/m+25YDUDtfCJtzkymAQPb+k27BCUgDrdxY3ZATb/l8h167fp3PKIV3+nsCBhxehaL+jjG
 MMZZiouJUJhx2XU+rtacihhLs9Y3h19khJfJlUu6w5xOE=

I have the following table within a NFTables rule set, but the address
given below (192.168.1.213) is assigned via DHCP and will change from
time to time.   How should I rewrite that line to do SNAT using whatever
the current IPv4 address happens to be at the moment?

/Lars

table ip nat {
         chain postrouting {
                 type nat hook postrouting priority srcnat; policy accept;
                 ip saddr 172.16.3.0/24 oif "wlan0" snat to 192.168.1.213
         }
}
