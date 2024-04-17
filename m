Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56A22338
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713383041; cv=none; b=dLLNIibj/gZtHZhRDeOfWg5xak3aJNFNx6cjVEyQBfN9UDmUf8ORGScG4hQoS0FEOErbGj7ji7vmeyuyFf4vD8+YOAn0I36mlGHlALa8V5wOlVHlMwDwU2gNrqK6SPCDsR6Zfl1reI/kZbPRhWWUr8DIUALrw5HNmqSS6uwIRGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713383041; c=relaxed/simple;
	bh=Ms9hLW9pSXE9BP4BjUMRimqxxpqUGW7K1W8bj8220rU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=JEJOO2w+vJBY9pub5Tvp+w+jOEluxKWtdZNFRzz49RIcWuYl7V8c2K2zEywPSL/Y4DEU/JCP/uR3gxsX4CtNcfEc0Cv8spBYsz2MFYUrSpTXUrQHW9xiGkhSuz5rk+wgUi0GiEj2llmUy8zUmSbwrJQ3Sgal6ISJWsguBUpKd7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=bkhX1HVz; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="bkhX1HVz"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VKWYh74Hpz9wN6
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 19:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713383033; bh=Ms9hLW9pSXE9BP4BjUMRimqxxpqUGW7K1W8bj8220rU=;
	h=Date:From:To:Subject:Reply-To:From;
	b=bkhX1HVzxdhi9hptWvCgzmVQSOZhBXlskdvalMkhPEN1avRld+ue9d6eDg37z2n7P
	 s29Vs5bipPqlbSwB3vfwwOv+7ko83uqKpdBqGKGCsW6DYP5SO56kO+NKo8ScHhGjAd
	 VwOSy9a7SoGQB+yZewHSeL3B7JoDqBrWpo5xN32A=
X-Riseup-User-ID: 1CCB198484843179A168A1404B05DA35CB6858647C750BBBD37F0218F12B9394
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VKWYd3P8bzFtXs
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 19:43:49 +0000 (UTC)
Date: Wed, 17 Apr 2024 19:43:40 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: DoS/DDoS protection for end nodes
Message-ID: <20240417194340.20430839@localhost>
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

I have been searching and reading, and reading... I understand this is
a huge and complex subject, especially for a non-expert. I read earlier
discussions on this ML - some answers seem to say it is futile (i.e.
something that should be done by the ISPs, not by the end clients),
others suggest there is benefit in doing at least what is possible. So,
I hope to have some things clarified by the experts here.

XY: I am trying to do what is right for the network security of a SOHO
LAN. The nodes are distrusted, i.e. there is no assumption that they
are/will always be "clean" just because they are on the LAN.

My questions:

1. Is there a point to attempt DoS/DDoS protection directly on the LAN
nodes (Linux based)?

2. What is the right approach (using nftables)?
