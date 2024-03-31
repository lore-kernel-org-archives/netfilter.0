Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DDC2F3B
	for <netfilter@vger.kernel.org>; Sun, 31 Mar 2024 05:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711863643; cv=none; b=oOscPs0d9x+yFzr58S3qT6hskBsZoGSV2vWvBfFf5zJlxUz1Cp9eap/lRbAHa+vq3X5BkZ+l7vBSZr6S7FLaDwUrlFjDRTq/DR3hi5nazCBJ9ogef47MNPWjFTQjdrp7rkFYJT6gF0Qw4XDE5IHa+fZNafg5j+GyWNDXLRplW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711863643; c=relaxed/simple;
	bh=lxMq5oT3dgiuiqr1Fw271+14oTEL7q8q91tN5ojkriI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=GG0KvJcoYT66afr+Y8efZEukFZ4CdyeFrU1GJEFCyAlbN/bwHVBkzxTbzp/g/MLGzJz6UYbmp6RCAldaTC3IktslhXyysLdMDif7Dm6agUx+Rf6Il/+BIbsFC3ObiGewwee87FX1Qyxgx+R5hE/AcCf6OWpdOqXdUDhasmh++pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=fNBtSqBH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NRONjNxE; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="fNBtSqBH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NRONjNxE"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 5F1F118000DF;
	Sun, 31 Mar 2024 01:40:40 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sun, 31 Mar 2024 01:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1711863639; x=1711950039; bh=BnY/qohCTu
	uWY0jdtB+HKAZeDO5kZll+uVu8Vo4pSRQ=; b=fNBtSqBH+uuoL3uVEJ2qyjepB1
	Hp2JdZvZ7eVvrkZH59vTplEgZMoX3+U9jNZFaGImLsD0itzDGjh1tzNEgrMl1J2+
	cCH9lM2Tc4fYOM84+jRh4i1HIesloi2L6WGiASZaoF80u7v6UOfjirJE5bM5k4Hd
	b9UzpsiUlFl+nIkEp28zy9c2pVyAtb2hWHibpE4mWvbYOAmpsg48OCiHEyWOJv5j
	nvnN5D/mJwsnB5Rptt5O560UIlo8a56T84958QGgu/mUbyvRFtdVaFT/DOxQsshZ
	8+1xkhSbiXve+nTw7GdUL5OdCDM+h3pA3jrzYPZvfEiNUZQGFzVne7kmkjwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711863639; x=1711950039; bh=BnY/qohCTuuWY0jdtB+HKAZeDO5k
	Zll+uVu8Vo4pSRQ=; b=NRONjNxEVlcHENyMlDS/9IkBKeDqP5EqgrwJ6I4rgzws
	HnxnwmHhdvy18idhRWN9KGlG5aruO7NTNPZT8y78dxPKl7WopvjlUFy1BzZ/HeMq
	RGTKk3iVIDPu1sWEkWXWArNLT14waYEipRU/kZYUkD2p/WBM4bdnbgUEzPIlorUr
	5+hBvVGqj8PrKN7h9zEpG4xCxNbSwZoZ6E8szgAgzZVKYPW6yX9pj7SCsu4igyNC
	Q9H4sxSymh7DFlfiUdI2axmMHFqIl/241CeMj758pq7dxy2fhwfJWFz0HxtpsUm/
	CWsJ2Wm8v7ZMaXd24+sLGu80Nedo5cwMTxj5nb8/zA==
