Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC447F4E2
	for <netfilter@vger.kernel.org>; Sat, 23 Dec 2023 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="OVpIwx0i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E+tqLovD"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id DAD77320014C
	for <netfilter@vger.kernel.org>; Sat, 23 Dec 2023 17:37:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 23 Dec 2023 17:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1703371026; x=1703457426; bh=Op+kI4EeGWCuOZImIa27b44W8hgY7wvr
	Mxv/DrstE4Q=; b=OVpIwx0iYURA7cepFOEfpCEn68Uh+4z3VRqRTqGhSlGVCtHV
	4k4PSQ6KknZNvcSTsOav8wU6++cPpQtu5+WaNETopGKExquwJ7oZYsj4s3IwZH7k
	kk71Lym1L9SjOxr9v2lNc68u9CfivEWyCiesZzUbJKg9/WxYM0stuWWIVkSoa6Q1
	xucWgtA+I1hy+tDr32M9bGlfh2eB9K0bxFkxSemd3BtkzMlUYlX4VeNCNBUtyym7
	4/NAbK3xabNbL3xly5f+g/LofVjWp7knCj/SbjgsLeW35gqlVZz9CzXryEu8n4//
	rrcqnjwpOtmJrHZK4JAd86X/O3bKFTtHEjda3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1703371026; x=1703457426; bh=Op+kI4EeGWCuOZImIa27b44W8hgY7wvrMxv
	/DrstE4Q=; b=E+tqLovDImCO+TLALz0+ceUPg03RbBjrYLVeXm0BFbne+l7lKUu
	rOZ5d3wYCUPIqAzSCS577IzFYfO7cgfbeY+gNZGLB3M2qMqPJXvjtOhLyJRyebEV
	7e9WugnK46oLqDmzwF06pRSiZQgYhyngs/NmFIJvglwhGjspc1KHr9vMug1JCwWC
	lsI7qbxNVHwsS/7xfrgbCEp3icKBx/tBe+3Cr0oNmAqjkQBC7pfIEMKDqL4SBJd6
	WhBNbCBDCLvOGVGt6xS9sh94Ig1otYvPl77/z7h56QO8lfMETwdzLWo9ABRIfj9L
	jGexyTQYTyi1k15iz+dAGQS0uz/92yCGLXQ==
X-ME-Sender: <xms:EmGHZT7LkYU63VRFpH3oGvr0Y1WzicMOGOXXD9FSfv_TATayhL3VWA>
    <xme:EmGHZY5Zy0SjHA-7fVRlL0sscgo-_PwdZUGv5a80eUBLsS_XGyCIxsBfAGECAdZ0E
    fZIMyBYihtiTb48hUk>
X-ME-Received: <xmr:EmGHZacNU6fOZ51b1njUaR5iRcJ3JGNFJorZcltsdI1H498rmjaEiauh2cMTszemmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduledgudeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhuffvkffogggtsehttdertd
    ertddvnecuhfhrohhmpeetuhhrvghlucghihhsshgvuceorghurhgvlhifihhsshgvsehf
    rghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepieefkefhgeejjeefieetke
    ffgfelveduffelkeehvefhjeegvedugefgteeihfdvnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegruhhrvghlfihishhsvgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:EmGHZUJGeIkTbY9-wgBc7ug1tV61KAy4znCvjNZ1yVBkNLtDagZXlw>
    <xmx:EmGHZXL6cNSeNjs-4m-_gwcpYwy-lKYApViDK3_VyNNkDM_4PcBK4g>
    <xmx:EmGHZdyqGzN5pjqEbtPa-V1on2j34aMnWtACol6MGAtaQAcHGvx4Og>
    <xmx:EmGHZSnwH76DAXSSqwO0nOYVFU6vMAIM173avJsz6xPUW9R4_RUkCg>
Feedback-ID: i7911475c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <netfilter@vger.kernel.org>; Sat, 23 Dec 2023 17:37:05 -0500 (EST)
Date: Sat, 23 Dec 2023 17:36:59 -0500
From: Aurel Wisse <aurelwisse@fastmail.com>
Subject: Vim Syntax Highlighting
To: netfilter@vger.kernel.org
Message-Id: <NH556S.G06QA55ATDUA@fastmail.com>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

I wrote a new syntax highlighting package for the Vim editor at 
https://github.com/awisse/vim-nftables,
starting from the "official" version 
https://github.com/nfnty/vim-nftables.

All 400+ reserved words of nftables are highlighted in a (hopefully) 
meaningful way, distinguishing
objects, types, constants, expressions and statements whenever 
possible. Comments and suggestions
welcome in "Issues".

Aurel


