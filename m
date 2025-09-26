Received: from apollo13.glsys.eu (apollo13.glsys.eu [135.181.116.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB2B86353
	for <netfilter@vger.kernel.org>; Fri, 26 Sep 2025 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.116.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758888687; cv=none; b=pWyl8OE4xSzZPPuWXHhanJUOCWZUFzetFmH4E3bsh3Y7LOO2M8kgfJbJ54RKe4eOHs6jvORkL5uVeVfJ8GfhB6Qmch6zrZK7nMmEDnC7SY1NsEse0GJf44Lev1sBhst9ytG/dJPHkYtBxwKXfrk2Nm3pm03x9UzR1HsquTw6f3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758888687; c=relaxed/simple;
	bh=OXX1w+sT//reruHcSyMsePICbPZa1sq3qkMMOb+Cc5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SmtFfSfRZ1WWq1Xct5RY5rBMF+x4N5dgXA1Qw0vWGnee6VUxhTscxNptWtaUX399WEI+TbMHvZwofekO+z/zD1LPWBzY6cxxT9k5eZLlb/Qbvev0sngHip2Q6xK+D6zTOJfDzCK1mk0aIXA+ZFRF+3kqg2//fRN2ozHLDs0OycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=swifty.hu; spf=pass smtp.mailfrom=swifty.hu; dkim=pass (1024-bit key) header.d=swifty.hu header.i=@swifty.hu header.b=YOekiVcv; arc=none smtp.client-ip=135.181.116.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=swifty.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swifty.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swifty.hu header.i=@swifty.hu header.b="YOekiVcv"
DKIM-Filter: OpenDKIM Filter v2.11.0 apollo13.glsys.eu 613CE34318B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swifty.hu;
	s=dkimkey; t=1758888199;
	bh=n/CO8Ey5tG4WrAc48nMB4udsxCw+pXvin5RaBhl6YSk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YOekiVcv1TG/5UH+6RIfgaaIMnwmPgYri26a1Qu4016qcmVyf+jK8nGYVyl6uiPtz
	 ZzZRhBcWiLEAbB2zjV6BmSlfhhaNv6DOufxIWpkTHSI2lRNgaBX68gksBY6we+afij
	 XZmbVOGCs41P+usTrvSgR8ho7mFu/GkoUCOIvjDc=
Received: from [127.127.127.127] (localhost [127.127.127.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1))
	(No client certificate requested)
	(Authenticated sender: info@glsys.eu)
	by apollo13.glsys.eu (Postfix) with ESMTPSA id 613CE34318B;
	Fri, 26 Sep 2025 14:03:19 +0200 (CEST)
Message-ID: <8fb8b43c-ffad-4d11-b4a2-2e0c4509d281@swifty.hu>
Date: Fri, 26 Sep 2025 14:03:19 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Private_information/1.0
Subject: Re: redirect/dnat to localhost address in prerouting chain?
To: arequipeno@gmail.com, netfilter@vger.kernel.org
References: <9d95db74-ba98-4712-be2a-b90cfc0239bc@gmail.com>
Content-Language: hu-HU, en-US, hu, de-DE
From: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@swifty.hu>
Autocrypt: addr=swifty@swifty.hu; keydata=
 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
In-Reply-To: <9d95db74-ba98-4712-be2a-b90cfc0239bc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I think what’s happening with |redirect| is that the NAT doesn’t map the 
traffic to |127.0.0.1|, but instead rewrites the destination to the IP 
address of the ingress interface. That means the service must be 
listening on the wildcard address (or specifically on that interface 
address) in order to accept the connection. If it only listens on 
|127.0.0.1|, the connection will fail because the packets never get 
translated to the loopback address.

But please correct me if I'm wrong.


Swifty

2025. 09. 25. 18:52 keltezéssel, Ian Pilcher írta:
> I have a multi-homed host that (among a lot of other things) routes
> traffic between the different subnets in my home network.  On that host
> I have a couple of *redirect* rules in a prerouting chain:
>
> table ip nat {
>
>   chain prerouting {
>     type nat hook prerouting priority dstnat + 20
>     policy accept
>
>     # HTTPS connections to old switches are redirected to stunnel
>     ip daddr { ... } tcp dport 443 redirect to :8084
>
>     # HTTP connections to the management network are redirected to an
>     # Apache virtual host that will send a redirect to the HTTPS version
>     ip daddr .../24 tcp dport 80 redirect to :8089
>   }
> }
>
> In order to make this work, I currently have both stunnel and Apache
> listening on the IPv4 wildcard address, which I don't like. There's no
> reason that stunnel or Apache (on that port) should ever receive traffic
> directly from another host.
>
> Unfortunately, I haven't been able to make things work when stunnel or
> Apache is configured to only listen on 127.0.0.1.  The redirect rules
> shown above result in a "connection refused" error.  I've also tried
> changing the rules from redirects to dnats, e.g.:
>
>   redirect to :8084 → dnat to 127.0.0.1:8084
>
> This causes connection attempts to time out.
>
> Is there any way to make this work?
>
> TIA!
>
