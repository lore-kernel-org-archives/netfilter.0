Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0E82899
	for <netfilter@vger.kernel.org>; Thu,  9 May 2024 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715260526; cv=none; b=knjOyf+Ym/uv5WD4NkbXH+Yps8oBrTfLSoqeMsvXz45iyG4CNsvTAlRKjAQD2/v++hFwNW4eoVRKIU9KE4FErCHNNVkpgBZg6kseE3hSirH3+UzLzf33ZH0hjknxq5gAmZdhNu29/s4gL4a20wH5i8bSJ/mydyN6tln1C+BuhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715260526; c=relaxed/simple;
	bh=dr5Q6XQpjsSqQsLFSSvneoReFUQLWGzwMgZ8GIZLBUg=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJ2XA7mRybItdV0HgMGxjHS05k7JyQ0+xACx3sGYQ9laGYzlWNP0i/skGvi7w4v65/lPvc9fkVKEgifzgxwbKBooTAU0aMmjfwnPgISXOmSL6HeX0UivWkdQJ2N9PovTaJuinZEAjCmLnW8VrwslIOHeuxEMQWvY5OsCyQwCSRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=kJzfOn/I; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="kJzfOn/I"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VZsvB4LgbzDqdM
	for <netfilter@vger.kernel.org>; Thu,  9 May 2024 13:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1715260518; bh=dr5Q6XQpjsSqQsLFSSvneoReFUQLWGzwMgZ8GIZLBUg=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=kJzfOn/I5bURxauJISPEIIu/wiC9Hxkm1xaWJvciRrqXJPcbwd8R8pl2jyiNZBAPV
	 Y5p6/lGPbH4LZvRTnbQc7b476XS/e4cYqL8kDllMRVsrUPFIByb17cNCUgsRnHUCSp
	 0CaX+KR5kXiFM/c9I1JAnwtFOm5elt0bEVMtVmA0=
X-Riseup-User-ID: EF0A2030C2467038ED07A6F8546EC63A12473521C10BC96A4B67B36CE4E21A4A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VZsv90zxPzFvRT
	for <netfilter@vger.kernel.org>; Thu,  9 May 2024 13:15:16 +0000 (UTC)
Date: Thu, 9 May 2024 13:15:06 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Sets nesting/reference? Complex concatenations in vmaps?
Message-ID: <20240509131506.1ed813a0@localhost>
In-Reply-To: <dd5723aa-6516-4cfc-9a24-bc3e599dda54@app.fastmail.com>
References: <20240505192531.5e4ed8a8@localhost>
	<20240509124230.6e5fdb9c@localhost>
	<dd5723aa-6516-4cfc-9a24-bc3e599dda54@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I understand.

What about ct state? Is there a way to have something like (quoting
just the inner line from the map):

1 . 1 . ::/0 . ::/0 . { established,related } : continue

I tried using the sum of hex codes instead of words but I got only
errors.
