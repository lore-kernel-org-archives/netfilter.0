Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D3919258C
	for <netfilter@vger.kernel.org>; Fri, 23 Aug 2024 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724440493; cv=none; b=q/XnzfJTTrivyVv9atBy1t029u+HHrkhZvFiJpNmw4BHGftQH5GS3ZfQtEpkM2/xaXYSu2oPMaYQkTm/HHQ+0OV512j1W1XgQgE3lpXBSraxjw14i+U/VQTKGTFIejkImbFDlUbtXv2kBcEieHNKBSLnxFxGfE7K5oOLlYEvoFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724440493; c=relaxed/simple;
	bh=XjB7ZYUtwrc+/EsIteuyVGjsTsGjUZuaRj8USl4OPQY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=XDHMX8rU0WKfX3qXKIq3Bzg037uz5TBELmg+kSOiEiLir/AHOVl07rugwV0g74oXDJrvPDCs8IuU5oEgaCfFFQjERzwsjfflKK+P/9wjVxNqJtPP/PI5fo0YYZUWQNEwdVTAsiEAv8KGGOEqGjy5D7rForiRBiUz2FMNd47OkhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev-mail.net; spf=pass smtp.mailfrom=dev-mail.net; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AI/+iAyf; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev-mail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev-mail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AI/+iAyf"
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0F3F31151AD0
	for <netfilter@vger.kernel.org>; Fri, 23 Aug 2024 15:14:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 23 Aug 2024 15:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1724440490; x=1724526890; bh=JAzPlguQjLZ2t
	xX17stH5HtTbpb8iTn37F/6fCuVt3I=; b=AI/+iAyfmUHvYYUv3kee1LumygOFd
	e2sAMbsqITRq4eX8heALvAyFWlk6YmjGNDMB74WBYK91djk3iwkN4IYV362JlMdK
	yux4V1GMAcdLwnEUqv2ALj3T4Zz5O3z42aVqk8EWuGzJbqo7Dc3pstSXO2/qwcNs
	454/LllWT7aU6N7L+R5yRDWaurCbVsUbYStFTS/SUQCY7YKofJMqVA4LBNituBEb
	v4B5QApGM8bpe/Qz6oJY8QlJgQmgXTSKfrWdPS4k9J4XbVGLyJCUUGjW72Fdaj/V
	vG4dBppQsYsXzQFHH1/eOdE0pHMwNm6bbqujOlKbS49jRs+qoSo5SnP9g==
X-ME-Sender: <xms:qd_IZmbtTCZydR0On7qaC2Nxf2BAnaTVh14qJMvOq3OVktHYfukCSw>
    <xme:qd_IZpbUCAJ-mWcXYilDkf6fBQ0T9bwV58gvmtJwiM5GMtEfkX0L3Thy9mdH6FJ4B
    NJ2w8ZN4VshSi8A>
X-ME-Received: <xmr:qd_IZg-gadJ0l-cSNVgxJEaQc83iglGcYko76k9G431zZ2EwHOHwyRvnexK-VBpRDPX79XqVszSGgzzj1X8Ld99NsYxMq6X_GTXq1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvvddgudeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgg
    gfrhfhuffvtgfgsehtjeertddtvdejnecuhfhrohhmpehpghhnugcuoehpghhnugesuggv
    vhdqmhgrihhlrdhnvghtqeenucggtffrrghtthgvrhhnpeejueeuueegteehudehffdvvd
    eghfeuleejuefgteeuteevhffglefghfeutedttdenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehpghhnugesuggvvhdqmhgrihhlrdhnvghtpd
    hnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnvght
    fhhilhhtvghrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qd_IZooMflHpGI4Rin99XmO6eipXNuTrJ8V_bPPsgaecpUpR_Pw49w>
    <xmx:qd_IZhoXa2nyIZikF60yxCxAv_DiQVpzbJX15gjbNpNMZVEcUlODXw>
    <xmx:qd_IZmTOOHJX0yNsJoIyFCAql9-k7_TbRObYS6tDcKvBGylbqoVLpA>
    <xmx:qd_IZhpKaxpFtXe5UR8tUktM6GBmq3CbHmGYIMvQsTMkwv7liokhVA>
    <xmx:qt_IZilCjjsy60-DH11snC9X0A5R0f_J8fvImiZ6cKXW6NfHy9P35sZM>
Feedback-ID: if6e94526:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <netfilter@vger.kernel.org>; Fri, 23 Aug 2024 15:14:49 -0400 (EDT)
Message-ID: <5e5fd477-c8d1-4985-b269-ab40245fb5ce@dev-mail.net>
Date: Fri, 23 Aug 2024 15:14:48 -0400
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: pgnd@dev-mail.net
From: pgnd <pgnd@dev-mail.net>
Content-Language: en-US, fr, de-DE, pl, es-ES
Subject: nftables' ulogd2 group "#" usage -- variable substitution possible?
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

i've built/installed nft + ulogd2 from sources, master branch

both are available

	nft -V
		nftables v1.1.0 (Commodore Bullmoose)
		  cli:          editline
		  json:         yes
		  minigmp:      no
		  libxtables:   no

	ulogd -V
		ulogd Version 2.0.8
		(C) 2000-2006 Harald Welte <laforge@netfilter.org>
		(C) 2008-2012 Pablo Neira Ayuso <pablo@netfilter.org>
		(C) 2008-2012 Eric Leblond <eric@regit.org>

and generally work as expected

rule logging, e.g.

	meta l4proto {tcp} th dport 22 log prefix "SSH DROP: " group 2 drop;

works as intended

for convenience/readability, I define an alias var

	define $LOG_ssh = 2

but attempt to

	meta l4proto {tcp} th dport 22 log prefix "SSH DROP: " group $LOG_ssh drop;

returns

	./test.nft:123:63-63: Error: syntax error, unexpected '$', expecting number
		meta l4proto {tcp} th dport 22 log prefix "SSH DROP: " group $LOG_ssh drop;

vars clearly work elsewhere.

is variable non-use intended/expected here?
or is my usage incorrect?
