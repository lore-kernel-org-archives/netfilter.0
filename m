Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416EA27713
	for <netfilter@vger.kernel.org>; Sun, 26 Jan 2025 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737884216; cv=none; b=CyyigNX9CVDM/hcJgTdD8oXkT2ehqpOmwVC2Lsbem0zUCp/lTwkSlRHH+dfCp7zeb+XnmY7SoG5cekrntbhBcPRbPkAdsTyFYAMCZdFi2iDKpxaUf6+ZhxOERigmC9KXRiQiK1mbCrV+lpE+Zj/rWZ+L7KQUoubj82p5gPgoyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737884216; c=relaxed/simple;
	bh=NJS0HP+Pitrqokc8LW34oXFovOGqDh1tmMIBO2pbpSs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uo7wFvdvEMxN80yIcQjib/a+b/kOa0mQrDcgTIQKWbuZr0zobxMeCwCj6yeoPD8K0e+7o70xkMhIt5C/V+Z0Y4r1WsIVP6UvnYLTcbKAY5pOVYHTDg5r4+QgHAp7MrYrnRXcw8qkQZeyLysyONQy1L08QXdLjF3kytJQXbOJcQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=Wmu21+xV; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="Wmu21+xV"
Received: by shakotay.alphanet.ch (Postfix, from userid 1000)
	id 992BF124168B; Sun, 26 Jan 2025 10:36:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1737884211; bh=NJS0HP+Pitrqokc8LW34oXFovOGqDh1tmMIBO2pbpSs=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Wmu21+xVysnUvRB1yWX+IPh/+RcbUn9HDeAyHFDTnmdMjxYRNMS27QaeSnm6NdwFS
	 DWyWF4m/UBQfK3IHfzDwSzATVGrjBvdaNrQti8F36zE3OnvfGMrkrpT9tJ1VRwEdOV
	 wUlHB68/e9ie+R7fP1+djnaHG8oc/SZ10s8ThjkmosABHTxLOnlKFBomBLSLJUny1z
	 0A9F2xzKCBuVeHfhrs+FLhJJRNdRitq5v3Vq1FhxLlmLIYSO0p0/4tAiDknb2IB9xP
	 hrBub+BaFX5Fwt6tVktUI+DiSEE7GQ+XMDm3e8aU3HPt0O9blpZM7wKfbNC8QlxIKb
	 N4hSSDFvgobmQ==
Date: Sun, 26 Jan 2025 10:36:51 +0100
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: netfilter@vger.kernel.org
Subject: Re: nftables DNAT routes to wrong iface
Message-ID: <Z5YCM6HeZ3sxRf64@alphanet.ch>
References: <Z5UJheaMk+bZsEFe@alphanet.ch>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5UJheaMk+bZsEFe@alphanet.ch>

Hello,

On Sat, Jan 25, 2025 at 04:55:49PM +0100, Marc SCHAEFER wrote:
>    telnet 193.72.186.130 8080 gives this on enp2s0.300
> 
>       IP 193.72.186.190.52636 > 193.72.186.130.8080 (normal)
>       IP 193.72.186.190.52636 > 192.168.202.10.80   (good, it was DNATted, BUT should be on enp2s0.202!)

Ok, my fault!

There still was an old configuration lying around which did:

root@test:~# ip rule
0:      from all lookup local
32764:  from 193.72.186.128/26 lookup 193
32766:  from all lookup main
32767:  from all lookup default

obviously, that's the bug.

If I remove those, then it works like it should.

I will now work on the conntrack part.
