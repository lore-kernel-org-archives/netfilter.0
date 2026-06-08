Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111F748CFC
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938374; cv=none; b=fSGP3fN7mrlPhAQ9vj3birsF5fbOvxFoygrKdBkNCWCl3SKoo8ytMjsDEA0wl3mtwdbNOsdA67Gp0Op/dAfXg3LbsDKqN8WVGAob6SCrceIzWlh1OCcqfYcIZNFoabg5e46QYuzcQ3mKoyZWvlX/vCwoRgnIuLelJ13+AFdiVZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938374; c=relaxed/simple;
	bh=q0ICSS1ofk8NgEfwfWU5ggYYojFZ1bR/kW7i0z3gKnQ=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HqF3DZcRmHTUXDRDxde+h71EF0EaVlLmf/f7E2s4eoREeOPEy0JqJ4n40RvEmE2wXMjFyWQo9CKwAjfBj2vn2F34OkgUyKmUw6ihTp2CU1+UewphKwEoVhAksfUrgKFzgLY4Vvf1lRfa8FlTRyowa9uPh4pTO/EO20rbdC+nrYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=D3GgozHY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j/cZdUxY; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="D3GgozHY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j/cZdUxY"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 45EC4EC01C0;
	Mon,  8 Jun 2026 13:06:11 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 13:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780938371;
	 x=1781024771; bh=65Xo1iFAiq5DKUq0HujblKGnRdEwuDDehwx2yvN+oOI=; b=
	D3GgozHYpulzw9x5IH0De+DFt/2LO+TXmunXaR4D3MPV7uI04vPtn5vA2OT3jQ7/
	AxewtcIUW9z/DbQ+RgbTcj5IRJe35hZS2BkngI52iki/leun8B6JJUNUDKvY02Fq
	6FGi1s3K2UvegZSb4SHPE2Bfw39rGtIe01zN9Q1ta4nehNLj6iFWezbG6IIJal8v
	FHv/6g+acC8gKOcsnVGkE8Tsy5PBvAmPEx9v9SOdvRSD6YrRUtIHLPd76w00FRA7
	3sN+nqozPiPgfjHLsga0lwzP9KRbuT/+4Qq+Eg2s3r7/SsOnWMJOFAteubIvxRY/
	bVQSW8nYdxwssSJBE5hcFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1780938371; x=1781024771; bh=6
	5Xo1iFAiq5DKUq0HujblKGnRdEwuDDehwx2yvN+oOI=; b=j/cZdUxY/eFXLDa8Y
	H/QwnaFXLaZO3iAzGTh/cVgM10qC4bwAskvByPqb6AXPKZwT7L3MUZIlSjRJct9E
	bFUpUNe04Hwi/E/khWkHtO/rvS1b8it3HRh0tbX5IFGGn5n9PwVjpna2vTZPe7kL
	NMmwuNlU6wn9w1ex4hs4bQtP+1tU/PS6Jm3cVd508Rih7jHCyE+Knw0GJWvktENF
	ORNzBdlaYpbRW92JzP/UO6elnDg+T21DZxWeSw27C5hOBNCAdP1tag773/GHArok
	m8q2UYb+hqho0LZyRjyMdHrXarUjrwfGvdWKlrmDF5EZGclE7KcFi4uPkfOPtdO2
	KblWA==
X-ME-Sender: <xms:g_Ymas9lhILZtqOsQlSHP37nHAQTquCPxu1xrLXWp9gKO9KU9jgTAw>
    <xme:g_YmavgmOr5xzCd3uvMK4B3IBPiDPmsh-i0GgtpvOEOTyItPmEbMPWY9R8I9cP5FL
    1Q85HBpGR_3C9DbouN7qEgm5nWQ3DP5pxv49etFYOSY-MYtvFs>
