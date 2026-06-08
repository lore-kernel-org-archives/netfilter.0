Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708493FCB0C
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932359; cv=none; b=Fs0Ia/kqkl+Od9kjmLL5jPTzZCAMu88pMBrmB1k8qFvnvq5HDHLI7FXgu74b+C5zm4o2TBpFO+fl65kfwgUCASXQ8iJBEIiA1BbzB+fqJWZlNWbY9qBBZ44J8hvIGUUUpij3XOnTsKlKF+Sda9oIHksN0aogpXdVsBzCK3DaSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932359; c=relaxed/simple;
	bh=vlqFtwT5RU6ZnnBL9tzEMvBNT5LS2jpFgiFiuK6ngw4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YT0mUEDU0eSJiNe/js5m1miP2QRDcZH22mMRp2qh0RriL8tcvDdjZI98tolW73gt+mJcrHKdA/h0FFGJKm7PaC9raTS0C2VShkMW+jyrxf97NTavKBowXd3yRebwaGnM9kqx2IaEsmPn8A0J8gend3H938wWNAz646ps+JUu0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=IWu0wKcm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R7Ejwyj/; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="IWu0wKcm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R7Ejwyj/"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B312714000F6;
	Mon,  8 Jun 2026 11:25:56 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 11:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780932356;
	 x=1781018756; bh=vlqFtwT5RU6ZnnBL9tzEMvBNT5LS2jpFgiFiuK6ngw4=; b=
	IWu0wKcmyx++ySm1rBNWChFRJYLpq7b7i6/snJb5OFL6OT05M0nLBiKk4Pw5oJST
	ynejctjq4nU8ETpbGFeii1xZeI6Vtjf3RggFpqOHOYqAcCNUrNcXKAjWJYu7FfL2
	+aJWFLgZPmixgq2+r3SfMK/X5cPfYaHOf0cbDIsud7bRveCIzYRcdl6lgOzbmWxX
	ATVKrI9nBK6/wUYAp/IPH05S/JWjJXaED+Q52YHV+DNQuPdJ3PAkZN46t6Xg2Bwu
	Knke0HVjJPknMpolslIbV7oO7G3pQUnTogdI5T1Wui0p1QZjDQquqpKu2gvlhdos
	PwdeyDHmK8ZS/IbqUGYMSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1780932356; x=1781018756; bh=v
	lqFtwT5RU6ZnnBL9tzEMvBNT5LS2jpFgiFiuK6ngw4=; b=R7Ejwyj/4Le52j2co
	Y3KJc9ffscuYcd1wZk2EMNgbvKUWoDPpR9DY+dLZtSZhCXWbrxToNusBlhLkfrKR
	BqCWnmoAD/P6UqdZJI/w33HS/m1Kh5fV5DdBOYFx33QmKYZGwdcmJCv0iJkn442V
	zSxO4qcETQpimQihaQEhmuuKCnjdhehcIsKRUsZ63bm0mbnK23mHUAtezmnrxEeo
	11+BovKvkrX9kfP2B4pvRvRL+inbmUPL/3+tnC9Tmi16+G/ZZ4GYojq22TuT37eM
	ZR+vwjbH3N6QD9r0x395c9G4A36524TRMRuT9P1uu2+AjOXmFJWpeC8916HzLxhF
	QQQPQ==
X-ME-Sender: <xms:BN8marTZbFmJ_16gAlnUKlrI8JVLsAtWEoJ8qtiGJYwVDjRL9K23Qg>
    <xme:BN8mank9b4Sc80om06SCsY8NtjvaPhestywyNZuK42_xxHzw431ogK52TRLl3VzZP
    9eQfrd3DkFaa40s-oBbm8HVUhi_HMaJvHfcosrwykOVeJHqeZY>
