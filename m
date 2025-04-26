Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015417E4
	for <netfilter@vger.kernel.org>; Sat, 26 Apr 2025 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656777; cv=none; b=uf4WEI2muu8Hdnjd88qmXQM47GlILXqoeHMH/fBKiq+Esbh2T/tXWd2rWrDUMcA+WuoHaolANtnlpHzAqudg30mhLN6nMBD93yPnmXWNY6aAkieskhNTCkMuXNwxO4Ap63XR+GE+Cj4QNpL/wVkBw0XuHqnstTuJwSwePUaQCWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656777; c=relaxed/simple;
	bh=JFOatL9jR6VtJfo20jx5FXGC/cddQTF/VHRjMzBuxaE=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fH9HmlNX3Gtzw7t1+T0FZSr+ykfxW/HES5oDylRa0DIOFOqonES4gyugCo34Am3KS6cjE0MZjUH06H7XRhvmtkohE1DuCkNeseHINSgRI68DtHMCGwZXLFTiCIYVuVQrjDoeYerDmK+xYqLEg9JR4KmtW9TH/3sDUsGnneRbeQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=cnqnv9cU; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=Zh4SQbAB; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="cnqnv9cU";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="Zh4SQbAB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=ycQ2Xrrlj+bIqCZ/e62R3TWA1DRym22OPRmCTvjEon4=; t=1745656773; x=1746866373; 
	b=cnqnv9cUp7NR/I1NL1fXv3qHqAdcvYVSydcpWUv/zLmwxr3O5e6WdmdbH8hijLXUsZcQcTeXhpN
	DmxDKFhLczt+Jmh2c5yT1vO7a8evg+GwspHsvKDTRM+z9la/pUIZGhHkjwx6M1o8gTyTYi9Y/gbDy
	J3QmFkpucAQ9G33tcIk=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=ycQ2Xrrlj+bIqCZ/e62R3TWA1DRym22OPRmCTvjEon4=; t=1745656773; x=1746866373; 
	b=Zh4SQbABOnszKQGZNk0jG7SJCjz9ESP2fC4mUHoKztI4pzT5BMuV/hSHmYh5X+kUoy+Xfs/pH5B
	cZV6/ysTbDA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u8b4F-001C7L-1z
	for netfilter@vger.kernel.org;
	Sat, 26 Apr 2025 10:39:24 +0200
Date: Sat, 26 Apr 2025 10:39:21 +0200
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <20250426103921.48f3255e@bonifac.skk>
In-Reply-To: <20250422114352.GA2092@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
	<20250422114352.GA2092@breakpoint.cc>
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

Dňa Tue, 22 Apr 2025 13:43:52 +0200 Florian Westphal <fw@strlen.de>
napísal:

> This is an input chain.  The loopback bypass is restricted
> to PRE_ROUTING before v6.15-rc1.

That opens another question, as i have in that chain:

    chain r_prerouting { # handle 1
        type filter hook input priority raw; policy accept;
        iif "lo" notrack accept comment "no lo conntrack" # handle 15
        ...
    }

Why this notrack works? The image about packet flow on [1] left me in
impression, that input hook happens after conntrack (as conntrack
priority is shown as part of prerouting hook), thus raw priority of
input hook is not important for that (just for ordering it), and thus
setting notrack in input hook is too late, despite of chain priority...

But it is not, it works, conntrack -L doesn't shows "lo" entries (nor
-E)... Please, can someone explain it for me? Does raw priority in
input (or more generic in any) hook run it before conntrack/DNAT,
despite of hook type?

What is then difference in between prerouting and input (and forward)
hooks, in conntrack/DNAT context?

(please approximate my question, my English is far from good)

[1] https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks

regards

-- 
Slavko
https://www.slavino.sk
