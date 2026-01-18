Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DDC17B425
	for <netfilter@vger.kernel.org>; Sun, 18 Jan 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768724898; cv=none; b=RL2bnZW/1JnqR4PxMJ5oVyiYzrxz8T8mOQ22wMObeMJAJPgfZOOTbq0GU279ql0gcxI51hmrP9zf2Lq9tysBsUDdh5P8uAP3Stc4Ebd7gyb15TkXOK5HQNuMN6PWKkghdGb7bZdVe1vy8/xOQWi+jhJy4GSr2V1I6zF9OhhX0S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768724898; c=relaxed/simple;
	bh=2O1JkvzXlbRshNZSa4EMLyCs1l9AJvoytR6te1PfmuQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=EBsjpC5N5vEquYbjMuX6jDeSdjiu0iL5pb2W6QhhI+hJqixnJEeqBTAULMRqgwdlGivXyd3JSeGAjZHzpDN0mkg9FckAw4hMyUI1xHSP8uf99uO8yaQr+4X3VI9rFYpkBmM5QEHoqAElet0QAXAMlQTAI01SbNgKHCKYgiMGs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=oDA3NBjn; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=cl8YsYko; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="oDA3NBjn";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="cl8YsYko"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:From:To:Cc:Reply-To:Subject:Date:Sender:In-Reply-To:
	References:Content-ID; bh=HNZa16IBxZaLgmPmrpxlMoYBaz8U8RsVda+np44UhfU=;
	t=1768724896; x=1769934496; b=oDA3NBjnokOe8sUaGE/HM/hfbAYJwZ/f+FqjrwZTxsKSMl5
	PPH9dOIIsjauq/wJZ6wQSmTamD7GYFzCF1t+fDpV9aPSfv41dSSaOD0OZcXugdPzi4AyGLrHCi/jE
	lTVJAy699yS+K+LfvFNQ4N/CFSBMToXL/+NTieCnUq6WlPk=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:From:To:Cc:Reply-To:Subject:Date:Sender:
	In-Reply-To:References:Content-ID;
	bh=HNZa16IBxZaLgmPmrpxlMoYBaz8U8RsVda+np44UhfU=; t=1768724896; x=1769934496; 
	b=cl8YsYkoFYmxw66pvcnxwJpByQdbWTXbJlN/vohndVv6PzE9WPow4X4VcmWWQc6eYlOu3u04Hei
	hOTNVwM3IBg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1vhO3D-000hUk-2i
	for netfilter@vger.kernel.org;
	Sun, 18 Jan 2026 09:22:23 +0100
Date: Sun, 18 Jan 2026 09:22:22 +0100
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: IPv6 blackhole route
Message-ID: <20260118082222.698d9d06@bonifac.skk>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

i play with blackhole route on IPv6 and i either did something wrong or
i am somewhat confused... I am in really using on somewhat old OpenWRT
router (Linux 4.4.92 mips, with iptables v1.4.21), but my investigation
was on Debian oldstable (Linux 6.1.0-42-amd64 x86_64, with iptables
v1.8.9 (nf_tables)), inside privileged LXC container (if that matter).

I tried to use TRACE target on Debian, but it fails on rule with match
module, thus no luck to investigate it in more depth on machine with
iptables (with real rules):

    ...
    Error: match extension not found
    xtables-monitor v1.8.9 (nf_tables): Parsing nftables rule failed
    Perhaps xtables-monitor or your kernel needs to be upgraded.
    ...

When i add IPv4 blackhole route, the packet seems to be dropped at
routing decision, at least counters in filter/INPUT chain doesn't grows,
i don't get response for ping and in kernel log (i log from all network
namespaces) i see:

    IPv4: martian source 10.0.0.2 from 10.0.0.3, on dev eth0

But when i try to same with IPv6, eg.:

    ip route add blackhole fd16:b::3/64

(it works even without -6) i do not get ping response, but counters in
filter/INPUT continues to grow and nothing is logged in kernel log, thus
i guess that packet goes behind routing decision.

Please, did i it wrongly or it is expected behavior on IPv6 or ...?

regards

-- 
Slavko
https://www.slavino.sk
