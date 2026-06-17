Received: from achilles.binarus.de (achilles.binarus.de [168.119.77.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E843E9FD
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.77.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692863; cv=none; b=un1qw3YSEExGT0RZxbh7gGVuWZQ+1WHBiEO0Bd1ikyluRAMs/9u8wayuMAiMSxEBd2LlqPNYjqkeca63SGzlzHR9qSkXzRms3lSeIT4cy5aywavDX4EFxcJn1fYIpbqe9GeipGiRnVz0EdzkmnY2BjMi1qri6QTJmiYLOPl24RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692863; c=relaxed/simple;
	bh=LybzAbEDAbyOq+tQAHvxbGtrOjxYy1nIhi2UTZ90Cyg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=GmRUb5nJaOJwcfkY4ZSYKMIc4lKps22K9UCcO9VnT6X/U3/6tJrQ2SNug6vUduwlLkonDu1P+q5xswhQUape6Nr1wYxXi2O/Bx3ySZ+Jya8BEw6E2KitdD7Q0yC0GZzBGJFZ7Adhh/oq3HD+OzKqZMexKnRRPFDpHifL73OmT4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=tCMTZtAV; arc=none smtp.client-ip=168.119.77.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="tCMTZtAV"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1781692858;
	bh=LybzAbEDAbyOq+tQAHvxbGtrOjxYy1nIhi2UTZ90Cyg=;
	h=Date:Subject:From:To:References:In-Reply-To:From:Reply-To:Subject:
	 Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:In-Reply-To:
	 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	 List-Post:List-Owner:List-Archive;
	b=tCMTZtAV8fHOTRgI+OOAz+cFhVFUcLvsiitwDIYa+yZLBz0bRhArBM/nCT/TBTFAA
	 7hsAGow5fEvJplhE46kjvi56WaaYZqUSgHM5Yq0ZuVg3UgV4TyLd/A6HJM/Gbrqqea
	 QDOrKEd7TaLrT/JJIa30mK1NSBeHelzf2lopbFYijDDiK9D+pqXIAARk0ez8DuO6Vj
	 2q+bgo8fga/4B112ylFU6ei+bXmrjZQyDiabLSrJsyP1rdzE2RqzGu5+FphOvUTpTl
	 /dhEA9FPpYy2keO9zUOZKU289vzbzLL/baDXGFb41pjp04dD1pJRSTct9KGhKCgwBv
	 T9MPQFZhwC2DhAxshYa5zwRxKw4iHan2oeBkpHdVUhw+xp46S6pzeNCfZy7rLk8QBu
	 XxGCQ5oe3jPyNovxOhqG2xcvEGr+CM3tL1D+nVo9NNtopLZuNKgTvP2861d4P0QuEL
	 g57u7iaI1XqkXnuECIuozjDQ1s76QOIwPIgPFJ3c7n+jQGj5NOHC2INRDVO9U++TfQ
	 NDBvMaFLxR9j5u9Ks6s70PYr5k97GVcS3VWWEwY0zYc07XSJ1WPwVDpZRcIfMUkRBg
	 2x3pr5fPI4FfB5I+WR7pbUN9P9iCjc1ch8cMJPNqR7BwxwzUQI+CsW+aGXHX4a/RDA
	 xpHOxtUeRZv9YfRYUeMCS60s=
Received: from [192.168.20.100] (pd9531579.dip0.t-ipconnect.de [217.83.21.121])
	(authenticated bits=0)
	by achilles.binarus.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 65HAewFQ1773607
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 12:40:58 +0200
Message-ID: <39956776-4dbf-473b-a2d8-c90dfdf48fa4@binarus.de>
Date: Wed, 17 Jun 2026 12:40:25 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: Is the article "Secure use of iptables and connection tracking
 helpers" (by Pablo et al.) still relevant?
From: Binarus <lists@binarus.de>
To: netfilter@vger.kernel.org
References: <bb1f251d-fb7e-443f-8e04-8d3ee00bf7ab@binarus.de>
Content-Language: en-US, de-DE
In-Reply-To: <bb1f251d-fb7e-443f-8e04-8d3ee00bf7ab@binarus.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>


On 17.06.2026 12:29, Binarus wrote:
> [...]
>
> For example, the nf_conntrack module in modern kernels (e.g., 6.12.90 on my Debian trixie system) obviously does not have the "nf_conntrack_helper" parameter the article mentions. Hence, setting it to 0 does not effect anything. Setting the "port" parameter to 0 seems to do the trick, though.

Setting the "port" parameter to 0 does not do the trick, too. Sorry for the wrong statement. I had interpreted a test result in a wrong way.

> 
> Background: If finally have upgraded my firewall from iptables to nftables (and have learned a lot in doing so). Now I'd like to improve security further by applying the recommendations from that article to the nf_conntrack_sip helper module (I have an asterisk instance running on my local network that communicates with the internet / the telephony providers via NAT, so I have to use the conntrack sip helper to make telephony work).
> 
> In other words, I' like to know whether we should still prevent the automatic loading of the nf_conntrack_sip module, and how we can achieve that.
> 
> Thank you very in advance, and best regards,
> 
> Binarus
> 
> 

