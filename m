Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92818C91F
	for <netfilter@vger.kernel.org>; Sat, 26 Apr 2025 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745660459; cv=none; b=JhV+5o6NPj45u37Y44P8yMiM14bPw5kZDBvkkmVTt5asT9hSgSXwB0fvfXB7qyAY2fsVx685hAE9nElBGnd9jjxjg4CbfpqX/6sPBYojrT0V9Qpmzv7o6j4JAw4MZXpBrJzmXSnh0FTorJwnDiX9wHX80/6aGk7jKxWwcruNG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745660459; c=relaxed/simple;
	bh=1qOsi2hNnY3FwsteorDVWwbVLrnT7IMfvjkJDCdbjmI=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdla73YbiPOOyoSm1K8lFJnjjRDJz4boX3xkE3/FeseKiMl2RemJXjfbAy8EeY6c+NUpwO9RKeSUFI0AD5zXWc1sbxqaLcg24xtu97a1ZssexJMEUP3j3nGp0HgYNZvnyxP8q/4jAlcao0OpKw52yYVkn0oT6cJSDEWs3spctsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=XJ9QwNlk; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=p87O6qwn; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="XJ9QwNlk";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="p87O6qwn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=8rMxfYI7XFpbKwYA849m6ecNu1J/s5TIrKwQbr3IKWQ=; t=1745660455; x=1746870055; 
	b=XJ9QwNlkRunEfjpYFuv+l9kJdw7Y0Rdt3srgvsQqAPM+8FCzjWDsxo82ssrySYkCsoJvDA95guf
	zwXbMdwMMVSW8Sm3/yScGKqkrMEpibZXbpd11eZ7jpTSfzfypgsJGoBLSqwqIOLwL3O7f9XdqOXd7
	MXxQX3gnDQ6hk4riEOM=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=8rMxfYI7XFpbKwYA849m6ecNu1J/s5TIrKwQbr3IKWQ=; t=1745660455; x=1746870055; 
	b=p87O6qwnw7YaAGSYjojZ+tvuhrPIbG2zyAPU6yu7WMfarKDG+IwKbJlEwtfvCbYDiUAd9d9BlsQ
	pQBL+bW1rCQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u8c1k-001CKU-1u
	for netfilter@vger.kernel.org;
	Sat, 26 Apr 2025 11:40:52 +0200
Date: Sat, 26 Apr 2025 11:40:51 +0200
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <20250426114051.607c5135@bonifac.skk>
In-Reply-To: <20250426092447.GA13989@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
	<20250422114352.GA2092@breakpoint.cc>
	<20250426103921.48f3255e@bonifac.skk>
	<20250426092447.GA13989@breakpoint.cc>
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

Dňa Sat, 26 Apr 2025 11:24:47 +0200 Florian Westphal <fw@strlen.de>
napísal:

> You either have no conntrack active at all or you have another
> notrack rule in output ("lo" is picked up in output, not prerouting).

yes, you are right, i have opposite lo notrack in output chain and it
seems, that for "lo" <=> "lo" traffic it is enough (tested).

thanks

-- 
Slavko
https://www.slavino.sk
