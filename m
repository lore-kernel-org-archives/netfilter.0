Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0EA38B7B3
	for <netfilter@vger.kernel.org>; Wed,  1 Apr 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775031534; cv=none; b=nbfpPEzeOoYztZ6RJsgYcn/ZSK18ttLUrjvE1ARj4mIt3EmZeBOlUqpxSRegwem8wsraH0jmjIQ9pmKvxmb771jN2Hq6R6c74lL+1Of2+Khc5JqepWRkt/OgZM+tNn8a1hiteI6BSdsBtKWbkJvO7hR0CCTd5IYFdND4SYo+s34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775031534; c=relaxed/simple;
	bh=XwF7bDQ4UxhbE5PVx1pb3Cp1Qywy3lxgZs0YLDzcH5o=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=iwrlH3aZ4xMejHgtRJKwUbQgD1Dwhcgwqzd1jKs/8UdyokHrupefwDFr9lnBbCkSfYJ+GCAVq6BUcLxMsfoMAAcMg8sX2oRRiG9F8DlUOH2jb9jsboR8lW+uayxBr7T4zIISMaNgpFI5yscDJCiKFdJWbjtEW2SI+yKWDAJvEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIowRE7g; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIowRE7g"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9c1da7ac63so72128766b.0
        for <netfilter@vger.kernel.org>; Wed, 01 Apr 2026 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775031530; x=1775636330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spbnlmMOquWwEZBOui8ERV2z8D+mrQXVOyRYpqsMsL4=;
        b=kIowRE7gP8mwroRiPyEXr3OIrhi7+pBX2m0wBCFjtCc/cn7gsvJY9GvQ1D/acNpy8/
         cV5LnF8XrVa+kcxf+tvQygjIXEYAw79lNlb3nSkJM0MdWXhDAtQfl7sMMLNhszecL3wx
         Pul2SOzihsxQlEgbsqdS8xgD32OKeZCHC1cLIrh2lbxyINcYySwrLd6s2Ljrk0TUnNnR
         U4GaR57kVBeva0/UEzKnjKJBfIdC85ZObzBdxc5kxh6Zj1GHvslyUtWnWU5ZjjMKbqhM
         Bv4m9Ln9Q5ngr6iLkeHYw3IolyzeHZEmsZMv8UxHSPZYTm9m/8EkPljtCgTs0rEhg+GB
         Q0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775031530; x=1775636330;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spbnlmMOquWwEZBOui8ERV2z8D+mrQXVOyRYpqsMsL4=;
        b=TB64frhi2+qlxrFK2rSmjDyettig3oL5a0+bM+YDF7l2n/Tzy4VPIT3D2dy95GmE4C
         qFpq8ajwv2mDJVfDPVKJhCvz5MzaF21op9wh80Hml2vegplQOwIz0hLUvS3yvmfdH7bc
         xI/awwThzT6TJuxgM0xXU22S//uY/URNd2o+nmOa7H8/AFdSX6+ri+a/Se/XZjWcYX8B
         CbFITRDKEJkcTUEtc2YKxfpOXU9u5XQznJKqn5PoBKN1z6Quv5X1g+g1RBWQfEFnf7px
         OxOF0uGz+eCGzdnSoZq8SxASvt9rmQc1d1mC+JihrLIlBcF44fC380t/FOkO3Lakg769
         MpDA==
X-Gm-Message-State: AOJu0YwF04CmJJmTlKDgcZbeE9hbTYuiBkckFUWZSbNvFBYJnirHoEDm
	DAV/cBH9JMQTUHs28SodATEVTsVJN/udxhmr/X+0CMjOUP4Pp2RyzEeG8gj23DM=
