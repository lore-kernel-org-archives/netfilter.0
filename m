Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03821154429
	for <netfilter@vger.kernel.org>; Sun,  3 Nov 2024 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730628584; cv=none; b=gj2DjEVHzFuE8wPUFKuDYRugw87KlQFzzoW7EiYGIMzr3r2ghg48slTb7wLuhnpMGVUcTexjuCjsmaWz+k6gTfqCtCSXCFRnM0ZQIfc5FWq6GOYyKJhzX+yxsqhr64wCcvqWaLnFpNqifsGz6I+/mzLQgODNaz3WLoLZe4/YXYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730628584; c=relaxed/simple;
	bh=aYzKNZ+MJ70J8uch3N6ceqstRHrZcb8YraFcLkDrQ0k=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YRPGF6US/3CvSrFeClyJ+VZPIkxB99/NgElY2Gdm2PlL09lsmRMoL7WFCAXtl+9lm3XlJV2Cjkd/VU2O/hWLjgDiNMOxHaCmWIis1d8JpteYJ+fNe/qV+eWGTUPeY1xdJjZs5cNQ5LOqh0+xwVzlN4ZUnkzHb8rDylcQnbrMoUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=gpvLU0Pv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cjiXonK1; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="gpvLU0Pv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cjiXonK1"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D19C81140090;
	Sun,  3 Nov 2024 05:09:39 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Sun, 03 Nov 2024 05:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730628579;
	 x=1730714979; bh=2eSDciB4sjKECRYlA6zzaROCKnHjbQhydX1cVX3tguk=; b=
	gpvLU0PvtrnjDbvkstOighIGN56SZpbdPBoXpT283KskS9wKyHrONay06JztbVqe
	o0e1y+pKCIgmtEO9LEtu0uCdRGCXlRj9VUCBsrRKXfEOQJxssgbsZdHdSVLKddbp
	X+NdQs0VF0fKnLXZSjSn6cjNQOkr8DOjxxwCYOJATwaVTa5rIovCUBphiAWHa2C+
	lFzts0XuoOA+9gJmtkjUmaQc6lqVrvLA18zFST33tK/Urkf5FKeT/fbSgd1tzoYL
	yNBbFkIzqm2o3jYbgDp/1AVgl37xw9iZTtidKD7G6e51OUPWp6w5laTVh9bIc52B
	l8AZwbgtT63ZoDmoMwVYbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1730628579; x=1730714979; bh=2
	eSDciB4sjKECRYlA6zzaROCKnHjbQhydX1cVX3tguk=; b=cjiXonK1jkw1rwQbf
	sb90JG/7nuQQUv3Zh7VDOS36/fjmjQrTr4JyaX/CzoQXec/ZyzOQc7JVnFxPczhY
	Y/yFAZA7GLUuLNDg+vXdszJolbpCrkSs+Naxg3AyBfDIr69RqW6lL/4kKjqc2JfW
	1fir7C3KDmK2AZWE7jalGfSPd1+VFn0rtDnxqwMTkhvUbXEfkSBxEph+VFDnkqcp
	BxtJLk99YoZf4MTHzKCbEsjRfoh8Kp3q9w/SzzH5VbGrt2SOenQR1iWEGR/RECys
	vlcIuO68rIgnv7tEKvFknUx4dnjT0t8j/F8aaMCccjnoXdaig49OH2Sv0t4jYeK3
	RuWpQ==
X-ME-Sender: <xms:40snZ9gZc2zxPC-CMXe0iDs9qFmfEewdRIb5De26lnqxxU48rCQeHg>
    <xme:40snZyAtUAHTgLty98Wg71iMadN7GLcewO_WlqpnELK0fpJdRPSADNQx9wvi8ReKN
    uqkSoPtYOzd7GWe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepgfeuhfekjeevgedukeduhedtgeevkeekgfeu
    teelfeevjeeggfeigffgueekvdevnecuffhomhgrihhnpeguvghlrhhothhhrdhnvghtne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhes
    phhluhhshhhkrghvrgdrnhgvthdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheplhgrrhhsrdhnohhouggvnhesghhmgidrtghomhdprhgtphht
    thhopehnvghtfhhilhhtvghrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:40snZ9FOjuh0KO99BaUk74RpjdFrotZZjEplcGJmJ2U9alYszQTvcA>
    <xmx:40snZyTB9gqKJR39WcqgoNcbZLFDfkjt9vf1LfWoa5RpbNIZJ0YoMg>
    <xmx:40snZ6xYCt49fZadW9HamW3YILS5XBCB56i0-qKMsNphGkk328UCYg>
    <xmx:40snZ47liD2TB85wgijb89Oo4yHYJEuTDmHusJqKCtfv4rQkF5gacg>
    <xmx:40snZ_pMTw0iPgq-hE7Y4xJXnwOY0CmCofjUUcHaOP5YzaU6HlF3863d>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7F6EF3C0066; Sun,  3 Nov 2024 05:09:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 10:08:46 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>,
 "Linux Netfilter Users List" <netfilter@vger.kernel.org>
Message-Id: <f0624e62-0079-43aa-9bd9-28f820914263@app.fastmail.com>
In-Reply-To: <d985d5e4-18b9-4f66-9e24-c7b1c9640caa@gmx.com>
References: <d985d5e4-18b9-4f66-9e24-c7b1c9640caa@gmx.com>
Subject: Re: Countering some types of SSH spoofing with NFTables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 3 Nov 2024, at 7:51 AM, Lars Nood=C3=A9n wrote:
> Greetings,
>
> There is some discussion on another list about dealing with the problem
> of a type of spoofed SSH connection.  Here is a description of the
> problem, along with how to use tcpdump to identify it:
>
> 	https://delroth.net/posts/spoofed-mass-scan-abuse/
>
> One solution offered in a message on the other list was to add the
> following rule into its own table:
>
> 	nft add rule ip accounting input \
> 		tcp sport 22 tcp flags =3D=3D syn\|ack counter
>
> The following seems to load without error and I have some beginner lev=
el
> questions.  Specifically, I wonder how or if it does the job.

For that rule to be of any conceivable value, you would have to refrain =
from ever using your host to connect to an instance of sshd(8) that is l=
istening on port 22. Moreover, it does not account for RST backscatter, =
should that be the job in question.

>
> Also,
>
> 1) Do port 22 IPv4 packets pass through both tables?  They seem to.  B=
ut
> how can I verify that?

To verify such for packets that arrive at your host, create a chain bear=
ing the hook:

  type filter hook prerouting priority raw; policy accept;

Populate the chain with rules that match the packets you are interested =
in, and which conclude with "meta nftrace set 1". The manner in which sa=
id packets traverse your ruleset may then be determined by running "nft =
monitor trace". The chain in question may reside in any table as long as=
 the table bears the relevant address family.

>
> 2) Is a second similar table needed for IPv6?

IPv6 packets can only be hooked within tables that are defined with eith=
er the "ip6" or "inet" address families. Whether you would prefer to hav=
e separate tables for IPv4 and IPv6 or leverage the "inet" family to cov=
er both would be for you to decide.

--
Kerin Millar
