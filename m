Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11518EA1
	for <netfilter@vger.kernel.org>; Tue, 19 Dec 2023 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="NmGsL228";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DBkt9pW2"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 26D743200A2D;
	Tue, 19 Dec 2023 08:23:16 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Tue, 19 Dec 2023 08:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1702992195; x=1703078595; bh=iCmLG2PvhV
	aFjSnzP3UuvXtqThdabwX1xgZMc07RG50=; b=NmGsL228BH3I0forAP9EFq3KtK
	wamo/bee9a2eV2P8mgTGIkhEbayMewyqn0QdS26zjl47HH4twjbuOxyPGiDEzSgl
	Whl+26UtHp3bVKHT3zrclCSgpnaLuKQFcsCBaWHbvPBbZMGTvJ5RtT9g+AcW+jRo
	7R1mRviy/m2g/SNvxOM2MpBPDQNkMsjwNqj0zNrn6AQ0Ehyp6WPX69IYf39W1ExQ
	UnBbKP6pux0VA4C8FZfD3ERc6S5ygEPI1F8n9aV3VVOgHOXgvfUAjGrtUDHN8PeI
	/8Ikx3t0xfnj69XSpAbk+3kiunRn+/lLRhH//biFrU0beuJetHdNsbAB7l3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1702992195; x=1703078595; bh=iCmLG2PvhVaFjSnzP3UuvXtqThda
	bwX1xgZMc07RG50=; b=DBkt9pW2Y2pF4IsxVl9aXzf8xo4IFQMzFNUxds91A/yU
	80nTY7AdecIAsvAIIegW4lamb7Z3wJPeXpN41B4NOQXlIfwS4M0G0l54weMH3ShL
	f+7IQKKcDI37SsNKXGYcb3hUJ1rx4iDqnwXBhTFtgqKf6ciNVrOVSoR5DkkTE5FH
	9UHZJVE1HQnxR0uAVTIGta52TmiI1zEl0YenzlyK7g65TymQTa0uRMsS7F/R7Guk
	atvTIJ0pGYMF8IhRxY7Y308N89ZTJq85Zm1aWZnrCwWpHN84KrKDV1q/CI8E1J2p
	R05q0eb/UuPdQvNtRPStM8tm+nozi/+PNF6TmaqjXg==
X-ME-Sender: <xms:Q5mBZTrWyX_qNN-AYi6BQDlD1E6Df8rpVBvjEcwYqE6hcY0n5VNlvQ>
    <xme:Q5mBZdpu1tBGbReeyizZHFwvWLBilx2XcNJ0NZur0i__LlT_ZcmLonOoPpP3SDZKo
    9RTJjKzy2QVJbaN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddutddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeeutdfgtedtheeitddugffghf
    dugfejjeeikeefieffveduleegveektdeggeegteenucffohhmrghinhepkhgvrhhnvghl
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:Q5mBZQNnPcfTjswcDPxzkFOkqYX-ypkGf8a1dymej3acuGJhGE8Cog>
    <xmx:Q5mBZW76WNUGNrXdUCUMatgToKRcBH0tsos7vqReCw5S5sBJsEyRAw>
    <xmx:Q5mBZS45jUUYsOnaTNEQYbPz5Aie_9oyRwO4Yi3xQjSP2mzgUMjDZw>
    <xmx:Q5mBZfXiw_XW-0MtbtkuOeIyj1aoV1maSOfoDpfmx6fT6gLAL2p9ug>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 45FD21700093; Tue, 19 Dec 2023 08:23:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1350-g1d0a93a8fb-fm-20231218.001-g1d0a93a8
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <6e536dae-3a06-4980-98d3-bc52d8690a16@app.fastmail.com>
In-Reply-To: 
 <ZdqLNLBbGjZ0siZOeMmxYkCvDyQO6M9e-UxKXnR4qaH4Cw9kHMR-5VVaNfnncHZfRoe-6uUr-xogQM4srVoz4Q1396B3uVPJ0O1hq7atttQ=@protonmail.ch>
References: <4Svb6P0lWsz3wZY@mail-02.mail-europe.com>
 <ZdqLNLBbGjZ0siZOeMmxYkCvDyQO6M9e-UxKXnR4qaH4Cw9kHMR-5VVaNfnncHZfRoe-6uUr-xogQM4srVoz4Q1396B3uVPJ0O1hq7atttQ=@protonmail.ch>
Date: Tue, 19 Dec 2023 13:22:27 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: Zounp <zounp@protonmail.ch>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Undelivered Mail Returned to Sender
Content-Type: text/plain

On Tue, 19 Dec 2023, at 12:19 PM, Zounp wrote:
> Hello,
>
> If this works at all.
>
> I just send a regular reply and got
>
> "<netfilter@vger.kernel.org>: host 
> smtp.subspace.kernel.org[44.238.234.78] said:
>     550 5.7.1 Your message looked spammy to us. Please check
>     https://subspace.kernel.org/etiquette.html and resend. (in reply to 
> end of DATA command)"
>
> Nice. I am not going to try to jump through your hoops which is mostly 
> fruitless. So I register kernel.org as unreachable.
> That means, no feedback on the bug reports I submitted.
> But then, I presume this e-mail will be rejected as well.

It was not, possibly because the payload was a text/plain part this time, rather than base64 encoded HTML. In any case, the ulogd link has been corrected.

-- 
Kerin Millar
