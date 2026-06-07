Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414162AE8D
	for <netfilter@vger.kernel.org>; Sun,  7 Jun 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780837239; cv=none; b=QIReN3G+n+v6BfHrjzY2rlZrKwr7+NOSYHT0OywVr/KMnZ/o93fqkqibBoSPyTnvBjQ/HQcjBGMW/M914MMbxIHpkYYMEnLlDDRkkessO1/zV3IkyuVAqJYs8FhXN8H5AZWue2T71xzcSD9EJkIGi/LjzN2A+rjJ5Bzi12x3Ja4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780837239; c=relaxed/simple;
	bh=314nGnswBitsJ9SaX25y9gZWMpbvusGKF9y5kloYr9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jBFr2a6ZHQ1x4m8C3x8xqk+EyJWY9b9xbaiUy12hzAw+SVuO4lLZFOnv1+QSm+Hz6yA0Z63P7zTPvHzTF7zQjGY23F4hn227XqLilXhhYgaNOVPh5BicTKwxPV+P+ljQQlvDYpAo3x3UzJOXeSsCr/nOBlRCfVYbVcHcszUfgio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl; spf=pass smtp.mailfrom=yandex.pl; dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b=rPWS1K50; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b="rPWS1K50"
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:4c9f:0:640:5657:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id A178F80A03;
	Sun, 07 Jun 2026 15:53:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (smtp) with ESMTPSA id OrGFqwkg4qM0-FXvryCxi;
	Sun, 07 Jun 2026 15:53:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.pl; s=mail;
	t=1780836807; bh=oHEpM/JzKdREMhRqaz64Jt2ZdxdYZqZltLQc06ogZAM=;
	h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
	b=rPWS1K50kQ62CA9hpOC7bRdt8+PFFWFSRbYY62TWrwmT7XWMEkDgZIsVaSgmf9xJo
	 H9Vjr93xObaqxQMnFtIumfR2K4BnF/NB6AueTtHQJXhgSmqi777cTa4xOPTXJXfp9z
	 D9oBdsmY6moMuDHlVvxInXk9THBWxmuVkXXq3EKQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.pl
Message-ID: <0446c465-ce93-43f6-ac3d-c3a40ae6f854@yandex.pl>
Date: Sun, 7 Jun 2026 14:53:29 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] success of adding interval elements to map/set depends on
 order
To: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org
References: <287a4898-f45f-417a-8b00-a44801139ae2@yandex.pl>
 <c4723eac-8af9-4146-8375-c389b21fbd4d@app.fastmail.com>
Content-Language: en-US
From: Michal Soltys <msoltyspl@yandex.pl>
In-Reply-To: <c4723eac-8af9-4146-8375-c389b21fbd4d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/02 18:47, Kerin Millar wrote:
> Hi Michal,
> 
>>
>> But if we swap the order of those two elements so the more narrow one is 
>> present earlier, the rules will load successfully. Same applies for 
>> manual adding via "nft add element". And same happens if it was a 
>> regular set instead of a map.
> 
> Given the absence of the auto-merge flag, overlapping elements are supposed to be rejected. The consistent behaviour would be to reject both orderings. That these rules can ever be loaded successfully is an unequivocal bug.

Yea, and auto-merge would make no sense in context of a map (for the 
record I did try that, but nft rightly complained it's not supported).

> 
> Speaking of which, there have been various bugs concerning sets and maps over the years. If I may ask, which version of Linux and nftables are you using?
> 

1.1.6 (on arch) as well as the older version shipped with debian13 
(think it was 1.1.3).
