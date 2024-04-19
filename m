Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [65.21.140.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071937E11E
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.140.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713537075; cv=none; b=pHdkid6jkCoJQPng67niKrrJGcc6fp4ZbRkmsr6QUiiikSGMqa1FTsiRkcEWR0npqgIJwwE+EPQXbyVDBOsDx24xSmGgFTAHsv2cuNOv0ZmASuRaF3ysxtH1roPtb1N5f8s8esFVUjsiSaPDm+PIr2ik2Pdbu8pv1o6AuhvI6JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713537075; c=relaxed/simple;
	bh=1/uYGcE4vlb93dd3r5UPof13vtf/D8j0uSnD80OoHLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=urhklrSx/KRZuisx7XU6zwDrDvJEhD4RzqH6ZBLPCdXrSMucvWjnmd0NYTeIfTXZBVM+B0R9026coVuPqe7SL8FdN+R5IKp5/7V6yIsbkREpRAAhDKv33qgMeJZa4j3bADNpfamvYlpAhcGwjSBq+fOKk8P/+jPy66yi36zVIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch; spf=pass smtp.mailfrom=at.encryp.ch; dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b=aBajhHpW; arc=none smtp.client-ip=65.21.140.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="aBajhHpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1713537070; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+B8Ty/Et4qS4pY5vjLJaeDGEGnnoBRV/Od933Wpy604=;
	b=aBajhHpWFfHJ5sICWjtCJXbLEekw+yYyTz7OG+9eionHDeBwqje6DmkhRVyoEwZe2xlNit
	vjzKhF0rNv/VxEMi6Rag60jFYYIWSQtFDRBiMyeZib0QxTt+Jmjq/e/02NkgLXpoU0QtPJ
	lluJDGhwlj/4bxYDvqE16Lk+N+NsBwc=
Message-ID: <7370616d-5f0dbda5-f12d-46f4-a3c8-37b2762e57b7-at.encryp.ch-74726170@at.encryp.ch>
Date: Fri, 19 Apr 2024 14:31:05 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Combining/compacting 2 rules into 1
To: netfilter@vger.kernel.org
References: <20240416174748.5612bd27@localhost>
 <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
 <20240419105542.74aaac89@localhost>
 <7370616d-56c4511e-0a47-40c5-8f38-4d70a6aad4b1-at.encryp.ch-74726170@at.encryp.ch>
 <20240419125431.148d4270@localhost>
From: Serhii <lists@at.encryp.ch>
In-Reply-To: <20240419125431.148d4270@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Seems like it something not possible, unfortunately.

> Error: conflicting intervals specified
> add rule inet example example tcp flags vmap { 0x03 / 0x03 : drop, 0x05 / 0x05 : drop }
>                                                ^^^^^^^^^^^         ~~~~~~~~~~~

On 4/19/24 12:54, William N. wrote:
> On Fri, 19 Apr 2024 11:01:59 +0000 Serhii wrote:
> 
>> Have you tried vmap?
> 
> OK. I tried.
> Can't get the syntax right though. How do you do this?
> 

-- 
Send unsolicited bulk mail to carle34@at.encryp.ch
