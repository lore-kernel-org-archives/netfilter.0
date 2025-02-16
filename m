Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFDA17E473
	for <netfilter@vger.kernel.org>; Sun, 16 Feb 2025 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739702442; cv=none; b=X9C7uL0dIYGrnKA2q9NqoGhZujsDzqsgyF9QrkVDN89JVY3EJxsbIWWSbJjCHHYNeZKQmDC6BJ7zyEu5U8o28fJPJwOsAI8u4wga6CDIBYlamVSRYwxhhcUOsu9Vnro8th/VKFty8jyytVuApFM+52u/AH7FnW7RcV3pP0UX+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739702442; c=relaxed/simple;
	bh=InP1a+JZ4RDd3rxmyvnCMrS/xtxSNYSik63txop2RHA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hUOGnnGU0Ol22oR+97aX/0jfH5ILGQMx7K0Lv3M2UPsd1ABAjXUuzAln0aw5102gAJEhWHep009F540MzNFER8FJWn0SkzF80qgw2hrm1W4yHkqtGUOlHn7OwzZi1gBdukLkQDOPbMQ1ztvgIwMghagYR+i9xeFhMI3sSevQ/9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=Gi8oQ4Y4; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=aRAfl8l8; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="Gi8oQ4Y4";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="aRAfl8l8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=XgjJ5oWwBmNesHGATNIsgqV7qPGwbvpHiYcDICP8h1U=; t=1739702437; x=1740912037; 
	b=Gi8oQ4Y44G0I+iYRNN2VZKmLhdD2OLjlrqURTdaxOdLWep603HMuzBpwHJ/fS/LECbCO/diGP4k
	WusWhvEwGWOhiwSrZHaWgNCJOGd6OqmepHagX+3ia8oIDZ7tyfvyN6n5z32vngpUvQEfby0Ro+N53
	clLeVoktRsNy1mGeQIo=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=XgjJ5oWwBmNesHGATNIsgqV7qPGwbvpHiYcDICP8h1U=; t=1739702437; x=1740912037; 
	b=aRAfl8l8NXUJYAVytq9pGuV2AUdmttMwfFRcoabDNRr4PTKNMui8M3BqnQqQKTG0hD24Tr+JdYF
	x8ViKG++VBw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tjc4g-000cFw-2V
	for netfilter@vger.kernel.org;
	Sun, 16 Feb 2025 11:40:34 +0100
Date: Sun, 16 Feb 2025 11:40:32 +0100
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: Static bidirectional static NAT for duplicate IP devices using
 iptables
Message-ID: <20250216114032.6b3c0ed1@bonifac.skk>
In-Reply-To: <CAOazyz0-dyiynzHLwa=a4iMXhUQ9jn7uGM3nYjwc8+QjxZaK+Q@mail.gmail.com>
References: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
	<CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
	<CAOazyz3dGP+QJ_BOvXQ7gnQzTvOhGcxwA9y-RRJx=CjmMNmWhw@mail.gmail.com>
	<20250216124022.127f90f3@gnosticus>
	<CAOazyz0KRqij4oenpBKbgQHJMem18OAQmNkyytfPSG0y0L6X_w@mail.gmail.com>
	<20250216201217.6d99e00c@gnosticus>
	<CAOazyz0-dyiynzHLwa=a4iMXhUQ9jn7uGM3nYjwc8+QjxZaK+Q@mail.gmail.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ahoj,

Dňa Sun, 16 Feb 2025 12:20:51 +0200 Alon Bar-Lev
<alon.barlev@gmail.com> napísal:

> I am unsure how you use NAT to perform the entire network
> transformation of 192.168.0.X <-> 10.0.0.X.

I never used it, but what about this, to map IPs from 10.141.11.0/24
to 192.168.2.0/24:

    snat ip prefix to ip saddr map { 10.141.11.0/24 : 192.168.2.0/24 }

regards

-- 
Slavko
https://www.slavino.sk