X-ME-Sender: <xms:V_cIZiaSkztaJNsnb8PfdZnNCYcwjUJMJN-xgwKQl_-MTlJaL78TCQ>
    <xme:V_cIZlZ6Iep-K5FymJG1Gn4eCXieaXw0OZvugSbfiY4sM1StoVMY7xigPtxOmWmMo
    QDw0SQSn1OkRieJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddviedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfmvghr
    ihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepkeehfffftefgudeigfekvdefudfhhfefhfekffdvvdefkedutdfhffei
    geegvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:V_cIZs-y0hZSbVJcH2tDzA7Is0IEseBLSbp_FNwm2PXIT2VlN7WJsQ>
    <xmx:V_cIZkqIE6L1OwRa8ziaxz9rdE97VUwc7ujWem0qWGRnUiKwcf5Cyw>
    <xmx:V_cIZtpHP5unPlXs9BegzDjVPo0i75c9thAPXt1n-jLbswQtphPAuw>
    <xmx:V_cIZiQQXr68pM2-PSio7V-HlT1AhrXKCGglUWp0mbPHwjf12J3CoA>
    <xmx:V_cIZk22FdaceFr44ulmcQgpqNk4DwFovAIWKCi2X82ej5A3v-Awmpm5Jnc>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 97BD81700093; Sun, 31 Mar 2024 01:40:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <80c37117-e985-4657-a73e-675e52777bef@app.fastmail.com>
In-Reply-To: 
 <SN7PR18MB3887FC43932FD714B8C8864B97382@SN7PR18MB3887.namprd18.prod.outlook.com>
References: 
 <SJ0PR18MB388483F4136B4AEF9FF7F8F097392@SJ0PR18MB3884.namprd18.prod.outlook.com>
 <20240330062742.abeecf69e3c13c6faa45e276@plushkava.net>
 <SN7PR18MB3887FC43932FD714B8C8864B97382@SN7PR18MB3887.namprd18.prod.outlook.com>
Date: Sun, 31 Mar 2024 06:40:02 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Blaine Elzey" <Blaine.Elzey@cygnalabs.com>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Rocky Linux 9 with firewalld and nftables always tracks connections
Content-Type: text/plain

On Sun, 31 Mar 2024, at 12:22 AM, Blaine Elzey wrote:

[...]

> Now that I know the underlying nftables configuration, I need to 
> incorporate this configuration into the firewalld configuration.  I 
> understand if this is off-topic and I may need to post in a different 
> forum.
>
> I see that firewalld says that direct rules is deprecated, and to use policies.

How very helpful of it.

>
> Unfortunately policies do not support notrack, and the necessary 
> arguments that I have tried in direct rules are invalid.  I have also 
> come to find that the firewall direct rules only support iptables, 
> while my firewalld.conf is set to use nftables; thus, unable to see 
> nftables tables and chains setup by firewalld.  Maybe the nftable rules 
> from firewalld override the iptables rules from firewalld direct?

Rocky 9 offers iptables-nft, which uses nftables as a backend while continuing to support xtables extensions. Unfortunately, it cannot be relied upon to translate the syntax of a given iptables(8) rule to a native nft(8) rule, even for those rules where it is technically possible. Consider the following.

# nft flush ruleset
# iptables -V
iptables v1.8.10 (nf_tables)
# iptables -t raw -A PREROUTING -j CT --notrack
# nft list ruleset
# Warning: table ip raw is managed by iptables-nft, do not touch!
table ip raw {
	chain PREROUTING {
		type filter hook prerouting priority raw; policy accept;
		counter packets 0 bytes 0 xt target "CT"
	}
}

This shows iptables electing to use the CT extension from xtables, rather than produce the native, equivalent nftables rule. Consequently, one ends up with a hybrid ruleset that can no longer be safely managed with nft alone.

So, should you wish to try the firewall.direct(5) syntax, be sure to define "FirewallBackend=iptables". Further, in each case that the backend is switched, be sure to stop the service and run "nft flush ruleset" before starting it again.

>
> At the moment, I created some workaround scripts from the information 
> in this post, and call the in the systemd  ExecStartPre= for DNS 
> service start.  I remove them in ExecStopPost=.

I fear that this might prove brittle. Presumably, firewalld can be instructed to interact with the ruleset in such a way that the necessary rules are lost, well after the systemd service has been started. Still, I can think of nothing else, other than to forgo the use of firewalld altogether.

-- 
Kerin Millar
