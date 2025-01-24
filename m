Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA027726
	for <netfilter@vger.kernel.org>; Fri, 24 Jan 2025 19:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737745659; cv=none; b=hzzVhIRuZeawLTCarBAVIYaRGQaWx5bzfN28ayAJ1jKKXXbQhWiOXOb+ysf3XPeWPNcxwy1spDdILy26ZryE/G+GNomQ5XPFQYrVGFS8vD8iPqxPw3WzOLIPiCAdauJSiGQm8klhUtI20Q3WNgjrmHLPtN8kFmk7l58oTv3cG9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737745659; c=relaxed/simple;
	bh=MYuvBMkMsl552WdX2qYgWwlvqjCW0mRDLsNFzj1qxZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pXg/x9i30LSU2xeJ5u68oTCePNzyPBY/utvwE0aXk+RFMu91N+58Gzk8tnXA+h/trmngv7i4FitRs5UF5+4pJkO2bn1+EMWFn4hB5tBOgnseGYodkxs4ML5gqnZcc1oo7DKUIemgBwI65ryORt5q7w61jbhEWjL9jTkVfi1AaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=Cs6+7hHL; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="Cs6+7hHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1737745340; bh=98mJpveENIX0Z1WFz7Nz/h1YwGf7nxE02VKKyrhGMgI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Cs6+7hHLpE/+rgwM9/zRrqZDrU98A/ry+yYbuB6LiJOME1fF0AYTyir2DTMiNyB90
	 Ivd5iphdqhnwupH+x6VQfST9x/GffbNjuN65Q0Xx8N8rI8T7urm4XJELP6XxcBCkpY
	 xWKy2lKX/fIWaGW9Bxd4bcp048RTDKcjBQLzuZJbCizbHA1JJ5LepeMZx+qXB
Original-Subject: Re: aggressive firewalling via nftables
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.120] (pcale.tana [::ffff:172.25.197.120])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC05A.000000006793E3BB.000054D5; Fri, 24 Jan 2025 20:02:19 +0100
Message-ID: <19fa6c75-ee8a-4614-b71d-7272c37374e1@tana.it>
Date: Fri, 24 Jan 2025 20:02:19 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: aggressive firewalling via nftables
To: potatojuggler@gmx.net, netfilter@vger.kernel.org
References: <trinity-8c3627be-7f9f-4150-a74a-5a69dbd8781a-1736180864807@trinity-msg-rest-gmx-gmx-live-548599f845-9tnlq>
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
Content-Language: en-US, it-IT
In-Reply-To: <trinity-8c3627be-7f9f-4150-a74a-5a69dbd8781a-1736180864807@trinity-msg-rest-gmx-gmx-live-548599f845-9tnlq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Mon 06/Jan/2025 17:27:44 +0100 potatojuggler wrote:
> /etc/nftables.d/limit-rate.nft
> Contains a set to limit the number of new connections per IP per minute.

I'm still using iptables.  It has a handy module named hashlimit.  It takes 
stuff like the following example:

iptables -A connserver -m hashlimit \
	--hashlimit-name firewall \
	--hashlimit-mode srcip \
	--hashlimit-srcmask 32 \
	--hashlimit-upto 500/hour \
	--hashlimit-burst 100 \
	--hashlimit-htable-size 16384 \
	--hashlimit-htable-max 65536 \
	--hashlimit-htable-expire 60000 \
	--hashlimit-htable-gcinterval 2000 \
	-j NFQUEUE

Isn't it available with nft?

Best
Ale
-- 
(sorry for being late...)






