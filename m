Received: from hh1.woollysoft.com (hh1.woollysoft.com [5.78.101.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7F770020
	for <netfilter@vger.kernel.org>; Wed, 28 Feb 2024 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.101.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709156119; cv=none; b=p9bnLdsaRkllN5/AwYtvy3OmbVVURB9pKUJidaRRRa6/xP/kr6/SKxtunD4NjatBRr21bW/tOD3JobsGDGvfDz9vPpl1I27x/jxcQcRCpuZWduLChpqVKxGfvluLjmq+AgrF38UTHw6QZY3BD/ceUCQhAPIksrLic9po+6RZv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709156119; c=relaxed/simple;
	bh=BDYRBqoVaUm0DlCA+sDjdv7VgCc0XyFlTwrr89vLNDs=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:
	 In-Reply-To:Content-Type; b=HkWEbRFxrg/bVvnmHrRDAa3fl7wqwmaLMVuqQBRGgQq56r6a6jvAHKN6Y3zdMdK1B1dcfF4335L27c3hHcBFc6WjXXeab2iTzylw5eh/tXB8Z0TWLmIjyG9E+MTWxBIzm7R7MJA1FDmmL5NXKljaYZCadSU8no75ORK3rwKwHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=woollysoft.com; spf=pass smtp.mailfrom=woollysoft.com; dkim=pass (2048-bit key) header.d=woollysoft.com header.i=@woollysoft.com header.b=UcBnzG8G; arc=none smtp.client-ip=5.78.101.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=woollysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=woollysoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=woollysoft.com header.i=@woollysoft.com header.b="UcBnzG8G"
Received: from hh1.woollysoft.com (localhost.localdomain [127.0.0.1])
	by hh1.woollysoft.com (Proxmox) with ESMTP id 7743C2145E
	for <netfilter@vger.kernel.org>; Wed, 28 Feb 2024 13:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=woollysoft.com;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=hh2311; bh=Njej515vzAG0976jUW
	WoLFsZRdwaEKNWHQp+HavSNz4=; b=UcBnzG8GSSpOFmt0EHZkExxITJucolcoaZ
	u7qMyNjbvjxbyjSOe2I1D/cSFavmJnepe+iUl9hFwrtcRYWZLwn0oeOpi/691bn7
	m5TQCPdHsSznHA6wvWvqvSEK2M6Iqgce2nehdXS1m6zWk1LhlThkdIf3lDwC3MYm
	skUo+Ojm2UzEMLRi7ChsEHYAphJ9KQu/roiUdZli7P+JWFm9gvpIkVQloJ/ZhoBL
	9x0Z2paOdECYAIdqq0lqpEL+m+MwmQJapYCR8mGoSBP+/UjKtRCr37zI0MFlO9g7
	ZE5f7IoNMxLzzdTZzVK0OApucCtiS36hePPIoPwaLW35lD0YBlGA==
Received: from moe.woollysoft.com (unknown [192.168.10.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hh1.woollysoft.com (Proxmox) with ESMTPS id 5B45E208E0
	for <netfilter@vger.kernel.org>; Wed, 28 Feb 2024 13:35:17 -0800 (PST)
Received: from [192.168.8.45] (port=62496)
	by moe.woollysoft.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <elf@woollysoft.com>)
	id 1rfRa8-001vZk-QB
	for netfilter@vger.kernel.org; Wed, 28 Feb 2024 13:35:16 -0800
Message-ID: <47a7ba26-96c0-43f4-9fdc-d780826787ac@woollysoft.com>
Date: Wed, 28 Feb 2024 13:35:16 -0800
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: Knocking example may not work?
Content-Language: en-US
References: <016b3e39-d379-4c70-afd9-80de3ede473d@woollysoft.com>
From: Marc Singer <elf@woollysoft.com>
To: netfilter@vger.kernel.org
In-Reply-To: <016b3e39-d379-4c70-afd9-80de3ede473d@woollysoft.com>
X-Forwarded-Message-Id: <016b3e39-d379-4c70-afd9-80de3ede473d@woollysoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Greetings,

I've been investigating the use of port knocking to activate remote 
access.  Once of the examples uses the form:

set  update ip saddr timeout 0s @Knocked_1

Yet I believe this doesn't do what the author intended.  When I dump 
this ruleset, the timeout parameter isn't set.  The behavior of the 
rule, too, is to do nothing as far as I can tell.  Certainly, the 
timeout isn't changed.

Cheers

-- 
/Marc Oscar Singer/
*Woollysoft*
+1.206.328.1718

