Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA93E0C4C
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086189; cv=none; b=RdpYlrDKwDmpGIRxKFdLHDObYbUHbvahkh4LH/Fc7fiKvsiiBo+Qwwu7CzmW6lKDlP3PlGIIeC2dZ6MJCc9p3vuycCt1J+qhQketyq8etIpDkHqz8PAssKB7fRdtBRvBf5x0ms7j9pBcCnp1yXyqkeShlZqwLfadt0ONOMlw1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086189; c=relaxed/simple;
	bh=g8UaIMNZ6Oo1D6i/+vRtHEgZfok/J+jFfuTIBNXcovI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CV3gJqygyRl7amIV7vyUFH35Px6g4b2YlC/6O+eLGIZRF8v2jm3FWbFZLRxk0bi5PSt9kVdAyYUCvfGEgQmn2xPOPEjlUlgBcKFL7oqPUowHsM0pZNoRJ9T+6zf8hzb5dh99gCujl3SC0Zu9W5noa7YrRTKTodG11op3pFMYAzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=BscY8kO0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B2qfAvye; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="BscY8kO0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B2qfAvye"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id BDCD2EC01DA;
	Wed, 10 Jun 2026 06:09:46 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 06:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781086186; x=1781172586; bh=c/hOJ/KJcEicZXZqBABzylXmivEPvIsP
	c3Z48/SSTxw=; b=BscY8kO0BOQ2a6zI/zSd7YrTvgouhfgkSxDPpJd1GlLytkbV
	AxXENVGD888nG21jPQl7lv62UpdPO3/Q3l0M7p4BIVEgpgg9T9ARzv9zWf/vh4pn
	r6XolUWYni6GetHhBpFjyVrrHT0185yBgsMbcgnsFnzLUB+6Pf1GEW9wIinZOPPE
	JuvFaHxMpPXsPWtwoiOFhOSpmDxhIx7w9QT+UqRKDv9b1mE5KHen0QIJzWWd6CuW
	XYnrrC5hDAmv3Xn9C99gu7/0CHXXsU/uZNXBXROwJCN+Ad0mGHzM4Qm1sji0J2DY
	vXiGQirysvtj+gOUKqH/u7odcaD1zHWI0OjwLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781086186; x=
	1781172586; bh=c/hOJ/KJcEicZXZqBABzylXmivEPvIsPc3Z48/SSTxw=; b=B
	2qfAvyeR62D0Ze3w/OKfnYo300YwmSf1tLk8W7nlE32hyueEjD1FgUloer0wha3l
	qXDgG5g9QCSfRIiqk2X730Vq5Wbn6aGOP1utsOG+rPQrtHLFQfM2xPuUFmeyhc5+
	LE38mq9Pm/oHLpsIJZTDXsCQWokrj9XjRDZNQp1YrXC1v+pjcEGx57pMVOLmcCGy
	Li7/GdZZSf5hRcU9Qt93F3zpCDYj4soR0HgkN1dl4tv98U3r4RsoE/1Jh+XY1tRQ
	pB6ZYyZYOqBO6WzW0XajRBZXLB6VNqd7BEv1shayxvs93GZBbCSg8UgM27S6b5FZ
	2QLv26eyneHR5XJgB5y/g==
X-ME-Sender: <xms:6jcpahnRD_ZZ9M5FbllVKvB6Z0kM0ocFlcEGziGFTnD7ewAKmFy9Dg>
    <xme:6jcpanpRM0femuXmmwdtpOw4kJRJ0qqzmQBJVL0JlTjTHLvD2fSWLmwCu2hW-ZHEh
    3zEOO9EjufeOTTwiMTab_pax9KG5Wfq0noXIxu-pvN-fGgAFSUZ>
