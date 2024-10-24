Received: from mail.thelounge.net (mail.thelounge.net [91.118.73.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF32189B97
	for <netfilter@vger.kernel.org>; Thu, 24 Oct 2024 07:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.118.73.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754072; cv=none; b=ucbUP7xp9M+dUuGtjXD6NIGuxVmABOQgsCkXAdDA9ovqbl6nEaXrFuyBKxhDZ02xnDcW1Cngzbf9dal8CV/umeexT4IjVc1udLpZskWawW0t98PZIOYY33nlFFv3J9ioBCoqzLSAROl8aRaDTAeIhT+wKJV0ztW/vOI4QCllrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754072; c=relaxed/simple;
	bh=TiohGv5sUfQPDxWXis+RqOIi6NamImgSXMDMC8Ei7F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Eze8I/XiEB5C+jt3ReI1ER6VOJwDCMXSHRV67xRw2ZAvsQ2QjM90WEt+s+GVdecApo1/okV1UCANlzEjTGSem0EvpGOxl188NZuxrwZb5Tah1oRAwWCMnHFSrBLy3aElHYNxsNyE5ehKM03Ob4DA0Hd5ZbAzJciBoquuS/KRsdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net; spf=pass smtp.mailfrom=thelounge.net; arc=none smtp.client-ip=91.118.73.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thelounge.net
Received: from [10.10.10.2] (rh.vpn.thelounge.net [10.10.10.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: h.reindl@thelounge.net)
	by mail.thelounge.net (THELOUNGE MTA) with ESMTPSA id 4XYxx63XXMzXLL;
	Thu, 24 Oct 2024 09:14:18 +0200 (CEST)
Message-ID: <a5d98b7d-1166-4b44-a98c-1721de8724f5@thelounge.net>
Date: Thu, 24 Oct 2024 09:14:18 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: location of conntrack rules
Content-Language: en-US
To: Matt Zagrabelny <mzagrabe@d.umn.edu>,
 netfilter <netfilter@vger.kernel.org>
References: <CAOLfK3UqOC6Mm+R+N9cQRPg_LvQzRfsRb-nRNRjFc4HR6vmV-A@mail.gmail.com>
From: Reindl Harald <h.reindl@thelounge.net>
Autocrypt: addr=h.reindl@thelounge.net; keydata=
 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
 K4rYsjPimkSIVdrNM//wVKdCTbO+
Organization: the lounge interactive design
In-Reply-To: <CAOLfK3UqOC6Mm+R+N9cQRPg_LvQzRfsRb-nRNRjFc4HR6vmV-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 24.10.24 um 00:10 schrieb Matt Zagrabelny:
> Greetings,
> 
> I have, what could be, a simple question.
> 
> Do folks put their connection tracking rules near the top (earlier
> rule) of their ruleset, or near the bottom (later rule)?
> 
> I used to believe that it "made sense" to have the conntrack rules
> earlier in the rule set, because the packets would be
> related/established and wouldn't need to hit the other rules
> unnecessarily.
> 
> However, the conntrack requires more kernel memory to track the
> packets. Therefore if every connection is tracked, then that would
> drive up the memory required for having the conntrack track every
> connection/packet - thus possibly exhausting the memory and not
> allowing other packets through.
completly irrelevant

the conntrack happens no matter where your rules are long before
