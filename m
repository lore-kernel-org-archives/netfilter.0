Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5644B1E89C
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710787466; cv=none; b=aeKZzZd4VUtaQonGJWL3i5O0pAakgP3Rj9hR8ClQzU/8WgrNrXQfVcJq9pZ56QaXuRK9AV6+iESFlJyRtyVHR6c+1FZN7sj80miue0Ccz9D8+O+0OCRABwv4khVhZRYUPgM1M0Hg7YJxy3w/X1aVj+ZChayvobTl//223JGPVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710787466; c=relaxed/simple;
	bh=+azr+lypyC2AtvJlphDcAGQhB9AkgV77SkpwYM3QNOY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=nIKn9tzUFILdnniwcHZ4sZEY8P47bqqaf7PXGfMUFOThVN3DCM6WJ3tc70kJ9N4Lgw7XOWFWfdmA01kI11wVBXpxW4jidoTjd0WuDz196kTGqjPAKb/3IVhVBLsGPSsn3Jms/GFCOaZTKuXPKMdLz3K6nyd456bVGuFZ8apUTXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=AnNslS3+; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=AnNslS3+; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="AnNslS3+";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="AnNslS3+"
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id 4ABFD6081701;
	Mon, 18 Mar 2024 19:44:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1710787459; bh=+azr+lypyC2AtvJlphDcAGQhB9AkgV77SkpwYM3QNOY=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=AnNslS3+ZEwzEurBypiVVExbDiFbZv/RYFOLxwRsfn2XX7CFgzX+dTpUp9N1bRV80
	 CgZaYN58NUZHz2S14Fylt8mfSoWKMaGlFMlxlskjAcHOPY5NzvywR1xBV9tf4tEH3n
	 GysH3rpzPko4lHbz7IMVTstvVpj2Wvbhggbe+1pQ=
X-Spam-Level: 
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id F1AD460817F6;
	Mon, 18 Mar 2024 19:44:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1710787459; bh=+azr+lypyC2AtvJlphDcAGQhB9AkgV77SkpwYM3QNOY=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=AnNslS3+ZEwzEurBypiVVExbDiFbZv/RYFOLxwRsfn2XX7CFgzX+dTpUp9N1bRV80
	 CgZaYN58NUZHz2S14Fylt8mfSoWKMaGlFMlxlskjAcHOPY5NzvywR1xBV9tf4tEH3n
	 GysH3rpzPko4lHbz7IMVTstvVpj2Wvbhggbe+1pQ=
Message-ID: <d38fa90d-f7c2-44ea-903e-65cdda2b36e1@tootai.net>
Date: Mon, 18 Mar 2024 19:44:18 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: List Support <list@tootai.net>
Subject: Re: IP not banned in interval set
To: Kerin Millar <kfm@plushkava.net>,
 Netfilter list <netfilter@vger.kernel.org>
References: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
 <3f1bf63e-8f04-4659-b06d-b47f96d6b9df@app.fastmail.com>
Content-Language: fr-FR
In-Reply-To: <3f1bf63e-8f04-4659-b06d-b47f96d6b9df@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Le 18/03/2024 à 18:16, Kerin Millar a écrit :
> On Mon, 18 Mar 2024, at 4:36 PM, List Support wrote:
>> Hi,
>>
>> nftables v1.0.6 (Lester Gooch #5) from Debian 12. I have a set which
>> contains in a table mytable of type inet
>>
>> set toban4-smtp {
>>       type ipv4_addr
>>       flags interval
>>       auto-merge
>>       elements = { 194.169.175.17-194.169.175.18 }
>> }
>>
>> chain input {
>>       type filter hook input priority -100; policy accept;
>>       ip saddr @toban4-smtp tcp dport { 25, 462, 587 } drop
>> }
>>
>> But
>>
>> nft delete element inet mytable toban4-smtp { 194.169.175.17 }
>> Error: element does not exist
>> delete element inet reaction toban4-smtp { 194.169.175.17 }
>>
> You would need at least nftables 1.0.7 for this to work.
>
> https://marc.info/?l=netfilter&m=167873533514569&w=2
OK, understand
>> where
>>
>> nft delete element inet mytable toban4-smtp {
>> 194.169.175.17-194.169.175.18 }
>>
>> does the job !
>>
>> Also, with elements = { 194.169.175.17-194.169.175.18 }, when one of
>> those IP is coming back it is allowed to enter :(
>>
>> What's wrong here ?
> This isn't particularly clear. Can you share the complete ruleset and explain the test case?
I mean that IP range from the above set doesn't drop any of those 2 IPs. 
Not very usefull ;)

-- 
Daniel
