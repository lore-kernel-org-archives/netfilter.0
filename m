Received: from achilles.binarus.de (achilles.binarus.de [167.235.4.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9A1FA851
	for <netfilter@vger.kernel.org>; Sun,  2 Feb 2025 21:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.4.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738530947; cv=none; b=Kf/fwT0uvJqhHweJWnWYYFElT/BWOgxfPCeZfjxYACL+2dcOSv1kywB7lp9+DphcADPHiuRWhmPenRhFks9Kg7VdjUYbJHfcIZ14IN+51NLRe9JOn/bVjJZm00GHa9DDB0CyyOP//Fb0x1wHis42xJz4l/RGmP/2FMim1xg1nM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738530947; c=relaxed/simple;
	bh=9/kmHomCwaM/YhAZZvfDwrYN+idGxF3FoDP0zu2+bY8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=QmWdqmM5v+tMGg0bWqf5Q49gehihaPiVTdDylld01PryO41UyasulNMFnxW9Q4UfwMgXzm280hV78RGrX4VJq2/woivA0CfqnLzQyIA1IYBD4QPmPb5q+YVuFWwds3t7y+LAX3WNi1vqdNcTnsPa8FuKGyCmmnhoVUu3wdH8qUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=ui5A+ZkM; arc=none smtp.client-ip=167.235.4.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="ui5A+ZkM"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1738530939;
	bh=9/kmHomCwaM/YhAZZvfDwrYN+idGxF3FoDP0zu2+bY8=;
	h=Date:Subject:From:To:References:In-Reply-To:From:Reply-To:Subject:
	 Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:In-Reply-To:
	 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	 List-Post:List-Owner:List-Archive;
	b=ui5A+ZkMglG9plXuqV3KlJqq/pWJ0LKBUoUh8ENdnW8G2ehTw5nn0uCUK76bEdlvI
	 tZNyuSzlgU6b5azhesL5Lb5PA9WE5oKnnuNozj8ti0h92HFBsL4XnTrIms1dvJrPhk
	 exyVXrLoWRMt1kSHL2LNTt932ltjUqXC6Vd7kFKWgg+bJqCV+Jafl6GjnNY/36uMUy
	 BsTQTnP7DUQT+5nAsh06XsglXxlKvk0stdFdBrnppzqc8sD8G1LAEZizbF6hQ01jy3
	 02lgxY3LzDo7gDW5eALTjX1DMBtMO1vAL76uRXz+DdlRd6FBlaffePnZXNvxh6sNE5
	 jQaJaQHPjFqypPxbXdo/pfXy4KtZC0xV29Xeu/vU5lz2w6VlqZHsW/LjEy61uub03C
	 ip1OwVS4BA95qoNNJsQZE/OwP8euRDD3Gznz63neweSXdAdXxcwoYjoyn437fQjejn
	 yz/hl/la0LMiAX5ZGC8nMFbWZghug1Qq1WmAhoNopRRABR4T5uYKH6hehEoOyZdA0d
	 lot53ZNoKfzi+EQKczLvBzfyO+UoNMzLyV6G2qv2UBTochT4ZzGXmtlbEQ6WJV8Adr
	 1mLVI7bU1xgvDX7OArr5tBgXfJHDrMB2/L+lTxeF896Dv3ejey599jlxAdNfekHfja
	 FwvvFTjbdTdabgwFZ53of7Io=
Received: from [192.168.20.110] (p54969e67.dip0.t-ipconnect.de [84.150.158.103])
	(authenticated bits=0)
	by achilles.binarus.de (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTPSA id 512LFdE13618393
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sun, 2 Feb 2025 22:15:39 +0100
Message-ID: <0ba06f32-5bec-4473-8659-7120efc30a09@binarus.de>
Date: Sun, 2 Feb 2025 22:15:38 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: Documentation regarding priorities possibly wrong - clarification
 / update appreciated
From: Binarus <lists@binarus.de>
To: netfilter@vger.kernel.org
References: <d8c877f0-bdcc-4fce-91c1-f92d267d66f4@binarus.de>
Content-Language: en-US
In-Reply-To: <d8c877f0-bdcc-4fce-91c1-f92d267d66f4@binarus.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

On 02.02.2025 19:48, Binarus wrote:
> On the other hand, during my research, I have found a post [2] that was an eye opener. The first and only reply to the question (at the time of writing) explains in great detail and in an understandable manner that the priority of a nat type chain is simply ignored* and that every nat type chain instead is always executed at priority -100. [* The relative order of nat type chains that are at the same hook is preserved, though, according to the post. ]
> 
> The post further contains an example ruleset and shows traces that prove the statements made. In summary, it seems convincing to me.

I forgot to mention that the post mentioned above was only about nat type chains at the prerouting hook. There was no statement about nat type chains at the output or postrouting hook. I assume that the situation is similar there, though.

> 
> [1] https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook
> 
> [2] https://unix.stackexchange.com/questions/762402/nftables-are-chains-of-multiple-types-all-evaluated-for-a-given-hook
> 
> 

Best regards,

Binarus
