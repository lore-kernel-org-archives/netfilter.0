Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0934715DBD6
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713442433; cv=none; b=aTjBb40Zd9ZaVw/BYUaNLLBoz3v3wZJl+lK+GSqZv4vTiKtdJnwfZDKBe2e8uyJGvjBW0As1l9Fq1GCMPuh3X+2VTV82GwirTmpgfXs6FZMmmZB0zKXxXd1/k9UPOzvmGMmyk4dEQvBljxWvdcj/gNAUyYO+W+hFwq8GFMCSMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713442433; c=relaxed/simple;
	bh=ilYSGQslwXDoVNB6QBFZIZJKGTiK1OVLoyGsXvhxfJ8=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjBvex6sApQTDQghU7g7DdTxiUubEOQq0BhBTMQq2KXoCwUBqkS14aWqxlNjxWUphbNCAv3/L1mGKrh3PqqfU5Hw4WTItys7aWM42JpgiW+c+m5yGFOLkb+GlM3Q4Gz9J+ch39yvhlJupq9LK+2l9LqxxjwJpIWMBNEicZ77T7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=nbDK9+h/; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="nbDK9+h/"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VKxWz36BDz9vMt
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713442431; bh=ilYSGQslwXDoVNB6QBFZIZJKGTiK1OVLoyGsXvhxfJ8=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=nbDK9+h/BqoIgXpZ0tLItGZGr1XBqs8xQ7hC5OujhqN/iineAuEgpFTLkEhcalv0j
	 Q5yg9VSDaGp0nF2pPuNFkU2IATcBC1Ac9roG457p3FXdkLK9vyIIBz/QjBZCTfoffM
	 k47MB8WgLDAupKRqyqtvCxO9Py9n6++4hRd6fHgw=
X-Riseup-User-ID: 2DD6DF0B4E2F3D1AEEB66C3182B4AF13C21CD65D795FDDA46F83CA47E55C75DF
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VKxWy18Z1zFpyd
	for <netfilter@vger.kernel.org>; Thu, 18 Apr 2024 12:13:49 +0000 (UTC)
Date: Thu, 18 Apr 2024 12:13:40 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: DoS/DDoS protection for end nodes
Message-ID: <20240418121340.58c1fa6e@localhost>
In-Reply-To: <7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
References: <20240417194340.20430839@localhost>
	<7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Apr 2024 20:25:51 +0000 Serg wrote:

> Your question is too broad,

Yes, because the subject itself is broad and I am trying to figure the
general idea correctly. AFAIU, it is performance.

> However, for high-performance scenarios, XDP is a better alternative
> to nftables.

After reading your reply, I did more reading. A few interesting links
(out of many which I read) from this additional research:

https://cilium.io/blog/2018/04/17/why-is-the-kernel-community-replacing-iptables/
https://github.com/mbertrone/bpf-iptables
https://www.phoronix.com/news/BPFILTER-2021

IIUC, there is this general long-term idea to move from
iptables/nftables rules to BPF (bpfilter), thus gaining performance and
there have been PoCs about that back in 2018. I could not find info
about how this has actually progressed (as it would really not be fun
to write firewall rules in C, parallel to using nftables).

What can you tell me about that?
How suitable is Cilium for SOHO needs?
Is bpfilter practical or not yet? Any documentation about it?
Am I looking at the wrong things?
