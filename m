Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68D44644C
	for <netfilter@vger.kernel.org>; Thu, 11 Jul 2024 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725318; cv=none; b=jEDymCxdPor+eIM2BJnLxXP74ZT94lOotpJBoT/M1EfeL2R0bukfX+fjuzsO6CcvyNnxhuouL38gSeyXwkbfU9pnlPa9o9RrpQz1DTW5myiJQaQI03a+Po1YLcixRzgH7jrJC5dgKaravW44RtgSm9dFsdJ2TnHBN6In7v+0Z2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725318; c=relaxed/simple;
	bh=HMmNDqJP8hSqaDdflrqysN3F+kVysVJbEA5XEVx7EaY=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jr6l0HVZ39KRCHDUieG5NKH7B5ly96rq5Yk1G3F7jeac+iYJluUrPlAPSbai+YgItY2eu0fvQWn50awlJPc+PgRQ1Cykadj2gtRfmVFiod+dz7BCmyOmCVRMQzvZ2aIc5D1YhNcbA11egMY40YvNp7G66H8GD5M83OZ5EKT0Zzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=MkWn4rMy; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="MkWn4rMy"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WKkvS3JZVzDqMS
	for <netfilter@vger.kernel.org>; Thu, 11 Jul 2024 19:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1720725316; bh=HMmNDqJP8hSqaDdflrqysN3F+kVysVJbEA5XEVx7EaY=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=MkWn4rMyCVGa0GpFSgzSN8bQo+cVR40beUTWuLRPx5FQDyK1+gJk3XEa1b1Gx3tZc
	 ISnVb3SYsVyIvahqDfPdONHtOcPHIpp7ki3MWLu54wvbalpUAq+EKhmzhcfLvf4v8n
	 Ot5O0+PU6Vg4gkhdUi6o2+IwR+nRpvYwL8CaorMs=
X-Riseup-User-ID: 52497F0FD7EEC3C9A8235F68E5F825D8C508675F6D528733E5637451FD4926A6
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WKkvR3KMBzFwbl
	for <netfilter@vger.kernel.org>; Thu, 11 Jul 2024 19:15:15 +0000 (UTC)
Date: Thu, 11 Jul 2024 19:15:12 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables rule optimization - evaluating efficiency
Message-ID: <20240711191512.084c060a@localhost>
In-Reply-To: <20240710213901.GB550@breakpoint.cc>
References: <20240702190318.618a3933@localhost>
	<20240710183451.0f193976@localhost>
	<1c12afa3-40fd-48df-9076-92277570ef3b@app.fastmail.com>
	<20240710213901.GB550@breakpoint.cc>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Jul 2024 23:39:01 +0200 Florian Westphal wrote:

> In general, its best to compact the ruleset as much as possible
> and use sets/maps/vmaps wherever possible.

That's what I suspected too.
