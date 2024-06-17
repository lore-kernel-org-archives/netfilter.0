Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21020EB
	for <netfilter@vger.kernel.org>; Mon, 17 Jun 2024 00:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585585; cv=none; b=bPi01o4TNmJ+Ubg+saH1aom0whpcrtQZK5EUl4kI06LWIBtdrF6fB36anNQ3kGjHme8jvFmm2iuWWJDP3QyKH6LeB+ufoZJORdHxL763Jn9/y6ShlN2w6lh+ddfPt9dhVGws/5OZMZyI5eTOYfVnnzF5jrMFEWQPshadlSWW2Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585585; c=relaxed/simple;
	bh=Ftl6ukf+mN2A1935lHdgcErRs7r5z4xzT4tdxOBWaEg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=Rmh7ENcOTf6wvRL4Gg2wu0Y8h+e1FPC2QVXDwpzTpCz/1kf2cmTDVb8wcM0sCIRH9Lhfudszz/Bau6zHs9XsLvomPE2TaKnxYHCZn/VRCTg1AhE8zw/KM23gKx+L7HyJUthveYockRhbNKJnbT+U8CcCdICP2iT/zwQNftdqPw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=UBrJuKHd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NjFcaRWx; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="UBrJuKHd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NjFcaRWx"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id A9A2113800A9
	for <netfilter@vger.kernel.org>; Sun, 16 Jun 2024 20:53:02 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sun, 16 Jun 2024 20:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1718585582; x=1718671982; bh=iJNr4J7JQf
	Ccfp37M+9tLW1RTOPHis27mA57gDDjz/k=; b=UBrJuKHdyZ06ng7Q4gd/DoiExi
	/JdYY54o3Us8Rerry0aq+5bvVLiRqKLi/R+QfzdfM80jlFVuMnYRSoH+gMVcsp8g
	Q6EMXuwHw+AVFPeH/YM4XbvkpxmguSsvjj0Ka7UWyOBJkuDr2wNzsQ+T1EOmCuG/
	oxVy/BwNIvEci7obt++x7mc256+dqQnAAhYV5xH2xXVM4TcY/rXPhprF3zp6d/SY
	w7iGRRNc7gs8zjVrXLLXOWXVfKDXtae52SxwHNl73qsS/BaTaVeRVt4jh+A3YAK/
	4noVTYAv/lEf3wSKSWwqSHqKdMrct4zGfVc1ctbL0eei+4bSHOZOohQT4NxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718585582; x=1718671982; bh=iJNr4J7JQfCcfp37M+9tLW1RTOPH
	is27mA57gDDjz/k=; b=NjFcaRWxAfB1Halqetj0nIUkFA4D6oxn1ol6OdKkA06V
	E0H9SYIOgzVP6KsIY/ffQS3K453m880HJWWqFjwWXOJzB3r3tv8/pDKDH0BJoyKA
	/AG57oQeL9EMd7XaeMdNaNxI1qs1XJ6FN7YWkOCW+rELMQETUkFrvAhmipAVsqju
	0OKazXJ4sDJsql5jf4cmjmG3GYKDKRMr/fSZOAnuWC+VZw7la/VHTod38ziGINsB
	10XulIvkdsU+5+0dWb6W6W4EhNRdBIW1/Jash79VCaEBYXzUPsJJT7gyFNuFI2Zy
	g9VLSNgqlyEc00wtOaG8Q+FoRRup1RoNzAWxKTTW8w==
X-ME-Sender: <xms:7ohvZjTs3WUelnb1II_NsRvp9zEVO5u2tpenduGRKW7FpqA2YTKoIg>
    <xme:7ohvZkxmmuGX_YjjA9NGSkfEVOpAYUmQTCBzf4RS2rw-bypQ-X-Yyeok7hQa47xcG
    1BI6qWjc1MAyeJ5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvgedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedu
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:7ohvZo0uFvTSJ2sZSukP03S2-yO9mUhNBczOxrLlZCsAMEm-9i4dLw>
    <xmx:7ohvZjDsI1Bd874iqn-44LGmQg7Q3sy8bv3IbkjNM3E9JjczAK18bg>
    <xmx:7ohvZsh0Av5AvctJYfEusMfs4q9zapWyMSotq9m3lCcrH5icjVMrLg>
    <xmx:7ohvZnoFPvVPlGo4fgRqimZ7gC63aHD4P2TRaJ9YDsKfyyoWKbSDhQ>
    <xmx:7ohvZkKwc7Oosa2WlBSqDAKp2tk6_ZjNL-InEeFXxrn8JueBqaf1DPe2>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6C4F41700093; Sun, 16 Jun 2024 20:53:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <77cb55f9-dd40-4296-bb5d-666a7bd81f77@app.fastmail.com>
In-Reply-To: <75dc80cf-0cbf-4fc5-aa99-bc97e908b64f@app.fastmail.com>
References: <20240614191511.3e9cd1a6@localhost>
 <47e42cb4-dbca-4586-879e-21f0752ebf03@app.fastmail.com>
 <20240616171648.59271196@localhost>
 <75dc80cf-0cbf-4fc5-aa99-bc97e908b64f@app.fastmail.com>
Date: Mon, 17 Jun 2024 01:52:31 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a counter for vmap verdicts?
Content-Type: text/plain

On Mon, 17 Jun 2024, at 1:48 AM, Kerin Millar wrote:
> On Sun, 16 Jun 2024, at 6:16 PM, William N. wrote:
>> Thank you.
>
> Please read the 1.0.8 release notes, the link to which is in my 
> response to your prior question.

My apologies. I read the title as if it were a fresh question. I should know better than to respond to posts when not yet wholly awake.

--
Kerin Millar
