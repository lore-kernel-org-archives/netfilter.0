Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37371EDA0E
	for <netfilter@vger.kernel.org>; Wed,  5 Mar 2025 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180831; cv=none; b=ZbUYlFdkNQhm+TDcX49qGeDLC2eJoj+ajMHR3XpgFsREvGlnGGIx3aUl7N8AhO8c4MDdDrQjJJq5mQkBrCdyRAfMaGooxOIvThEv6w9TGSoWkLqp6qDaNpRj1owXEAYeKe8Zzu6F+QuQ50KN0vr5ItZzbbQIUasobgD3Qalq+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180831; c=relaxed/simple;
	bh=Ay2wfI9W3ZB94i/LZKGJJZOKRNyaE9FR2UGQHk2ZqIc=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSTDFbFekH/S+MZSoZ5Uat7woSruOGZI9RhW11ON5NgFuKwk2JNwc2tCWBPKcMD6aHECRnus/z6Pugp8mHRAtcBlvqn6kxrbaezlKkxju6LTIifk1AzjF+gpRt4FKZUPG2jWRRb+B6+YXE+JbPAmLrA2wqxs4fE/54DsQEtIGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=nUAWf+GF; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=3pkXc3As; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="nUAWf+GF";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="3pkXc3As"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=XV1NpifPi0w7j/HBo0WpIYG8WIVXzqqTAOxpxux1Ruw=; t=1741180826; x=1742390426; 
	b=nUAWf+GFMCP0yjq5d2kHBQOleIMiIKSn6bCE4zBUg5v6sRVk89dqWykGJ8mKdaNjUXtB7mBOxlm
	apU5kYO+kpQ2VPhuK96ZgvmYNg2nAX0OGaMab+MFftHwnCVWNWF1Pt5t8vlu2hiMtIaSI+lA+A3Oo
	MSd8lhbSzV/xkwRtu5E=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=XV1NpifPi0w7j/HBo0WpIYG8WIVXzqqTAOxpxux1Ruw=; t=1741180826; x=1742390426; 
	b=3pkXc3AssTF4yX+Ifyv5f3QwDUs+yPQ6k0uls4LEPa3li+KNnIC0PH6qR2OFJiNPt5cb5VRcA3p
	0pEHe9zlwAw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tpofZ-0023bx-2M
	for netfilter@vger.kernel.org;
	Wed, 05 Mar 2025 14:20:17 +0100
Date: Wed, 5 Mar 2025 14:20:16 +0100
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
Message-ID: <20250305142016.37749842@bonifac.skk>
In-Reply-To: <20250303220334.GA19712@breakpoint.cc>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
	<20250303193533.GA16225@breakpoint.cc>
	<88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
	<20250303220334.GA19712@breakpoint.cc>
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

Dňa Mon, 3 Mar 2025 23:03:34 +0100 Florian Westphal <fw@strlen.de>
napísal:

> Can you test and report back if this works?
> I have no idea what I am doing as I don't use ulogd.

I had more luck ;-)

Basically it works. At first attempt i got nothing in GPRINT file, and
in journal i found:

    ulogd[2879765]: Unknown protocol family
    ulogd[2879765]: error during propagate_results

Then i found, that this error comes from IP2STR, thus i shrink stack to
(IMO it has to silently skip it to i don't need separate stack for ARP):

    stack=log2a:NFLOG,base1:BASE,ifi1:IFINDEX,mac2str1:HWHDR,gp1:GPRINT

That "solves" the "Unknown protocol family" problem and packets are
logged with ARP entries (beside others):

    arp.hwtype=1,
    arp.protocoltype=2048,
    arp.operation=1,
    arp.saddr=158.160.47.125,
    arp.daddr=168.160.47.125,

Big **but** is, that the values of "arp.[ds]addr" are wrong, these IPs
as captured by tcpdump:

    ARP, Request who-has 192.168.10.254 tell 192.168.10.15, length 28

Another (less important) point, the field:

    oob.protocol=2054

is three times in one log line with that stack.

That is all, what i noticed yet...

regards

-- 
Slavko
https://www.slavino.sk
