Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01755D460
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796216; cv=none; b=CYB9rpBCjd0V0+XWpcce/ek3g6F63E2YJNbV64A4E4VQnHD44Gwo6MjlOZNP2yhUg74CcaSv8zSqET65NjgEt+nECSM/8SKTum7BjK6H+5R5h+o2cHO5Yq56pCsdtYx/bGQz9/syOBN1RB3jhvakg7RGYdpiLkKqgop0XMUtXSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796216; c=relaxed/simple;
	bh=eMgdUYthUUbON/4j7RSw/pHFu6iFARVSvHwSHg/upLo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=m0tzWmFK4ZRW+9BeCneGGwaCgOjeNOyNYgxm/DMqyZ30vRsLaZBwBMOPzwxLM+S71dfDxbG1H8/2T++9kAHJCJadeaAU/V3naqw3QPMVSgVPbJXUjPPToZ+F3XV8Y5wTVpNNL7KCgqC6WiDS/Rnj+VxNzlQAHR3zqkaI6SGJVsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=tD6vAb0B; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J6rjOmnu; arc=none smtp.client-ip=66.111.4.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="tD6vAb0B";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J6rjOmnu"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id B6DE25C00A3;
	Thu,  1 Feb 2024 09:03:33 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 01 Feb 2024 09:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1706796213;
	 x=1706882613; bh=eMgdUYthUUbON/4j7RSw/pHFu6iFARVSvHwSHg/upLo=; b=
	tD6vAb0Bu7TRcj2ktKbPWrqyDck8n/L+E82Rlxqoxe6IQV1XDiS/lW1vQbe7mXEm
	s4/fpUB10UUFFdFMawu8p46G+y6QUdbItqk0+7T0fOlHhcxNu9FbUTf1AzSePjvM
	uqcFhmdIO25lvclbUy13OoAiln8UA0wVp5oMhmJzeSqeCSF7m4xf9TrZnmKcuOTV
	Vb0DvKcRvYTTm6crqjtwF8UkE3q2yUr9bvCgKbqpjAshtSfIMHHmVcZpIenyVt+F
	NwqwdydaddYTcrG2ZeYRG+0bhaJGUQIjtuxq7XFYa21InfHzHh7pdfG1XrzgY6c6
	3DJi8yxAWOn2W0SwkMZT9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706796213; x=
	1706882613; bh=eMgdUYthUUbON/4j7RSw/pHFu6iFARVSvHwSHg/upLo=; b=J
	6rjOmnuVOVHAUkkhin0wMNUwHtTEV0lzNyTir6bNn5+juaL+3e+vWVZvOgC8pQHO
	ph5DjF+eaggbzJKxqdZNMNih2ekNCOOw9XaCowwSd5BXJokth4TfbsUsMA05HDKA
	3QMNpYWa07z0DSFbREU69DuQdKc+hiGALPLeC2taz88W0V5vBsiUKzkg0czbjjKK
	kG08KgVcfHvnPu3sc+eNYQ3sSZCFHEpIqta824YzqN9xbJj7FhCFJdhAuscd5GtT
	DltfuJQBK20pkOtn0AG7svQzpwh5snAWSmvC5z/bjuzMQeKbQwB6HHAlSTqcEYJQ
	nlClci2IMx80UT5yYOstA==
X-ME-Sender: <xms:taS7ZZfT5oDp6HazSMxy5is5Dzi_4SsNXRSRq53lhALT8CDyGgY7TQ>
    <xme:taS7ZXPdi43_ygp3_l19yr-VhsZfo1wBzGLPmB97UW0DSb7KvCGCcIsrqSdGSy3BS
    MHSy6l8CKy9gmLy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduuddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfmfgv
    rhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtf
    frrghtthgvrhhnpedtgfdufefhffevvefffefgudfhledvteeutefhkeejveelfeeiffdu
    leelgeetteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:taS7ZSj05sTYn-Y-_q0VZwFFQ6AIGDy-nPBCSFbIxRsokSgJ7fxYvg>
    <xmx:taS7ZS9RdV9QpjFeel21yY2tMPJrD8BcH5YDAQdFmkj1bhmOX-7lFA>
    <xmx:taS7ZVuPe-HXERRmLjOsYDE5_AJsViJCZCgBar0bmy1x35fBkveIGQ>
    <xmx:taS7ZT1ufx12gUCRaMg-oOFoqcqR2zWcmB4dSVL3BOuWe3w1MiyY4g>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 054CC1700093; Thu,  1 Feb 2024 09:03:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <566650f0-e484-4189-8928-f8a205acfbbb@app.fastmail.com>
In-Reply-To: <BA79D432-A474-45F1-BD3D-EC1B523DD818@slavino.sk>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
 <20240131221012.289b2a17152cbcae39132ab1@plushkava.net>
 <75cb1437-0fdb-4599-aa8e-9f12fdf6057b@slavino.sk>
 <327e8447-e995-465b-9569-1a00fbc9ad68@app.fastmail.com>
 <BA79D432-A474-45F1-BD3D-EC1B523DD818@slavino.sk>
Date: Thu, 01 Feb 2024 14:03:11 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Feb 2024, at 1:42 PM, Slavko wrote:
> D=C5=88a 1. febru=C3=A1ra 2024 12:48:31 UTC pou=C5=BE=C3=ADvate=C4=BE =
Kerin Millar=20
> <kfm@plushkava.net> nap=C3=ADsal:
>
>>The problem is that the size isn't always shown. I complained about it=
 here:
>
> I afraid, that it shows configured size limit, not real items count an=
d does not
> show memory usage (on my version)...

Ah, yes. That won't do at all. Sorry.

--=20
Kerin Millar
