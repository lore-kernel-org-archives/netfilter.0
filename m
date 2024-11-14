Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34947192B8E
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731599785; cv=none; b=fc44zoWOOhDkmrmsn/YXJG6DyTkABTead+g/cnQTg874tk/j1Hh5ilI4dJA6gyJcmj2RnB8SzaNmUxjg2e6B8Mz6Uoo971p4O8ZYzIM/gcDjp6tBNRTym6v3YkxElTh2fPTafIdfbgoUU86vYZxC8vaHrry94k6VebjNYyaJf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731599785; c=relaxed/simple;
	bh=qnfRZ9xeuE9uH1BfEabfr+Z+MyrIiQK8CIX1g6mh9q4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OmAOIr+f+k3NPoNNBZP/gBUinwN+yknYp6At4h1BQo4b4e3D9GUuOXLPWAlI89iXKnWCe+qeLWOwWiGuOAcmdhI2SxKFX6N3VH8hhiWObYJwnNLyHc/vPMdW7FhkJ7O3byhlh6I2UFdXGhgHmg0VbmlAz10no3H+ItWv5PWB17s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=bKFvSaNu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i5k4VS2q; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="bKFvSaNu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i5k4VS2q"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 312CA13802D7;
	Thu, 14 Nov 2024 10:56:22 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Thu, 14 Nov 2024 10:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1731599782;
	 x=1731686182; bh=qnfRZ9xeuE9uH1BfEabfr+Z+MyrIiQK8CIX1g6mh9q4=; b=
	bKFvSaNuFYw2wZdXws+eq2VQi/duLB4cekhvbeNjTftO7fp5bKaK6pV1D6aZz6dE
	Qm0ldHbngbudV0aS0v8leU0xU6Rh1Tkwt2cZqJpja8f3ppHOlluPlGuUyyTrp1Q3
	77ujM6kZvK+TPpMjYAiBObYV+Z1gntk/3m050fk/gbkuzE64UPtluGtIIX8ukotd
	kTrt9o/sRInuXsaLC9RB1vgAVoV+fC3IqehHih92kLYRggt0xRKRb2GL0CHroMtz
	wZ4UPlf5LxXrwE7PnmWmBA3qIuIPN5zpO+eMed3wbt6GorDhOCJWJ+i2AFlmkHJO
	p2/ODLKYmMzdG0CJeoemUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1731599782; x=1731686182; bh=q
	nfRZ9xeuE9uH1BfEabfr+Z+MyrIiQK8CIX1g6mh9q4=; b=i5k4VS2qI5tcJTuxW
	NfC2wJcwp2c4IIl/0JbKzzKOdPKXEoEMIIvmbPkCKwCfPntEDptmhBv/KEu/ZPZS
	nryloFsGCfoYJQFQeq5ZiCMPras0H8fv0NR9+8+bUnDdRtUBdWa88hE33Nzf/35/
	dfY3y2zixrTGFY6EY3bp6gjw/nugEXdn6nzfInLfOI2uUmr8oRUXo+iR68p6AwfQ
	+CLBywVbaqnJ4J/VF6THeg1x7vGD9pcvowDUbccAyKeusXLyyjFHcezZ5MBTr6xi
	/M0UtExfRhctQy3WUbb652LnGw/bWgbi9zxPQlzp/Lh5QyIi+MUa8souyjTRoh5a
	yaTuA==
X-ME-Sender: <xms:pB02ZyxujZVntKodCY3N1Lp_HNa9_BoadNacTWPC4DaiphZTCp5kMg>
    <xme:pB02Z-SMub523xW_MKOF_co-nOLYWMg3xCzn_pne1DHLHuF5gg1n8387_SnKXcY5j
    QK91tNqd9NEijf2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtqhertdertdejnecu
    hfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrd
    hnvghtqeenucggtffrrghtthgvrhhnpefgfedtfeejuedvvddufffftdffffdufedvueeu
    leegudfgkeegkeevjeethedvveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgtphht
    thhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhomhgrsheskhhovg
    hllhgvrhdrugihnhgunhhsrdhorhhgpdhrtghpthhtohepughlrghkvghlrghnsehsthhr
    vggvthdqrghrthhishhtshdrohhrghdprhgtphhtthhopehnvghtfhhilhhtvghrsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pB02Z0UtJnvhGtJ3Ji2AFD3Uf0etPYGnCoRumtaYT9jDcqwY1RI4Ow>
    <xmx:pB02Z4iwbJLDU19pWUplV03IB-0LrPLyGcE5w2BxLDbNSlRCdC0R3A>
    <xmx:pB02Z0Aeheh6xrYYId_A-1ho_mHICZQkJRRXTo-eNd3n69BbPI4tHQ>
    <xmx:pB02Z5L9wX2DlWsULvG8J2ENuAErjFLSUt3-DeiwnIHFI8lE6ZvjyQ>
    <xmx:ph02Z3Oz_YI1gBAQEB8ylXRh7TtbAXw927NaFzKQ1kZbtFkk2Pn8fZV0>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AEB8C3C0066; Thu, 14 Nov 2024 10:56:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 14 Nov 2024 15:56:00 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Daniel Lakeland" <dlakelan@street-artists.org>,
 "Thomas Koeller" <thomas@koeller.dyndns.org>, netfilter@vger.kernel.org
Message-Id: <1072c0ae-0e6e-4986-9798-aeb18aec1bbf@app.fastmail.com>
In-Reply-To: <04ebffd9-25e3-4dad-a0c8-503449366327@street-artists.org>
References: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
 <04ebffd9-25e3-4dad-a0c8-503449366327@street-artists.org>
Subject: Re: Dropping of the end of a chain
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Nov 2024, at 3:06 PM, Daniel Lakeland wrote:
> On 11/14/24 6:01 AM, Thomas K=C3=B6ller wrote:
>> The nft manpage states that if the end of a chain invoked via 'goto'=20
>> is reached without a verdict, 'evaluation will continue at the last=20
>> chain instead of the one containing the goto statement'. I cannot mak=
e=20
>> sense of this; what is the 'last chain'?
>>
>>
>
> Pretty sure this means It will return to the chain that called goto (t=
he=20
> last chain that was active)

That is not the case. You are effectively describing the behaviour of 'j=
ump', as opposed to 'goto'.

--
Kerin Millar
