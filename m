Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE81127E18
	for <netfilter@vger.kernel.org>; Mon, 30 Sep 2024 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727689923; cv=none; b=ER0ZLtcQ0Y6JpizNnco4otpin2oJzWoAnkRgo2ygiV6Oc+XKrWV4jOSwi07dYBNt6rlxGe2zNDBpSM0MzqgypNwWeMcQjfQjU2S14gs0+bGO1kZn8zuUof05F4hXKOj0NRkQvPSay502urR1fJWgjwQKcnvLEcx0YuNyXYTczJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727689923; c=relaxed/simple;
	bh=4PGdgTCT6lk8SsMm/Fgu5EPcj6HI42ZUjYr2LipQkRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xwu9TZw6mbPau+xIjvXaor8uFONUdqAN5m+WjWHboBo47KIX8GgunO9NhAjXmBtMv34cU178W3E7exK3dtxvbypCKSGrV4qcq2MippXDqpn+jTC2kf92AbDjmbgghIwrr2rWZDB2rBK//BI2XDMWMt8xDQAP9s1/MdLNUy/ndXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=33358 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1svD4N-007w0x-3q; Mon, 30 Sep 2024 11:51:57 +0200
Date: Mon, 30 Sep 2024 11:51:54 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: netfilter@vger.kernel.org
Subject: Re: Allowing closed connections time to drain before logging packets
Message-ID: <Zvp0uij4kC6Vjj9p@calendula>
References: <97d9d783d0ff4ac494b909176f2a99df2d1190e5.camel@interlinx.bc.ca>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97d9d783d0ff4ac494b909176f2a99df2d1190e5.camel@interlinx.bc.ca>
X-Spam-Score: -1.9 (-)

On Wed, Sep 25, 2024 at 01:09:38PM -0400, Brian J. Murrell wrote:
> I often see entries such as this being logged in my system log:
> 
> IN=ens3 OUT= MAC=[redacted] SRC=[redacted] DST=10.75.26.3 LEN=74 TOS=0x00 PREC=0x00 TTL=43 ID=3769 DF PROTO=TCP SPT=33944 DPT=22 WINDOW=229 RES=0x00 ACK PSH URGP=0
> 
> I suspect these are packets that come straggling in after a TCP
> connection has been shut down.  Is there any way to have netfilter give
> recently shut down TCP connections a bit of grace time before logging
> packets that have been sent after they were shut down, just to reduce
> the false-positive noise in my logs?

These are packets logged through 'ct state invalid', right?

> Same goes for UDP in fact:
> 
> IN=eth0.2 OUT= MAC=[redacted] SRC=[reacted, remote IP] DST=[redacted, my local IP] LEN=99 TOS=0x00 PREC=0x00 TTL=59 ID=0 DF PROTO=UDP SPT=443 DPT=37242 LEN=79 MARK=0x3f00
> 
> for, for example, QUIC connections.
> 
> Cheers,
> b.
> 


