Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net [23.83.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E21127E18
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731597178; cv=pass; b=PWJVFWsvP+xmKI1au7Ak5iLmjCwDja6HrkCAc1GG9x0DE5IMmD9Xyf8eJvsCdsdNxwSJicLEmw7yg3Bka4Tsm3CNB4wYExz0anhg+x4VjKSDYQNNCMf5anzxnZ2H1XtqXCCgCAGl6K7wDkEC9vogttYe/cA9nQcgfaCD5bcOIAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731597178; c=relaxed/simple;
	bh=XDie6N2GHISH4AL4j9aPLQK954Nw94rXKPy9vINMn6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j3C3qsqR8ERNdiIPdpQ9F5AzJejjkAMOuqXC0c6FvuA9r+KiUXfBgNuMaQyDBgxnxkw7xf9ZIiPhIjcVRCOQ7me4TGo/l6wtVSe1FQN6FApsun4npZpPtiNrxSDw45n5YHIEAKk735QStqNUapxU/WIRGRgllPHmkVHpxqGGYM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=street-artists.org; spf=pass smtp.mailfrom=street-artists.org; dkim=pass (2048-bit key) header.d=street-artists.org header.i=@street-artists.org header.b=kmfodQ/z; arc=pass smtp.client-ip=23.83.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=street-artists.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=street-artists.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=street-artists.org header.i=@street-artists.org header.b="kmfodQ/z"
X-Sender-Id: dreamhost|x-authsender|dlakelan@endpointcomputing.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7FF9E461E4;
	Thu, 14 Nov 2024 15:06:17 +0000 (UTC)
Received: from pdx1-sub0-mail-a294.dreamhost.com (trex-11.trex.outbound.svc.cluster.local [100.111.99.11])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 18DCE44D26;
	Thu, 14 Nov 2024 15:06:17 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1731596777; a=rsa-sha256;
	cv=none;
	b=VQbonYG4DDJoSb7tRLFkpVXQNarjsPd1A/F3/Lz0vOu6hrueSrox+ZIB659OEOvuoFzt+A
	pPjuKnegI9gnQ4o5SCI3WF0L7Kq2CegaLQdF6f3d12f6VtgzoLrHb6Y3ErMmKDS6Cfzjcp
	hZK2+af+wVv5RypL3ceptIxzPEHi1vdaRKpDTt0nRB+fHYwG075wPchlmoTDoDp1/jhfws
	w7l+4j9Z408/HPNrRKSDmj9IFDdHqlLZVx3wuKPKu+Tp+zbjLbVbS5AnpLdyRTXAosYalF
	uOOBKmp1tyv0OV4y4DzB5xWMe5P2RANOYjWZyMJcozbIE5DZigAUBCyI0aovwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1731596777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=nmyz5JlYH+pxhdBE6VTBYtg4Cluhwb478gdw0hyy71c=;
	b=0KUK/5ompVf7guRHaMbeNvl670ixGZV2mv7MpDUj5qperl8W9pzcFNxdKL9AT+iHUfBwUN
	qP6v0Kixkkp75xmvbMazmJjESuEa+U/rzOhI8laKoOw9y29VWxgohTyF9bvfh97Vjb2GwJ
	J+tK3EULsiW0qJi9MiRIUQs1oOu/hrI+IySrBjD8FMeN0geT9BKf5gR0KWzeyp4LT+6V14
	x4Znfnd88aLvfzpDIGm7Z3hwzldk/OTK6kGd6pHAh5nsMRP7F1qWD9tlckI2DDgw0a2CY1
	WovqC/OnOu5TRcDli8TZIIyzKrCYI4Dkrl6x8+0qrtAQIr93aR1WJ7zqXLczrg==
ARC-Authentication-Results: i=1;
	rspamd-645676964-rggkn;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dlakelan@street-artists.org
X-Sender-Id: dreamhost|x-authsender|dlakelan@endpointcomputing.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dlakelan@endpointcomputing.com
X-MailChannels-Auth-Id: dreamhost
X-Bottle-Befitting: 0493c79908d0bb00_1731596777338_1196631968
X-MC-Loop-Signature: 1731596777337:2529017416
X-MC-Ingress-Time: 1731596777337
Received: from pdx1-sub0-mail-a294.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.99.11 (trex/7.0.2);
	Thu, 14 Nov 2024 15:06:17 +0000
Received: from [10.79.1.187] (23-114-244-112.lightspeed.irvnca.sbcglobal.net [23.114.244.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlakelan@endpointcomputing.com)
	by pdx1-sub0-mail-a294.dreamhost.com (Postfix) with ESMTPSA id 4Xq3Q06HQ0zRK;
	Thu, 14 Nov 2024 07:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=street-artists.org;
	s=dreamhost; t=1731596776;
	bh=nmyz5JlYH+pxhdBE6VTBYtg4Cluhwb478gdw0hyy71c=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=kmfodQ/zfqyrcuxfNK2cLBiZOq719OjAzTRFbkaCxxWvGoaxfwmz5RmSLG+PuNaF3
	 52nHW8U/5QvRzRreJduAe/zLMU3Kio2Lb08j0WzsC96b6ZvVKAuGp07mnbtXI5n2u8
	 zlFHyS0Vj+8weqQC6Q4Zgu1FRArpT6+lOXrxf0NLiyquNBxPEShObcSvr1ytTgMifZ
	 NxnVs/B5twPt6IRpb6uTHQSlziLJlafkwqaszCMqn3YJcNbw4stkP+iMoQmN6MtNDa
	 RMYIFWNUjXuibEfkUblhTVVqUsXhNy5iir5bDT3bw/FXVybZrxoLQDGXTxdgGE++QU
	 DbdD41sc5bpBw==
Message-ID: <04ebffd9-25e3-4dad-a0c8-503449366327@street-artists.org>
Date: Thu, 14 Nov 2024 07:06:16 -0800
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dropping of the end of a chain
To: =?UTF-8?Q?Thomas_K=C3=B6ller?= <thomas@koeller.dyndns.org>,
 netfilter@vger.kernel.org
References: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
Content-Language: en-US
From: Daniel Lakeland <dlakelan@street-artists.org>
In-Reply-To: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/14/24 6:01 AM, Thomas Köller wrote:
> The nft manpage states that if the end of a chain invoked via 'goto' 
> is reached without a verdict, 'evaluation will continue at the last 
> chain instead of the one containing the goto statement'. I cannot make 
> sense of this; what is the 'last chain'?
>
>

Pretty sure this means It will return to the chain that called goto (the 
last chain that was active)



