Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB81E1C23
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728407551; cv=none; b=Yvbir+syH9peOP0vEHbxG6FEhWAm8EphgGDxe4tZikJbGs2IkqRgp6OK20GxNLBRUPvEWIdTsGOUrRTPfOKbEX3+CTmUHwrflQ14xDRv2XnE231/Hnor4deG2oqSFN/RlwrpUn38WkfTo1rXTy0+ig7FKmzK1/uHXUpJPfRCKWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728407551; c=relaxed/simple;
	bh=drXvhjQcuc1cKWA+6/apFJD3daGp4eAU2AqdWy8v86o=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=o+gAsz0+yF9imOfDfzDsuuSNnEFb6kfGp3rwqtyWUrSVhf2B2uWEHf3luXxSJOdO06xnnybBprYQMxeaT5izp9n7ZTzTg21/Ng/VsdewkXm84HRWkJeTIeXKKo2V0ONkE6tMCjIoQnkvYrZlFYgYU+i/aM2euhMwWL0YRDP0Hmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=Jvs1ebDg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K9uAGzqz; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="Jvs1ebDg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K9uAGzqz"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id E1B9F13800F6;
	Tue,  8 Oct 2024 13:12:27 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Tue, 08 Oct 2024 13:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1728407547;
	 x=1728493947; bh=drXvhjQcuc1cKWA+6/apFJD3daGp4eAU2AqdWy8v86o=; b=
	Jvs1ebDgtysUPZR4fqsRlFGQFn9cqfLX8uQGGLeNJ1ZtIJYyCRJ1fFuvg4qu3jEM
	HGwXw0YzQK42wZIGgdA4uY1ogjbpGidauvxAajAkI26AW8GHoFk6csKFYMSux50N
	nds4RZo2B39WhQkVKkZVruGyNrstJ6kq5tZqcg7GkqVso0I9C+SW7ine9nDA4hNC
	eAF1OftIn+8q5TgAouvOKsPtOIS0pajEMYH8i2btJWbIFifiR6kooOlulzP/GBQS
	SfPY0fFXlxm+y/aORLBpA6iyR/0YHk5m5C761xJ/c12wZ2H5wzUbm+9vKPDMF3LA
	P5NNsSv6DNCDdBiIPM9o8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728407547; x=
	1728493947; bh=drXvhjQcuc1cKWA+6/apFJD3daGp4eAU2AqdWy8v86o=; b=K
	9uAGzqzG18tBwl3GrKEcatJbI+M5RFPTvJ97UT0vGcBk5BZIQ1UjW+ctq4k4FpGS
	vppWIzxCbkLY4yY3yE/jfO93Wb/3S4oD7FdE/yE9SH71f7SISZynMZhfcGKFgZhm
	rmv0xA/GSlRY1HOpqxahDF0ry6yDqvjSChRVowmyJyW7+0itQKl0s0MwthlVpkW9
	qKzMfWuY88tlM7Coshn5Mxl8R0qKfv2oz3AmXRS4eW6MQfHzRo95kc/Ud8CSARXW
	nZN+y4Sdcj5ZeDlQrrQ/1LKX+BubatjhLGQEmt4qVunY1qF0Sh+Vm2EeQ1azXHr9
	HtDuv4f0j5OhkdaEtdHnQ==
X-ME-Sender: <xms:-2cFZ0IIhZ8wGo69DdgNXrqizc7djXeKTWvlMBPEuqaRxRNEOAIL2w>
    <xme:-2cFZ0Ls3ZH8MK3DnJ8yzlSLBlWdzTvh0_O-9zbG3pu8Dz1wya8fm03pvjqvkAF1T
    PQf0nJdkVO_Nvca>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvh
    grrdhnvghtqeenucggtffrrghtthgvrhhnpefgfedtfeejuedvvddufffftdffffdufedv
    ueeuleegudfgkeegkeevjeethedvveenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgt
    phhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohgsihhnsgesvg
    igtggvlhgvrhgrthgvrdhinhhfohdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-2cFZ0s8-X3boBq3xWH4k5LNSUYN31iR69t8TNPaBP2bfCTeXCJR9w>
    <xmx:-2cFZxZ6UXPYYEirjyxImniMrCZYM3iY5UzZNkHk0AVeaIrFSrCqPw>
    <xmx:-2cFZ7aD7ClL4E5eS_uTGvXwVj63_xLJwoOUwJDsFbvEL3aEGXUM-w>
    <xmx:-2cFZ9A0uBi0MnDV5eheyv_LtiAovg10s21gGw8suteaTUrRC2WQmg>
    <xmx:-2cFZyxy2eJRuYXUr7KxqQsbOCH-euFermkxf47Mon6WbPBe2p9Yge7I>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 82CB53C0066; Tue,  8 Oct 2024 13:12:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Oct 2024 18:12:07 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Robin Bussell" <RobinB@excelerate.info>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-Id: <daa4a802-c058-494c-b47b-f258728a00c2@app.fastmail.com>
In-Reply-To: 
 <CWXP123MB4792C9E58B0187197122EAFBD07E2@CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM>
References: 
 <CWXP123MB4792C9E58B0187197122EAFBD07E2@CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM>
Subject: Re: Unsuccessful adding policy to a regular chain
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Oct 2024, at 5:59 PM, Robin Bussell wrote:
> Hi Folks,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I'm trying to create a regular chain=
 with a default drop=20
> policy and not getting anywhere. The wiki implies this can be done, bu=
t=20
> when I try:
>
> =C2=A0nft 'add chain ip myTable myChain { policy drop ;}'
>=C2=A0=C2=A0
> I get back:
>
> Error: Could not process rule: Operation not supported
> add chain ip O365 O365WhiteList { policy drop ;}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^
>
> ( those carets line up with the "policy drop" on my terminal. A table=20
> called myTable of the ip family exists already )
>
> So are policies actually supported on regular chains? If so, can you=20
> tell me what might be wrong with my=C2=A0 nft invocation?

There can be no policy for a chain bearing no hook.

>
> What I want to do is make a whitelist setup by having a base chain=20
> hooked to forward with a rule that jumps to my whitelist chain for=20
> packets coming in from one particular interface.
> Then have the whitelist chain with a default drop policy and a set of=20
> rules defining=C2=A0 which hosts and networks to accept for further=20
> forwarding.

If the base chain already has "policy drop" then simply use goto instead=
 of jump. Alternatively, conclude your whitelist chain with an explicit =
"drop" rule.

--
Kerin Millar
