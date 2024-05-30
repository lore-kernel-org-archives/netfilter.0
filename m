Received: from 0.smtp.remotehost.it (0.smtp.remotehost.it [213.190.28.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7118756A
	for <netfilter@vger.kernel.org>; Thu, 30 May 2024 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.190.28.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717102049; cv=none; b=b2Ls6Sr+VWmqpcSk6Q6RQDQqnwooqpMhtDes05hHUfH7rTSJ6lYz9p3DK/nM5zQEgxkHD6YzL+X7kvCyEkdhAPxcSkIXnSEOw/mSzesFJJL8P0R6t/yAz0afLcYa31aqiE97FsG9K3LGA72hocapTWBrUZc8GRJpMNH5YfRugHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717102049; c=relaxed/simple;
	bh=Ln4kpVaa+r3YP0K88GzPljoAuA3cw2idyv/G9v0HkXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nyKKjwlAE55Hf03GmZdXTrzaJQvU+9SaidpoSCAOFmo7tKtdZRq4C9quKuHoHTcgm2iNkv3eu3YpDmlv+56TRovaWpplOG7jX6I+ju8zFxvDz8gMGn7nsZ2ajDL9XHAQTHSn4ComvpYs0swLTfHlI+1uYTfkbIxyQFQDFq4g34Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardfalcon.net; spf=pass smtp.mailfrom=hardfalcon.net; dkim=permerror (0-bit key) header.d=hardfalcon.net header.i=@hardfalcon.net header.b=UHL19gyc; arc=none smtp.client-ip=213.190.28.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardfalcon.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardfalcon.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=hardfalcon.net header.i=@hardfalcon.net header.b="UHL19gyc"
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardfalcon.net;
	s=dkim_2024-02-03; t=1717102040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IB05Qh6iNtHiJr3rqvlTMAapchqLUd/Uuvn2KRfJkEk=;
	b=UHL19gycI//ni39Iuc0yeii3xQbU3ugEbBcWNJZUEJiZ2ytnWJXzXflUEEetmLm5ngejsI
	oa0pZnnAVQV6CbBg==
Message-ID: <009a5cd4-5b1b-4df4-9702-4c20f93c478f@hardfalcon.net>
Date: Thu, 30 May 2024 22:47:14 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Cant get "tcp dport 22 @ih,0,32 0x5353482d" to work/match
To: Valentijn Sessink <valentijn@sessink.nl>, Florian Westphal
 <fw@strlen.de>, netfilter@vger.kernel.org
References: <c2c52fe9-5ff1-4eb9-96e5-81e645e77b50@hardfalcon.net>
 <781b5fb2-1fbd-4e76-bb59-29ee3b530f73@sessink.nl>
Content-Language: en-US
From: Pascal Ernster <netfilter@hardfalcon.net>
In-Reply-To: <781b5fb2-1fbd-4e76-bb59-29ee3b530f73@sessink.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[2024-05-30 10:03] Florian Westphal:
> You cannot redirect once the first packet has been processed.
…
> Rule above accepts the packet with SSH string in the payload.
> 
>>> 		tcp dport 22 counter packets 1 bytes 80 log prefix "##### SSH DEBUG 3 ##### " flags all accept comment "allow SSH- via SSH port"
> 
> ... and this matches the initial SYN packet.


[2024-05-30 10:18] Valentijn Sessink:
> You're trying to match information that is not yet available.
> 
> The first tcp/dst 22 packet will not match any of your @ih packets, 
> because it's just a SYN without payload:
…
> ... but it *will* match this one:
> 
>>>         tcp dport 22 accept comment "allow ssh"
> 
> And afterwards, packets will be accepted based on the "ct state 
> established" rule at the beginning of your script and not hit any 
> further rules.
> 
> As your @ih information will only be available in an established 
> connection (i.e. packet number 3 or so), it will never be reached.
> 
> Also, as Florian says:
> - you cannot redirect a connection to another port once it has already 
> been established;
> - while at the same time, you cannot distinguish between SSH or HTTPS 
> without having an established connection.

Argh, you're right, I forgot about the SYN/ACK handshake. 🙈
Thanks a lot to both of you for the explanation! :)

I have found a way to use nginx to demultiplex SSH and TLS/HTTPS on the 
same port, and I'm even able to pass the original client IP using the 
PROXY protocol, but only for the TLS/HTTPS stuff.

The only detail left is figuring out how to pass the original client IP 
to OpenSSH, which doesn't support the PROXY protocol. Apparently, even 
that should be possible by using the "transparent" parameter with nginx' 
"proxy_bind" directive, but that's probably not a topic for the 
netfilter mailing list.


Regards
Pascal
