Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68132D879E
	for <netfilter@vger.kernel.org>; Thu, 26 Feb 2026 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110195; cv=none; b=djW9iUnZODqcpvap8ik0R9++9NOZOBoeQqOiDOXazO0ntVlZrMla931BdKelsv2uY29c4FhCWDH7eYzWFXr67LOiMASre+tSMRWJ08vcoZG1p34ta6Z9ygUxt3ZgKObQ+poUoPXa9J50OXR1mi06R2DPvDR06cqabDVKb3etypg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110195; c=relaxed/simple;
	bh=LeuJq7Za0VB4M6Preelx5Mo6gUBP6P4gdhhjME2ZOSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SU2dm5reZHt3uQwDOOlQP80S7zstLRPrYUa8dVBlxaF4E0OsBBHUOFnlSmw/bgoXnDkQwJloLg7FPXP4lub8cKMwoCyGLHwsNPJkNj73H3st8i86VoDF0oUI6lsmvSL+dKn7A7nXTQ6nGtuFd2KKTrigSVCTdrpa4DDAR3G2W9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl; spf=pass smtp.mailfrom=yandex.pl; dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b=IoFMCxQs; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b="IoFMCxQs"
Received: from mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:942:0:640:e3c0:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id 69444C00E7;
	Thu, 26 Feb 2026 15:49:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id enh3jq0GFuQ0-zcXexZA7;
	Thu, 26 Feb 2026 15:49:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.pl; s=mail;
	t=1772110182; bh=xTGwyGCeHl9bob+eYLNudVvJU3ta39pSmFed4zPi2dM=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=IoFMCxQstagDmDyIk2zYEMU7GuDXsMN8mMKVk4f5Bo8zX0gpKafOx4WRsVYNmrNBM
	 K4BVZcTRZKgzZYgucjNqSQiazmfThY9p4X43gRIuFk9+m5xVQxuOtdEpHxLQ5/MeBm
	 2TM8bCBjgbtL+/SIw2J6KOCjOT3CnqsoCF9xnnz8=
Authentication-Results: mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.pl
Message-ID: <4e9371c0-0a79-47e9-b70a-488dddca5131@yandex.pl>
Date: Thu, 26 Feb 2026 13:49:40 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] "ether type ip" forgotten/implied when listing rules for
 'netdev' family
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, Florian Westphal <fw@strlen.de>
References: <6dbbb6b3-da22-4a09-8de7-ec2dc60d179f@yandex.pl>
 <aZyl9JUreTr9Bw39@chamomile>
From: Michal Soltys <msoltyspl@yandex.pl>
Content-Language: en-US-large
In-Reply-To: <aZyl9JUreTr9Bw39@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/26 8:09 PM, Pablo Neira Ayuso wrote:
> Hi,
> 
> Would you file a bug to netfilter's bugzilla so it is possible to
> follow track of this issue?
> 
> Thanks.

Done.
https://bugzilla.netfilter.org/show_bug.cgi?id=1831
