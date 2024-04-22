Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7A152168
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713798769; cv=none; b=LNxqZCY3NMdy5shRNJwwOJMiwyIW0o9jcEStWEhCeKbcJlIIpn5imTvwNVVRfU72Upiecnfh+KTvzkp7QbX2DCBmN9EgZjsDn06iA2J19r8BiwLXtzjMg1MR4Xep9rWjK0dWq70AkCehulDIk8lGbAPcMlxvljeISiIT5O/CRe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713798769; c=relaxed/simple;
	bh=U5uY0Ns0nyKzUgpaTHZFhCLIl+/5mTc6iz9nXGaGqTE=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VyxJvWyDrloBCa2vyrfh6vVKNCRttO2iD1M8nSyHSZuDOn/CHPwyqGOnCsOj7Sm9DUyMNF9UgVfsiv1tsaCw85BtFxWf/5nOaH49czgDPvkUSIfI8rix5XitH2cjGwTUJjnn5purktzhyO7bwIwRnJ5tmnrGhLLySlBwOV/fZP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ozcrF8mL; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ozcrF8mL"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VNTJT2W9Wz9w83
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713798761; bh=U5uY0Ns0nyKzUgpaTHZFhCLIl+/5mTc6iz9nXGaGqTE=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=ozcrF8mL6lDv7MV9V1v2sIVfB9DHLHD0/0s5pDXnRnYlZs/Pa3UaTsJnFjZDmlZWk
	 uLSaUhkxajew3Cfu0MxEvpot9uY8Df9NrtP1EWPBAAwJS5xxmM5gdwvm7tDg7Si0gD
	 X/o8LJYozvtnCUAQZKHjXqJ1r8Ur8vmNCT40j1go=
X-Riseup-User-ID: 7C01D17DE3383CC402CFF1D98F633A5FB129D05E60C61D938049596891CD09A1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VNTJP4mH8zFsjF
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 15:12:36 +0000 (UTC)
Date: Mon, 22 Apr 2024 15:12:27 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: DoS/DDoS protection for end nodes
Message-ID: <20240422151227.4b022e75@localhost>
In-Reply-To: <b513f4de-6717-4306-b56a-70144a59dddc@naccy.de>
References: <20240417194340.20430839@localhost>
	<7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
	<20240418121340.58c1fa6e@localhost>
	<07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
	<20240418153254.65058b50@localhost>
	<b513f4de-6717-4306-b56a-70144a59dddc@naccy.de>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks for the feedback, Quentin!
It's great to have you here.

As discussed in another thread recently, I wonder what your testing
procedures are to compare the performance of one ruleset with that of
another for the purpose of hopefully optimizing whatever is possible.