X-ME-Proxy-Cause: dmFkZTEKjr9iLksxO0IEalRcMWDjlC7DmIxo45qGKRDr5L6mw5Xb1h670AeJ50ZK/ySqgL
    YCPV0eWtI5/47Wg5CuQ3l23IY5mylUg0Sce+V40tmiv2TK5feKQGAimb52NWiJecxRt6Yc
    BvrCjQxicuPuOMCIWNwnLWkhOBHpCLLbtoMPx8h374VjfPDjJJGd+Uv/dixAkPcpwVGLgl
    GhwmkNMyXAGmDVzRoMWRHz6+sIPpEq70qVSoXvhlP8u91CXdf6vktzJCGKWKRvZX8dAC7p
    bXqXNq1YqOFmYiJdza7Uv54sBPgDaL8DB7vGUAcFzmcFUcZrF91GwEBUuNaUtzNceYzQD2
    sbeq4E3jyVsZFh8IZljPmYpAz/DTcwFBsqTpcPqxSE57SzBRnL6nEfnjF0MVIyMPoFJG26
    68E4j8fKP1WPNwZlc8oHhp9JcUgo2JVOgxTxxp8qTSja3cB03t7zhOjhAaiDU5kSXuShz6
    bN9urztdd7QUozuUsRoa/Xh2FV8DxFjl3z1qToFpzDAqcCYYUwUONMmH4ULS320gFGW8dj
    MjKJkZ1UYAxzU66YiJLbe0A7g1oy31ZYRNYrtZc3/F6Oi6iXP+Tiq2I4fPt5VQWEn9ZPcH
    b04ZsHWXvIJWS5nek2MdIGCq7ztYr36021Rs7mj3eJP4fYKbNM2mFOxHKnqQ
X-ME-Proxy: <xmx:6jcpaujTD0TjYZdQYJSvAn2wK4GrFAJsWz_G_Jv0PdaReNDZ_DChqw>
    <xmx:6jcpamwtyqWzl8CiUZz0MqE7LypFrPVgENbiU3iz-3ev0o8dLGj0jg>
    <xmx:6jcpapLa1S2JK_2codogBzat_HnUsWbhpqjbNIOPi0tpp_TcgOcMYQ>
    <xmx:6jcpalS9lstEuKcudgPCAlHC7Lrq3wSUOrzy_jbSV7VRXo4XN7N6LQ>
    <xmx:6jcpatE1hy6HWBPOYVX-WdjwAXswRPO4jOvNHE0ooH9TVZjQyVbdAa2W>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C43E216008A; Wed, 10 Jun 2026 06:09:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbmbupR3g_CV
Date: Wed, 10 Jun 2026 11:09:25 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Reindl Harald" <h.reindl@thelounge.net>, "Randy Bush" <randy@psg.com>
Cc: netfilter@vger.kernel.org
Message-Id: <7ceb27a6-e16d-4f27-8b99-16d8256437a7@app.fastmail.com>
In-Reply-To: <24394eb0-abf4-4825-9041-0554badd34a8@thelounge.net>
References: <m233yv2r20.wl-randy@psg.com>
 <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com>
 <m21pef2ope.wl-randy@psg.com>
 <24394eb0-abf4-4825-9041-0554badd34a8@thelounge.net>
Subject: Re: prefix len confusion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 7:20 AM, Reindl Harald wrote:
> Am 10.06.26 um 03:01 schrieb Randy Bush:
>>>> essentially, i am seeing the traditional ssh dict attcak to
>>>> 42.642.11.82, when i think i am filtering 42.642.11.80/30, which should
>>>> cover 42.642.11.82
>>>
>> sorry for being insufficiently explicit
>> 
>> the ssh attacker is getting through to 42.642.11.82, which is a piece of
>> hardware, not a vm.  it is the ssh port of a hardware switch whose
>> security profile i prefer not to expose to attackers.
>> 
>>      define VULN4 = {
>> 	42.642.11.34/31,
>> 	42.642.11.36/31,
>> 	42.642.11.40/29,
>> 	42.642.11.48/29,
>> 	42.642.11.80/30   # <<<====
>>      }
> you guys realize that "642" can't be part of an ipv4 address
> and "should cover" is best answered with ipcalc
> in that case it says the input is nonsense

This is not the flex that you think it is.

Firstly, it is (obviously) a comment intended to draw attention to the entry, not a diagnostic message. Secondly, had the ruleset not been (obviously) obfuscated, nft would hardly wait until encountering that particular entry before electing to complain about an invalid address.

--
Kerin Millar
