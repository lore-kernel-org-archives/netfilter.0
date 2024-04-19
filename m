Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E856FAD51
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 10:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713524175; cv=none; b=Yx1iZ5IDvvc5+rhRB5i8XR+ANl1jByVlwpphhx10yAHkiOMuuMyyJ7EQfRRCcDAICPKky/Uz3eSnkDjCovIjSuzWE9zgbGlP70D+ZU09tAS8s6afi67rNmomtrb7lTlWOLWjSdH+Kx9RrC/ZsL/6R3JMFG0hpxZBo67umouCv9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713524175; c=relaxed/simple;
	bh=xiWs0DVzbn5HVLQeo9YMacq416+vkdsnNc9BYSN2YYQ=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tttHPMfqrvjtMSEF41I3dlq9JC0ULvLIWj0TpknRL8vrk3KEHwQwHUG2g4zJ3Xyfid8X72WanFC9B9vIO/n1iongIXBCYS99Ej3zf5pH2xMSa7OigZ0984Q2fR5Ud5+xO1PUYX1GN6+um94k4Vvhok65o5Lq2LAMby3u1jnHgyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=FVhnj54p; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="FVhnj54p"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VLWlp69Ksz9vZt
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713524166; bh=xiWs0DVzbn5HVLQeo9YMacq416+vkdsnNc9BYSN2YYQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=FVhnj54p35cxmc0M4u9hHgPFyZrX8KWP4qZ6HYLxymx/irAX/w/atQLgDU8Co6XQO
	 +HvQW1nUGixklVy96rdt8qOLQNnW1WYzsK+aDI/1TjKIi+VijTIn0OCA7/9ScMsxdY
	 abQTtfGeVJUpqXkU4YfLiRHmdOm1GKNgm1ZC10zQ=
X-Riseup-User-ID: E6F10AA6DBF0290E9764C3B52005BDF7E5F063E35DA1244AB04A3F32C3A69A36
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VLWlZ4NPDzFrx3
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 10:55:53 +0000 (UTC)
Date: Fri, 19 Apr 2024 10:55:42 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-ID: <20240419105542.74aaac89@localhost>
In-Reply-To: <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
References: <20240416174748.5612bd27@localhost>
	<20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Is it possible to combine, e.g.:

tcp flags fin,syn / fin,syn drop
tcp flags syn,rst / syn,rst drop
tcp flags fin,rst / fin,rst drop
tcp flags fin / fin,ack drop

into something like:

tcp flags {
	fin,syn / fin,syn,
	syn,rst / syn,rst,
	fin,rst / fin,rst,
	fin / fin,ack
	} drop

just using some correct syntax?
