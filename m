Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898EE54657
	for <netfilter@vger.kernel.org>; Tue,  2 Jul 2024 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719947017; cv=none; b=X1M9NvOio3dgpUikuYNuyRijTkMd76ODIhUlmdWUw5Ys1aTAu+bdklMwBaQIr6YZnqrebr0iKB/Ru42VmWbln62An1tlgSvPMRO5uCJyIiBzVfKsJOVFBhsaBJAIazzJxMNcnMpCQnVxSutVv5Cm9FsxWfXwNNgi3N0AgO6Xta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719947017; c=relaxed/simple;
	bh=kkQJl/C2OsCWGuE7Y4xEI/0+fV38fowTTs2EoQ5gx/o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=e1fJntxzwsaeE7ZWgIsAAAJBM3+hK16X7YKoCiWtLkaicT7LfXD+BRUxJzdbzkisHHWcgN8Nayj5zeXIyiY4YTOYvSAyTqi4DgpwjmpT096wZlyTUnneGz72w+EPbqB0QjdLnzg0ZeBwbBbI/1HYcnRYZDu+c3tJzKbs7g7XMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=faTawGNl; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="faTawGNl"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WDC415srhz9s64
	for <netfilter@vger.kernel.org>; Tue,  2 Jul 2024 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1719947009; bh=kkQJl/C2OsCWGuE7Y4xEI/0+fV38fowTTs2EoQ5gx/o=;
	h=Date:From:To:Subject:Reply-To:From;
	b=faTawGNl1IV6gv9Pbs79NQKV/G/EuE0vMmOn/oft6tvMiA7Lw+ulj0hyXAd4hXg84
	 /PGDnKkQ27z09jGJQKUpbKe/Cn5ZOiStWIOIJsqXDA80GHtZDY9UhqecHZkfcu0h5t
	 iqQE1mNxbJkxWBjn3XUYuIHGOlJ8nLk4qLlyQh/4=
X-Riseup-User-ID: F2DCC3270577C80FA02CF1041833B970DA556C831445B7076B1A1B8D403515D4
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WDC405ly7zFwRM
	for <netfilter@vger.kernel.org>; Tue,  2 Jul 2024 19:03:28 +0000 (UTC)
Date: Tue, 2 Jul 2024 19:03:18 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: nftables rule optimization - evaluating efficiency
Message-ID: <20240702190318.618a3933@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Since it is possible to do the same thing using different rules, I am
looking for the most optimal (low resource usage, high speed) way to
write my rules.

Here is just a very simple test to compare the different approaches:

#!/usr/sbin/nft -f

flush ruleset
table ip6 t {
	# Goal: fast processing through early "exit"
	chain A {
		ip6 hoplimit != 255 return
		icmpv6 type  != 133 return
		icmpv6 code  != 0   return
		accept
	}

	# Goal: compact syntax
	chain B {
		icmpv6 type . icmpv6 code . ip6 hoplimit {
				133 . 0 . 255
			} \
			accept
		return
	}

	# Goal: no specific, using "general" syntax
	chain C {
		icmpv6 type 133 icmpv6 code 0 ip6 hoplimit 255 \
			accept
		return
	}
}

Looking at the output of 'nft -c --debug=netlink -f <this file>', it
seems:

- chain A would work best (least instructions to verdict) if there is
  no match (e.g. if hoplimit is indeed not 255) but in all other cases
  the total number of instructions to be processed is greater

- chain B and C seem to have the same number of instructions but
  perhaps B would outperform C in case of multiple elements in the set
  (e.g. more types or codes to check)

Also, it is not clear what is the actual "load" of different
instructions in terms of CPU cycles and memory, i.e. one instruction
may look as "one" but may actually cost more than another 2, right?

What is the proper way to evaluate and optimize rule efficiency?
