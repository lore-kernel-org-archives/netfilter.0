Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965977F08
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713986450; cv=none; b=mgBBav2As67NsZvAzs89FEoOlhpYJJFhu2rDr0rDn1FYanJNVTTtqXFYQIMoLjnZp2eV4ZDIXXhuXXvBIHZFNImFkL2IzRn3/afm/n3x4am0cEzYFvRqZSrNWjIr7mD8LrNChT3F8U1PXCzzIWaRGCIbV9tc1mjagvEpuNdsRaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713986450; c=relaxed/simple;
	bh=j/gbPQNw8npvhnFUwwH5MabvR9FIv1/ic/qbW/JyqMA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gc4dyevnMerN3XyUlI0pfvfbUnnIe1hnFrAYZ+NcyuLw1W+nWzK20KXVH/GAXfuT12RpCHOqQXiStf6Dy115WpPX7E0ayPLYxII75as9WmLoL1WtHNNe5X3L+zg/E+V8ihvJsPpK9uK4uetgh9Ou+rLM0bJ5V8yEb0dNHwBPJ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=bR7OS1kz; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="bR7OS1kz"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VPpjr0lLhz9wVR
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 19:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713986448; bh=j/gbPQNw8npvhnFUwwH5MabvR9FIv1/ic/qbW/JyqMA=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=bR7OS1kzvA+tj5tjxUQT+fjn38lirfWcW4aGutO83bsKJcghKoBho+7ytfynU24zE
	 F6Lbvyr0VM/SBzTxqNiTQqn4rqicyFkl9SFrkrQu5fmRJ/G3vPYWwwH8xJZA0wWk+6
	 YlJTS73r1OAQaXcyAZqA6/G0lxOqvWi4KbSiKhnc=
X-Riseup-User-ID: 8E6C6825D9E847B85F02913213E5D124784F09F2F7F4AC75CF6D9E8E6770CDCE
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VPpjp6c6LzFt7m
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 19:20:46 +0000 (UTC)
Date: Wed, 24 Apr 2024 19:20:33 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a dynamic ingress device(s) list?
Message-ID: <20240424192033.5f05ef18@localhost>
In-Reply-To: <3b215f04-cf5e-49d3-9166-3806b3e53471@app.fastmail.com>
References: <20240424180331.3dfb6fc4@localhost>
	<3b215f04-cf5e-49d3-9166-3806b3e53471@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Apr 2024 19:49:28 +0100 Kerin Millar wrote:

> Rather, "define nics".

Yes, sorry.

> You mentioned the use of bash, which is capable of serving as a generator.

Thanks, I know. The thing is that nics can be added/removed at any point in time, not just at startup, which makes it more complicated.

> It does not.
> 
> # nft 'define nics = { "enp1s0" }; table netdev t { chain c { type filter hook ingress devices = $nics priority -500; }; }'

This gives segfault here.

> Perhaps you need to upgrade nft.

Here:

# nft -V
nftables v1.0.6 (Lester Gooch #5)
  cli:          editline
  json:         yes
  minigmp:      no
  libxtables:   yes

On Debian 12 stable.


> Can you provide a minimal ruleset that reproduces the segfault?

#!/usr/sbin/nft -f

flush ruleset

define nics = { "eth0" }
table netdev filter
delete table netdev filter

table netdev filter {
	chain ingress_internal {
		type filter hook ingress devices = $nics priority -500
	}
}
