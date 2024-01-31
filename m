Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E795069D39
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706702119; cv=none; b=hc7DhU7uKJ7cFwjATmvZtPJWYK5VVgQH9J7TATfgzA7It2ilo3OEG7zbSZlCrWvp1xexw9BgKgCyobNOGOjhzYQsiFYdTi1TSrAFddubTnsDq9Yh6lcHLg1mZphrkgXtybcqdAfrXbHZhKtdYaH6hhMKPv5E5XtALKSjcy+RxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706702119; c=relaxed/simple;
	bh=nKWYYshsPay/hSQl350vvmxBWm1xZZSwOiXYHcF8bVM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=A35ktebGBg6zHbnjjJr6PMQ1mg+Ln8zYYJ8cfC16oHt1tSGQl3gWrLj3+Ezc2TyEeih3Pu+rYeSPW4+KQFjChg3rtaXEA2Z39Au/35p+26p0bIpNBAeAioHHABI904oDbcsMtTH3zBo83j3PB9zqgC7OCaPYNaV/FpAU71A1Yc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=fQcfzBbt; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=XDDtNqC7; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="fQcfzBbt";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="XDDtNqC7"
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id E782E6081733
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 12:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1706702113; bh=nKWYYshsPay/hSQl350vvmxBWm1xZZSwOiXYHcF8bVM=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=fQcfzBbtgTkuvwgkhLMNiK+MV1jZUGgBdAaQqZuQ8Bsw/9NP7wSv2hODae0CUn3Jc
	 Yv3GDfzgW2hAHjLmFYz2sJwVABxhsMX87cD9CqRwSbwGCyNyH0T2zTao/Y3hf+gxDm
	 mVZD5mvBToAitIU65lSSfMsh/vha5/rv8NO36oNE=
X-Spam-Level: 
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id B500B6081730
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 12:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1706702112; bh=nKWYYshsPay/hSQl350vvmxBWm1xZZSwOiXYHcF8bVM=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=XDDtNqC7tm8HE3jmlvNZ0TaFcd6W/lC1UhQ7vI4mrWQeFWRmSbuNJl0CvvuyszUbO
	 EWoC+InQI0pTG80Kv0JDLInlxWUzTQZhz6apYyhK24ajmbgmgsVZIIDuR3GbLkEGv+
	 9nv+jr+YZS6d/zrpklmJMBnI7U7Tf50hbl6EC/OA=
Message-ID: <83297f85-8799-49e1-9196-98cfba87ea3c@tootai.net>
Date: Wed, 31 Jan 2024 12:55:12 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel <tech@tootai.net>
Subject: Re: Combine ipv4 and ipv6 in a set
To: Netfilter list <netfilter@vger.kernel.org>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
Content-Language: fr-FR
In-Reply-To: <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP


Le 31/01/2024 à 11:54, Marc Haber a écrit :
[...]
>  >> At any rate, the follow nftables ruleset is valid. >> >> table inet 
filter { set block4 { type ipv4_addr } set block6 { type >> ipv6_addr } 
chain INPUT { type filter hook input priority filter; >> policy accept 
ip saddr @block4 drop ip6 saddr @block6 drop } } > Isnt that clumsy! 
Wouldn't it be so much nicer to be able to write: > > table inet filter 
{ set block46 { type ipv46_addr } chain INPUT { > type filter hook input 
priority filter; policy accept ip46 saddr > @block46 drop } } > > Having 
to write distinct rules makes things more complex and > error-prone.
table inet filter {
         set block6 {
                 type ipv6_addr
         }

chain INPUT {
                 type filter hook input priority filter; policy accept
                 ip4to6 saddr @block6 drop
                 ip6 saddr @block6 drop
         }

With ip4to6 -type/cmd not existing at this time in nftables- 
transforming an ipv4 in ipv4-ipv6 mapped eg 127.0.0.1 => 
::ffff:127.0.0.1 At this time we are already able to map ipv4 addresses 
in ipv6 tables like

nft add element inet filter ip-banned-ip6 { ::ffff:1:2:3:4 }

[...]

-- 
Daniel
