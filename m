Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [65.21.140.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0992E12F59E
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 16:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.140.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713542787; cv=none; b=dqK2cc5AwMdFQPkAbXSlruHpKxn9zmA0pibJ+hzCzqigqZRJkA6o4r3Jjp29spemLISQAV2ELoaJWsdBrmXx20THN+H9VI9EA5DzBEPOy1nHwdN+Yqk0W/GrQrYDg8We7IIgaLTB3G8BQZ5ny+OSktJqEbziPV3iW6JoeMhm4CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713542787; c=relaxed/simple;
	bh=qtMTZ0tJak0piArwxCs/NJ/qmTBKFXOYLHCTvRANt1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RvtAJjW8KDOpjKku+nH/rYCOP8FnDtJZLdeR8Erx7ZUTw6g0wdKslzyAQ8Nl3tdk8LYoiIumlCEnReOlTm7ZnuI3025LpwV40BFLfPoBLxcaSLkokenrd8spVRhCkN0Ybnf2A9JRC6aI1EwSbQAwYJ9AnodYTzmpAQEXAZQ8vc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch; spf=pass smtp.mailfrom=at.encryp.ch; dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b=h97x/QVX; arc=none smtp.client-ip=65.21.140.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="h97x/QVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1713542778; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsodzTEUiAjwEvop4EkiTLfRcG7vxlUzNs86Y/Lkfcw=;
	b=h97x/QVXPDMQNF7GyKZRueZehKHHVT8LWxbYv1SQYKTBM8JbByqoInqhw9c88qZHFZdGF6
	3Yppr9PmU8zSExK/Rcj6MHUhfMjjPHXsc9Y1tMabD7fKk4uRJHxmGpScYDspIwjpmPLWkW
	bYsTDDqGF0hOtxuEMMcQQz48QzYlIQM=
Message-ID: <7370616d-997afb3d-332c-4a26-afe9-e2a7c4e80c19-at.encryp.ch-74726170@at.encryp.ch>
Date: Fri, 19 Apr 2024 16:06:14 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: How to measure/profile ruleset performance?
To: netfilter@vger.kernel.org
References: <20240419160232.4caca594@localhost>
From: Serhii <lists@at.encryp.ch>
In-Reply-To: <20240419160232.4caca594@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

iperf3 checks only link throughput. To evaluate firewall performance you would need to generate high packet rate.

On 4/19/24 16:02, William N. wrote:
> Hi,
> 
> How can I measure the performance of particular nftables
> rules/chains/tables with idea to optimize the bottlenecks?
> 
> Currently, I am trying to do this by commenting/uncommenting sections
> of the ruleset and running iperf3. However, this seems quite
> inaccurate, inconsistent and time-consuming.
> 

-- 
Send unsolicited bulk mail to carle34@at.encryp.ch
