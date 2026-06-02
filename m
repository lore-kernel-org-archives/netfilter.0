Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C53361DD2
	for <netfilter@vger.kernel.org>; Tue,  2 Jun 2026 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417561; cv=none; b=edDqR0OkqSguHYQTCFQaHTS7wQl9qKhHRtPsc9TkNeGg+MerCnGwLFR+aLu+1nYEnbU0vL4+a8AyNlVgyFbnPz80ZG6daAewljnaAk442ggzWs2T6Sf2KWeUhm6BuQtvBVEpK/TXaJQB3nkOzgWnBMhZlDP8bJZu589wgUVnrQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417561; c=relaxed/simple;
	bh=jetuxH/Hf5283VvknyJAt74xjynkq2oyVgBR1Taiwno=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=p3GLXY3gBmipN/CBLBTTeC/kRdPwxRob/qzrVRj3FNMw4kWFPvHgGojprgkm0hScj4LvwLGjoRz7tPFWvX6P03TefmcT9QoHrBXdg7ZHN9GykB/vxFYBuJcojcTGe7M8ppLeMZNHogBGhprvhCwFumyxKT4y7633BJ/EAbz8cGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=KAFxnPi5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SZaR6xCq; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="KAFxnPi5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SZaR6xCq"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 4CD0E1D0004D;
	Tue,  2 Jun 2026 12:25:58 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Tue, 02 Jun 2026 12:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780417558;
	 x=1780503958; bh=8y7dRwXPhM8qQ+DkhMQ3yHon3uVAEVQy5LOMpNYAw8Q=; b=
	KAFxnPi5TzhAmreTeHYX/Z0jddyUilAzr9swz4Nz3hnhjVCmZMYRKe990F5r5ff7
	cU137611vwCzq+pe2Nbql/ZPS1iOExo/XCSfZRp0pPtOVlZR79j+L5ll5mSM3csf
	VH+mwrzuWrm0ChECgBIoPLKTn/E63sPC/EmgkNxK1j6EjoneibkzK+ni9Vd5tEEa
	sf/jrOVIeFhWu6eG9spqhynD6kyG5QDym4efUgVaupa4WK7KX1uUNTlhsVEJLvg6
	0VUcuNalSwXr1Qz1Yx9skkYAGM5YmF8E/EezqbiDlRX5UZN1crAVPtNR3iLV9ocn
	iGRqItB81JqwdOGPl8wuIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1780417558; x=1780503958; bh=8
	y7dRwXPhM8qQ+DkhMQ3yHon3uVAEVQy5LOMpNYAw8Q=; b=SZaR6xCqP9gxXVpxE
	OUtht/3oodyYJ2xZK/x4Txv3Zz0075Xzc8my5oJvQWXZSnPnZSTBv0Tkfnzlkz84
	8d5iOS9MefY5ML73w7bgZI34iFDxMhQ47jv4c40e7o7vpVfFoIzBW1lXKFRKKVcS
	pipjaiSFphoXTTn204Rl3vIBUE109CCs8tuaIN3Vibfu86Z+n3YHUeeS9j1sgO9N
	5zUOBnt/dqbRV0pDylmpFtGz9IvU46GO5zXlDMDBDa02ajc+bxPq7ZjfRYHE/Y5s
	Cd4Bp4DbMwwbmsFy7QOdC78ww1KoRWK6NSd3VdfMCmZzyXsJDbT1o5q7xB51ANc/
	owGmA==
X-ME-Sender: <xms:FQQfalHxGRE9g890gddKKhGgvo_qLDyN3Fs__VAQbHVAHVjvQvmGLA>
    <xme:FQQfalJZFSff3M6B9Yr9XiyKF-sW7Ht9EFfk0h6vZi_yVP4yvmpCBvW75t7rVCFII
    F1DLsr226o3PSjUuMhl14VcFQ3f4V0Brq3GLbUfF8cwMNjlzXWw>
