Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A57C1AB6C0
	for <netfilter@vger.kernel.org>; Tue,  3 Sep 2024 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725350344; cv=none; b=hnTlt6C8Ipeg6nxlutLw3a04v4X+I/bjkggJ8WFv4Pp5Jf86pUw8kM0KA6JRru6IfPfUJFIdYOiZs6/0wR1ZkWQ2+7r/aQwwJsz36ztYPwS8thNwclUDLf6JsnsGOkGAis1lxW/Z/d1Wtm/3GfzdUaNtezcPKdzL0C5EXCWVM0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725350344; c=relaxed/simple;
	bh=17twfbVw0dZjTXASXEmXdOldQwecrCPe0NXY9pbTwL4=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=eqzHVRkgCBYe2y6HfCd0XuCYi4BMIoo6F8QBgA/jL64UE7Tj72I6I/90eEIfKsFfh5syev9DM3x5HATgqlGHQBN6WItxTWWr6oXjWx5r8nssErm6yLXmLcDhU1UBNWuQbGnzbFWkqTd/1WzrnCxzLjzgSFQ7peIS7UToaIT3fjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=o5eGAxSP; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="o5eGAxSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1725350340; x=1725609540;
	bh=17twfbVw0dZjTXASXEmXdOldQwecrCPe0NXY9pbTwL4=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=o5eGAxSPlLqZFEPa4vkGLo9YLtGg48VgORueWdtefASiFaGomLe/eCPbvBrPiD3xo
	 Nyx/47esFbyhOf+cX6VRAomvnozVWf+LcQ810lBg8Ioam8gKwlylYWBTSE/3GldnlE
	 Rh1SvJVjXRv9Rjr+RXX0vPAH8tJuAzRDiVONJTbD0F3xGG2I5c8JttB9Ch0zOkDt3X
	 +lGXtGn5AfSWVbERqQztWLkVhBYnHCXkrdteosqgnRo6B1lKRSnnbJl0U5CyuU7kb2
	 /yoebyXoIG7paea6Oo7cCcQ4YdYjIb0JH28kqbaHasr0Yu+gcn9svuFG4vUwk5EHFL
	 G4ehYs/br22XQ==
Date: Tue, 03 Sep 2024 07:58:56 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Subject: Raw payload expressions are mangled
Message-ID: <DZC45RRhLNfzeCW9I6ahm9glqdw7JeVCHAtNRmJKEGsvLMzUaU1kI-yv-5rVp2mJq3dJPyHN2yWVbSiwc7JWWvZOf4GXBmtiPpYZS9zVKEo=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 9b65fca9ed621c49b4e836b1d5acac0a0a8037c9
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, I am attempting to match ntpv4 replies inbound to my machine; like so:

udp sport 123 dport 123 @ih,2,3 0x4 @ih,5,3 0x4 @ih,8,8 0x1

In english, this is: "ntpv4 mode server stratum 1" (there are additional ch=
ecks for poll, precision and reference, though they're not neccesary here)

After loading the rule (among others) with /usr/sbin/nft -f (in a config fi=
le) on Debian 12 Bookworm (not yet updated); the rule shows as:

ip daddr 10.0.0.5 udp sport 123 udp dport 123 ct state established meta sku=
id 996 @ih,0,8 & 0x38 =3D=3D 0x20 @ih,0,8 & 0x7 =3D=3D 0x4 @ih,8,8 0x1

It seems bit-level checks were aligned to '8 bit boundaries'. The resulting=
 expression is technically correct, though it is (as far as I'm aware), onl=
y minimally faster.

I would prefer the output to remain as I had typed; as I did not ask for NF=
T to optimise the ruleset as of yet, and I need to spend much more time val=
idating the configuration.

Is this optimisation able to be toggled off?

Regards,
Sunny73cr
