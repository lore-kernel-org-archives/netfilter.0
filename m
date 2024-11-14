Received: from outbound5i.eu.mailhop.org (outbound5i.eu.mailhop.org [35.156.234.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8191C32
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.156.234.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731592972; cv=none; b=CBTAyxbyIzEahyDrILdgu91UENxoYPTNYyfDqvXJCjdQQ/84UJYiHYMEEHxsZZsQn5RoH6BMbauDgg7w9/WpkliJGIBbCnzh5ewg8e9vUOT0MLUIrULwqob+y0OV0Dk5q5+Hwzf/wipQCCzIRRJ8OjOVcDQGkaCSRrruy9PMwes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731592972; c=relaxed/simple;
	bh=CBiW526Rt73bVQ7OSluhUIC7Y3JmPnSbbur+KOtc2uE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=WJxPeolKYboIQ23czdJEDt8UTzHxgyQDIyvzYyCd7wq6I+H1orHryRS4+/CoAgbx/xp3dblbIY9I5ElYoVkVTJq9i7n33wUuKBftRewCbgIS01X0lh5LzH1X/Z4+GgdvfLWnS9cKvWO4Z/O5zfG7Lmp38KGUEVbft48sf4QxMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org; spf=none smtp.mailfrom=koeller.dyndns.org; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=KVjgfovV; arc=none smtp.client-ip=35.156.234.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="KVjgfovV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
	 message-id:from;
	bh=xVhDAKbpPycTQcQ3UC2EeHMN4wv67ADYm2I1K1l71wU=;
	b=KVjgfovVaIA32VikhOBdFXvFecQil/MwgodrweGV2pANTLixKm8RLCxAmAx8jJtAkTefycACgrcYw
	 pqmtt6SZZzeAlX5GAQ9+QJUc7lHjCckcJShOy9pln9cSfEfRf+lHMMwRFikDllsteezPH4a2udznM/
	 mhZ1VPPOeMl+1BwYQv5l0BvX2RW1jSGCaq9E3KzzBKXfeGifaajToDRjUX9jgR6awZXkJusJeD73o8
	 618T18q3wJZpbf1Vt9SlBwuESf+9jBSYhesOYyYVyl13rEZjVjRhc5Os+IB1YiqNZaq2/ObuLb1TYS
	 3O+t5HpB3R8Ro4XSAOb1HdSpiA9BAeQ==
X-MHO-RoutePath: dGtvZWxsZXI=
X-MHO-User: 1d107aa8-a291-11ef-a024-7b4c7e2b9385
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.koeller.dyndns.org (ip1f123f5c.dynamic.kabel-deutschland.de [31.18.63.92])
	by outbound2.eu.mailhop.org (Halon) with ESMTPSA
	id 1d107aa8-a291-11ef-a024-7b4c7e2b9385;
	Thu, 14 Nov 2024 14:02:41 +0000 (UTC)
Received: from [IPV6:fd46:1ffa:d8e0::1] (sarkovy.koeller.dyndns.org [IPv6:fd46:1ffa:d8e0::1])
	by mail.koeller.dyndns.org (Postfix) with ESMTPSA id 4F38C969A57
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 14:53:04 +0100 (CET)
Message-ID: <209ce99a-9f22-444d-bd75-8b38865aea3b@koeller.dyndns.org>
Date: Thu, 14 Nov 2024 14:53:04 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US
From: =?UTF-8?Q?Thomas_K=C3=B6ller?= <thomas@koeller.dyndns.org>
Subject: Adding set elements
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

What exactly happens if an attempt is made to add another element to a 
set that is already full? I ran into this condition and found that a 
subsequent 'nft list ruleset' would display the set with no contained 
elements at all.

I think that a reasonable way to handle this case would be to apply sume 
LRU strategy to free up a slot, but that is apparently not the case?

Thomas

