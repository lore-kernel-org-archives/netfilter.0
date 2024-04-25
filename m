Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C0438398
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059053; cv=none; b=ffDgC+d6VdXpFrG3OoeL4oMbR0nFsupnIMkUCKtl0R/XgyvgArHuhe1opOeoxPyWnkn/QHtAaEw5h5YjrmcDY2zVI9Vr8HmVxWf/4TaGZ3alCFhJh9+SsNEra5QCEm5jjqMFMwntYD6qqRO9aKXLNCgxAwlmh2cXFvdwkEsckqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059053; c=relaxed/simple;
	bh=n25XGknlUFwnW3ZIpeUpB4PsTdIC3yNZJRPYysyKXLI=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RHEwFz3fZnWLtWMR78roy0JzNZDUB16yLnoq+Pnm2/sxeR66mlQhl6jTNOk7OK1bTIDntZsPss6mW3HHgqb598dg79OZoe1DAHMtSS8D+9Sq1Ucj6O8LoGeHfKnSQe2+eYeim2TS6ZmaCls1txP3Ld5XgSFf+yo3c3H1sHOf1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=UqaDenxD; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="UqaDenxD"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VQKZ267hYzDqS1
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1714059050; bh=n25XGknlUFwnW3ZIpeUpB4PsTdIC3yNZJRPYysyKXLI=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=UqaDenxDAy7brMZ/+k6Q3dmoUj9vukdEfp6bZqYKsIh2E1j7XA7FJhvW7okvRqxma
	 lU5hrFy0l6E/MbSoFyAixeJy+gMyiLNgEKJGduDoLbAKe50BlbviRhN8y9K1k3qbHr
	 gTzi6FMbIllRUPkbbX7MLna5kCVFa64zztZDW7iE=
X-Riseup-User-ID: 42CFC5DE284797482ACF073A34D534E53B53556CE681B2DFFB850C8D64ADDA43
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VQKZ06jtJzFvpV
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 15:30:47 +0000 (UTC)
Date: Thu, 25 Apr 2024 15:30:31 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a dynamic ingress device(s) list?
Message-ID: <20240425153031.063010a9@localhost>
In-Reply-To: <67e12cc1-47f4-41c8-a574-194a19afba34@app.fastmail.com>
References: <20240424180331.3dfb6fc4@localhost>
	<3b215f04-cf5e-49d3-9166-3806b3e53471@app.fastmail.com>
	<20240424192033.5f05ef18@localhost>
	<eb3a3017-e09a-4484-9a48-abf3916e25c9@app.fastmail.com>
	<20240425141258.0f32e644@localhost>
	<67e12cc1-47f4-41c8-a574-194a19afba34@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Apr 2024 15:22:45 +0100 Kerin Millar wrote:

> I do not know exactly. I'm running 1.0.9.

I see. I guess I will have to consider my options until a version
having it fixed makes it to "stable".
