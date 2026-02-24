Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5FE1F1304
	for <netfilter@vger.kernel.org>; Tue, 24 Feb 2026 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949739; cv=none; b=PHjrEDnMKQzMHhxoANfDVeMPpbtU54KvlSDQ5leBVH/ZJQD+EcCBTPkEHvgOW8Ej/Ud/XXmmGJYiKQQs/I0re2q4D6C6JeTCVw4o+AuQg40oRJxXltt+6QMC0mTaMSyyQ7Elg+WfHhdsFxCf6ncG+Ihjx0ReFpuWoOign2hI96c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949739; c=relaxed/simple;
	bh=Tw6TG6YF/S6rkY6PGZ5XL0u3U7Pkp65IQIi1XGBGJdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofVlmZfJIs8y3492vzTHKOVF2tYGLAUrJsCkzpxk5TzWZzGKjlMkdwaF9I+arQXAIJiXhr1lWiSV3vvvKqzj5IinIsR698cYuOnpGTfeoWQpZQkm3sVhUX/PXGOJlRKaAaJXPYHXV9ZqykBSrIIvsIRnpjOnU0lQgu+EH9LugM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl; spf=pass smtp.mailfrom=yandex.pl; dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b=vomFDLMy; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b="vomFDLMy"
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:4702:0:640:9195:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 77E6483884;
	Tue, 24 Feb 2026 19:08:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 48jcVieGvGk0-YlarzZkx;
	Tue, 24 Feb 2026 19:08:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.pl; s=mail;
	t=1771949285; bh=y68f6hvNKqT2CNeUzitNmt+z+SoR8+BMMJSU2bOhowI=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=vomFDLMyzVmienfcIJHpMSnFiOrU+KYWsbVlyywHYegbooacJtLkyyzyzpqYtCiJ+
	 //FMv02+LICejMAvyiHU/m2LIrl6qB36do1tkYcsjd/3UhtvvdvoV/NncbbLReUN7N
	 mgTTF2Tl3dDiPsL2KeCJYl1gl9y6liLCmGMs4/R4=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.pl
Message-ID: <f92a902c-88a7-4bde-9359-a8f5583647ba@yandex.pl>
Date: Tue, 24 Feb 2026 17:08:04 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] "ether type ip" forgotten/implied when listing rules for
 'netdev' family
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
References: <6dbbb6b3-da22-4a09-8de7-ec2dc60d179f@yandex.pl>
 <aZypV4D7kP0lMwXx@strlen.de>
From: Michal Soltys <msoltyspl@yandex.pl>
Content-Language: en-US-large
In-Reply-To: <aZypV4D7kP0lMwXx@strlen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/26 8:24 PM, Florian Westphal wrote:
> Michal Soltys <msoltyspl@yandex.pl> wrote:
>> While testing the behavior of early filtering in netdev / ingress, I
>> noticed something that possibly looks like a bug.
> 
> Yes, this is a bug, both in nftables and in the tests/py/netdev
> directory, at least one of the existing files needs to be expanded
> to trigger this bug for regression testing.
> 
> Not sure if I can get to it this week but I will put it on my todo list
> in case noone else can pick this up.

For the record, this also happens with constructs such as:

nft add rule netdev efil edev ether type vlan meta protocol ip6 tcp 
dport 12345 counter

or

nft add rule netdev efil edev ether type vlan meta protocol ip tcp dport 
12345 counter

So if we e.g. wanted to catch a vlan packet with some specific payload. 
This will be simplified (during nft list ruleset) to just:

meta protocol ip6 tcp dport 12345 counter packets 0 bytes 0
meta protocol ip tcp dport 12345 counter packets 0 bytes 0

The rules will function correctly if added via add rule, but will 
analogously ignore the payload after reloading via -f

I'll add that variation to the bug report as well.
