Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB03149DF0
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714054406; cv=none; b=c2ZCQUR45EUg5/jPeVRVctPzJ3/Nb5Y00XT/tMd7v7udZmut9C1J8EdV8b/zF8fZgGi+c2gKDgpPfi75YkDy0RY3yLz6NsjE1Z83GMabQNrQb9tRGgJHc3tHBORZjor6xV2YYXdSjcJM/BKmI7gVJZ99Np8CHbfrqEudSa0Bkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714054406; c=relaxed/simple;
	bh=Q+yqfMZ5n2+fqXnxTnnhYqsxx33v7qWqZIDBxetEkg0=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NGj82jubvmO1wWknV9f5oxfOqihWbdpk3bqSXGDFMRGIovnx3oeLeaFWUcW2sFzSWyJC1rt9jmTgANeTRYS8yK+TcpMmyNv3ojs/raFrsXOomexTHfT3YD4u4KOdRgScLNZo7GUlLIuY/tLS0CEKHhF3G0ODn65L8bbWCb8c3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=glJmL0uE; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="glJmL0uE"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VQHrZ6WRvzDqm5
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1714054398; bh=Q+yqfMZ5n2+fqXnxTnnhYqsxx33v7qWqZIDBxetEkg0=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=glJmL0uEL1KZz1y2gfsEYCNyiVNq5T1ps6nfJyNuiUkBFpV/RDaoimpcHfo2A2tGD
	 MHZyBjw8n7azSqf7W82/CCE54Q2o3eZrN99FcPXR36KBAv5oNau8gYu+i2w6nII2tc
	 4I1tWMhuY/tozo5ngH237h9IEc3wKNVQevgW31CA=
X-Riseup-User-ID: FED59ACD9940FD4634C0252D4431F737CEC8092866562FB3DC249D3434FD8267
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VQHrM1Cj2zFt4K
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 14:13:06 +0000 (UTC)
Date: Thu, 25 Apr 2024 14:12:58 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a dynamic ingress device(s) list?
Message-ID: <20240425141258.0f32e644@localhost>
In-Reply-To: <eb3a3017-e09a-4484-9a48-abf3916e25c9@app.fastmail.com>
References: <20240424180331.3dfb6fc4@localhost>
	<3b215f04-cf5e-49d3-9166-3806b3e53471@app.fastmail.com>
	<20240424192033.5f05ef18@localhost>
	<eb3a3017-e09a-4484-9a48-abf3916e25c9@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Apr 2024 00:25:31 +0100 Kerin Millar wrote:

> I see. That has since been addressed, at least.

In which version?
