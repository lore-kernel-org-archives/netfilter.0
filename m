Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8F3783A3
	for <netfilter@vger.kernel.org>; Tue, 24 Feb 2026 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934123; cv=none; b=QzWvE8rfIWHDpr7jRbVVQn7bAs4lzE1ZWwpSmuv9t+p8hmKvSW+5KCzXc4DOzLjjvHY+fDqhQjxYeuKwonE4f/76O3DXrt1F+hBF+oQuD6rK5nJyXfvS4Z1WPhqbIIHzAThg2DD8X+Xf/Fae0wNX+Dyg/UPY3dZlhqxuQkwriLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934123; c=relaxed/simple;
	bh=FShumysTCxbfkR6d/RC2TO80l+12lbxC7aph49al2TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TY0yKnW0uD9i678TXRglXbKDzUCQ/5BMs/29w/+PTmL/UuGMAzFwK6/eg4REKErFM7O6v1tK5K4tqPix5Wmcxhla6/4qNpmPWaTcTiw3AIi9kQh0nmyAWs3ZbI7wLmpj6Wyh1Pcy1eBaerSFwiM1K7PdUR8XWWBvzjNlGp3v+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl; spf=pass smtp.mailfrom=yandex.pl; dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b=QZuvuX38; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b="QZuvuX38"
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c16:1e9b:0:640:1479:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id ECD33C1759;
	Tue, 24 Feb 2026 14:50:02 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 0oeIcobGumI0-S1Hauj0H;
	Tue, 24 Feb 2026 14:50:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.pl; s=mail;
	t=1771933802; bh=zCx9iK1n7KozddFuacwyr9QHnen80Iej9ovB/i5Qkzs=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=QZuvuX3851b79lhhjiVK8O9uTP9b6wSpC6jYNVHYEOJFd9ZK5SZ7+Ou4qiA/jyGIj
	 2wRQ/H3w0Cd0HummEzHQ6XKeM+V694UhfDt3f43DHScXvaSoZRoxi7biG8TOd9Ct1t
	 yJ/A8J7r5Aj8/viIJw6jghTRE1EMPnGhyJuaQ0Tw=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.pl
Message-ID: <34b6c59d-c15d-4cc8-9281-d653520083c9@yandex.pl>
Date: Tue, 24 Feb 2026 12:49:59 +0100
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
Cc: netfilter@vger.kernel.org
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

Will do - I've sent a request to bugzilla-account@ to create an account.