X-Gm-Gg: ATEYQzx9+xmVRlT4F9JzmhBj5VUmZ18AtWvaIN17i+slocEtfu+5zT6ppP1cCZYCuXl
	tnvY2lsVvgP2Sar/lbf7sEB0DKmNjN58YNVJNxCciMtKyxUkR61P40Uiqv/wDqL3hgpmSERPSNo
	51gEQn3W2AbyvHGwoAERjXVDHWUOpgdAiaZ7zmk+gUzVv2lWXu3xHUE8FYXu1m9zr7dvWlHFxxC
	HHpp9tQqnaeoKChV2+uAW+RK+RSy63aXqPCbKPazAIkzsn418lcgNSdw0rZG3w361YppYrwoTtI
	60zloLibh/w0AFH8SqLs3ZPg3SYRj8pQuh58hSRedQ/UjOkSzpxz4kznsSrmHa/hC9O42pfh3XI
	AX+eQdCDeMg/eh9ljt9pjJ4+zWg0IpTs48Q2tmD8bi1pTd77OCpxylT7WqO9pg5ZLJZQ2SAKkaF
	jMP9GLTiHCbVrwCsfM+F2HmG5akFfcfNIQN9Ew/hVGd5MRCX2dWKm+b9ArSncdOjyFrJznUOAmJ
	tAK2RGgZAWEISiYGvIbI9twGrhM7yaT21TMem8FB2GijsaByCAehUfIn31Z+03wYENpBu4=
X-Received: by 2002:a17:907:3f89:b0:b8f:f08a:4b80 with SMTP id a640c23a62f3a-b9c137b24famr174698966b.3.1775031529585;
        Wed, 01 Apr 2026 01:18:49 -0700 (PDT)
Received: from ?IPV6:2a02:a470:a384:0:e02c:5dfa:cccf:7784? (2a02-a470-a384-0-e02c-5dfa-cccf-7784.fixed6.kpn.net. [2a02:a470:a384:0:e02c:5dfa:cccf:7784])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c309875b6sm1707866b.14.2026.04.01.01.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:18:49 -0700 (PDT)
Message-ID: <07431a43-e76b-4a2f-a24d-99dd25a9ef7d@gmail.com>
Date: Wed, 1 Apr 2026 10:18:46 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: nl
To: netfilter@vger.kernel.org
From: Dion Bosschieter <dionbosschieter@gmail.com>
Subject: nftable field to field matching, to support garp filtering
Cc: jean-louis@dupond.be
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

In order to support filtering on garp in the nftables driver of nwfilter 
for libvirt:

https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/thread/4VYYUJE2MF6IBAO6R6YT2FA456LTKHC7/

I have tried to come up with a solution to support the equivalent of 
ebtables --arp-gratuitous:

   [!] --arp-gratuitous
          Checks for ARP gratuitous packets: checks equality of IPv4
          source address and IPv4 destination address inside the ARP
          header.

I havee not found an easy solution to field to field matching using nft
For example: arp saddr ip == arp daddr ip

In order to compare "arp saddr ip" against "arp daddr ip" I have now 
written the following solution:

// create a concatenation set of identical IP pairs

same-ip-set { 0.0.0.0 . 0.0.0.0, 1.0.0.0 . 1.0.0.0, ...

In order to not list all possible ipv4 ips in the same-ip-set, we will 
mask with either 255.0.0.0 0.255.0.0 0.0.255.0 or 0.0.0.255
this ensures that we only have 1024 entries in that same-ip-set.

This results in the following rule:
arp saddr ip & 255.0.0.0 . arp daddr ip & 255.0.0.0 @same-ip-set
arp saddr ip & 0.255.0.0 . arp daddr ip & 0.255.0.0 @same-ip-set
arp saddr ip & 0.0.255.0 . arp daddr ip & 0.0.255.0 @same-ip-set
arp saddr ip & 0.0.0.255 . arp daddr ip & 0.0.0.255 @same-ip-set
accept

This appears to correctly match GARP traffic.

My questions are:
- Is there an easier approach to this?
- Are there plans to support packet data to packet data matching or 
otherwise specifically garp filtering?

With regards,

Dion
