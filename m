Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [65.21.140.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE1171A1
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 20:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.140.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713385576; cv=none; b=QTTj+zYzjJpefcRkE+LUCt3uiYCNPPlBC4p4tBT6nQ8Wo1TP2xF77E1szVc955vxjm168TZoQsQzZDnNedC51REHfPCMUVK7K7GuAYprLc/Zh5iw5X16JSbkgwhFQ1+rVVVaJXd4diXQ3ZQaUInHHU9DcHsINHPnDCcAECuqfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713385576; c=relaxed/simple;
	bh=8Cc4z3nyEAStyBVsJVh9BDniExrpifQgwiFqNlE4rCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O8nM4zGnq87sKdQgtPIyVtQVCHAIhexBqaqxZHqowgE2m3mkgtMoK6qKGWwSoWF3HDAAnDAdh6/oyOlXK4Zkqx0Y+ZdPxJgB5qIVvouzCAKmD74+txS47A8VsAgMrUN9Q9baRjlnEBaKsTr8r/tUAjyNc8O6loQA/tgFHV8f8Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch; spf=pass smtp.mailfrom=at.encryp.ch; dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b=a2EEjAdw; arc=none smtp.client-ip=65.21.140.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="a2EEjAdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1713385572; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7TlIMF9GZGnwxz2xG9f1f3Vj8cYn5x6e1h0filPevM=;
	b=a2EEjAdwWQgKyXYdDiMF1jvzQ9yR6hsf7UAJRILGV6hX78b7FRX0Ht5FZYbSw48aLquLC6
	dY/dBAeVWjVCGEa7QKNzUikkGe5KQmSJP4k6BI8LHOunfmkFIBTe7F8rF88II/sGkdgMyQ
	sh41Es8E5zHWPrtM0vxHRl8HjjBNRZU=
Message-ID: <7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
Date: Wed, 17 Apr 2024 20:25:51 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: DoS/DDoS protection for end nodes
To: netfilter@vger.kernel.org
References: <20240417194340.20430839@localhost>
From: Serg <lists@at.encryp.ch>
In-Reply-To: <20240417194340.20430839@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Your question is too broad, but in case of protecting from DDoS over WAN, nftables is not suitable simply because attacker can easily overwhelm your uplink. However, for high-performance scenarios, XDP is a better alternative to nftables.

For LAN, I suppose rate-limit using nftables is sufficient to handle DoS (if you have untrusted devices in your network). I can't imagine of any DDoS scenario in LAN though.

On 4/17/24 19:43, William N. wrote:
> Hi,
> 
> I have been searching and reading, and reading... I understand this is
> a huge and complex subject, especially for a non-expert. I read earlier
> discussions on this ML - some answers seem to say it is futile (i.e.
> something that should be done by the ISPs, not by the end clients),
> others suggest there is benefit in doing at least what is possible. So,
> I hope to have some things clarified by the experts here.
> 
> XY: I am trying to do what is right for the network security of a SOHO
> LAN. The nodes are distrusted, i.e. there is no assumption that they
> are/will always be "clean" just because they are on the LAN.
> 
> My questions:
> 
> 1. Is there a point to attempt DoS/DDoS protection directly on the LAN
> nodes (Linux based)?
> 
> 2. What is the right approach (using nftables)?
> 
