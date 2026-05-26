Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D312C21F1
	for <netfilter@vger.kernel.org>; Tue, 26 May 2026 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760710; cv=none; b=n2OoGy2FpJhVVmiD179sATn3jNZlZcaV+Jfy71vra8yCmPLRsUOOEkekHc0MC7ORHg80TWFFHrtOOVDbuD1r206NCZ+xnbKZqHfj1EtJgKbGvsAHu2UrMyjCPnf0MbzMUL6RIaA0tntlOSw36L3qS6rlNdv58HP9lwO+z/WMNKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760710; c=relaxed/simple;
	bh=5mDIFGa6J8K+Slt3EQT4/9WtX4vG7pSchNLauy1WmfI=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aiN6ne+aTaM3uQVBgDVXfydCRReTcqEgQNXMBdTEahrRtdR0LtQab53Hr3qFVB1QmCAjrj9YVf7orOzwpQS4t3stAtipl8B3RgcvyIKV7iIHxXCI1TdcJLRaQXtPqwZxgYGEuRLEmncWBkyYc0CwWfV203+VGzBz5dlk8Ubbleo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=jPgNCk6p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IBC0nFJE; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="jPgNCk6p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IBC0nFJE"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E715C1400080;
	Mon, 25 May 2026 21:58:27 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 25 May 2026 21:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1779760707;
	 x=1779847107; bh=2OT0HZKiltYFen3/gD4Cj1JpH8QHDb3DAczW1npM/og=; b=
	jPgNCk6pS4F4Dg0pRlydB822mvfx9rQlSjs2xuo3VJZVT7syKrG/wsoUFu896CM+
	cb3LTR5h1XxRdCtrJ6jT0PH/iog6Xi5nuYkB8fg+ApVSm0QTcyFUaGwb5Su3KEw4
	do8PYXzZrLLRGATn7+4PG5Tu6TnaA4LtoAdtLUY09oC/2w5WcJxRjCcPB02+X2DT
	ktNaCQ0wVQW9FYd7Dgr5lI+6exE8hyoG49LvjJ3jgApD/Aw+cQcz7cCim/B1RbsA
	K0cFYSkf5bJX6aUD6+RlBganzhyBJomd5eUzAVe19GUuWoouAbHUJqWPfDySHjaE
	9gAlvFzJUy3hqyaz70B8Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1779760707; x=1779847107; bh=2
	OT0HZKiltYFen3/gD4Cj1JpH8QHDb3DAczW1npM/og=; b=IBC0nFJEbQ9gDoDOV
	KZICia14b7g32jSUNUQeb/bLKSAhFbw5CS57EYs8iYyX185KNe/PkJkX6H3OCfHy
	vEDvgH0iEyD5CgCfyiIOEU1aVxFSHVWY+lRruIu+UFDM48Cn7jdVCKnXMXhuL10n
	/yNx08LwsB1Z+yA11+dPFZTYqBUpMIQkwfk3bu/tSxEiP/GNFC8Is82pZbnGacA4
	BUpd5H1s+lND8fNH9wjknzfQnx4+Hi5Hm/5h8swqygwKUn+VMBnWglpjpVEA4b2j
	hL4xmhpe7cFAmCWoWKtzr3elSBBiJ4AnDaCfMVDfDUEzRQOlbS2sX6WEA3CdUVNy
	ZV/9w==
X-ME-Sender: <xms:Q_4UaqYbtfJLqvAEBZLGcX-3YmcNyp-6l1HiSvuDnn3fhOFbq2Zx6w>
    <xme:Q_4UaoO9ilrOc0LXm_JN6HS8AgPd_62mKJaH-mZ3CepSf83mkhwSbzn7Jx5-5XJHl
    5tmNMq8N6MJUbhpmuF4sT4lW2yyyAEShJsEL7zav97a0i75zm1h>
