Received: from achilles.binarus.de (achilles.binarus.de [168.119.77.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA040D567
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 22:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.77.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130645; cv=none; b=JLBePBebHJmIeArCr7SzlP75LISSf3irIBeMkQFyXN6rRxrPXOqLqgBNLG3deqUdjpfITA8FVNt/G8LHZI9rrSaU6xZK+MkFdUSBN0qAX8/a1cP0O8WzcWbaLX81SfxT+ZaXr7/FXym475HCr6z+J0R6CIik1kKlmWxhv2otyUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130645; c=relaxed/simple;
	bh=JaLLgRVrlx/q2SuaaFzdijJaCE0YXKMPoJTjDQRWtmY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=F2EUzjXb563pNTZG8wumcVUMdUcxISfR7mO7QspVVmr5JF5zo/w9nPzMrTHQLYTr4Tg6+9m1PJqKDl5X/jyk/8RmIK2/pjLIINeQ2DEBGoPiSg6eE+r5OcgGuKXOFsBoQowNygCbTvD20hLI6dn9Q82BTqnpW9DDfTcXtQh4mWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=XdZRDNAg; arc=none smtp.client-ip=168.119.77.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="XdZRDNAg"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1781130256;
	bh=JaLLgRVrlx/q2SuaaFzdijJaCE0YXKMPoJTjDQRWtmY=;
	h=Date:To:From:Subject:From:Reply-To:Subject:Date:To:Cc:Resent-Date:
	 Resent-From:Resent-To:Resent-Cc:In-Reply-To:References:List-Id:
	 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	 List-Archive;
	b=XdZRDNAgqkmRh9LCYmCVRbBB3oH4khwEeUtrsC6WXA8VndYdceLM8BFc79mT6Vr9F
	 v2mcqs/TizGHpS+xwZ8H8HHPmaHn2/GO/czyrDJLmoeY4u5CS1xQRu/svrL1n1OIk8
	 J1cQ759beErasHuj2vZdx6SPdOI8Q/JF5F8rxOQkJfjvhLqPKyeH31ytuFVYVIovgN
	 y5PUda556VQDgEBTeRshgBpkMtkmvkn8TV4/kKZjQMQEySo9R9naZaYOjxjefDYhTO
	 RlzpafhBd4hZPFCp1w0JoQW568Eyfiz4wA86e6f88ii3T9k7fQDiYPLLxLFGzwcfQj
	 5JDRR0Cqwyy7Wf0LunXNv7wEVDgWzH2+VSaqTMxRDFx/zIiiaHTFRZvyND00TRLKot
	 rtlMwvhUv9j/ieAeVzgZmDEnUEIzXb4QLkUEdc8LyV9w2b1onZztqhFbp25heKSvH8
	 B6OKfQWXZg/xA4QonXVCKvrsDXISsva7aBOE9lPsov9x8WxGIDi84qqMtfiWmbWva3
	 oShD5CbcdkcjQiIjojWCLApYwRQXMxUpFIuw0H5VdofG9ZH3FisTcLhz5pQxT+JGTM
	 8tUjhSGA3cqGmyaFcbYJm+c0EVLhtotfP/sA+UFT3jmXANykaTzK2inA0juSdPkQmD
	 JDhhOQ5d6VpedpxmeE+Z/dTA=
Received: from [192.168.20.110] (p5496990a.dip0.t-ipconnect.de [84.150.153.10])
	(authenticated bits=0)
	by achilles.binarus.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 65AMOFLl889341
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Thu, 11 Jun 2026 00:24:16 +0200
Message-ID: <06c74ee3-64eb-47db-8575-bfe42eb47c4b@binarus.de>
Date: Thu, 11 Jun 2026 00:24:28 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Content-Language: en-US
To: netfilter@vger.kernel.org
From: Binarus <lists@binarus.de>
Subject: "nft list hooks" not working (empty output)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

Dear all,

according to the man page for nft, "nft list hooks" should list all functions registered at each hook, along with their priorities, and including the internal nftables functions. I am understanding this in the sense that "nft list hooks" should output something at least when there actually is a ruleset.

But on my test system, that output is always empty. Please consider the following excerpt from a terminal session:

root@charon /etc/network # nft list ruleset
table ip t_IP {
         chain input-filter {
                 type filter hook input priority filter; policy accept;
                 ip protocol icmp drop
         }
}
root@charon /etc/network # nft list hooks
root@charon /etc/network #

Of course, that ruleset does not make any sense, but it serves its purpose for testing. "nft list hooks" should output something in that situation, shouldn't it?

This happens on Debian trixie, kernel 6.12.90, nftables 1.1.3.

I also have tried "nft list hooks inet" with the same result.

Furthermore, I have created another ruleset with an ingress filter and have tried "nft list hooks netdev", which also gave no output.

Any advice or explanation? Where is my misunderstanding or mistake?

Thank you very much in advance,

Binarus