X-ME-Proxy-Cause: dmFkZTGhNYcu8tgP1fvPeH39qrUY9b8/AkxpBhbL8HbyvECYQb3lnlxVqTmWFayw63gj7I
    QloHrP19YShf4i+i2Tj6J8ikEAtAY+0xO2LEnNn3/ZagKJaTC5ZlsxTDMJprBLR8MjE9/x
    DYQsD9WJJjOwaWXjvbYFW8FJZL6Z+jkVzvcve7mA8Pun/8AxWg3A0W+N0usg3g/HsFYH6/
    mzeRf46SmtUd46Q1XL3OQNqoYSF+Yv9qwj5Y3qMTGdVx+45gbo62qnlvOfyIaBNXhWR78o
    VL+5qTAF5gmqjTcOh7XeQUZmYPQstjckZl7JFa77BAk5dZU2NeaR26eqhOSz3WJe2yHcj0
    E//wKGAHQf+CqWmMmHg3iiCVioeC2//GcfijUmzimGvTx6OQtfKWMvj809rlCJjbkrDYex
    DpsGVE+iY3pBFUzmzpLnYK/qi2hY/YWFngCzwgObKlq7YQXaBKdWLuQIF6dSBALFrIeF2K
    ze/lVmX958VNpPN70nl0/hXXLNeAmQnrIq6Gd5jOTuHWokWsWms09FEB/w1yFkV9dHNFap
    BWd3kiSojzJglvrUE42CaK0e7g4tAXStQ+269eR3bb4btAivbcN8nhI2JGVkWkoN4HCCaL
    /kGZsCFZKCwPiFamw/ut1IPKmokCxn/PsuRkjXabY7tU7IUDEy+AZsCkH1KA
X-ME-Proxy: <xmx:g_Ymarref-kwtd7VVFOyoJRjteyKCChydPdBa7kMn7EHjxRwuCfPwg>
    <xmx:g_Ymajk63xQFx6I7D_PEiwUor_YB1guSrvyxTMwZh015vL7wUPpOyg>
    <xmx:g_Ymavx9rXVd73-hKwRjccpZ6JV6xOnXk_MbFy6EjINGuT4vPYWMkg>
    <xmx:g_Ymarn39kM6E9oKPA5oKLEqLp6Fjr-y7K9M3ErWBB0fy60jwQ3LBw>
    <xmx:g_YmatQTTeF5YC6T_84zM_obmje1gFZlL6d3SDqIFWhhZYUbZJ8hHxE1>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 07E0E216008A; Mon,  8 Jun 2026 13:06:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABFZICgcHfNg
Date: Mon, 08 Jun 2026 18:05:49 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>,
 netfilter@vger.kernel.org
Message-Id: <cbf09448-ccd4-417e-b905-1e7df3e167d2@app.fastmail.com>
In-Reply-To: <6141c93d-ca25-4b3f-8a6b-b048f2ec595f@gmx.com>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
 <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
 <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
 <6141c93d-ca25-4b3f-8a6b-b048f2ec595f@gmx.com>
Subject: Re: Question on rate limiting on nftables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jun 2026, at 4:57 PM, Lars Nood=C3=A9n wrote:
> On 6/8/26 18:01, Andre Rodier wrote:
>> Also, a connection attempts on a
>> different port should immediately raise attention, as it is involving
>> more than a basic SSH scan bot.
>
> Shifting ports might quiet the logs somewhat, but your SSH port will b=
e=20
> found both quickly and easily by bots.  That has been the case for a=20
> long time:
>
>   https://bsdly.blogspot.com/2013/02/theres-no-protection-in-high-port=
s.html

This blog post argues against security-by-obscurity. It has nothing what=
soever do with the substance of my initial post in this thread, in which=
 I wrote:

=C2=ABIf the problem can be characterised as "I endure too much log nois=
e from sshd and I find it annoying" then perhaps configure sshd(8) to ad=
ditionally bind to some other random port than 22 and expose only that p=
ort.=C2=BB

Nothing more, nothing less. I did not write, "I want to make it impossib=
le for any bot anywhere to discover that I am running an sshd service on=
 a given port forever more". Nor did I write, "I'm worried about being h=
acked and I think that switching to a different port will make that even=
tuality less likely".

Indeed, Mr Hansteen's post concedes precisely that:

=C2=ABThe immediate effect in almost all cases was a much quieter authen=
tication log.=C2=BB

The implied question can thus be framed as: do I think that increasing t=
he signal-to-noise ratio of my logs is worth a port change? In my case, =
the answer is an unequivocal yes.

--
Kerin Millar
