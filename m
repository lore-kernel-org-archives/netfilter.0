Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70979330330
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110488; cv=none; b=ZpCGBtBlCHBN7XfliPaODWtYe50wptW7FK/m/UN/sDA73dUm5q+RE/O9BCM+PizLOueWpRYSifvfUCnB72Gix6Un3ooz8ERKjD7iJn1ZRAsZ4g6iMfr/a9knr/uUbfoF3Sf81kUpfW4+U30at/dChvNGujNLa76jmRdj6oeP4gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110488; c=relaxed/simple;
	bh=HLrWGasJagisctdLj9df6VoII+rtSYH17vlR36aquKw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Wg+eyoD2oaHfbfg1VQbuGDegFolnmqpJvbTma+34UFGtvcG+PbGGePt0wpDUTNdnO72nVBkmR3LaGVgY2r5nPorJ1F1n/dWSAy9ItPzclPVlYLPef5EyP0QoRyjkLGe67D4zkhlsNQg9ueajBwQwrngpglhbVytPMta9sktm+2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=HLsh+0ae; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fFCEB00t; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="HLsh+0ae";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fFCEB00t"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A578C14000B2;
	Wed, 10 Jun 2026 12:54:46 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 12:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781110486; x=1781196886; bh=lH0jYdetqbQuHUJ/dchv4R5IaRFF0PTL
	hje5yRY/zeo=; b=HLsh+0aenAHTNDk1dVydReC781HHgWVniZgMwyNHu425gAyA
	1eKkBCl/0Wginv8ctzn43vSHVFa2IgIJC+oGXyYO4GTrd3rXGC4dd9L+aX3ibu+I
	ZIxrqblHj6JOvKDCreIjm959xVhC5J/cJH1CmQQRM6nO2VonQfhxFFPIf45Ynlm7
	QTrW08RbXYoHxMwfrzc7VynYqfrHP8mIDqZHjBq0L81BPbZp9HTatnAurqRZbmds
	EkRpBJONhOag8N3VQDXTQTryZt3H9Lval7nT5590hQqStFLYOQYFNBOMd1VmD+lC
	G5bzjtJ2luOEhk+ERITC8ukQGZn6hD50fcYCWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781110486; x=
	1781196886; bh=lH0jYdetqbQuHUJ/dchv4R5IaRFF0PTLhje5yRY/zeo=; b=f
	FCEB00tFcZv9eV0iYpF0QK1UJX7XGqjlE1hlyzHakwu8607dD7l3PH3AClh5THUC
	ANYPzMuHs5R3Ldke5zAnCTFfdBRjFlq2wvaFo/1h2d7eDdu6t4Yjocoub5Olw2/0
	AWjCVYXLC4RgBamcSNk3xrgMt4D+HIr0IGt44GusaityLqxVWCBWmta4Op9mpPrH
	XZ2gIj7rbU0lvNWYb+prXfj90CT8Zfre+ENiZLTL+hsfs3Fqf5mTbzqtSnqlADAH
	vbQdOjw/lW5YDmJvDpjy2efI1LNpcsrlZCHMZbqBs23qWXrVZTYDf7wEskMRiCmA
	KuWZRVPP/QiXesasx27tw==
X-ME-Sender: <xms:1pYpavkFK_MyOmY-FSVyhQ0Q7oa0PMmvbvD9PZwyrQ_VvxHdZVNp4w>
    <xme:1pYpatoUynsBtpcDYA4Zg_yNMspGv8HyzCdApG2fsejutQQZDzzkP9cTAuNe4G-cm
    muYPM8nh7C7u8L05pITmKhnRuBTQhBM5BktYHQU3MVvgbzy4XSY>
