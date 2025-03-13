Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F2F800
	for <netfilter@vger.kernel.org>; Thu, 13 Mar 2025 04:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741840292; cv=none; b=ZensNX3T0V4ttfrpUF8t5qLwMrIa+Von7ek4VhPoLIMKNO4ypVyf8V5sC+Ler5Dec58Ae0vO7QXe7OYzLZwgCgNkTNpeRM/T7zhTc5UAIa9tWBf8Xk968JZ9N3G+3WMjSO1VhZUU1Cm3zBAbJvhIUDD3nzjnyzxRNFDdAnQ5ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741840292; c=relaxed/simple;
	bh=vZLk7XjAWFBT1zcb4zd1xtlkp6JNw6b4q3h1tCBx8DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RiL+ZZyEXKaxgk4NgXTaiRQEJG0sq3ZaUJtNKS06iA2pVso+hZ7HB6aQLFsMuHR/wCxZqEivoAj3gAYr4OwXqMlkZQmABR5hfSjKbJ2XqAC39ZiWgAvjf0ZEOlKFmRgDE3weMwumLcd5T1FMbZp2x2RtHX+HcKWfKnuP24C0H6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=gil7ww6b; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="gil7ww6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1741840288; x=1742445088; i=lars.nooden@gmx.com;
	bh=3yAFYv4yQbEbRKWNPUptTAjqQdGWGYX5FYctjpANiAM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gil7ww6bOaLPS1OnUJQDOtFF9C/g80rMRov9iImXPh5pbW9o4jl27skoDeuH64tj
	 XwDXC4AVqIqFkM+xdTsl1Jv2XD5PSgEw1PDwUNIam7dctEt7QquHcG6BV5bSBSQkU
	 k7t/m7K3rh0ZuyIUMcovMtc2OwFhvuEaoqp4vO0cCDQiLpOxnH5jgIKyiPyi1Y8v2
	 u4D1gdoxFPpKiLABlpA8IXFl2S2sOdUocmJsapny297b6fTP4QR5nKns2bf/UnulN
	 BlZaHs+tlSF7ePr3rxiwfsnIXzPKkB975FEngzpeMfn4Yck2PdgfrqbiabkOGEyGF
	 44qq2cFMIwPB0IszQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.11.9.65] ([80.220.97.94]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M5QJD-1ttx8n0qg9-008MAK for
 <netfilter@vger.kernel.org>; Thu, 13 Mar 2025 05:31:28 +0100
Message-ID: <cd939795-b632-4eba-9ff0-c003c4419ba0@gmx.com>
Date: Thu, 13 Mar 2025 06:31:03 +0200
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
 <Z9IFgS-NOhJKUsFk@calendula>
Content-Language: en-US
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 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 jw==
In-Reply-To: <Z9IFgS-NOhJKUsFk@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sCSkNcPyjqUjQDMHVY8OU5ZG+l02kv75JB3tuRSwD/2ZBmb4s6a
 m4jzJbX7buOxqt6r7E3HILX9McA64v6yFEGdzhv14oMuSJN6Bh/ReuhSy4QrOqt85gcRdAr
 VBOGn1w42EzBo+Ym0YZwgdFhfltr2fQXGFm3NMm0Y1JfmIu6gXIJylWYfP8dRpyNX4tol55
 93OpoePngdqwi6L6wMLzQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y6t/uHUnARQ=;71T5M70rZiBAuNAf4ZDwuwEH9xF
 9MEtTicZpFvSioxDOIRhmhPiUFgGA7dhuD7+7+N+3yBQEoa+1ZksSI6zqjbEUysbQK7gWos/e
 E4b3TvzlFWZd2ZaNws9kc1NGlYoYXra6Qp8ZXpAyjNJ/fO/Wax4BSXV27adHceSNWHI8Z5Yr+
 lUZYHOGPJiXOWhCM6wYogTkTxx5T7s9c33zxYY4gSO+EmgqaEMWOPzQV/iYi3rGZshgObLWR3
 AjqmVOuD77Tzw99B/E8wSItrSH8jLGjUjgcLbgYiccKCVGbdc7oJQ3Ndkgr0pzatCDp0B1wvv
 xRYT4P9ooifUvI7U25HheofB3ovcj4SJwg4SXN+WtJX2g81qbAOb7Aq0YL+Wc7olvm7xxnhWl
 Ri3SSQCW4UXAXbgQzIspsEVprM4J3Sr/whFIgaEbXppBUaXkguaAb3C1B3aHj2SQhUUf+QH5+
 j7ofVefmRNq/ZVeo1x44O18xLxFbXRH0wmoLCbnMdk6yHZ+baWNkHiMwoJw3kSRLdaVvcYgxa
 JwW1mVU5gIggFamRtr2nZM2Cmtc9oZT95gJzorHa3Y1JvR3Iely6NHa427gNP+LCsGcPRkdIW
 p0jmL6Ty01d4/Mb1BW/PFZ7eDYibytAkjt7Vjdn6q1RcZ7kFODz1m+zPAOstuJ2jtpHCEZHsD
 lu6LZfDDknUJ5ypcFlRpYZ69H8y932woCgQqnTGxrbs9rw4C93mjM0SjX+mYZt9U6jWX85FE5
 hV2kXrNtJlaBfAME/KOwGP1ZZ7I9dFNSiyCkdnPigHvhD+XFvfV3W7krPchyBLjKyodi4V4aW
 D1LWLZPeC8K3rekGH7Kba8uIKFHu2BGEzihLOrk/cyOrigEkWkI4MYAfBPZeZKQMiKnV8RklV
 AXwi1xfDJuTD6zueS3dtz5ejU0ejDkRat0b5zXikDaZ3pLgNcihXDuavcmBtL+X9ZX4EN1dmt
 EYvRPUvQlyyeIm21rXyhXutNzxA+XIfWuJ47B/7lE2hm8U7c68yO9BHjJ9lPivc3wWgohRBjJ
 luDn/0y6sbCagtKofBrcY6QJT+3e6RlUUW4TWCumaKGq8mdxz0G69Wfg1v2FUbudG74H8ukBK
 x8eyCMLWGkQVAFY/gAr0w8Wxi5ibwhCsX+Sy2qVkGyyQbhULNGyx/dK0hx7G7fn8O3lQXc67H
 6B5t7+UbRev0y7tzHpil3QNe+KTpFOx1tD4lF6CLzTI/KMBriiSjZ4oemZITZuclevKrQwEDA
 DdKHz6DjHDX+RZAnKHaGqlLys/p1UE7r7qNy79YpgbtV5pdmpfUDqu/qEZVa4MEDzfAoTpaCF
 /SsrNomRQUpeLZ53g6udeQfNLAtQeu/+qgNjP6VYLuxnibdKJQSCRexZIECDK5oEvi1P04xr5
 YdWwYw/6L7S3NKcfyw0518P5k0lPhS318l6iTgka+s6fGzyz9GKntx/9Yg

Thanks.

On 3/12/25 21:44, Kerin Millar wrote:
 > I suspect that your set has been declared with the "interval" flag
 > in effect, in which case updates from the packet path are not
 > allowed. As far as I can tell, this constraint is undocumented.

Yes, it is the case that the interval flag has been set.  It seems that
the interval flag necessary when the set shall contain a mixture of
single IPv4 addresses and subnets with elements:

	"Error: You must add 'flags interval' to your
	 set declaration if you want to add prefix elements"

and with auto-merge:

	"Error: auto-merge only works with interval sets"

It is necessary to have auto-merge since the individual IPv4 addresses
and subnets get added in an unpredictable manner and may overlap.

On 3/13/25 00:06, Pablo Neira Ayuso wrote:
> The ruleset above provides sufficient context to infer that the
> dynamic flag is needed, but that might not be the case in all
> circunstances. The dynamic flag cannot be inferred in all cases like
> the one above.
>
> Without Lars' set declaration, the question is incomplete and it is
> not easy to answer.

The following is basically the set up:

table ip foo {
         set bar {
                 type ipv4_addr
                 flags interval
                 auto-merge
                 elements =3D { 192.168.2.0/24 }
         }
	chain input {}
}

The two important parts to retain are auto-merge and pre-defined
elements (and be able to add to the elements later).

/Lars
