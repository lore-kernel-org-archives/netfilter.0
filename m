Received: from filter.openoffice.nl (filter.openoffice.nl [144.76.204.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E408152180
	for <netfilter@vger.kernel.org>; Thu, 30 May 2024 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.204.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717057573; cv=none; b=u08SR8edJ36pZyKV+Sb+nch/iEsgrYALxth/LFjVj6/hYXzqKstJlEpFw/grIq2ww7Q6ofe/u1yAb2VncdG1khizo5h22f0JJVDUoKw/2LhGX/XydMGzFZVf0HlP2QSHr3bpI3Go/Nurz4FgyS1LMLlolHeIcbR5zLTMpauCbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717057573; c=relaxed/simple;
	bh=m5ulkWtt+/F47bFy5ZqKy0HvYCDUMLdPHyImuryYf9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pXYfG7h5rbtbqNDwRt+2SbCNzSefnGqVheC0c34TOExRiS69TFFNMKHkv8auRqXkT8L7DiVycD4HHUlI+5FOZ6mkMFlpbknLyUjgcVs07Q/yRkjn31Hbl0KfOuo0po+gzuyqDqRrDxgvMHZdaET+otrB7tDj3JWx8FBymw/wSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sessink.nl; spf=pass smtp.mailfrom=sessink.nl; dkim=pass (1024-bit key) header.d=sessink.nl header.i=@sessink.nl header.b=abkX7Uci; arc=none smtp.client-ip=144.76.204.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sessink.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sessink.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sessink.nl header.i=@sessink.nl header.b="abkX7Uci"
Received: from localhost (localhost [127.0.0.1])
	by filter.openoffice.nl (Postfix) with ESMTP id 5A798100438;
	Thu, 30 May 2024 10:18:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at filter.openoffice.nl
Received: from filter.openoffice.nl ([IPv6:::1])
	by localhost (filter.openoffice.nl [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id 4AaYdVCVz3Rj; Thu, 30 May 2024 10:18:56 +0200 (CEST)
Received: from blub.net (mail.blub.net [95.217.39.243])
	by filter.openoffice.nl (Postfix) with ESMTP id 251D910032F;
	Thu, 30 May 2024 10:18:56 +0200 (CEST)
Received: from [IPV6:2a02:a46d:bbe9:0:647c:da8f:c2d3:5233] (2a02-a46d-bbe9-0-647c-da8f-c2d3-5233.fixed6.kpn.net [IPv6:2a02:a46d:bbe9:0:647c:da8f:c2d3:5233])
	by blub.net (Postfix) with ESMTPSA id E2A7A3001C2;
	Thu, 30 May 2024 10:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sessink.nl; s=201802;
	t=1717057136; bh=m5ulkWtt+/F47bFy5ZqKy0HvYCDUMLdPHyImuryYf9Q=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=abkX7UciajqZzoGkVJIuXHWuSmy2wrokdMKxSg4lHgmIB1n6ZUrC7f0U4zlRxKmBY
	 AddzTiw3gz3Iohhl9R9yu1DeHOVUGYKWjkJzyKgDvCzFEKJjMakmjTHqSOco7M4FYi
	 2cwUD1NaUwKZOK9GsIex0FbkcUehVx63H3QcJh/A=
Message-ID: <781b5fb2-1fbd-4e76-bb59-29ee3b530f73@sessink.nl>
Date: Thu, 30 May 2024 10:18:54 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cant get "tcp dport 22 @ih,0,32 0x5353482d" to work/match
To: Pascal Ernster <netfilter@hardfalcon.net>, netfilter@vger.kernel.org
References: <c2c52fe9-5ff1-4eb9-96e5-81e645e77b50@hardfalcon.net>
Content-Language: nl-NL
From: Valentijn Sessink <valentijn@sessink.nl>
In-Reply-To: <c2c52fe9-5ff1-4eb9-96e5-81e645e77b50@hardfalcon.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

You're trying to match information that is not yet available.

The first tcp/dst 22 packet will not match any of your @ih packets, 
because it's just a SYN without payload:

On 30-05-2024 09:27, Pascal Ernster wrote:
> multiplexing SSH and TLS on TLS port 443. The idea is to match the 
> "SSH-" string in the TCP payload of the SSH client's first packet of the 
[...]>>         ct state { established, related } accept comment "allow
>> tracked connections"
[...]
>>         tcp dport 22 @ih,0,32 0x5353482d counter packets 0 bytes 0 log 
>> prefix "##### SSH DEBUG 1 ##### " flags all accept comment "allow SSH- 
>> via SSH port"
>>         tcp dport 22 @ih,0,32 != 0x5353482d counter packets 0 bytes 0 
>> log prefix "##### SSH DEBUG 2 ##### " flags all accept comment "allow 
>> SSH- via SSH port"
>>         tcp dport 22 counter packets 1 bytes 80 log prefix "##### SSH 
>> DEBUG 3 ##### " flags all accept comment "allow SSH- via SSH port"

... but it *will* match this one:

>>         tcp dport 22 accept comment "allow ssh"

And afterwards, packets will be accepted based on the "ct state 
established" rule at the beginning of your script and not hit any 
further rules.

As your @ih information will only be available in an established 
connection (i.e. packet number 3 or so), it will never be reached.

Also, as Florian says:
- you cannot redirect a connection to another port once it has already 
been established;
- while at the same time, you cannot distinguish between SSH or HTTPS 
without having an established connection.

V.
-- 
Durgerdamstraat 29, 1507 JL Zaandam; telefoon 075-7100071