X-ME-Proxy-Cause: dmFkZTEUeUxImL9x2pGOQxN6HcoiF3A8+fMxwL5ZDpo7/A+HRMlFaMCdok+ZBgKIEbtt8R
    xKU+ZtwN5UalXMRuZuI7DYTRc3WLMle0C/TS8QofFN7b5De/CsErjMTDiFUh1IrMLT1mou
    mSldRFIfe9bsNPcIMcpRg3BCOhH3nc0aG/nH2j2BD04cOe8E3LSBvaUsDPy5yYqMIOpW8h
    hyETJ7gBcqBBMW9m/8IVRMd3fgp2hEpK1vSoKHZ2aq2vkNrMeV2ZkGVMgepYTMfWe3loid
    0Iuy6tguj7+6DNAzCzadmmfsN5jgY5hQdYPfUuSsgDQkf3qKXci86bx2o4+1VrD9Whf5Bv
    3u02QGkIfKXvLKROePtODvlOzOtduSPhchd9mCuOH7t0hgNkXsvSYrQMgcPot7OlngLxMx
    nFGIFXbaXVkUqcuAs76LYxuzQ1rhV6azHTpZVxisbVdHR2nKvGn4PV5H/8Ks47Ha7eKUeG
    I92Hres555yN1BGa5899yEyLXer4JhSpGf4ZMvDVBImo/73Kn5mJmiG28PP8ykIUmlSty8
    f92SzZ6mA71gZAMMQIS3HaOkWdoBCO3g/+sCOZPmKBK6mvb3vLGV1gVupSiAZQubJ5RvsP
    uHx8OqOP7CEoQ4NBmJ/LJ+JBACuQ5fyC46tKZodZTgseHmIdv2EeHIiBEifg
X-ME-Proxy: <xmx:Q_4UalG4tcz4J4LANA-P0GSzlAF7mdas_Ali2fTKIx1Jqk5KIAOORQ>
    <xmx:Q_4UaoSJfr3z5U8zpG6LGhbl8Ctvpkfoy_-Q6o2UIFMkwgAeUWWaIg>
    <xmx:Q_4Uauui44UE9gjvDI20-9PB8XzMl5bdcGqqgAjjK-tLTSJKyQuY6w>
    <xmx:Q_4Uanxrhx50nqtknvn2pyKE6nsWeKZDs_16bsJCiWd_B3l7pm0Jfw>
    <xmx:Q_4Uao9fwKUEGpUZgK2muxq8uuMIq1TeRwU0um_A3gz9X42VqkFuiJIZ>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B1136216008A; Mon, 25 May 2026 21:58:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AxyL7JDUTh3s
Date: Tue, 26 May 2026 02:57:38 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: imnozi@gmail.com, netfilter@vger.kernel.org
Message-Id: <a276ecef-e609-4d55-bc71-ddb9c9ff2f3c@app.fastmail.com>
In-Reply-To: <20260525205736.1c76666f@playground>
References: <20260525205736.1c76666f@playground>
Subject: Re: ipset not completely working in mangle:PREROUTING
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 26 May 2026, at 1:57 AM, imnozi@gmail.com wrote:
> iptables v1.8.7 (legacy)
> ipset v6.34, protocol version: 6
>
> I have four sets:
>   - blockSetHost (hash:ip)
>   - blockSetNet (hash:net)
>   - whiteSetHost (hash:ip)
>   - whiteSetNet (hash:net)
>
> I added rules to match the block sets in filter to INPUT, FORWARD and 
> OUTPUT. The rules match and jump to chain blDrop. In blDrop, if either 
> white set matches, control returns. If no match, the packet is dropped.
>
> This works well in filter. But there's one artifact. The blocked 
> packets are 'accounted' to the internal server where they would have 
> gone.

The meaning of this isn't altogether clear. I presume that you are referring to counters in some capacity.

>
> To fix this, I added the rules below to mangle. Here in mangle, the 
> white sets never match and all of the packets (that matched the block 
> sets) are dropped.

Be sure that you need to match on the NEW state. Otherwise, -t raw -A PREROUTING makes for a less expensive way of dropping ingress packets at the border.

>
> Is this another instance of 'it doesn't work in mangle or in PREROUTING'?

This is unlikely. Both -m set and -m state work in the same way across tables, though the raw table precludes matching on conntrack state.

>
> Thanks,
> Neal
>
> ----
> The rules used in mangle; eth3 is internet:
> -A blDrop -m set --match-set whiteSetNet src -j RETURN
> -A blDrop -m set --match-set whiteSetHost src -j RETURN
> -A blDrop -j DROP
>
> -A PREROUTING -i eth3 -p udp -m set --match-set blockSetHost src -m 
> state --state NEW -j blDrop
> -A PREROUTING -i eth3 -p tcp -m set --match-set blockSetHost src -m 
> state --state NEW -j blDrop
> -A PREROUTING -i eth3 -p udp -m set --match-set blockSetNet src -m 
> state --state NEW -j blDrop
> -A PREROUTING -i eth3 -p tcp -m set --match-set blockSetNet src -m 
> state --state NEW -j blDrop

An iptables-save -c dump would be preferable. These excerpts don't unambiguously qualify the containing table names. In particular, there is no way for the reader to determine whether the chain named "blDrop" in whatever table that may be is acting in the same way as the chain named "blDrop" that may still exist - or have once existed - in another table.

-- 
Kerin Millar
