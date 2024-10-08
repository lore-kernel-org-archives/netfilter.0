Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10E017BD9
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728407225; cv=none; b=IyRJ7pF8UU7QnW+o4uGh5/b2YBYxMNq/wh8fkGLRtq80v+tSfVvpGAOK+81y8A93MkS3eiyro51eMC7efz9VMmNJWT559hZ/ZYu6LX5eC23YEJ//mlYQtYI2iACRYz34+ROpFqJnVY9CkZ45DNDB91mFDtboMuisvUc8pEQqt/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728407225; c=relaxed/simple;
	bh=REeah73afjBFQk72b7Q5zPyngg9p9WPlmPl+++Y+/2U=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Wc/HmgTGcc+sjuPe5vQzLhiRJFmfw9iLUh9i2yxHY+UoDnUuVOpnEMEJ2mHzP0VepKdvo7uGU/BDaRB6WcIFRFLC9q18mbcjC1xBe/wAAUhyo6WAik5EH17/FOTaAlbZgCKS8WBIf8Y/dQUMCoXfBfBf9s1AMZGgnisYcQB9XTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us; spf=pass smtp.mailfrom=kevin.km6g.us; dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b=Ng6rBxfH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U4ucOWN8; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="Ng6rBxfH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U4ucOWN8"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id A78431380241;
	Tue,  8 Oct 2024 13:07:01 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-05.internal (MEProxy); Tue, 08 Oct 2024 13:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1728407221;
	 x=1728493621; bh=REeah73afjBFQk72b7Q5zPyngg9p9WPlmPl+++Y+/2U=; b=
	Ng6rBxfHF7lilDEo45KOBQfqB2ivX53A1SipjVUQVC0kU5RQNI+dkpXm2QRsUxqe
	0S1I9Xxm1z60FdWb2AJOionDcRHirnKapqWxHMYqVIJDz0oQKNq8jmwmuIg8W851
	ycpU0GN3pYQZ0VBIR+8z9Ffp1Ii4U3Y10VUi2Az5hMGkkQu6pyIegqjTfOq/eSkn
	CJ0IzsdEduXHnlc0lw6pgzV1vdgiNh5K0NWyOE69pAne4PewWVyKkaigdkU/jex2
	BBzuTN7mBUlVfsAMTrH1sjW9DP3JxiMGeYGP7No+BKY3zkMVK6sqdLvfjwxhkiLw
	W7fGpbL+gD71wfpjSHR21Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728407221; x=
	1728493621; bh=REeah73afjBFQk72b7Q5zPyngg9p9WPlmPl+++Y+/2U=; b=U
	4ucOWN8KXypcwQUipP6T0MHR9dGHS4Q0oarqNWQ6aTdTn9jhs0/+8Y2s342Vezay
	rOg3EENrIdjaBKXihjf+qOnmn/kopQFYplhRoX0gCMs/G1aFXglS0NfHxbQ1gh/d
	BwaLTkvXgM/vQmT5hDddcoDohZdJzLHp4qYwwnhm6GR2cmkPC2ZKu19qQfoXgz8V
	WeBemLqwoxOvbTU2X8VQ7WFfe25shLoZsCAVUdVTL1s0wgX7I0d6LTEpqmwa7SGk
	jFZOSFlI2XuiMBGTfrf348VrVuqp8riKpYKKGJRNo9qPjesshVAKRI8zDqemeTDz
	PiACGryAlEx7u8wXIBp4Q==
X-ME-Sender: <xms:tWYFZzOUtC_87LSEUscSpHz7KQ54NBEmoj-mVTcn1vz_vlyKaGZwkQ>
    <xme:tWYFZ98HA65pLBK55pauTGDZZC48yoXEXzEWXFC-9CfmggRr0G9p_BBye_I8stzxi
    tpklZf_JyJnUzA6LiE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfmfgvvhhinhcurfdrucfhlhgvmhhinhhgfdcuoehlihhsthhsrdhnvg
    htfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhsqeenucggtffrrghtthgvrhhnpeef
    uddvteffvdevtdeifeelffdvtdehgeeuteeiiefgkeetgfduhfevueehgfduheenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlihhsthhsrdhn
    vghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhspdhnsggprhgtphhtthhopedvpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohgsihhnsgesvgigtggvlhgvrhgr
    thgvrdhinhhfohdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:tWYFZyQMUWsuNAshABZUI6JnxRn8JfnZAQ-AXKWunyQQ_9aJu3CUBA>
    <xmx:tWYFZ3vvfTCLDy0Fs1vkD96y48Op2AKjFXYZK41R_qed9w1WtkMIUw>
    <xmx:tWYFZ7c9b3akHvZN3wwD51EvRTWhae2oGQjgAxH4l8KJnyGvvsYV3Q>
    <xmx:tWYFZz1NanbDiRa1g_6Ob-d02NtnXncBTzNJwmu9KPi4qV2H9LR-7A>
    <xmx:tWYFZzFPF5VuMoU_J6kqVs-fSNFGzuWRhyBMfkzy4S3CwUDJKiIHKolM>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 03AEB18A0065; Tue,  8 Oct 2024 13:07:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Oct 2024 13:06:40 -0400
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: "Robin Bussell" <RobinB@excelerate.info>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-Id: <d4465959-c218-4552-8aec-0776c2248823@app.fastmail.com>
In-Reply-To: 
 <CWXP123MB4792C9E58B0187197122EAFBD07E2@CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM>
References: 
 <CWXP123MB4792C9E58B0187197122EAFBD07E2@CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM>
Subject: Re: Unsuccessful adding policy to a regular chain
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024, at 12:59, Robin Bussell wrote:
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

I don't think they are, they are only supported in hook chains. Which pa=
rt of the wiki implies otherwise?