X-ME-Proxy-Cause: dmFkZTE2wKIFviduYosQOXUc7wzhPpYItZugnMpkllp8HO+HCu7A4HOQC9DrJwZ/Yw320R
    1z3LVfVsHUfOM5NcDKwLR1kbIJoDGJv7WIGZ7TYlvUMkT8TRXELytMfeoI6+OgELqGh9cF
    dv0+nIRxwegneH3f5K478SoH+bYKSxJGZLKWT+7at/m9WjKnSPx/TiWEZbFXGTyYWZYxj1
    VfYuWxX4Klld1y2Od7X/T8GqiUmJHfC5+IjRhipOSz+STTGxQcCTYEegrC2KNNLfeoPrUq
    IBMJ6XcArUu39RFQrfvSAqrbCB06r/PA/CVbE88HWcBYrs9ttj+fyz7H5cGOiJgpWCRGmp
    HTv3h58ZjBiztJm0lsrkCCIu4tTzErnNBwohLhULkSdPSLTi2eNp3v4D2dqmk2l3oFheZ7
    KucU22v/60lkG5nSyPZYzcA4Ho03sdXo4ADSUmMhQrO9UDbZbPliO3/7ApaQYkh78Qf73O
    YUt/5uMt23z/7LAfsmwuS27+6t+0+a0kCga6EWV+r2Sje1C9PsuRVM7ZaFt6ZvclznP1kM
    IuiYeZ02h7w74ofRMA2MKFeM94RhyCO0ykMQE2L/CtDcYsGL9fhdmuXnvbjN5KBADTqQih
    hANoQpBEj82+Sd+sUnclAlYVUpnOXRCHH1soZcc/2NEdBqgMZvBkm3SduYjw
X-ME-Proxy: <xmx:FQQfas6CSsvQ93S3LejauOVFbf9qzE-Fi2RU7h4yAKBiOYeNz-bdOA>
    <xmx:FQQfaiOxvlf-Utux_IeYRdk50lYAdiuCptHRFDxGFr9JijPWDbI2ig>
    <xmx:FQQfaqmQLzGByI0pI7X7U3qtYs7GKT800OKid74IlCVu3lE7kebEaA>
    <xmx:FQQfapRl1kg_xEXL5FwtVbwd68wTA-AwMCb7fU2GhL309lwD08IBog>
    <xmx:FgQfavm_jmFcy8wjf93GnLo-kNOUEX78Imh9yqWHhWIcWRoNwzbs2WWi>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 98A63216008B; Tue,  2 Jun 2026 12:25:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8Q2qJYAM7bV
Date: Tue, 02 Jun 2026 17:24:24 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Jan Kasprzak" <kas@fi.muni.cz>, netfilter@vger.kernel.org
Message-Id: <93605739-24d5-4402-9212-b06ffefe9b46@app.fastmail.com>
In-Reply-To: <ah7ylcA705Ai0HQi@fi.muni.cz>
References: <ah7ylcA705Ai0HQi@fi.muni.cz>
Subject: Re: conntrackd master-master IPv4/IPv6 configuration order
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Yenya,

On Tue, 2 Jun 2026, at 4:11 PM, Jan Kasprzak wrote:
> Hello, netfilter users,
>
> I plan to deploy a pair of Linux routers/firewalls with state data
> synchronized using conntrackd. Unlike my previous deployments, I would
> like to use both routers at the same time:
>
> one router routing IPv4 traffic and acting as a standby for IPv6 traffic,
> and another one routing IPv6 traffic and acting as a standby for IPv4 traffic.
>
> Can I use conntrackd to synchronize the state data between these
> routers? I am not sure which commands should I run at takover time
> (as described in conntrack-tools/doc/sync/primary-backup.sh).

You should be able to go about it more or less in the documented way. Just be careful as to which configuration file is used in the case that you are running multiple instances. For example:

# To be run by the script that commits the IPv4 states into the kernel
conntrackd -C /etc/conntrackd/conntrackd-v4.conf -c

# To be run by the script that commits the IPv6 states into the kernel
conntrackd -C /etc/conntrackd/conntrackd-v6.conf -c

The same goes for the -f (flush) and -R (resync) options.

>
> Or maybe I should run two instances of conntrackd on each node, one for
> synchronizing IPv4 by default in one direction, and other one for IPv6
> by default in the opposite direction, and having dedicated scripts
> for promoting to master/demoting to standby/starting up for IPv4 and IPv6.

The idea of running two instances is sensible. That way, there can be a distinct failover procedure for both address families. If you do this, remember to give each instance its own UNIX socket path, lock file and multicast group/port so that they don't clash.

Also, note that conntrack states are not synchronised in one direction. Rather, they are replicated in both directions continuously. A receiving node holds the replicated states in a so-called external cache until such time as they are committed. The commit operation injects them into the kernel conntrack table that Netfilter actually consults. The internal cache acts as a mirror of the kernel conntrack table (the commit operation does not touch that particular cache).

>
> And two separate conntrackd configs filtering out the unwanted L3 protocol
> by universal prefix address:
>
>         Filter From Kernelspace {
> 		Address Ignore { IPv4_address 0.0.0.0/0 }
>                 # or Address Ignore { IPv6_address ::/0 }
> 		...
> 	}
>

Yes, this should work exactly as you expect. The first directive should result in state changes pertaining to IPv4 being ignored. Likewise for the second, only pertaining to IPv6.

--
Kerin Millar
