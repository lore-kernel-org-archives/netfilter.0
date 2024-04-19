Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [65.21.140.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D107F7CE
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.140.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713524535; cv=none; b=GdffXk7ZqAFIbR9S2pdxRfIOtC6FZazmx3Q8OCGGMoVkt4vkNIAMGUi5oDqrkwPNpyapbdIBltB2qaKTGsqqn5bYEt9/PvKkhbz3saQjwu8Kaaq+lStg7S6Ecec91pZwv4Z+EZJE1aS0QIO5evaZDT+gAcWufIa6SgzII7nFv80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713524535; c=relaxed/simple;
	bh=p9Gr2rQvTmhqTdMh/N4kGMam9pY5yjfH5PilQhg5sSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j1RB11qIpxMJSVfvxIAcdbQfU/E6vRIr5veVUIl0aNBQpgw+0rPXE/u4OVK+VK+A2aGoe9jYb1GHFcE5+jjYP6ikxbhL2BXEf8Pm1eNAYIyqyYeYC4A03BUhi3NL8buMJhIooEDnLf2RgZHTEY/wORn52q78kG8wszoYI0fXZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch; spf=pass smtp.mailfrom=at.encryp.ch; dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b=PeAUZD8z; arc=none smtp.client-ip=65.21.140.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="PeAUZD8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1713524524; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6eGi9XisM7QCuSmlI4trYoG3Sis/H24IbcRczTphQI=;
	b=PeAUZD8z9KznQohSD1icMNdEucUHCNDoCv8782rHvUx0H0A+Smo67donHljZifXlfkDcRa
	/n1SfhJ0ucL6FS9t1QWD2gVE8vTkE53oavL8kYIgxOBbHCoR7qJjFLU0BpFzLJiVtoxBUQ
	BIvZz4tUNbDsvQ30h+zi1GOTbSaHHKE=
Message-ID: <7370616d-56c4511e-0a47-40c5-8f38-4d70a6aad4b1-at.encryp.ch-74726170@at.encryp.ch>
Date: Fri, 19 Apr 2024 11:01:59 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Combining/compacting 2 rules into 1
To: netfilter@vger.kernel.org
References: <20240416174748.5612bd27@localhost>
 <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
 <20240419105542.74aaac89@localhost>
From: Serhii <lists@at.encryp.ch>
In-Reply-To: <20240419105542.74aaac89@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Have you tried vmap?

>    VMAP STATEMENT
>        The verdict map (vmap) statement works analogous to the map statement, but contains verdicts as values.
> 
>            expression vmap { VMAP_ELEMENTS }
> 
>            VMAP_ELEMENTS := VMAP_ELEMENT [, VMAP_ELEMENTS]
>            VMAP_ELEMENT  := key : verdict
> 
>        Using the vmap statement.
> 
>            # jump to different chains depending on layer 4 protocol type:
>            nft add rule ip filter input ip protocol vmap { tcp : jump tcp-chain, udp : jump udp-chain , icmp : jump icmp-chain }


On 4/19/24 10:55, William N. wrote:
> Is it possible to combine, e.g.:
> 
> tcp flags fin,syn / fin,syn drop
> tcp flags syn,rst / syn,rst drop
> tcp flags fin,rst / fin,rst drop
> tcp flags fin / fin,ack drop
> 
> into something like:
> 
> tcp flags {
> 	fin,syn / fin,syn,
> 	syn,rst / syn,rst,
> 	fin,rst / fin,rst,
> 	fin / fin,ack
> 	} drop
> 
> just using some correct syntax?
> 

-- 
Send unsolicited bulk mail to carle34@at.encryp.ch
