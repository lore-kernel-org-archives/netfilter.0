Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446EA3BBE4
	for <netfilter@vger.kernel.org>; Sat, 27 Apr 2024 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714245832; cv=none; b=VihSMB9Sc1bQvNEPFkpZuALv7+v1y4dW10DwAk7uUP1jf+5OHt3NjarGAiE6RtnBWY2NOu6k7qL4O1Hl5h+dSyDz9hIP4AO6D7mwogxc94a2ELXFPT7fKvJE2gFtG410B6557Aj7FTXlSUbQOZS63K6SbJYehiFWysC8gCG1Lk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714245832; c=relaxed/simple;
	bh=+iDXfADkBHmKTj+rxFlP/gHvyskW+PYL1g5u0/Xi1ek=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsK32HdVew3cF7kw3IUaWEwmA0mJvDk3/uT42dyunlJQRQwzGYynbnUBqBhq+MXpBUskRRMfjImUMHsVYzHCba78VXVIjTKYqMBsSfAHWGxy9RM7es7HVx0c/5v7kU1ETgdK5slGa2IPKMgbvzWswLCmeJV61fPun6ePd+G8OTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=IYz6JRM8; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="IYz6JRM8"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VRfdr47TrzDrF4
	for <netfilter@vger.kernel.org>; Sat, 27 Apr 2024 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1714245824; bh=+iDXfADkBHmKTj+rxFlP/gHvyskW+PYL1g5u0/Xi1ek=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=IYz6JRM8kHtNbrolULdWDqi86ePG/rwoQ7rxvqzWMucnls3hZjNK8nbKmunldBSVX
	 3jd37n/uWJK8si/hEWcEH5D7LATpHTfAqtfjlNOh9IwpW9mYvXlRSK7fiwYGCXoh3Q
	 mATJc19FD4cwrqt57+G3vvby08wgIFwZFhm4nFTw=
X-Riseup-User-ID: A753568F539B109C3D8B50607D570B00F30CBA16168AFB9058026D8D4D5C658B
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VRfdb4hhxzFrvw
	for <netfilter@vger.kernel.org>; Sat, 27 Apr 2024 19:23:30 +0000 (UTC)
Date: Sat, 27 Apr 2024 19:23:13 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: [Thread split] nftables rule optimization - dropping invalid in
 ingress?
Message-ID: <20240427192313.4f31c715@localhost>
In-Reply-To: <20240421174726.7345861d@localhost>
References: <20240420084802.6ff973cf@localhost>
	<20240420183750.332ffbad@localhost>
	<31f21bca-c442-40f9-a1a3-d9cfe9778570@app.fastmail.com>
	<20240421174726.7345861d@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Another test, using only invalid packets, shows the opposite result:

timeout 65s hping3 <host> --flood --xmas

When dropping in ingress:

14455889 packets transmitted
(on <host>) load average: 0.26, 0.30, 0.18

When dropping in prerouting (conntrack 'invalid'):

13794361 packets transmitted
(on <host>) load average: 0.55, 0.29, 0.19

So, after all, dropping in ingress seems faster (5% more packets for
the same time) and x2 less resource intensive.
