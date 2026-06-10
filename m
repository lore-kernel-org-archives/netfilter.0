Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84F13BF66C
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 23:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781135482; cv=none; b=g9nx87U1Jo+wi6KVNplmorTkU4Cs5ZKEhQVvnITndoiZ1fC7FU6q4MyV0QTp0/VXhg29pnhaBlDvdRRfeRLkOQlpkV2aizeUdWzNcOD9VKaVpsD4gyrJ7sf/pFqJ8Tbchgv/YGC8bnloXplzh70MzfhPHM6Io8gobvxuAADArvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781135482; c=relaxed/simple;
	bh=YewM6nN/Qgb8l0Ayh+yte9cVb5qjrYUIKAbDdhN2MF8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Evd5KnZf8ZWXJzB4dXzdLEuxTnswWeLGfPFSKcK8MdCAfSwYPqn4YJezOG1czIuleScy+gtS9TJGDybsV0oIqnkOKtkAHJYD7T4dPeal/GJ34s9Y0B5vDxpi5IMjbASH+EZQMMSVt7kL+KHmpVyIZz7So3mCbUsXloL8Jq0Qv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=I8IQzO8z; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="I8IQzO8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781135469; x=1781394669;
	bh=s7/PKjkLgw1BoF5nWqmivQ3viZ6cG3vcCCf0STQ+Z6A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I8IQzO8zyNnJ5/NNTXevlzL4qsWO+tmerKGwgcYh8KAF9/wt1+uaSTia22VLs8iJB
	 hqJ5B0LArTKBaqAZlNVkI7X09lX67fksM6EDcDmWFWlvOhHlUOVoM4rDm2aFQIffzI
	 +Rm2O1ObViI69583WEFrm3J3aKW2WtwlkPQkEpLUM/vsIk1+cphqGJX0pERMUhwex7
	 1IRcfk3KBO34yWsrQ0PRMUvAKd8tfo06QltsKe9PIctmRn1Oc3mU1NuwvLsVqQ+gNj
	 cMVcOaSckmVAuMBKQGdAoLBdPE7lX2II7ZT+hxJQffc/ru151PxHl4yTuLfsynq0OD
	 x6wo1eBAOklhg==
Date: Wed, 10 Jun 2026 23:51:05 +0000
To: Kerin Millar <kfm@plushkava.net>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Randy Bush <randy@psg.com>, netfilter@vger.kernel.org
Subject: Re: prefix len confusion
Message-ID: <eo6IAy4tTDDl6AcRVB1pmRAiEEylNBe2EGlUxAsDHSglsWmdaXg-oFwfDcPGyTmYP17SvtgGpOOye8uy2u9lZLgPaxuTnUWPY7jiJEgpdM8=@protonmail.com>
In-Reply-To: <2c8aa7b9-b387-402f-be90-a59f8b669e30@app.fastmail.com>
References: <m233yv2r20.wl-randy@psg.com> <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com> <m21pef2ope.wl-randy@psg.com> <6fcf67b9-4fee-4b1c-85f1-597afff788ba@app.fastmail.com> <m2o6hi1hku.wl-randy@psg.com> <ead376de-4dd5-4725-86df-bf7cf798b672@app.fastmail.com> <m2ik7q1ff8.wl-randy@psg.com> <2c8aa7b9-b387-402f-be90-a59f8b669e30@app.fastmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 13d33ceae591d1d9e9d19f6f2257f0e85b0b2f54
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Try this:

table ip filter {
    chain forward {
        type filter hook forward priority filter;
        iifname "lo" accept # please filter this too, you'll bounce your bu=
shies (brows)
        iifname $IFACE goto wan-in
        ip protocol icmp accept
        # so is LAN
        ip saddr $INTv4 accept
        drop
    }
    chain wan-in {
        ip saddr $BOGONS4 drop
        ip daddr $VULN4 drop
        ip protocol icmp accept
        ip saddr $JUMP4 accept
        ip saddr $EXTv4 accept
        tcp dport 8006 ip daddr $PROX4 drop   # block proxmox web login
...

Basically, you want to drop anything you don't like before you accept anyth=
ing that you do (unless it will be dropped by a later hook). Someone mentio=
ned no input hook registration; that should be OK as docs say that later ho=
oks still get evaluated... test to be sure.

Refer to VERDICT STATEMENT in https://www.netfilter.org/projects/nftables/m=
anpage.html; it says '
accept - Terminate ruleset evaluation and accept the packet. The packet can=
 still be dropped later by another hook...'.

So currently, if iifname was lo (due to some other kernel vuln), or protoco=
l was ICMP, or saddr was jump4 or extv4: it will get forwarded to the machi=
ne within 42.642.11.80/30

Hope all is well,
sunny

CONFIDENTIALITY NOTICE:
This email and its attachments are intended solely for the use of the inten=
ded addressee; and may contain confidential and/or privileged information. =
You are hereby notified that any unauthorized use of this email or its atta=
chments is strictly prohibited. If you have received this email in error, p=
lease destroy instances of it, and any information that was derived directl=
y from it. To be clear, the message and its headers (SMTP, IMAP, POP messag=
e, etc.) is 'this email', but network headers (Ethernet, Internet Protocol,=
 Transmission Control Protocol, User Datagram Protocol, etc.) are not.

SIGNATURE NOTICE:
If we have not met, the below public key is not useful.

sunny_0x00000000_public.asc

-----BEGIN PGP PUBLIC KEY BLOCK-----
KEY REDACTED, WE HAVE NOT MET.
-----END PGP PUBLIC KEY BLOCK-----