X-ME-Proxy-Cause: dmFkZTEus2N8wcxlxcrlzS48v62guLGP9kMGGxMuC3jcScEZobIhte4EggoqEg68jW6AnO
    Y9DSYXSU/EHsrJ4btx3pP7U6smcsueF4s/RgQKX/dmdvqaPcKDxAuCLlM9+u7GhZQRiRAD
    jpbQFJAA6DZJaiXjmipnsC1uqJ1whB0hT5LkNPeO/QNuGEvc0KNNWmUbwCi6ykUf9nmO3A
    T5htBdawf9HOhR517taKd0tGSY7ciHfR9CJBo6wnRL9PXBZejFWdhcYpp7kvplhuGnAWHf
    MFE0g3rmlNpsqV0+xwpyVMLhmSZw7RyECOZCWF6awU2XQWNa19/vMPsWsIwlSkRKBULwdM
    s2xvTrPJhPv8e++5JbBwOhInvuHzr1rfMFrDb6sjseCPwUwbL0VqzuXUPS4BIWDTWRvUxa
    kQ6HNmBw30wz/lfopW2MDBRMAwDqFPOTDJbACGhIlYm6YgZKHGmXajY7Ik9IvbAacyKNMN
    uRXu5Xl9tE2ghiNJ6s4IP9ifYDlHkVum7gsccjeQ2aFOxXtjHADBly5tEpFpp4Kph6tdS/
    Lu+iIfNWjE0VzKkl+db532fZkarnHPlEX/a90+xE8dGda76/vucBYPqUUy6Ua/26Obsean
    GEKe42Yktf4ZgjOp1qMBFDEHJuTZ7ENg4tTWerkfsW8V9k5yoLNMlQUYJ13A
X-ME-Proxy: <xmx:1pYpamTdFiT878_t79rxGZio6Mj5-Q87vXlrAmUSka3SY_IwfgnzIg>
    <xmx:1pYpaptkruDMb37oH_s4N0J8Miia6_GmXrKx0df_NHHpREawNLRXUg>
    <xmx:1pYparaVTmuxwjohB5O38JIKqYQie-dWYR5zT5Jf9YIceaIzfMxeCQ>
    <xmx:1pYpaustV8CIXA9x-t2e5ELuO1npaCe_Se1xeg1AWk4qUfrUUP-zuA>
    <xmx:1pYpahaF5OJizxS3oKNJfRk41SPep9Mcq4--pBAjNbw2O2b5jeSpLrbv>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 75CAC216008B; Wed, 10 Jun 2026 12:54:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbmbupR3g_CV
Date: Wed, 10 Jun 2026 17:53:49 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Randy Bush" <randy@psg.com>
Cc: netfilter@vger.kernel.org
Message-Id: <ead376de-4dd5-4725-86df-bf7cf798b672@app.fastmail.com>
In-Reply-To: <m2o6hi1hku.wl-randy@psg.com>
References: <m233yv2r20.wl-randy@psg.com>
 <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com>
 <m21pef2ope.wl-randy@psg.com>
 <6fcf67b9-4fee-4b1c-85f1-597afff788ba@app.fastmail.com>
 <m2o6hi1hku.wl-randy@psg.com>
Subject: Re: prefix len confusion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 5:33 PM, Randy Bush wrote:
>> table ip raw {
>>     chain PREROUTING {
>>         type filter hook prerouting priority raw;
>>         ip daddr 42.642.11.82 tcp dport 22 meta nftrace set 1
>>     }
>> }
>> 
>> 
>> Next, run "nft monitor trace".
>
> thanks a million.  this showed pretty conclusively that the
> `/etc/nftables.conf` was indeed correct and filtering as one
> would hope/expect.  and i learned a new hack!
>
> so we are now looking for more subtle attack surface, e.g. loose
> source routing, bouncing off a legitimately open service on the
> same LAN, etc.
>
> we also see this (distributed source) attack on proxmox clusters' web
> interfaces
>
>     2026-06-07T02:01:39.274405+00:00 pv0 pvedaemon[2276]: 
> authentication failure; rhost=::ffff:85.11.167.7 user=root@pam 
> msg=Authentication failure
>     2026-06-07T02:01:42.970943+00:00 pv0 pvedaemon[2277]: 
> authentication failure; rhost=::ffff:85.11.167.7 user=root@pam 
> msg=Authentication failure
>
> can we safely just add ffff::0 to the v6 bogon list?

It's an IPv4 address being logged in the form of an IPv4-mapped IPv6 address. If you wish to block it, consider it as an ordinary IPv4 address (85.11.167.7). Your BOGONS6 variable does not need to be adjusted.

For that reason, you should also be able to observe the packet(s) if you add a suitable tracing rule to the existing PREROUTING chain. That is, unless it is bridged traffic or does not traverse the firewall (as discussed previously).

--
Kerin Millar