X-ME-Proxy-Cause: dmFkZTGaOn4a/JJM4BYZh9em40OyTcv/ujgM8BjbPcbIDxJ97EaYUbtqCMPwybN+n6SScN
    wdzXd+uauB6VdphF/ktYZBboCe0FoJ/oA/g74yGotsAtzhAEXPMDuZsg99AJvzfVS9n7T+
    6Ry2sQKJ2WSRhf7pM12Xsa3WH6aafrc8qTj1Q6RSdOempRoCHsEb28C/6Cp2KbwrePxaCn
    mn2OSfnIBXH0CJjeSL6cTkxzzMBllSNDXPCo1MinCYUXVfauCHu2PAv6/ukWc8LZZn8l4v
    mVHKoSsJNfX2iyO1nrpXeyPwiCxY2RdwSQtlFfo/yfbdhk+wJYtYg7H1R7jPXrBSRPqVE5
    ocgjypnbG56PulVVqZgQd1bPX/HkVanthvGgRPV7MIw+4DdmMJknfMh5yqQqGNS6ITe7lA
    9eJp1DtXkp52TdUNMlU9nKboi4bG54izsjQr0I+XIW21TFFZlonbVO9J8h7b1xhb2UZc3E
    PIRJOAANdeHbcJxnSqylHEv7FcORqfeZV3GpeXTn6j2NkmdpAC7LzU81BOe5feQw/q8tam
    OW8hsURCgEUE0Z60Ok8ILrfUUg7GwmGvMU041LNWd/egDhGIbiUfT+Y21s8D4rVN1oLzPB
    sTsRK6B5g8lAvBFARO6pdmPxZwAjfh7zHKTx6oUg7gihUfSeVn85byqiU2Tw
X-ME-Proxy: <xmx:BN8mat8VMa-khsB36K-5oZey9ILJNw45y77iGwwqRGVjyrbm4novOA>
    <xmx:BN8mavry-mTdBq5YFA6pkiCDUbXhmj2XfOOi4VV1u9moHXDLoHi2Gg>
    <xmx:BN8maimOZCl_JUbqZqK6aoR9ibiwzMNdXXqLzy2rv3iXyulgHPASlQ>
    <xmx:BN8mauJI7TCxWb_25IfCj3rai9fuvIrNDp8x_vhR9m_VY446KGNpMA>
    <xmx:BN8makBpGRng-7kmR2SYOpa0yc38eU8MnkIa0OkP1F3G13EMkroryPEY>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2CB1D216008A; Mon,  8 Jun 2026 11:25:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABFZICgcHfNg
Date: Mon, 08 Jun 2026 16:25:35 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Message-Id: <82f3a1b0-0594-409f-ac37-4573e6f31796@app.fastmail.com>
In-Reply-To: <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
 <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
Subject: Re: Question on rate limiting on nftables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jun 2026, at 3:32 PM, Slavko wrote:
> D=C5=88a 8. j=C3=BAna 2026 12:45:55 UTC pou=C5=BE=C3=ADvate=C4=BE Keri=
n Millar=20
> <kfm@plushkava.net> nap=C3=ADsal:
>
>>If the problem can be characterised as "I endure too much log noise fr=
om sshd and I find it annoying" then perhaps configure sshd(8) to additi=
onally bind to some other random port than 22 and expose only that port.
>
> Not worth of change ports, soon or latter it will be found
> and abused as default port.

In my experience, choosing a random high port has a demonstrable effect =
on reducing sshd(8) log noise. I make no claim that it eliminates log no=
ise outright, nor that it places the service beyond the purview of bots =
at large.

>
> Fail2ban or so, can block addresses selectively. BTW, here after
> long time (1-2 years) of banning the counts drops from hundreds/thousa=
nds
> addresses daily to tens daily. Currently, i have banned 30 addresses
> with bantime up to 90 days, from that the ~20 is today "spike".

I understand that you probably have different requirements to the OP. St=
ill, no userspace tool is needed if the only criteria by which a ban is =
to be exacted is that of exceeding a TCP connect rate limit. Netfilter, =
itself, is best positioned to manage that.

--
Kerin Millar
