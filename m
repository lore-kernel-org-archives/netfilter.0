Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3191E529
	for <netfilter@vger.kernel.org>; Mon, 17 Jun 2024 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642589; cv=none; b=SVbFInSdXQGY8Ny2DEfb7xCNoS746pVbbKpRDeOAKRiunwUZuBQIqJBXftP/jB9wCyi3Ly10C0HpnFC9qvwohXGwES6X3epbctu1y+jamE+gEeipXwEwjgmaxg150VqiEmKuEQ5uDKv8Vwb5jBp1Dkof5Pjm1tQlAyS6KALpAg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642589; c=relaxed/simple;
	bh=EjmdFaPsn3vP6Nyst0ovac5cthatSpMVAZZ9YJrAnn0=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thq8NVgupEjrGwmLxmDLykjsLQ6VfvDRdB1kf9LxuqnT0GnlyKpWSi01oxXe2BCLbJW74vqnjjOjRz7xjZDdQSgUGZ1j+C3zW4vToeazmxnThFHh24GyJSqU6x06pkPHAXo5LQwbrLt3LfPEMppQj+O8kUYrvj8+z7FLWBFk1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=BENULQsg; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="BENULQsg"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4W2wfz1gttzDq9W
	for <netfilter@vger.kernel.org>; Mon, 17 Jun 2024 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1718642587; bh=EjmdFaPsn3vP6Nyst0ovac5cthatSpMVAZZ9YJrAnn0=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=BENULQsgUFJLOJlgfkr5uN6gx27jkW3/HEYdqbZTtP/VfaHoxQFB/0+pOcSXFpQPH
	 ejJpP8Axdv9aL313pbOc3iRkGNVcAG9vz4SN1NA4cmLuO/W0dYytnADtthKfUEja7G
	 JO4UdPh2E2j5T/kC5NxchXfiE9jZrQaxyJoqhTOg=
X-Riseup-User-ID: 9A527F195DBE3A0DC237BD92D25D4FBFEE84414EC468D4A356CC4493A4F48698
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4W2wfj1ypHzFsnN
	for <netfilter@vger.kernel.org>; Mon, 17 Jun 2024 16:42:52 +0000 (UTC)
Date: Mon, 17 Jun 2024 16:42:34 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a counter for vmap verdicts?
Message-ID: <20240617164234.5a981d67@localhost>
In-Reply-To: <77cb55f9-dd40-4296-bb5d-666a7bd81f77@app.fastmail.com>
References: <20240614191511.3e9cd1a6@localhost>
	<47e42cb4-dbca-4586-879e-21f0752ebf03@app.fastmail.com>
	<20240616171648.59271196@localhost>
	<75dc80cf-0cbf-4fc5-aa99-bc97e908b64f@app.fastmail.com>
	<77cb55f9-dd40-4296-bb5d-666a7bd81f77@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

No worries, Kerin!
I have read those. Your attention is always much appreciated.
