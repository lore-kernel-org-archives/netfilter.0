Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4CB1C2BE
	for <netfilter@vger.kernel.org>; Sat, 16 Mar 2024 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710615062; cv=none; b=FuWuEI06sjSZSkJBJRFkXNw9n0FxaDRuZbCtUBoCRxmsWIPZN9RgNrfqBS4CQ61An63Cs9t5pUVseo4O4O0Z+IxQ9HxOtIZe6CdBtABzM5CFULz+qCKWV4LQy994GQ0O9i/TA/qy2nMVKgu7FWa0egFmMnkyKYpRkNSKEebonG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710615062; c=relaxed/simple;
	bh=HGk8M5flFvHsmRDvmGrveoY5Q+KhHjYQs1BG5KfmnGk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=bXxxJwzcCLlaFqhsM7EtI5YXZCzwdfIvYIo0W8XHLFy1UwxLVcZMLMUwNZE8DiLZdYMsocr0zOnu6OjopVxxv/8+i2QI8LDpp/pf6AhvTAvW4lL94Muq84qlQlmq3BXUsGuyCxnSDyzpmEYGWAKQ69LnFxtDVSSKCngoBY6L1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b=sAYSnely; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=DNvW+R0+; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b="sAYSnely";
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="DNvW+R0+"
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
	s=epsilon; t=1710615055;
	bh=lO6iG9nwJXD5rf9DnqtRmtKL+VVbFzXe2LUiqr179rU=;
	h=Author:Date:Subject:From:To:References:In-Reply-To;
	b=sAYSnelyRHcCj7Z+yVRUhQmrFvn09s4ujx3yeqZ+DEUxAP/ZXblKtFgIfieBWfS1k
	 eCQowV1cnSWgOzrWMMeDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1710615055; bh=lO6iG9nwJXD5rf9DnqtRmtKL+VVbFzXe2LUiqr179rU=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=DNvW+R0+GdRCjomSeaRjLun6xb/O8IpIe7lfY0bnCrnCP7+fwxjvwzEKS71xxU1uO
	 crhjCYTJsOp2o5R5IxVabwTw01RL7YMH0/2uEohFgkICtt0tfN+OLtmg2d632AZv0l
	 JLdG/fcyjT1yZPL6uAmIoNyp4OZZcE7AJoioUBVy+m+J8kLKbQ81DUqDYerh2
Original-Subject: Re: Cannot get the correct IP version from packet
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.120] (pcale.tana [172.25.197.120])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC083.0000000065F5EA0F.000046D5; Sat, 16 Mar 2024 19:50:55 +0100
Message-ID: <c7e596ef-ab4a-42be-9e84-642f598e764a@tana.it>
Date: Sat, 16 Mar 2024 19:50:55 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cannot get the correct IP version from packet
Content-Language: en-US, it-IT
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
To: netfilter <netfilter@vger.kernel.org>
References: <10cebf27-05b8-4734-b429-689e8e14b44e@tana.it>
In-Reply-To: <10cebf27-05b8-4734-b429-689e8e14b44e@tana.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat 16/Mar/2024 19:11:58 +0100 Alessandro Vesely wrote:
> 
>      char *payload = mnl_attr_get_payload(attr[NFQA_PAYLOAD]);
>      if (payload)
>      {
>          int const af = (payload[0] & 0xf);

Heck, should be af = (payload[0] &0xf0)>>4 = 0x6

third time I change it...


Best
Ale

