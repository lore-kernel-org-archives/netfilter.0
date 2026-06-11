Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC02FFC0A
	for <netfilter@vger.kernel.org>; Thu, 11 Jun 2026 00:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781136380; cv=none; b=gOZNmcNkq2cflr31dcbfAuSrMAYssI6mQBf4SoDkWs/+FAkTjAIEf7wmqYulJFANU9d5jXCnwm/r9l9JKCK5vMuqLf1XsXcut0mB3NLcCTtO4vtq6I77IEWub9o9qvvA1tU4rc913L95hWE0BeUsQ7lzltNH2341FzWCE9R4MjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781136380; c=relaxed/simple;
	bh=7k0UJZ1LiVvoSngxD9VphVKsOBAsIBaG3SK9Pq9SvlY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PHnxZ3GBmCQ7C3cGafALqLNxdjAl2aEXgtRRwxsQmITWJxX1nrgVMy0bt8JQ2QLyQBytYnCYOPyeW1MOoldBc8C/CkvRDfr46wE3hz7TT1L/4n3Y1ra5Fr/6qHFjZPw6qedipkEhtpO90oAnzPS/fosNC/a3ElqhcgdabWl9HOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=lbtMTMjf; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="lbtMTMjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781136370; x=1781395570;
	bh=EKevVuXEuyn6aP4efQIw0I+R8Nh10ArUYnSCGBMebb0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lbtMTMjfJIU5lT+LxaWZDGY1pokGHMY+ynWa2WRHcEWR4i81SmN8tDJjQfqdB9TRA
	 jbB+vL7qwbZY29pz+Z6JuYPobiYJ/P25hwvovnDggCD9T2joUBa2Pi40EXpFujekeW
	 qB3//TfOubZaXAai1vgY62hHTDmvmPU1iPnJdbo6sIZOqePSA2/byQdQ2tQ/ZlHdgV
	 JGCEtG1uZuZknMyCEiIR+1o7jREq4mL77hj/aUHPy2r7+FgIen3QLHWBthZuVuEsLy
	 k3MTQIrDT3MbIiuVYonxN047rg+2xD5dHT7rmuRJ21Xyaxn37jQeGZ3Eb+MaNM/7SU
	 w8vdJqbS8Y6Zw==
Date: Thu, 11 Jun 2026 00:06:06 +0000
To: Randy Bush <randy@psg.com>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org
Subject: Re: prefix len confusion
Message-ID: <scvzZFFc0YAE7k_JC5BL5RPJaJmJhsP5UHJ8TSZzLVAQohQAdyhlLFw3AV9_oNq6GpFaWI8x4LKNiS4NPqOUZe0gLUhx1G0oRLStKsyGyEw=@protonmail.com>
In-Reply-To: <m233yu0x0g.wl-randy@psg.com>
References: <m233yv2r20.wl-randy@psg.com> <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com> <m21pef2ope.wl-randy@psg.com> <6fcf67b9-4fee-4b1c-85f1-597afff788ba@app.fastmail.com> <m2o6hi1hku.wl-randy@psg.com> <ead376de-4dd5-4725-86df-bf7cf798b672@app.fastmail.com> <m2ik7q1ff8.wl-randy@psg.com> <2c8aa7b9-b387-402f-be90-a59f8b669e30@app.fastmail.com> <eo6IAy4tTDDl6AcRVB1pmRAiEEylNBe2EGlUxAsDHSglsWmdaXg-oFwfDcPGyTmYP17SvtgGpOOye8uy2u9lZLgPaxuTnUWPY7jiJEgpdM8=@protonmail.com> <m233yu0x0g.wl-randy@psg.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: f6bf0ba291dd76560f1ad6b6f14f85b14001d632
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

     chain wan-in {
         ip saddr $BOGONS4 drop
         ip saddr $EXTv4 daddr $VULN4 accept
         ip saddr $JUMP4 daddr $VULN4 accept
         ip daddr $VULN4 drop
         ip protocol icmp accept
...

Did you mean to do this instead?

You should discriminate about which machines can send forwardable icmp, tho=
ugh.

CONFIDENTIALITY NOTICE: as prior.
SIGNATURE NOTICE: as prior.

Regards,
sunny
